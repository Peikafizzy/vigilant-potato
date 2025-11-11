package com.gok.pboot.rest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.BaseUserDetail;
import com.gok.pboot.auth.Unit;
import com.gok.pboot.auth.req.UserReq;
import com.gok.pboot.auth.vo.UnitSearchVO;
import com.gok.pboot.auth.vo.UnitUserVO;
import com.gok.pboot.auth.vo.UnitVO;
import com.gok.pboot.auth.vo.UserVO;
import com.gok.pboot.base.*;
import com.gok.pboot.service.IUnitService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月14日
 */
@RestController
@RequestMapping("/sys")
public class UnitController extends BaseController {

    private final IUnitService unitService;

    @Autowired
    public UnitController(IUnitService unitService) {
        this.unitService = unitService;
    }

    /**
     * 根据父id获取单位节点
     *
     * @param pid
     * @return
     */
    @GetMapping("/unit/tree/{pid}")
    public ApiResult getOrgByParentId(@PathVariable("pid") Long pid) {
        return success(unitService.getUnitByParentId(pid));
    }

    /**
     * 获取单位树信息
     *
     * @return
     */
    @GetMapping("/units")
//    //@PreAuthorize("hasAuthority('unit:list')")
    public ApiResult getAllUnits(UnitVO unitVO, HttpServletRequest request) {
//        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        return success(unitService.getAllUnits(JSONObject.parseObject(JSON.toJSONString(unitVO))));
    }

    /**
     * 获取可用机构树
     *
     * @return
     */
    @GetMapping("/units/findTree")
//    //@PreAuthorize("hasAuthority('unit:list')")
    public ApiResult findTree() {
        return success(unitService.getUseUnits());
    }

    /**
     * 根据条件分页查询
     *
     * @return
     */
    @GetMapping("/unit/findByPage")
//    //@PreAuthorize("hasAuthority('unit:list')")
    public ApiResult findByPage(PageRequest pageRequest, HttpServletRequest request) {
        Page<UnitVO> page = unitService.findByPage(pageRequest, PropertyFilters.get(request, true));
        return success(page);
    }

    /**
     * 保存组织机构
     *
     * @param entity
     * @return
     */
    @PostMapping("/unit")
//    //@PreAuthorize("hasAuthority('unit:save')")
    public ApiResult saveUnit(@Valid @RequestBody Unit entity, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        entity.setTenantId(tenantId);
        unitService.saveUnit(entity);
        return success(entity);
    }

    /**
     * 根据id删除组织机构
     *
     * @param id
     * @return
     */
    @DeleteMapping("/unit/{id}")
//    //@PreAuthorize("hasAuthority('unit:delete')")
    public ApiResult deleteUnit(@PathVariable("id") Long id, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        unitService.deleteUnit(id, tenantId);
        return success(id);
    }

    /**
     * 根据组id获取关联单位信息
     *
     * @param id
     * @return
     */
    @GetMapping("/unit/group/{id}")
    public ApiResult getGroupUnits(@PathVariable("id") Long id) {
        List<Unit> unitList = unitService.getGroupUnit(id);
        return success(unitList);
    }

    @GetMapping("/unit/checked")
    public ApiResult getCheckedUnit(@RequestParam("id") Long groupId) {
        return success(unitService.getCheckedUnitsByGroupId(groupId));
    }

    /**
     * 根据父id获取单位节点
     *
     * @param pid
     * @return
     */
    @GetMapping("/unit/parent/{pid}")
    public ApiResult<List<UnitVO>> getParentUnit(@PathVariable("pid") Long pid, Authentication authentication) {
        Long tenantId = ((BaseUserDetail) authentication.getPrincipal()).getBaseUser().getTenantId();
        return success(unitService.getParentUnit(pid, tenantId));
    }

    /**
     * 根据id获取组织机构
     *
     * @param id
     * @return
     */
    @GetMapping("/unit/{id}")
    public ApiResult<Unit> getUnitById(@PathVariable("id") Long id) {
        return success(unitService.selectOne(id));
    }


    /**
     * 根据条件查询组织机构
     *
     * @param searchVO
     * @return
     */
    @PostMapping("/unit/list")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult<List<UnitVO>> getUnitList(@RequestBody UnitSearchVO searchVO) {
        return success(unitService.getUnitList(searchVO));
    }

    /**
     * 根据用户获取机构
     *
     * @param searchVO
     * @return
     */
    @PostMapping("/unit/findByUserId")
//    //@PreAuthorize("hasAuthority('user:save')")
    public ApiResult<List<UserVO>> findByUserId(@RequestBody UnitSearchVO searchVO) {
        return success(unitService.findByUserId(searchVO));
    }

    /**
     * 根据父id获取单位节点
     *
     * @param pid
     * @return
     */
    @GetMapping("/unit/parentWithUser/{pid}")
    public ApiResult<List<UnitUserVO>> parentWithUser(@PathVariable("pid") Long pid) {
        return success(unitService.parentWithUser(pid, UserUtils.getTenantId(), false));
    }

    /**
     * 根据父节点获取机构(包含机构底下成员)和人员
     *
     * @param pid
     * @return
     */
    @GetMapping("/unit/getChildUserByPid/{pid}")
    public ApiResult<List<UnitUserVO>> getChildUserByPid(@PathVariable("pid") Long pid) {
        return success(unitService.parentWithUser(pid, UserUtils.getTenantId(), true));
    }


    /**
     * 根据id集合获取子节点
     *
     * @param ids {"ids":["1240890599700279297"]}
     * @return
     */
    @PostMapping("/unit/getChild")
    public ApiResult<List<Long>> getChild(@RequestBody Map<String, List<Long>> ids) {
        return success(unitService.getChildUnit(ids.get("ids")));
    }

    /**
     * 根据id获取子节点
     *
     * @param id
     * @return
     */
    @GetMapping("/unit/getChild2/{id}/{tenantId}")
    public ApiResult<List<Long>> getChild2(@PathVariable("id") Long id, @PathVariable("tenantId") Long tenantId) {
        return success(unitService.getChildUnit2(id, tenantId));
    }


    /**
     * 获取子机构和父机构
     *
     * @param unitId
     * @param tenantId
     * @param tenantId
     * @return
     */
    @GetMapping("/unit/getUnitIdsOfUnitId/{unitId}/{tenantId}")
    public ApiResult<Set<Long>> getUnitIdsOfUnitId(@PathVariable("unitId") Long unitId, @PathVariable("tenantId") Long tenantId) {
        return success(unitService.getUnitIdsOfUnitId(unitId, tenantId));
    }

    /**
     * 导出
     *
     * @param request
     * @param response
     * @return
     */
    @GetMapping("/unit/export")
    public void export(HttpServletRequest request, HttpServletResponse response) throws IOException {
        final Workbook workbook = unitService.export(PropertyFilters.get(request, true));
        commonDownload(response, workbook, "组织机构信息导出.xlsx");
    }

    /**
     * 获取机构下所有成员，包括子机构的成员
     *
     * @param unitIds
     * @return
     */
    @PostMapping("/unit/finAllUserByUnit")
    public ApiResult<Set<UserVO>> finAllUserByUnit(@RequestBody Set<Long> unitIds) {
        return success(unitService.finAllUserByUnit(unitIds));
    }

    /**
     * 获取机构下所有成员，包括子机构的成员
     *
     * @return
     */
    @GetMapping("/unit/getChildUserByUserId")
    public ApiResult<Set<UserVO>> finAllUserByUnit() {
        Set<Long> unitIds = new HashSet<>();
        unitIds.add(UserUtils.getUser().getUnitId());
        return success(unitService.finAllUserByUnit(unitIds));
    }

    /**
     * 根据角色id获取机构下所有成员，包括子机构的成员
     *
     * @param req
     * @return
     */
    @PostMapping("/unit/finAllUserByUnitAndGroupId")
    public ApiResult<Set<UserVO>> finAllUserByUnitAndGroupId(UserReq req) {
        return success(unitService.finAllUserByUnitAndGroupId(req.getUnitId(), req.getGroupId()));
    }

    @PostMapping("/unit/getUnitTree")
    public ApiResult<List<Unit>> getUnitTree(@RequestBody List<Unit> units) {
        return success(unitService.getUnitTree(units));
    }


}
