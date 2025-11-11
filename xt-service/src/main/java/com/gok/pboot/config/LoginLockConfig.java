package com.gok.pboot.config;

import org.springframework.context.annotation.DependsOn;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

/**
*@author huangBy
*@Description:  用户登入锁配置
*@date 2019/12/26 22:38
*/
@Component
@DependsOn("springContextHolder")
public class LoginLockConfig {
    /**
     * 登入锁时间：秒
     */
    private static long lockTime;

    /**
     * 用户名正确，密码错误登入出错次数
     */
    private static long errorLimit;

    /**
     * 错误计数缓存时间
     */
    private static long errorCacheTime;

    LoginLockConfig(){
        Environment environment = SpringContextHolder.getApplicationContext().getEnvironment();
        lockTime = environment.getProperty("sys.login.lock-time", Long.class);
        errorLimit = environment.getProperty("sys.login.error-limit", Long.class);
        errorCacheTime = environment.getProperty("sys.login.error-cache-time", Long.class);
    }


    public static long getLockTime() {
        return lockTime;
    }

    public static long getErrorLimit() {
        return errorLimit;
    }

    public static long getErrorCacheTime() {
        return errorCacheTime;
    }
}
