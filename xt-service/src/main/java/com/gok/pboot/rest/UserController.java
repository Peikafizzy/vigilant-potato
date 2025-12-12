package com.gok.pboot.rest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.BeanUtils;
import com.gok.pboot.CollectionUtils;
import com.gok.pboot.auth.Account;
import com.gok.pboot.auth.BaseUserDetail;
import com.gok.pboot.auth.Resource;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.resp.AccessTokenResp;
import com.gok.pboot.auth.vo.RegisterVO;
import com.gok.pboot.auth.vo.UnitUserVO;
import com.gok.pboot.auth.vo.UserSearchVO;
import com.gok.pboot.auth.vo.UserVO;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.base.UserUtils;
import com.gok.pboot.config.BaseConfig;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.service.impl.UserDetailsServiceImpl;
import com.google.common.collect.Lists;
import com.gok.pboot.entity.UserAccount;
import com.gok.pboot.service.IUserAccountService;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.ehcache.xml.model.TimeUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 用户管理rest
 *
 * @author funcas
 * @version 1.0
 * @date 2018年10月12日
 * | HTTP + Path                                  | Purpose / What it likely does                                                                        |
 * | -------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
 * | **POST /sys/userinfo**                       | Get the info of the currently authenticated user (user profile + permissions / resources)            |
 * | **GET /sys/users**                           | Get a list of users (with pagination / filter)                                                       |
 * | **GET /sys/userByUnit/{unitId}**             | Get list of users filtered by a “unit” (organization unit), using path parameter `unitId`            |
 * | **GET /sys/getUserByUnit**                   | Another version — get users by unit + tenantId via query parameters (`unitId`, `tenantId`)           |
 * | **GET /sys/user/{userId}**                   | Get a single user’s info by their `userId`                                                           |
 * | **GET /sys/user/checkUser**                  | Check account info (by username & phone) — maybe for verifying user identity / recovery / validation |
 * | **GET /sys/user/getAccountByUserNameExpose** | Get account details by username (exposed endpoint)                                                   |
 * | **POST /sys/user**                           | Create a new user (or save a user) — `@RequestBody User user`                                        |
 * | **POST /sys/updateUserOnly**                 | Update user info only (without maybe roles/permissions)                                              |
 * | **POST /sys/user/updateTenantPhone**         | Update tenant (organization) phone — some special permission/update action                           |
 * | **POST /sys/saveAdminUser**                  | Create or save an “admin” user (special privileges)                                                  |
 * | **POST /sys/user/list**                      | Search or list users based on some filter (body is `UserSearchVO`)                                   |
 * | **POST /sys/user/list/Expose**               | Similar to above, maybe a variant with looser permissions or less filtering                          |
 * | **POST /sys/user/listToMap**                 | Get list of users and return as a Map keyed by user ID (transformed result)                          |
 * | **DELETE /sys/user**                         | Batch delete users logically (by list of IDs) — “delete user(s)” action                              |
 * | **POST /sys/user/getUsersByIdList**          | Get multiple users by a list of IDs — batch fetch                                                    |
 * | **POST /sys/user/getUsersByGroup**           | Get users belonging to certain group(s) (by group ID set)                                            |
 * | **GET /sys/user/getUsersByIdList**           | Another batch-fetch endpoint (maybe for operations) by ID range (`begin`, `end`)                     |
 * | **GET /sys/getAccountById/{id}**             | Get account info by account ID                                                                       |
 * | **GET /sys/getAccountByPhone/{phone}**       | Get account info by phone number                                                                     |
 * | **POST /sys/user/insertBatch**               | Insert many users at once (bulk create)                                                              |
 * | **POST /sys/user/insertBatchExpose**         | Another version of bulk insert, maybe exposed differently                                            |
 * | **POST /sys/saveAccount**                    | Save a new account (not necessarily user) — perhaps registration or account creation                 |
 * | **GET /sys/countTenantId/{accountId}**       | Count or fetch the number of tenants associated with an account (by account ID)                      |
 * | **POST /sys/getByPhoneList**                 | Get accounts/users by a list of phone numbers (batch lookup)                                         |
 * | **POST /sys/switchType**                     | Switch a user’s type (role / classification) — maybe student ↔ teacher etc.                          |
 * | **POST /sys/updateState**                    | Update user state (e.g. active/inactive, enable/disable)                                             |
 * | **POST /sys/updatePassword/first**           | First phase of password update (for user resetting password, verifying phone or account)             |
 * | **POST /sys/updatePassword/second**          | Second phase of password update (actually set new password)                                          |
 * | **POST /sys/checkPassword**                  | Check if provided credentials/password matches (maybe for change password / verification)            |
 * | **POST /sys/updatePhone**                    | Update user phone number                                                                             |
 * | **POST /sys/findByUserFilter**               | Search users by some filter object (User fields)                                                     |
 * | **POST /sys/findByUserFilterExpose**         | Same as above but maybe “public/exposed” version (less restrictions)                                 |
 * | **POST /sys/findByPhoneList**                | Find users by list of phone numbers (batch search)                                                   |
 * | **POST /sys/getUserMapByAccountIdList**      | Get a map of users keyed by account IDs from a `UserSearchVO` request                                |
 */
@RestController
@RequestMapping("/sys")
@Slf4j
public class UserController extends BaseController {

    private final IAccountService accountService;
    @Autowired
    public UserController(IAccountService accountService) {
        this.accountService = accountService;
    }
    /**
     * 获取登陆用户信息接口
     *
     * @param authentication
     * @return
     */
    @PostMapping("/userinfo")
    public ApiResult getUserInfo(Authentication authentication) {
        AccessTokenResp userVo = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser();
        Long uid = userVo.getId();
        //if (UserType.PARENTS.getValue().equals(userVo.getType())) {
        //    uid = userVo.getParentsId();
        //}
        User user = accountService.getUser(uid);
        List<Resource> resourceList = accountService.getUserResources(uid);
        List<Resource> userResourceList = accountService.mergeResources(resourceList);
        List<String> perms = Lists.newArrayList();
        for (Resource resource : resourceList) {
            if (StringUtils.isNotEmpty(resource.getPermission())) {
                perms.add(resource.getPermission());
            }
        }
        perms.add(UserDetailsServiceImpl.DEFAULT_PERMS);
        log.info("输出权限：{}", perms);
        user.setPerms(perms);
        user.setResourceList(userResourceList);
        user.setWeakPwd(userVo.getWeakPwd());
        if (UserType.PARENTS.getValue().equals(user.getType())) {
            user.setParentsId(user.getId());
            user.setId(user.getDefStudent());
        }
        return success(user);
    }

    /**
     * 获取用户列表接口
     *
     * @param pageRequest
     * @param request
     * @return
     */
    @GetMapping("/users")
    //@PreAuthorize("hasAuthority('user:list')")
    public ApiResult getUserLists(PageRequest pageRequest, User user) {
        log.info("测试");
        Map<String, Object> filter = JSONObject.parseObject(JSON.toJSONString(user));
        filter.put("tenantId", UserUtils.getTenantId());
        Page<User> userIPage = accountService.findUsers(pageRequest, filter);
        return success(userIPage);
    }

    /**
     * 根据机构获取用户列表接口
     *
     * @param unitId
     * @return
     */
    @GetMapping("/userByUnit/{unitId}")
//    //@PreAuthorize("hasAuthority('user:list')")
    public ApiResult getUserLists(@PathVariable Long unitId, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        List<User> userList = accountService.getListByUnitId(unitId, tenantId);
        return success(userList);
    }


    /**
     * 根据机构获取用户接口，需要对参数解密
     *
     * @param unitId   机构id
     * @param tenantId 租户id
     * @return
     */
    @GetMapping("/getUserByUnit")
    public ApiResult<List<User>> getUserByUnit(@RequestParam("unitId") String unitId, @RequestParam("tenantId") String tenantId) {
        if (StringUtils.isBlank(tenantId) || StringUtils.isBlank(unitId)) {
            return failure(null);
        }
        List<User> userList = accountService.getListByUnitId(Long.valueOf(unitId), Long.valueOf(tenantId));
        return success(userList);
    }


    /**
     * 根据用户id获取用户信息
     *
     * @param userId
     * @return
     */
    @GetMapping("/user/{userId}")
//    //@PreAuthorize("hasAuthority('user:edit')")
    public ApiResult<User> getUserById(@PathVariable("userId") Long userId) {
        User user = accountService.getUser(userId);
        return success(user);
    }

    /**
     * 根据账户id获取账号信息
     *
     * @param userName
     * @return
     */
    @GetMapping("/user/checkUser")
//    //@PreAuthorize("hasAuthority('user:edit')")
    public ApiResult checkUser(@RequestParam("userName") String userName, @RequestParam("phone") String phone) {
        Account account = accountService.getAccount(userName);
        if (account == null) {
            return failureMsg("用户名与手机号不匹配！");
        }
        String userPhone = account.getPhone();
        if (!phone.equals(userPhone)) {
            return failureMsg("用户名与手机号不匹配！");
        }
        return success("");
    }

    /**
     * 根据账户id获取账号信息
     *
     * @param userName
     * @return
     */
    @GetMapping("/user/getAccountByUserNameExpose")
//    //@PreAuthorize("hasAuthority('user:edit')")
    public ApiResult<Account> getAccountByUserName(@RequestParam("userName") String userName) {
        Account account = accountService.getAccount(userName);
        return success(account);
    }

    /**
     * 保存用户
     *
     * @param user
     * @return
     */
    @PostMapping("/user")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult<User> saveUser(@Valid @RequestBody User user, Authentication authentication) {
        AccessTokenResp creator = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser();
        //教职工只能编辑角色
        if (null != user.getId() && UserType.TEACHER.getValue().equals(user.getType())) {
            accountService.editTeacherGroup(user);
        } else {
            user.setType(UserType.USER.getValue());
            user.setTenantId(creator.getTenantId());
            user.setTenantNo(creator.getTenantNo());
            accountService.saveUser(user);
        }
        return success(user);
    }

    /**
     * 保存用户
     *
     * @param user
     * @return
     */
    @PostMapping("/updateUserOnly")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult<User> updateUserOnly(@RequestBody User user) {
        accountService.updateUserOnly(user);
        return success(user);
    }


    /**
     * 修改手机号码
     *
     * @param userVO
     * @return
     */
    @PostMapping("/user/updateTenantPhone")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult updateTenantPhone(@RequestBody UserVO userVO) {
        if (!UserUtils.getTenantId().equals(BaseConfig.getLandlordId())) {
            return failureMsg("非法操作！");
        }
        return success(accountService.updateTenantPhone(userVO));
    }

    /**
     * 根据用户id删除用户
     * @param userId
     * @return
     */
//    @DeleteMapping("/user/{userId}")
////    //@PreAuthorize("hasAuthority('user:delete')")
//    public ApiResult deleteUser(@PathVariable("userId") Long userId, Authentication authentication){
//        Long tenantId = ((BaseUserDetail)authentication.getPrincipal()).getBaseUser().getTenantId();
//        accountService.deleteUsers(Lists.newArrayList(userId), tenantId);
//        return success(userId);
//    }

    /**
     * 批量删除用户（物理）
     * @param ids
     * @return
     */
//    @DeleteMapping("/user/batch")
//    public ApiResult deleteUserBatch(@RequestBody List<Long> ids, Authentication authentication){
//        Long tenantId = ((BaseUserDetail)authentication.getPrincipal()).getBaseUser().getTenantId();
//        accountService.deleteUsers(ids, tenantId);
//        return success(ids);
//    }

    /**
     * 保存用户
     *
     * @param userVO
     * @return
     */
    @PostMapping("/saveAdminUser")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult saveAdminUser(@Valid @RequestBody UserVO userVO, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        if (!tenantId.equals(BaseConfig.getLandlordId())) {
            return failureMsg("非法操作！");
        }
        User user = BeanUtils.copyObject(userVO, User.class);
        accountService.saveAdminUser(user);
        return success(user);
    }


    /**
     * 根据条件查询用户
     *
     * @param searchVO
     * @return
     */
    @PostMapping("/user/list")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult<List<UserVO>> getUserList(@RequestBody UserSearchVO searchVO) {
        return success(accountService.getUserList(searchVO));
    }

    /**
     * 根据条件查询用户暴露接口
     *
     * @param searchVO
     * @return
     */
    @PostMapping("/user/list/Expose")
    public ApiResult<List<UserVO>> getUserListExpose(@RequestBody UserSearchVO searchVO) {
        return success(accountService.getUserList(searchVO));
    }

    @PostMapping("/user/listToMap")
    public ApiResult<Map<Long, UserVO>> listToMap(@RequestBody UserSearchVO searchVO) {
        List<UserVO> userVOS = accountService.getUserList(searchVO);
        Map<Long, UserVO> map = userVOS.stream().collect(Collectors.toMap(UserVO::getId, a -> a, (k1, k2) -> k1));
        return success(map);
    }

    /**
     * 批量逻辑删除
     *
     * @param ids
     * @return com.gok.pboot.base.ApiResult
     */
    @DeleteMapping("/user")
    public ApiResult deleteUserBatch(@RequestBody List<Long> ids) {
        accountService.delBatchByLogic(ids);
        return success(null);
    }

    /**
     * 根据用户id集合获取用户信息
     *
     * @param ids
     * @return
     */
    @PostMapping("/user/getUsersByIdList")
    public ApiResult<List<User>> getUsersByIdList(@RequestBody List<Long> ids) {
        //id集合为空，进行返回
        if (CollectionUtils.isEmpty(ids)) {
            return success(new ArrayList<>());
        }
        return success(accountService.getUsersByIdList(ids));
    }

    /**
     * 根据角色ID集合查询用户
     *
     * @param ids
     * @return
     */
    @PostMapping("/user/getUsersByGroup")
    public ApiResult<List<UnitUserVO>> getUsersByGroup(@RequestBody Set<Long> ids) {
        //id集合为空，进行返回
        if (CollectionUtils.isEmpty(ids)) {
            return success(new ArrayList<>());
        }
        return success(accountService.getUsersByGroup(ids));
    }


    /**
     * 用户，账户分离获取用户信息运维专用
     *
     * @param begin limit开始
     * @param end   limit结束
     * @return
     */
    @GetMapping("/user/getUsersByIdList")
    public ApiResult<List<UserVO>> getOperationsUsers(@RequestParam("begin") int begin, @RequestParam("end") int end) {
        return ApiResult.success(accountService.getOperationsUsers(begin, end));
    }

    /**
     * @param id 账号表主键
     * @return
     */
    @GetMapping("/getAccountById/{id}")
    public ApiResult<Account> getAccountById(@PathVariable("id") Long id) {
        return ApiResult.success(accountService.getAccountById(id));
    }

    /**
     * 通过手机号查询
     *
     * @param phone 手机号
     * @return
     */
    @GetMapping("/getAccountByPhone/{phone}")
    public ApiResult<Account> getAccountByPhone(@PathVariable("phone") String phone) {
        return ApiResult.success(accountService.getByPhone(phone));
    }

    @PostMapping("/user/insertBatch")
    public ApiResult insertBatch(@RequestBody List<User> users) {
        accountService.insertBatch(users);
        return success("success");
    }

    @PostMapping("/user/insertBatchExpose")
    public ApiResult insertBatchExpose(@RequestBody List<User> users) {
        accountService.insertBatch(users);
        return success("success");
    }

    @PostMapping("/saveAccount")
    public ApiResult saveAccount(@RequestBody RegisterVO vo) {
        return success(accountService.saveAccount(vo));
    }

    @GetMapping("/countTenantId/{accountId}")
    public ApiResult<List<Long>> getAccountByPhone(@PathVariable("accountId") Long accountId) {
        return ApiResult.success(accountService.countTenantId(accountId));
    }

    @PostMapping("/getByPhoneList")
    public ApiResult getByPhoneList(@RequestBody List<String> phoneList) {
        return success(accountService.getByPhoneList(phoneList));
    }

    @PostMapping("/switchType")
    public ApiResult switchType(@RequestBody User user) {
        return success(accountService.findTypeByAccount(user));
    }

    @PostMapping("/updateState")
    public ApiResult updateState(@RequestBody UserVO vo) {
        return success(accountService.updateState(vo));
    }

    @PostMapping("/updatePassword/first")
    public ApiResult updatePasswordFirst(@RequestBody RegisterVO vo) {
        Long aLong = accountService.updatePasswordFirst(vo);
        if (aLong != null) {
            return success(aLong);
        } else {
            return failureMsg("用户名或手机号码输入有误，请重新输入");
        }

    }

    @PostMapping("/updatePassword/second")
    public ApiResult updatePasswordFirst(@RequestBody Account account) {
        accountService.updatePasswordSecond(account);
        return success(1);
    }

    @PostMapping("/checkPassword")
    public ApiResult<Boolean> checkPassword(@RequestBody RegisterVO vo) {
        return ApiResult.success(accountService.checkPassword(vo));
    }

    @PostMapping("/updatePhone")
    public ApiResult updatePhone(@RequestBody RegisterVO vo) {
        return accountService.updatePhone(vo);
    }


    @PostMapping("/findByUserFilter")
    public ApiResult findByUserFilter(@RequestBody User user) {
        return success(accountService.findByUserFilter(user));
    }

    @PostMapping("/findByUserFilterExpose")
    public ApiResult findByUserFilterExpose(@RequestBody User user) {
        return success(accountService.findByUserFilter(user));
    }

    @PostMapping("/findByPhoneList")
    public ApiResult findByPhoneList(@RequestBody List<String> phoneList) {
        return success(accountService.findByPhoneList(phoneList));
    }

    @PostMapping("/getUserMapByAccountIdList")
    public ApiResult getUserMapByAccountIdList(UserSearchVO vo) {
        return success(accountService.getUserMapByAccountIdList(vo));
    }
}
