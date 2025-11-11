package com.gok.pboot.service.impl;

import com.gok.pboot.CollectionUtils;
import com.gok.pboot.ConverterUtils;
import com.gok.pboot.PasswordChecker;
import com.gok.pboot.auth.*;
import com.gok.pboot.auth.authenticator.IAuthenticator;
import com.gok.pboot.auth.resp.AccessGroupResp;
import com.gok.pboot.auth.resp.AccessTokenResp;
import com.gok.pboot.base.BaseConstants;
import com.gok.pboot.base.RedisKeyConstants;
import com.gok.pboot.config.LoginLockConfig;
import com.gok.pboot.enumeration.entity.State;
import com.gok.pboot.enumeration.entity.YesOrNoEnum;
import com.gok.pboot.redis.RedisUtil;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.service.ITokenService;
import com.gok.pboot.service.IUnitService;
import com.google.common.collect.Sets;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月18日
 */
@Service
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {

    public static final String DEFAULT_PERMS = "sys:default";

    private final IAccountService userService;
    private final IUnitService unitService;
    private final List<IAuthenticator> authenticators;
    private final PasswordEncoder passwordEncoder;
    private final RedisUtil redisUtil;


    @Autowired
    @Lazy
    private ITokenService tokenService;

    @Autowired
    public UserDetailsServiceImpl(IAccountService userService, IUnitService unitService, List<IAuthenticator> authenticators,@Lazy PasswordEncoder passwordEncoder, RedisUtil redisUtil) {
        this.userService = userService;
        this.unitService = unitService;
        this.authenticators = authenticators;
        this.passwordEncoder = passwordEncoder;
        this.redisUtil = redisUtil;
    }

    @Override
    public UserDetails loadUserByUsername(String name){

        IntegrationAuthentication integrationAuthentication = AuthenticationContext.get();
        //判断是否是集成登录
        if (integrationAuthentication == null) {
            integrationAuthentication = new IntegrationAuthentication();
        }


        integrationAuthentication.setUsername(name);
        User userVO = this.authenticate(integrationAuthentication);

        if(userVO == null){
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        //错误计数
        errorCounting(integrationAuthentication, userVO);


        //仅允许登陆一个
        tokenService.removeTokenByClientIdAndUsername(integrationAuthentication.getAuthParameter(IntegrationAuthentication.CLIENT_ID_KEY),  name);
        this.grantAuthorities(userVO);

        // 可用性 :true:可用 false:不可用
        boolean enabled = State.ENABLE.getValue().equals(userVO.getState());
        if (!enabled){
             throw new DisabledException("系统未检测到匹配的账号数据，请重新登录");
        }
        //清除无用user属性，减少token长度
        AccessTokenResp accessTokenResp = removeNoUseFieldValue(userVO);
        org.springframework.security.core.userdetails.User user =
                new org.springframework.security.core.userdetails.User(userVO.getUsername(), userVO.getPassword() ,enabled,true,
                        true,true, userVO.getGrantedAuthorities());
        return new BaseUserDetail(accessTokenResp, user);
    }

    private AccessTokenResp removeNoUseFieldValue(User userVO) {
        AccessTokenResp userTemp = new AccessTokenResp();
        userTemp.setId(userVO.getId());
        userTemp.setTenantId(userVO.getTenantId());
        userTemp.setTenantNo(userVO.getTenantNo());
        userTemp.setUnitId(userVO.getUnitId());
        userTemp.setUsername(userVO.getUsername());
        userTemp.setNickname(userVO.getNickname());
        userTemp.setAccountId(userVO.getAccountId());
        userTemp.setResourceList(userVO.getResourceList());
        List<AccessGroupResp> groupRespList = new ArrayList<>(5);
        if (CollectionUtils.isNotEmpty(userVO.getGroups())) {
            for (Group group : userVO.getGroups()) {
                AccessGroupResp accessGroupResp = ConverterUtils.converte(group, AccessGroupResp.class);
                accessGroupResp.setId(group.getId());
                groupRespList.add(accessGroupResp);
            }
        }
        userTemp.setGroups(groupRespList);
        userTemp.setGrantedAuthorities(userVO.getGrantedAuthorities());
        //userTemp.setUnit(userVO.getUnit());
        userTemp.setPerms(userVO.getPerms());
        return userTemp;
    }

    /**
     * 错误计数：如果用户名正确，密码错误。每错误异常错误数添加1, 超过指定次数锁用户
     * @param integrationAuthentication
     * @param userVO
     */
    private void errorCounting(IntegrationAuthentication integrationAuthentication, User userVO) {
        String password=integrationAuthentication.getAuthParameter(IntegrationAuthentication.CIPHER_KEY);
        if (!passwordEncoder.matches(password, userVO.getPassword())){
            long errorCount = redisUtil.add(RedisKeyConstants.LOGIN_ERROR_PRE + userVO.getUsername(), 1, LoginLockConfig.getErrorCacheTime());
            if(errorCount > LoginLockConfig.getErrorLimit()){
                redisUtil.set(RedisKeyConstants.LOGIN_LOCK_PRE + userVO.getUsername(),"", LoginLockConfig.getLockTime());
                redisUtil.remove(RedisKeyConstants.LOGIN_ERROR_PRE + userVO.getUsername());
            }
            Map<String, String[]> authParam = new HashMap<>(integrationAuthentication.getAuthParameters());
            authParam.put(IntegrationAuthentication.LOGIN_FLAG, new String[]{BaseConstants.NO_STR});
            integrationAuthentication.setAuthParameters(authParam);
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        //判断是否是弱密码，如果是弱密码,需进行密码修改
        PasswordChecker passwordChecker=new PasswordChecker();
       if(!passwordChecker.checkRuleMiddle(password)){
           userVO.setWeakPwd(YesOrNoEnum.YES.getValue());
       }else{
           userVO.setWeakPwd(YesOrNoEnum.NO.getValue());
       }
        //如果登入成功清除之前错误记录
        redisUtil.remove(RedisKeyConstants.LOGIN_ERROR_PRE + userVO.getUsername());
    }


    protected void grantAuthorities(User userVO){
        Set<GrantedAuthority> grantedAuthorities = Sets.newHashSet();
        //source去除
        List<Resource> resourceList = userService.getUserResources(userVO.getId());
        List<String> authorityList = resourceList.stream().map(Resource::getPermission).distinct().collect(Collectors.toList());
        //添加角色权限
        for(String authority : authorityList) {
            if(StringUtils.isNotEmpty(authority)){
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(authority);
                grantedAuthorities.add(grantedAuthority);
            }
        }

        grantedAuthorities.add(new SimpleGrantedAuthority(DEFAULT_PERMS));
        List<Group> groups = userService.getUserGroups(userVO.getId());
        Unit unit = unitService.selectOne(userVO.getUnitId());
        userVO.setGroups(groups);
        userVO.setUnit(unit);
        userVO.setGrantedAuthorities(grantedAuthorities);
    }

    private User authenticate(IntegrationAuthentication integrationAuthentication) {
        if (this.authenticators != null) {
            for (IAuthenticator authenticator : authenticators) {
                if (authenticator.support(integrationAuthentication)) {
                    return authenticator.authenticate(integrationAuthentication);
                }
            }
        }
        return null;
    }
}
