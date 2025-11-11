package com.gok.pboot.utils;

import com.gok.pboot.auth.BaseUserDetail;
import com.gok.pboot.auth.resp.AccessTokenResp;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author funcas
 * @version 1.0
 * @date 2019年04月03日
 */
public class SecurityUtils {

    private SecurityUtils(){
        throw new IllegalStateException("SecurityUtils class");
    }

    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * 获取用户
     */
    public static AccessTokenResp getBaseUser() {
        return ((BaseUserDetail) getAuthentication().getPrincipal()).getBaseUser();
    }


}
