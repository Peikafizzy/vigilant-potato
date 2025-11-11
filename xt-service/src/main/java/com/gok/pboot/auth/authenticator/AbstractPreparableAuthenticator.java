package com.gok.pboot.auth.authenticator;

import com.alibaba.fastjson.JSON;
import com.gok.pboot.auth.Account;
import com.gok.pboot.auth.IntegrationAuthentication;
import com.gok.pboot.auth.User;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.redis.RedisUtil;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.utils.VerifyCodeUtils;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.*;


/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月28日
 */
@Slf4j
public abstract class AbstractPreparableAuthenticator implements IAuthenticator {

    public static final String DEFAULT_CIPHER = "123456";
    public static final String CLIENT_ID_KEY = "web";

    @Override
    public void complete(IntegrationAuthentication integrationAuthentication) {

    }

    /**
     * 验证短信验证码是否正确
     *
     * @param integrationAuthentication
     * @param phoneKey
     * @param redisUtil
     */
    protected boolean checkVerifyCode(IntegrationAuthentication integrationAuthentication, String phoneKey, RedisUtil redisUtil, String type) {
        String verifyCode = integrationAuthentication.getAuthParameter(IntegrationAuthentication.VERIFY_CODE);
        String phone = integrationAuthentication.getAuthParameter(phoneKey);
        return VerifyCodeUtils.verifyCode(verifyCode, redisUtil, phone,type);
    }

    /**
     * 获取用户类型集合
     *
     * @param userList
     * @return
     */
    protected List<Integer> getUserTypes(List<User> userList, IntegrationAuthentication integrationAuthentication) {
        Map<String, String[]> paramMap = integrationAuthentication.getAuthParameters();
        paramMap = new HashMap<>(paramMap);
        List<Integer> typeList = new ArrayList<>(2);
        if (userList == null || userList.isEmpty()) {
            return Collections.emptyList();
        } else if (userList.size() == 1) {
            typeList = Lists.newArrayList(userList.get(0).getType());
        } else {
            for (User user : userList) {
                if (user.getTenantId().equals(user.getDefTenant()) && user.getType().equals(user.getDefType())) {
                    paramMap.put(IntegrationAuthentication.USERLIST_KEY, new String[]{JSON.toJSONString(Lists.newArrayList(user))});
                    integrationAuthentication.setAuthParameters(paramMap);
                    return Lists.newArrayList(user.getType());
                } else {
                    typeList.add(user.getType());
                }
            }
        }
        paramMap.put(IntegrationAuthentication.USERLIST_KEY, new String[]{JSON.toJSONString(userList)});
        integrationAuthentication.setAuthParameters(paramMap);
        return typeList;
    }

    protected List<Integer> defaultGetUserTypes(IAccountService accountService, IntegrationAuthentication integrationAuthentication) {
        String tenantNo = integrationAuthentication.getAuthParameter(IntegrationAuthentication.TENANT_NO_KEY);
        String username = integrationAuthentication.getAuthParameter(IntegrationAuthentication.USERNAME_KEY);
        if (StringUtils.isBlank(tenantNo)) {
            return Collections.EMPTY_LIST;
        }
        log.info("username="+username);
        log.info("tenantNo="+tenantNo);
        List<User> userList = accountService.getUsersByUsernameAndTenantNo(username, tenantNo);
        if (CollectionUtils.isEmpty(userList)) {
            userList = accountService.getUsersByPhoneAndTenantNo(username, tenantNo);
        }
        log.info("userList="+ userList);
        return getUserTypes(userList, integrationAuthentication);
    }


    /**
     * 获取用户
     *
     * @param integrationAuthentication
     * @param accountService
     * @return com.gok.pboot.auth.User
     * @author: yzs
     */
    protected User getUserByLogin(IntegrationAuthentication integrationAuthentication, IAccountService accountService) {
        String authTypeFlag = integrationAuthentication.getAuthParameter(IntegrationAuthentication.AUTO_TYPE_FLAG);
        String tenantNo = integrationAuthentication.getAuthParameter(IntegrationAuthentication.TENANT_NO_KEY);
        String type = integrationAuthentication.getAuthParameter(IntegrationAuthentication.USER_TYPE_KEY);
        User user = null;
        if (StringUtils.isNotBlank(authTypeFlag)) {
            List<User> userList = JSON.parseArray(integrationAuthentication.getAuthParameter(IntegrationAuthentication.USERLIST_KEY), User.class);
            user = userList.get(0);
        } else {
            user = accountService.getLoginUser(integrationAuthentication.getUsername(), tenantNo, type);
        }
        return user;
    }

    /**
     * 更新默认信息
     *
     * @param user
     * @param accountService
     * @return com.gok.pboot.auth.User
     * @author: yzs
     */
    protected void updateUserDef(User user, IAccountService accountService) {
        Account account = new Account();
        account.setId(user.getAccountId());
        account.setDefTenant(user.getTenantId());
        account.setDefType(user.getType());
        if (UserType.PARENTS.getValue().equals(user.getType())) {
            account.setDefStudent(user.getDefStudent());
        }
        accountService.updateEntity(account);
    }
}
