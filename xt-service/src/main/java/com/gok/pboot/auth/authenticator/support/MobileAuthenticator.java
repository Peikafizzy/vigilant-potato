package com.gok.pboot.auth.authenticator.support;

import com.gok.pboot.auth.IntegrationAuthentication;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.authenticator.AbstractPreparableAuthenticator;
import com.gok.pboot.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 *@author huangBy
 *@Description: 移动端登入校验
 *@date 2019/11/7 19:07
 */
@Component
public class MobileAuthenticator extends AbstractPreparableAuthenticator {
    private static final String MOBILE_AUTH_TYPE = "mobile";

    @Autowired
    private IAccountService accountService;

//    @Autowired
//    private IRemoteParentMsgService msgService;

    @Override
    public User authenticate(IntegrationAuthentication integrationAuthentication) {
        User user = getUserByLogin(integrationAuthentication, accountService);
        updateUserDef(user,accountService);
        return user;
    }

    @Override
    public List<Integer> getUserTypes(IntegrationAuthentication integrationAuthentication) {
        return defaultGetUserTypes(accountService, integrationAuthentication);
    }

//    @Override
//    public List<Student> getUserStudents( IntegrationAuthentication integrationAuthentication) {
//        return defaultGetUserStudents(msgService,accountService,integrationAuthentication);
//    }

    @Override
    public boolean prepare(IntegrationAuthentication integrationAuthentication) {
        return true;
    }

    @Override
    public boolean support(IntegrationAuthentication integrationAuthentication) {
        return MOBILE_AUTH_TYPE.equals(integrationAuthentication.getAuthType());
    }
}
