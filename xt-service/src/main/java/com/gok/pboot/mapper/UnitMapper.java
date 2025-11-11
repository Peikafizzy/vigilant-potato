package com.gok.pboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.Unit;
import com.gok.pboot.auth.vo.UnitExportVO;
import com.gok.pboot.auth.vo.UnitSearchVO;
import com.gok.pboot.auth.vo.UnitVO;
import com.gok.pboot.auth.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年04月21日
 */
@Mapper
public interface UnitMapper extends BaseMapper<Unit> {

    List<Unit> findOrgByParentId(@Param("parentId") Long parentId);

    List<Unit> findTwoLevelOrgByParentId(@Param("rootId") Long rootId);

    String genOrgCode(@Param("parentId") Long parentId);

    List<Unit> selectGroupUnit(@Param("groupId") Long groupId);

    public List<String> getCheckedUnitsByGroupId(@Param("groupId") Long groupId);

    public List<Unit> getUnits(@Param("filter") Map<String, Object> filter);

    /**
     * 根据id获取机构
     *
     * @param id
     * @param tenantId
     * @return
     */
    public UnitVO getById(@Param("id") Long id, @Param("tenantId") Long tenantId);

    /**
     * 根据条件查询机构列表
     *
     * @param searchVO
     * @return
     */
    List<UnitVO> getUnitList(UnitSearchVO searchVO);

    /**
     * 根据父级id获取机构
     *
     * @param parentId
     * @param tenantId
     * @return
     */
    List<UnitVO> findByParentId(@Param("parentId") Long parentId, @Param("tenantId") Long tenantId);

    List<Unit> findByParentIds(@Param("parentIds") List<Long> parentIds);

    /**
     * 获取部门信息
     *
     *
     * @return 账户
     */
    Unit getUnitByNameAndId(@Param("name") String name, @Param("id") Long id);

    /**
     * 根据id删除部门
     * @author chx
     * @date 2023/12/4
     * @return void
     */
    void deleteUnitById(@Param("ids") List<Long> id);

    /**
     * 获取部门信息
     *
     *
     * @return 账户
     */
    Unit getUnitByParentIdAndId(@Param("parentId") String parentId, @Param("id") Long id);

    /**
     * 获取部门信息
     *
     *
     * @return 账户
     */
    Unit getUnitByName(@Param("name") String name);

    /**
     * 根据父级机构分页获取子机构列表
     * @param page
     * @param filter
     * @return
     */
    Page<UnitVO> findList(Page<UnitVO> page, @Param("filter") Map<String, Object> filter);

    /**
     * 根据父级机构分页获取子机构列表
     * @param page
     * @param filter
     * @return
     */
    List<Unit> getList(@Param("filter") Map<String, Object> filter);

    /**
     * 获取所有部门
     * @return List<Unit>
     */
    List<Unit> getAllUnitList();

    /**
     * 组织机构导出
     * @param filter
     * @return
     */
    List<UnitExportVO> getListExport(@Param("filter") Map<String, Object> filter);

    /**
     * 根据用户获取机构
     * @param searchVO
     * @return
     */
    List<UserVO> findByUserId(UnitSearchVO searchVO);
    List<Unit> findByParentIds2(@Param("parentIds") List<Long> parentIds, @Param("tenantId") Long tenantId);
}
