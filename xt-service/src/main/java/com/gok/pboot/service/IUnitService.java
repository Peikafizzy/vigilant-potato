package com.gok.pboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.Unit;
import com.gok.pboot.auth.vo.UnitSearchVO;
import com.gok.pboot.auth.vo.UnitUserVO;
import com.gok.pboot.auth.vo.UnitVO;
import com.gok.pboot.auth.vo.UserVO;
import com.gok.pboot.base.PageRequest;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Workbook;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年04月26日
 */
public interface IUnitService {

    public void saveUnit(Unit entity);

    public List<Unit> getUnitByParentId(Long pid);

    public List<Unit> getAllUnits(@Param("filter") Map<String, Object> filter);

    /**
     * 获取可用机构树
     * @return
     */
    public List<Unit> getUseUnits();

    public void deleteUnit(Long id, Long tenantId);

    public Unit selectOne(Long id);

    public List<Unit> getGroupUnit(Long id);

    public List<String> getCheckedUnitsByGroupId(Long groupId);

    public List<Unit> getUnitByDataScope(Long groupId);

    /**
     * 根据id查询所有父节点
     *
     * @param id
     * @param tenantId
     * @return
     */
    List<UnitVO> getParentUnit(Long id, Long tenantId);

    /**
     * 根据条件查询机构列表
     *
     * @param searchVO
     * @return
     */
    List<UnitVO> getUnitList(UnitSearchVO searchVO);

    /**
     * 显示当前组织成员和下级部门
     * @param id
     * @param tenantId
     * @param includeUnitUser 是否包含机构底下的用户
     * @return
     */
    List<UnitUserVO> parentWithUser(Long id, Long tenantId, Boolean includeUnitUser);

    /**
     * 根据ids查询所有子节点
     *
     * @param ids 机构id集合
     * @return
     */
    List<Long> getChildUnit(List<Long> ids);
    List<Long> getChildUnit2(Long id,Long tenantId);


    Set<Long> getUnitIdsOfUnitId(Long unitId,Long tenantId);

    /**
     * 根据用户获取机构
     * @param searchVO
     * @return
     */
    List<UserVO> findByUserId(UnitSearchVO searchVO);

    /**
     * 根据父级机构分页获取子机构列表
     * @param pageRequest
     * @param filter
     * @return
     */
    Page<UnitVO> findByPage(PageRequest pageRequest, Map<String, Object> filter);

    /**
     * 组织机构信息导出
     * @param filter
     * @return
     */
    Workbook export(Map<String, Object> filter);


    Set<UserVO> finAllUserByUnit(Set<Long> unitIds);

    Set<UserVO> finAllUserByUnitAndGroupId(String unitIds, String groupId);

    List<Unit> getUnitTree(List<Unit> units);

    Set<UserVO> finUserByUnit(Long unitId, String tenantId);
}
