package com.gok.pboot.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.CollectionUtils;
import com.gok.pboot.auth.BaseUserDetail;
import com.gok.pboot.auth.Group;
import com.gok.pboot.auth.vo.GroupSearchVO;
import com.gok.pboot.auth.vo.GroupVO;
import com.gok.pboot.auth.vo.UserVO;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.base.PropertyFilters;
import com.gok.pboot.service.IAccountService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月14日
 */
@RestController
@RequestMapping("/sys")
public class GroupController extends BaseController {

    private final IAccountService accountService;


    @Autowired
    public GroupController(IAccountService accountService) {
        this.accountService = accountService;
    }

    /**
     * 分页获取组列表
     *
     * @param pageRequest
     * @param request
     * @return
     */
    @GetMapping("/groups")
//    //@PreAuthorize("hasAuthority('group:list')")
    public ApiResult list(PageRequest pageRequest, HttpServletRequest request, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        Map<String, Object> filter = PropertyFilters.get(request, true);
        filter.put("tenantId", tenantId);
        Page<Group> groupList = accountService.findGroups(pageRequest, filter);
        return success(groupList);
    }

    /**
     * 根据id获取组信息
     *
     * @param id
     * @return
     */
    @GetMapping("/group/{id}")
//    //@PreAuthorize("hasAuthority('group:edit')")
    public ApiResult edit(@PathVariable("id") Long id) {
        return success(accountService.getGroup(id));
    }


    /**
     * 保存组信息
     *
     * @param group
     * @return
     */
    @PostMapping("/group")
//    //@PreAuthorize("hasAuthority('group:save')")
    public ApiResult save(@Valid @RequestBody Group group, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        group.setTenantId(tenantId);
        accountService.saveGroup(group);
        return success(group);
    }

    @PostMapping("/findGroupList")
    public ApiResult findGroupList(@RequestBody GroupSearchVO searchVO) {
        return success(accountService.findGroupList(searchVO));
    }

    @PostMapping("/groupAddUser")
    public ApiResult groupAddUser(@RequestBody GroupVO groupVO) {
        accountService.saveGroupUser(groupVO);
        return successMsg("成功");
    }

    @GetMapping("/findByGroupId/{groupId}/{userType}")
    public ApiResult findByGroupId(@PathVariable("groupId") Long groupId, @PathVariable("userType") Integer userType) {
        List<UserVO> list = accountService.findByGroupId(groupId, userType);
        return success(list);
    }


    /**
     * 按id删除组信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/group/{id}")
//    //@PreAuthorize("hasAuthority('group:delete')")
    public ApiResult delete(@PathVariable("id") Long id) {
        accountService.deleteGroups(Lists.newArrayList(id));
        return success(id);
    }

    /**
     * 批量删除组
     *
     * @param ids
     * @return
     */
    @DeleteMapping("/group/batch")
//    //@PreAuthorize("hasAuthority('group:delete')")
    public ApiResult deleteBatch(List<Long> ids) {
        accountService.deleteGroups(ids);
        return success(ids);
    }

    /**
     * 根据角色ID集合查询角色
     *
     * @param ids
     * @return
     */
    @PostMapping("/group/findGroupByIds")
    public ApiResult<List<Group>> findGroupByIds(@RequestBody List<Long> ids) {
        //id集合为空，进行返回
        if (CollectionUtils.isEmpty(ids)) {
            return success(new ArrayList<>());
        }
        return success(accountService.findGroupByIds(ids));
    }

}
