package com.gok.pboot.config;

/**
 * @author luolp
 * @date 2020-04-03 17:04
 * @desc
 **/

import com.alibaba.nacos.common.utils.CollectionUtils;
import com.gok.pboot.redis.RedisUtil;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import org.apache.http.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static org.springframework.cloud.netflix.zuul.filters.support.FilterConstants.PRE_TYPE;

/**
 * @author huangBy
 * @date 2020-10-29 23:53
 * @desc  权限校验过滤，
 **/
@Component
@ConfigurationProperties("access")
public class AccessFilter extends ZuulFilter {

    /**
     * token前缀
     */
    public static final String TOKEN_PRE = "Bearer";

    /**
     * 权限存储redis的前缀
     */
    public static final String AUTH_KEY_PRE = "access:";



    @Autowired
    private RedisUtil redisUtil;

    /**
     * 无需校验的接口集合
     */
    private List<String> ignoreList;

    private final AntPathMatcher pathMatcher = new AntPathMatcher();


    public void setIgnoreList(List<String> ignoreList) {
        this.ignoreList = ignoreList;
    }

    @Override
    public String filterType() {
        //前置过滤器
        return PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        //优先级，数字越大，优先级越低
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        //是否执行该过滤器，true代表需要过滤
        return true;
    }

    /**
     * 1.无需校验的接口直接放行
     * 2.需要校验的接口：
     *      a.判断是否存在token，如果不存在直接返回错误
     *      b.如果在redis中获取不到该key，返回错误信息
     * @return
     */
    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        String uri = request.getRequestURI();
        if (CollectionUtils.isNotEmpty(ignoreList)) {
            for (String pattern : ignoreList) {
                if (pathMatcher.match(pattern, uri)) {
                    return null;
                }
            }
        }

        String token = request.getHeader(HttpHeaders.AUTHORIZATION);
        if(token == null){
            permissionDenied(ctx);
            return null;
        }

        token = AUTH_KEY_PRE + token.replace(TOKEN_PRE, "").trim();
        if(!redisUtil.exists(token)){
            permissionDenied(ctx);
        }

        return null;
    }

    private void permissionDenied(RequestContext ctx) {
        ctx.setSendZuulResponse(false);
        ctx.setResponseStatusCode(200);
        ctx.setResponseBody("{\"retCode\":\"401\",\"retMessage\":\"token过期!\"}");
        ctx.getResponse().setContentType("text/json;charset=UTF-8");
    }

}

