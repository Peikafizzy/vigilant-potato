package com.gok.pboot.rest;

import com.gok.pboot.CollectionUtils;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.vo.UserSearchVO;
import com.gok.pboot.auth.vo.UserVO;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.UserUtils;
import com.gok.pboot.config.BaseConfig;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.service.ISystemCommonService;
import com.gok.pboot.service.ITokenService;
import com.gok.pboot.utils.VerifyCodeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月09日
 */
@RestController
@Slf4j
public class SystemCommonController extends BaseController {

    private final ISystemCommonService systemCommonService;
    private final ITokenService tokenService;

    private final IAccountService accountService;

    @Autowired
    public SystemCommonController(ISystemCommonService systemCommonService, ITokenService tokenService, IAccountService accountService) {
        this.systemCommonService = systemCommonService;
        this.tokenService = tokenService;
        this.accountService = accountService;
    }

    /**
     * 登出操作
     * @param authentication
     * @return
     */
    @PostMapping("/_logout")
    public ApiResult logout(OAuth2Authentication authentication) {
        boolean result = tokenService.revokeAccessToken(authentication);
        return success(result);
    }

    /**
     * 是否开启手机验证
     * @param status
     * @return
     */
    @GetMapping("/updateVerifyCodeStatus/{status}")
    public ApiResult updateVerifyCodeStatus(@PathVariable("status") Integer status) {
        log.info("是否开启手机验证开关状态{}",status);
        systemCommonService.updateVerifyCodeStatus(status);
        return successMsg("成功");
    }

    /**
     *
     * @param key 存redis 的uuid
     * @return
     * @throws Exception
     */
    @PostMapping("/res/getVerifiCode/{key}")
    public ApiResult getVerifiCode(@PathVariable("key") String key)  throws Exception {
        return success(VerifyCodeUtils.getVerifyCode(key));
    }

    /**
     *  微信小程序解除绑定
     * @param authentication
     * @return
     * @throws Exception
     */
    //@PostMapping("/microAppUnbind")
    //public ApiResult microAppUnbind(OAuth2Authentication authentication){
    //    AccessTokenResp user = UserUtils.getUser();
    //    user.setOpenid(null);
    //    accountService.updateOpenidByUserId(user);
    //    boolean result = tokenService.revokeAccessToken(authentication);
    //    return success(result);
    //}

    /**
     *  修改密码
     * @param oldPassword   旧密码
     * @param newPassword   新密码
     * @return
     * @throws Exception
     */
    @PostMapping("/updatePassword/{oldPassword}/{newPassword}")
    public ApiResult updatePassword(@PathVariable("oldPassword") String oldPassword, @PathVariable("newPassword") String newPassword){
        User user =  accountService.getUser(UserUtils.getUserId());
        accountService.updateUserPassword(user, oldPassword, newPassword);
        return success("");
    }

    /**
     *  重置租户密码
     * @param tenantId   租户id
     * @return
     * @throws Exception
     */
    @PostMapping("/resetPassword/{tenantId}")
    public ApiResult resetTenantPassword(@PathVariable("tenantId") Long tenantId){
        if(BaseConfig.getLandlordId().equals(UserUtils.getTenantId())){
            UserSearchVO userSearchVO=new UserSearchVO();
            userSearchVO.setTenantId(tenantId);
            userSearchVO.setType(UserType.ADMIN.getValue());
            List<UserVO> userVOList=accountService.getUserList(userSearchVO);
            if(CollectionUtils.isNotEmpty(userVOList)){
                accountService.resetPassword(userVOList.get(0));
            }
        }
        return success("");
    }

    /**
     *  重置用户密码
     * @param userId  用户ID
     * @return
     * @throws Exception
     */
    @PostMapping("/resetUserPassword/{userId}")
    public ApiResult resetUserPassword(@PathVariable("userId") Long userId){
        UserSearchVO userSearchVO=new UserSearchVO();
        userSearchVO.setTenantId(UserUtils.getTenantId());
        userSearchVO.setIdList(Arrays.asList(userId));
        List<UserVO> userVOList=accountService.getUserList(userSearchVO);
        if(CollectionUtils.isNotEmpty(userVOList)){
            accountService.resetPassword(userVOList.get(0));
        }
        return success("");
    }

}
