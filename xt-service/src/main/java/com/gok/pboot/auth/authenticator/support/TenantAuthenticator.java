package com.gok.pboot.auth.authenticator.support;

import com.gok.pboot.auth.Group;
import com.gok.pboot.auth.IntegrationAuthentication;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.authenticator.AbstractPreparableAuthenticator;
import com.gok.pboot.config.BaseConfig;
import com.gok.pboot.config.RedisConfig;
import com.gok.pboot.config.VerifyConfig;
import com.gok.pboot.enumeration.entity.VerifyCodeType;
import com.gok.pboot.redis.RedisUtil;
import com.gok.pboot.service.IAccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 *@author huangBy
 *@Description: 租户登入校验
 *@date 2019/11/7 19:07
 */
@Component
public class TenantAuthenticator extends AbstractPreparableAuthenticator {
    private static final String TENANT_AUTH_TYPE = "tenant";
    @Autowired
    private IAccountService accountService;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public User authenticate(IntegrationAuthentication integrationAuthentication) {
        User user = getUserByLogin(integrationAuthentication, accountService);
        if(BaseConfig.getLandlordId().equals(user.getTenantId())){
            return null;
        }

        List<Group> groups = accountService.getUserGroups(user.getId());
        if(groups==null || groups.isEmpty()){
            return null;
        }
        updateUserDef(user,accountService);
        return user;
    }

    @Override
    public List<Integer> getUserTypes(IntegrationAuthentication integrationAuthentication) {
        List<Integer> integers = defaultGetUserTypes(accountService, integrationAuthentication);
        return integers;
    }


    @Override
    public boolean prepare(IntegrationAuthentication integrationAuthentication) {
        String o=RedisConfig.getCache().get(VerifyConfig.REDIS_PHONE_CODE_ENABLE);
        if(StringUtils.isNotBlank(o) && Boolean.parseBoolean(o)){
            return checkVerifyCode(integrationAuthentication, IntegrationAuthentication.PHONE_KEY, redisUtil, VerifyCodeType.LOGIN.getValue());
        }
        return true;
    }

    @Override
    public boolean support(IntegrationAuthentication integrationAuthentication) {
        return TENANT_AUTH_TYPE.equals(integrationAuthentication.getAuthType());
    }

}
