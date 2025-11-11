package com.gok.pboot.auth;

import lombok.Data;

import java.util.Map;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月27日
 */
@Data
public class IntegrationAuthentication {

    public static final String USERNAME_KEY = "username";
    public static final String CIPHER_KEY = "password";
    public static final String  CLIENT_ID_KEY= "client_id";
    public static final String CLIENT_SECRET_KEY = "client_secret";
    /**
     * 登入状态 0 失败成功， 其他成功
     */
    public static final String LOGIN_FLAG = "LOGIN_FLAG";

    /**
     * 租户编号
     */
    public static final String TENANT_NO_KEY = "tenant_no";

    /**
     * 用户类型
     * @see com.gok.pboot.enumeration.entity.UserType
     */
    public static final String USER_TYPE_KEY = "user_type";
    /**
     * 子女ID
     */
    public static final String STUDENT_ID = "student_id";
    /**
     * 子女ID
     */
    public static final String PARENT_ID = "parent_id";
    /**
     * 自动设置用户类型type标识
     */
    public static final String AUTO_TYPE_FLAG = "auto_type_flag";
    /**
     * 自动设置用户子女标识
     */
    public static final String AUTO_Student_FLAG = "auto_student_flag";
    /**
     * openid保持键名称
     */
    public static final String OPENID_KEY = "openid";

    /**
     * 用户集合key
     */
    public static final String USERLIST_KEY = "userList";

    /**
     * 招行小程序签名字符串
     */
    public static final String SIGN_STR = "signStr";

    /**
     * 验证码
     */
    public static final String VERIFY_CODE="verifyCode";

    /**
     * 登入校验：手机参数名
     */
    public static final String PHONE_KEY = "phone";

    /**
     * app
     */
    public static final String APP_CLIENT = "app";


    private String authType;
    private String username;
    private Map<String,String[]> authParameters;

    public String getAuthParameter(String paramter){
        String[] values = this.authParameters.get(paramter);
        if(values != null && values.length > 0){
            return values[0];
        }
        return null;
    }
}
