package com.gok.pboot.rest;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.enumeration.ApiResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.endpoint.TokenEndpoint;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.Map;

/**
* @author huangBy
*@Description: 登入操作
*@date 2020/7/8 11:38
*/
@RestController
@RequestMapping("/oauth")
@Slf4j
public class OauthController {

    /**
     * tokenEndpoint 提供了登入操作Service
     */
    @Autowired
    private TokenEndpoint tokenEndpoint;

    public static final String USER_PASSWORD_ERROR_MESSAGE = "Bad credentials";

    /**
     * Oauth2登入
     * @param principal
     * @param parameters
     * @return
     * @throws HttpRequestMethodNotSupportedException
     */
    @PostMapping("/token")
    public ApiResult postAccessTokenWithUserInfo(Principal principal, @RequestParam Map<String, String> parameters) throws HttpRequestMethodNotSupportedException {
        try {
            OAuth2AccessToken accessToken = tokenEndpoint.postAccessToken(principal, parameters).getBody();
            return ApiResult.builder().apiResultEnum(ApiResultEnum.SUCCESS).result(accessToken).build();
        } catch (Exception e) {
            log.error("登录异常", e);
            if (USER_PASSWORD_ERROR_MESSAGE.equals(e.getMessage())) {
                return ApiResult.failureMsg("密码错误，请重新输入", ApiResultEnum.ACL_FAILURE);
            }
            return ApiResult.failure(ApiResultEnum.ACL_FAILURE);
        }
    }
}
