package com.gok.pboot.auth.authenticator.support;

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
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Primary
@Component
/**
*@author huangBy
*@Description: 运营平台登入
*@date 2019/11/7 19:07
*/
public class LandlordAuthenticator extends AbstractPreparableAuthenticator {

    @Autowired
    private IAccountService accountService;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public User authenticate(IntegrationAuthentication integrationAuthentication) {
        User user = getUserByLogin(integrationAuthentication, accountService);
        if(user==null || !BaseConfig.getLandlordId().equals(user.getTenantId())){
            return null;
        }
        return user;
    }


    @Override
    public List<Integer> getUserTypes(IntegrationAuthentication integrationAuthentication) {
        Map<String, String[]> param = new HashMap<>(integrationAuthentication.getAuthParameters());
        param.put(IntegrationAuthentication.TENANT_NO_KEY, new String[]{BaseConfig.getLandlordNo()});
        integrationAuthentication.setAuthParameters(param);
        return defaultGetUserTypes(accountService, integrationAuthentication);
    }

//    @Override
//    public List<Student> getUserStudents( IntegrationAuthentication integrationAuthentication) {
//        return null;
//    }

    @Override
    public boolean prepare(IntegrationAuthentication integrationAuthentication) {
        String o= RedisConfig.getCache().get(VerifyConfig.REDIS_PHONE_CODE_ENABLE);
        if(StringUtils.isNotBlank(o) && Boolean.parseBoolean(o)){
            return checkVerifyCode(integrationAuthentication, IntegrationAuthentication.PHONE_KEY, redisUtil, VerifyCodeType.LOGIN.getValue());
        }
        return true;
    }

    @Override
    public boolean support(IntegrationAuthentication integrationAuthentication) {
        return StringUtils.isEmpty(integrationAuthentication.getAuthType());
    }
}
