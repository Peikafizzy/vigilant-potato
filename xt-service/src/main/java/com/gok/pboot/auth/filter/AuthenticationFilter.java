package com.gok.pboot.auth.filter;

import com.alibaba.fastjson.JSON;
import com.gok.pboot.CollectionUtils;
import com.gok.pboot.auth.AuthenticationContext;
import com.gok.pboot.auth.IntegrationAuthentication;
import com.gok.pboot.auth.authenticator.IAuthenticator;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseConstants;
import com.gok.pboot.base.Dict;
import com.gok.pboot.base.RedisKeyConstants;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.redis.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpHeaders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月27日
 */
@Component
public class AuthenticationFilter extends GenericFilterBean implements ApplicationContextAware {

    Logger log = LoggerFactory.getLogger(AuthenticationFilter.class);

    private static final String AUTH_TYPE_PARM_NAME = "auth_type";

    private static final String OAUTH_TOKEN_URL = "/oauth/token";

    private Collection<IAuthenticator> authenticators;

    private ApplicationContext applicationContext;

    private RedisUtil redisUtil;

    private RequestMatcher requestMatcher;

    public AuthenticationFilter(){
        this.requestMatcher = new OrRequestMatcher(
                new AntPathRequestMatcher(OAUTH_TOKEN_URL, "GET"),
                new AntPathRequestMatcher(OAUTH_TOKEN_URL, "POST")
        );
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if(requestMatcher.matches(request)){
            //设置集成登录信息
            IntegrationAuthentication integrationAuthentication = new IntegrationAuthentication();
            integrationAuthentication.setAuthType(request.getParameter(AUTH_TYPE_PARM_NAME));
            integrationAuthentication.setAuthParameters(request.getParameterMap());
            //针对app鉴权转换
            appConvert(request, integrationAuthentication);
            //验证密码是否被锁
            if(checkUserLock(response, request.getParameter(IntegrationAuthentication.USERNAME_KEY))){
                return;
            }
            AuthenticationContext.set(integrationAuthentication);
            try{
                //预处理
                if(!this.prepare(integrationAuthentication, response,request)){
                    return;
                }

                filterChain.doFilter(request,response);

                //后置处理
                this.complete(integrationAuthentication);
            }
            finally {
                AuthenticationContext.clear();
            }
        }else{
            filterChain.doFilter(request,response);
        }
    }

    /**
     * 判断账号是否被锁
     * @param response
     * @param username
     * @return
     */
    private boolean checkUserLock(HttpServletResponse response, String username) {
        Long expireTime = redisUtil.getExpire(RedisKeyConstants.LOGIN_LOCK_PRE + username);
        log.warn("time={}",expireTime);
        if(expireTime == 0){
            return false;
        }
        loginFail(response, "账号被锁" + expireTime + "秒，请联系管理员。");
        return true;
    }

    private void loginFail(HttpServletResponse response, String msg) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        try {
            response.getWriter().write(JSON.toJSONString(ApiResult.failure(msg)));
        } catch (IOException e) {
            log.warn("登入拦截器错误，{}", e.getMessage());
        }
    }

    private void loginUserTypeChoose(HttpServletResponse response,  List<Dict> dictList) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        try {
            response.getWriter().write(JSON.toJSONString(ApiResult.success(dictList)));
        } catch (IOException e) {
            log.info("登入拦截器错误，{}", e.getMessage());
        }
    }

    /**
     * app鉴权转换，从请求头Authorization中截取client_id和client_secret
     * @param request
     * @param integrationAuthentication
     */
    private void appConvert(HttpServletRequest request, IntegrationAuthentication integrationAuthentication) {
        String authorization = request.getHeader(HttpHeaders.AUTHORIZATION);
        if(StringUtils.isNotEmpty(authorization)){
            authorization = authorization.substring(6);
            authorization = new String(Base64.getDecoder().decode(authorization));
            String[] clientParams = authorization.split(":");
            Map<String,String[]> paramMap =new HashMap<>(integrationAuthentication.getAuthParameters());
            paramMap.put(IntegrationAuthentication.CLIENT_ID_KEY, new String[]{clientParams[0]});
            paramMap.put(IntegrationAuthentication.CLIENT_SECRET_KEY, new String[]{clientParams[1]});
            integrationAuthentication.setAuthParameters(paramMap);
        }
    }

    /**
     * 进行预处理
     * @param integrationAuthentication
     */
    private boolean prepare(IntegrationAuthentication integrationAuthentication, HttpServletResponse response, HttpServletRequest request) {

        //延迟加载认证器
        if(this.authenticators == null){
            synchronized (this){
                Map<String, IAuthenticator> integrationAuthenticatorMap = applicationContext.getBeansOfType(IAuthenticator.class);
                if(integrationAuthenticatorMap != null){
                    this.authenticators = integrationAuthenticatorMap.values();
                }
            }
        }

        if(this.authenticators == null){
            this.authenticators = new ArrayList<>();
        }

        for (IAuthenticator authenticator: authenticators) {
            if(authenticator.support(integrationAuthentication)){
                if (!authenticator.prepare(integrationAuthentication) || !userTypeAutoChoose(integrationAuthentication, response, authenticator)){
                    return false;
                }
            }
        }
        return true;
    }

    /**
     *  用户类型自动选择操作
     * @param integrationAuthentication
     * @param response
     * @param authenticator
     * @return
     */
    private boolean userTypeAutoChoose(IntegrationAuthentication integrationAuthentication, HttpServletResponse response, IAuthenticator authenticator) {
        //如果用户类型不为空则不执行用户类型选择
        if(StringUtils.isNotBlank(integrationAuthentication.getAuthParameter(IntegrationAuthentication.USER_TYPE_KEY))){
            return true;
        }
        log.info("tenantNo==="+integrationAuthentication.getAuthParameter(IntegrationAuthentication.TENANT_NO_KEY));
        log.info("IntegrationAuthentication="+integrationAuthentication);
        List<Integer> typeList = authenticator.getUserTypes(integrationAuthentication);
        if(CollectionUtils.isEmpty(typeList)){
            loginFail(response, "用户名或者密码错误");
            return false;
        }else if(typeList.size() == 1){
            Map<String,String[]> paramMap =new HashMap<>(integrationAuthentication.getAuthParameters());
            paramMap.put(IntegrationAuthentication.USER_TYPE_KEY, new String[]{String.valueOf(typeList.get(0))});
            paramMap.put(IntegrationAuthentication.AUTO_TYPE_FLAG, new String[]{BaseConstants.YES_STR});
            integrationAuthentication.setAuthParameters(paramMap);
        }else {
            List<Dict> DictList = new ArrayList<>(2);
            for (Integer type : typeList) {
                DictList.add(new Dict(UserType.getNameByValue(type), type));
            }
            loginUserTypeChoose(response, DictList);
            return false;
        }
        return true;
    }

    /**
     * 后置处理
     * @param integrationAuthentication
     */
    private void complete(IntegrationAuthentication integrationAuthentication){
        for (IAuthenticator authenticator: authenticators) {
            if(authenticator.support(integrationAuthentication)){
                authenticator.complete(integrationAuthentication);
            }
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.redisUtil = applicationContext.getBean(RedisUtil.class);
    }
}
