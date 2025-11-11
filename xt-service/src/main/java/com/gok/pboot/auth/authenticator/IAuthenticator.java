package com.gok.pboot.auth.authenticator;

import com.gok.pboot.auth.IntegrationAuthentication;
import com.gok.pboot.auth.User;

import java.util.List;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月28日
 */
public interface IAuthenticator {
    /**
     * 处理集成认证
     * @param integrationAuthentication
     * @return
     */
    User authenticate(IntegrationAuthentication integrationAuthentication);


    /**
     *获取用户类型集合
     * @param integrationAuthentication
     * @return
     */
    List<Integer> getUserTypes(IntegrationAuthentication integrationAuthentication);

    /**
     * 进行预处理
     * @param integrationAuthentication
     * @return
     */
    boolean prepare(IntegrationAuthentication integrationAuthentication);

    /**
     * 判断是否支持集成认证类型
     * @param integrationAuthentication
     * @return
     */
    boolean support(IntegrationAuthentication integrationAuthentication);

    /** 认证结束后执行
     * @param integrationAuthentication
     */
    void complete(IntegrationAuthentication integrationAuthentication);
}
