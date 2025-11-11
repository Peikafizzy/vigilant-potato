package com.gok.pboot.rest;

import com.gok.pboot.auth.Resource;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.UserUtils;
import com.gok.pboot.config.BaseConfig;
import com.gok.pboot.service.IAccountService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月14日
 */
@RestController
@RequestMapping("/sys")
public class ResourceController extends BaseController {
    private final IAccountService accountService;

    @Autowired
    public ResourceController(IAccountService accountService) {
        this.accountService = accountService;
    }

    /**
     * 获取所有的菜单信息
     * @return
     */
    @GetMapping("/resources")
    //@PreAuthorize("hasAuthority('resource:list')")
    public ApiResult getUserResources() {
        return success(accountService.mergeResources(accountService.getResources(UserUtils.getTenantId())));
    }

    /**
     * 根据id获取菜单信息
     * @param id
     * @return
     */
    @GetMapping("/resource/{id}")
    //@PreAuthorize("hasAuthority('resource:edit')")
    public ApiResult edit(@PathVariable("id") Long id) {
        return success(accountService.getResource(id, UserUtils.getTenantId()));
    }

    /**
     * 保存菜单信息
     * @param entity
     * @return
     */
    @PostMapping("/resource")
    //@PreAuthorize("hasAuthority('resource:save')")
    public ApiResult save(@Valid @RequestBody Resource entity) {
        entity.setTenantId(UserUtils.getTenantId());
        accountService.saveResource(entity);
        return success(entity);
    }

    /**
     * 删除菜单
     * @param id
     * @return
     */
    @DeleteMapping("/resource/{id}")
    //@PreAuthorize("hasAuthority('resource:delete')")
    public ApiResult delete(@PathVariable("id") Long id) {
        accountService.deleteResources(Lists.newArrayList(id), UserUtils.getTenantId());
        return success(id);
    }

    /**
     * 根据组id获取资源，带是否选中
     * @param id
     * @return
     */
    @GetMapping("/resource/group/{id}")
    public ApiResult getResourceByGroupId(@PathVariable("id") Long id){
        return success(accountService.getResourcesByGroupId(id, UserUtils.getTenantId()));
    }

    @GetMapping("/resource/checked")
    public ApiResult getResourceIdsByGroupId(@RequestParam("id") Long id) {
        return success(accountService.getCheckedResourceIds(id, UserUtils.getTenantId()));
    }

    /**
     * 添加默认租户菜单
     * @param ids
     * @return
     */
    @PostMapping("/resource/saveDefaultResource")
    public ApiResult saveDefaultResource(@RequestBody List<Long> ids) {
        accountService.saveDefaultResource(ids);
        return success("");
    }

    /**
     * 获取所有的菜单信息
     * @return
     */
    @GetMapping("/resource/defaultList")
    //@PreAuthorize("hasAuthority('resource:list')")
    public ApiResult<List<Resource>> defaultList() {
        return success(accountService.getCheckedResources(BaseConfig.getLandlordId(), BaseConfig.getResourceTenantId(),true));
    }

    /**
     * 添加租户菜单
     * @param ids
     * @return
     */
    @PostMapping("/resource/saveTenantResource/{tenantId}")
    public ApiResult saveTenantResource(@RequestBody List<Long> ids, @PathVariable("tenantId") Long tenantId) {
        accountService.saveTenantResource(ids,tenantId);
        return success("");
    }

    /**
     * 获取所有的菜单信息
     * @return
     */
    @GetMapping("/resource/tenantList/{tenantId}")
    //@PreAuthorize("hasAuthority('resource:list')")
    public ApiResult tenantResourceList(@PathVariable("tenantId") Long tenantId) {
        return success(accountService.getCheckedResources(BaseConfig.getResourceTenantId(),tenantId,true));
    }

}
