package com.gok.pboot.service.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.CollectionUtils;
import com.gok.pboot.auth.Unit;
import com.gok.pboot.auth.vo.*;
import com.gok.pboot.base.BaseBuildEntity;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.base.UserUtils;
import com.gok.pboot.easypoi.SheetExcelExportStyler;
import com.gok.pboot.enumeration.entity.DelFlag;
import com.gok.pboot.enumeration.entity.State;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.exception.ServiceException;
import com.gok.pboot.mapper.UnitMapper;
import com.gok.pboot.mapper.UserMapper;
import com.gok.pboot.platform.servicemanage.enumeration.ServiceObjEnum;
import com.gok.pboot.service.IUnitService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.list.TreeList;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年04月26日
 */
@Slf4j
@Service("organizationService")
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class UnitServiceImpl extends BaseBizService implements IUnitService {

    private final UnitMapper unitMapper;
    private final UserMapper userMapper;

    private static final String TENANT_ID="tenant_id";

    @Autowired
    public UnitServiceImpl(UnitMapper unitMapper, UserMapper userMapper) {
        this.unitMapper = unitMapper;
        this.userMapper = userMapper;
    }

    /**
     * 保存组织机构信息
     *
     * @param entity
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveUnit(Unit entity) {
        log.info("请求参数:{}", entity);
        Long tenantId = UserUtils.getTenantId();
        if (entity.getParentId() != null) {
            //校验当前上级部门是否存在
            Unit unit = unitMapper.selectById(entity.getParentId());
            if (unit == null) {
                throw new ServiceException("上级部门不存在，请重新输入");
            }
            Map<String, Object> map = new HashMap<>();
            if (unit.getLevel() >= 5) {
                throw new ServiceException("超过最大层级，请重新选择上级部门");
            }
            entity.setLevel(unit.getLevel() + 1);
            entity.setOrgCode(this.generateOrgCode(entity.getParentId()));

        } else {
            entity.setLevel(1);
            entity.setParentId(0L);
        }

        if (entity.getId() != null) {

            //校验当前部门名称是否已存在
            if (unitMapper.getUnitByNameAndId(entity.getName(), entity.getId()) != null) {
                throw new ServiceException("部门名称已存在，请重新输入");
            }
            Unit oldUnit = unitMapper.selectById(entity.getId());
            if (CollectionUtils.isNotEmpty(unitMapper.findByParentId(entity.getId(), tenantId))
                    && !oldUnit.getParentId().equals(entity.getParentId())) {
                throw new ServiceException("当前部门存在下级部门，不可编辑上级部门");
            }

            //检测关联数据是否停用
            checkSubUnit(entity, tenantId);
            BaseBuildEntity.buildUpdate(entity);
            List<UnitVO> byParentId = unitMapper.findByParentId(entity.getParentId(), tenantId);
            if (CollectionUtils.isNotEmpty(byParentId)) {
                entity.setSort(byParentId.get(byParentId.size() - 1).getSort() + 1);
            } else {
                entity.setSort(0);
            }
            unitMapper.update(entity, new QueryWrapper<Unit>().eq("id", entity.getId()).eq(TENANT_ID, tenantId));
        } else {
            List<Unit> allUnitList = unitMapper.getAllUnitList();
            if (allUnitList.size() >= 99) {
                throw new ServiceException("部门数不超过99个");
            }
            if (unitMapper.getUnitByName(entity.getName()) != null) {
                throw new ServiceException("部门名称已存在，请重新输入");
            }
            //已停用的上级建筑在查看时，用户点击新增按钮时，需提示用户“该机构已停用，请先启用机构在执行操作”
            UnitVO unit = unitMapper.getById(entity.getParentId(), tenantId);
            if (null != unit && State.DISABLE.getValue().compareTo(unit.getState()) == 0) {
                throw new ServiceException("该机构已停用，请先启用机构在执行操作");
            }
            BaseBuildEntity.tenantBuildInsert(entity);
            entity.setState(State.ENABLE.getValue());
            List<UnitVO> byParentId = unitMapper.findByParentId(entity.getParentId(), tenantId);
            if (CollectionUtils.isNotEmpty(byParentId)) {
                entity.setSort(byParentId.get(byParentId.size() - 1).getSort() + 1);
            } else {
                entity.setSort(0);
            }

            unitMapper.insert(entity);
        }

    }

    private void checkSubUnit(Unit unit, Long tenantId) {
        //当存在下级机构时，对上级机构进行停用时，需提示用户“该机构正被其他下级机构使用，不允许停用
        if (State.DISABLE.getValue().compareTo(unit.getState()) == 0) {
            UnitSearchVO searchVO = new UnitSearchVO();
            searchVO.setTenantId(tenantId);
            searchVO.setState(State.ENABLE.getValue());
            searchVO.setParentId(unit.getId());
            List<UnitVO> subList = unitMapper.getUnitList(searchVO);
            if (CollectionUtils.isNotEmpty(subList)) {
                throw new ServiceException("该机构正被其他下级机构使用，不允许停用");
            }
            //禁用时需判断是否有关联用户
            List<UserVO> userVOList = userMapper.findByUnitId(unit.getId(), tenantId, UserType.TEACHER.getValue());
            if (CollectionUtils.isNotEmpty(userVOList)) {
                throw new ServiceException("该机构下已关联用户,无法停用");
            }
        }
    }


    @Override
    public List<Unit> getUnitByDataScope(Long groupId) {
        Map<String, Object> filterMap = Maps.newHashMap();
        filterMap.put("delFlag", DelFlag.NORMAL.getValue());
        String ds = this.dataScopeFilter(Unit.ALIAS, "id", USER_COLUMN);
        filterMap.put(DS_FILTER, ds);
        filterMap.put("groupId", groupId);
        return this.mergeUnit2(unitMapper.getUnits(filterMap));
    }


    private List<Unit> mergeUnit2(List<Unit> units) {
        List<Unit> result = Lists.newArrayList();
        String orgCode = units.get(0).getOrgCode();
        int minLevel = orgCode.length();
        for (Unit entity : units) {
            if (entity.getOrgCode().length() - 3 < minLevel) {
                recursionResource(entity, units);
                result.add(entity);
            }
        }

        return result;
    }

    /**
     * 根据父id获取组织机构列表
     *
     * @param pid
     * @return
     */
    @Override
    public List<Unit> getUnitByParentId(Long pid) {
        return unitMapper.selectList(new QueryWrapper<Unit>().eq("parent_id", pid));
    }

    @Override
    public List<Unit> getAllUnits(@Param("filter") Map<String, Object> filter) {
        //若存在名称查询
        if (filter.get("name") != null && StringUtils.isNotBlank(filter.get("name").toString())) {
            return this.mergeUnitByName(unitMapper.getList(filter));
        }

        return this.mergeUnit(unitMapper.getList(filter));
    }

    @Override
    public List<Unit> getUseUnits() {
        return this.mergeUnitByLevel(unitMapper.selectList(new QueryWrapper<Unit>().eq("del_flag", 0).eq(TENANT_ID, UserUtils.getTenantId()).eq("state", State.ENABLE.getValue()).orderByAsc("sort")));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUnit(Long id, Long tenantId) {
        //校验是否存在用户使用
        Map<String, Object> map = new HashMap<>();
        map.put("unit_id", id);
        List<Long> unitIds = new ArrayList<>();
        unitIds.add(id);
        List<Long> childUnit = getChildUnit(unitIds);
        childUnit.add(id);
        List<UserVO> userVOList = userMapper.findByUnitIds(childUnit);
        if (CollectionUtils.isNotEmpty(userVOList)) {
            throw new ServiceException("部门下存在用户，不可删除");
        }
        unitMapper.deleteUnitById(childUnit);
    }

    /**
     * 根据id获取组织机构
     *
     * @param id
     * @return
     */
    @Override
    public Unit selectOne(Long id) {
        return unitMapper.selectById(id);
    }

    /**
     * 按用户组查询关联的组织
     *
     * @param id 用户id
     * @return
     */
    @Override
    public List<Unit> getGroupUnit(Long id) {
        return this.mergeUnit(unitMapper.selectGroupUnit(id));
    }

    @Override
    public List<String> getCheckedUnitsByGroupId(Long groupId) {
        return unitMapper.getCheckedUnitsByGroupId(groupId);
    }

    @Override
    public List<UnitVO> getParentUnit(Long id, Long tenantId) {
        return getParentUnit(id, tenantId, new ArrayList<>());
    }

    private List<UnitVO> getParentUnit(Long id, Long tenantId, List<UnitVO> unitList) {
        UnitVO unit = unitMapper.getById(id, tenantId);
        unitList.add(unit);
        if (unit.getParentId() == 0) {
            return unitList;
        } else {
            return getParentUnit(unit.getParentId(), tenantId, unitList);
        }
    }

    private List<Unit> mergeUnit(List<Unit> units) {
        List<Unit> result = Lists.newArrayList();
        for (Unit entity : units) {
            Long parentId = entity.getParentId();
            if (parentId == 0) {
                recursionResource(entity, units);
                result.add(entity);
            }
        }
        return result;
    }

    private List<Unit> mergeUnitByLevel(List<Unit> units) {
        List<Unit> result = Lists.newArrayList();
        for (Unit entity : units) {
            Long parentId = entity.getParentId();
            if (parentId == 0) {
                recursionResourceByLevel(entity, units);
                result.add(entity);
            }
        }
        return result;
    }

    private List<Unit> mergeUnitByName(List<Unit> units) {
        List<Unit> result = Lists.newArrayList();
        for (Unit entity : units) {
            recursionResource(entity, units);
            result.add(entity);

        }
        return result;
    }

    private void recursionResource(Unit parent, List<Unit> units) {

        for (Unit entity : units) {
            Long parentId = entity.getParentId();

            if (parentId == 0) {
                continue;
            }

            Long id = parent.getId();
            System.out.println(parentId.equals(id));
            if (parentId.equals(id)) {
                recursionResource(entity, units);
                parent.addChildren(entity);
            }
        }
    }

    private void recursionResourceByLevel(Unit parent, List<Unit> units) {

        for (Unit entity : units) {
            Long parentId = entity.getParentId();

            if (parentId == 0 || parent.getLevel() == 4) {
                continue;
            }

            Long id = parent.getId();

            if (parentId.equals(id)) {
                recursionResourceByLevel(entity, units);
                parent.addChildren(entity);
            }
        }
    }

    /**
     * 生成orgCode
     *
     * @param parentId 父级id
     * @return
     */
    private String generateOrgCode(Long parentId) {
        String orgCode = unitMapper.genOrgCode(parentId);
        if (null == orgCode) {
            Unit unit = unitMapper.selectById(parentId);
            return unit.getOrgCode() + "001";
        }
        return orgCode;
    }

    @Override
    public List<UnitVO> getUnitList(UnitSearchVO searchVO) {
        return unitMapper.getUnitList(searchVO);
    }

    @Override
    public List<UnitUserVO> parentWithUser(Long id, Long tenantId, Boolean includeUnitUser) {
        List<UnitVO> unitVOList = unitMapper.findByParentId(id, tenantId);
        List<UnitUserVO> unitUserVOList = new TreeList();
        if (CollectionUtils.isNotEmpty(unitVOList)) {
            for (UnitVO unitVO : unitVOList) {
                UnitUserVO unitUserVO = new UnitUserVO();
                unitUserVO.setId(unitVO.getId());
                unitUserVO.setName(unitVO.getName());
                unitUserVO.setType(ServiceObjEnum.S_UN_ID.getValue());
                if (includeUnitUser) {
                    unitUserVO.setUserVOList(userMapper.findByUnitId(unitVO.getId(), UserUtils.getTenantId(), UserType.USER.getValue()));
                }
                unitUserVOList.add(unitUserVO);
            }
        }

        return unitUserVOList;
    }

    @Override
    public List<Long> getChildUnit(List<Long> ids ) {
        List<Unit> unitList = unitMapper.findByParentIds(ids);
        List<Long> allIds = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(unitList)){
            getChildUnit(unitList, allIds);
        }
        allIds.addAll(ids);
        return allIds;
    }

    @Override
    public List<UserVO> findByUserId(UnitSearchVO searchVO) {
        return unitMapper.findByUserId(searchVO);
    }

    @Override
    public Page<UnitVO> findByPage(PageRequest pageRequest, Map<String, Object> filter) {
        return unitMapper.findList(new Page<>(pageRequest.getPageNumber(), pageRequest.getPageSize()), filter);
    }

    @Override
    public Workbook export(Map<String, Object> filter) {
        List<UnitExportVO> unitExportVOList = unitMapper.getListExport(filter);
        ExportParams exportParams = new ExportParams();
        exportParams.setType(ExcelType.XSSF);
        exportParams.setStyle(SheetExcelExportStyler.class);
        return ExcelExportUtil.exportExcel(exportParams, UnitExportVO.class, unitExportVOList);
    }

    private List<Long> getChildUnit(List<Unit> unitList, List<Long> allIds) {
        List<Long> unitIds = new ArrayList<>();
        for (Unit unit : unitList) {
            unitIds.add(unit.getId());
        }
        allIds.addAll(unitIds);
        List<Unit> childList = unitMapper.findByParentIds(unitIds);
        if (CollectionUtils.isNotEmpty(childList)) {
            return getChildUnit(childList, allIds);
        } else {
            return allIds;
        }
    }


    @Override
    public List<Long> getChildUnit2(Long id, Long tenantId) {
        Unit unit = unitMapper.selectById(id);
        List<Unit> unitList = new ArrayList<>();
        unitList.add(unit);
        List<Long> allIds = new ArrayList<>();
        getChildUnit2(unitList, allIds, tenantId);
        return allIds;
    }

    @Override
    public Set<Long> getUnitIdsOfUnitId(Long unitId, Long tenantId) {
        Set<Long> set = Sets.newHashSet();
        set.add(unitId);
        //获取子机构
       /* List<Long> childList = getChildUnit2(unitId, tenantId);
        if (CollectionUtils.isNotEmpty(childList)) {
            for (Long id : childList) {
                set.add(id);
            }
        }*/
        //获取父机构
        List<UnitVO> parentList = getParentUnit(unitId, tenantId);
        if (CollectionUtils.isNotEmpty(parentList)) {
            for (UnitVO unitVO : parentList) {
                set.add(unitVO.getId());
            }
        }

        return set;
    }

    private List<Long> getChildUnit2(List<Unit> unitList, List<Long> allIds, Long tenantId) {
        List<Long> unitIds = new ArrayList<>();
        for (Unit unit : unitList) {
            unitIds.add(unit.getId());
        }
        allIds.addAll(unitIds);
        List<Unit> childList = unitMapper.findByParentIds2(unitIds, tenantId);
        if (CollectionUtils.isNotEmpty(childList)) {
            return getChildUnit2(childList, allIds, tenantId);
        } else {
            return allIds;
        }
    }


    private List<UserVO> getChildUser(Long id) {
        List<UserVO> userList = new ArrayList<>();
        List<UserVO> userVOList = userMapper.findByUnitParentIds(Arrays.asList(id));
        return userList;
    }

    private List<UserVO> mergeChildUnit(List<UserVO> childList, List<UserVO> userVOList) {
        //查询用户的机构id集合
        List<Long> parentIdList = childList.stream().map(UserVO::getUnitId).distinct().collect(Collectors.toList());
        //根据机构查询子机构用户
        List<UserVO> childUserList = userMapper.findByUnitParentIds(parentIdList);
        if (CollectionUtils.isNotEmpty(childUserList)) {
            userVOList.addAll(childUserList);
            mergeChildUnit(childUserList, userVOList);
        }
        return userVOList;
    }

    /**
     * 遍历该机构下所有用户
     */
    private List<UserVO> findAllUserByUnitId(Long unitId, Long tenantId, Integer type) {
        List<UserVO> users = Lists.newArrayList();
        users.addAll(userMapper.findByUnitId(unitId, tenantId, type));
        List<Unit> units = getUnitByParentId(unitId);
        if (units != null) {
            for (Unit unit : units) {
                users.addAll(findAllUserByUnitId(unit.getId(), tenantId, type));
            }
        }
        return users;
    }

    /**
     * 遍历该机构下所有用户
     */
    private List<UserVO> findAllUserByUnitIdAndGroupId(Long unitId, Long tenantId, Long groupId) {
        List<UserVO> users = Lists.newArrayList();
        users.addAll(userMapper.findByUnitIdAndGroupId(unitId, tenantId, groupId,null));
        List<Unit> units = getUnitByParentId(unitId);
        if (units != null) {
            for (Unit unit : units) {
                users.addAll(findAllUserByUnitIdAndGroupId(unit.getId(), tenantId, groupId));
            }
        }
        return users;
    }

    @Override
    public Set<UserVO> finAllUserByUnit(Set<Long> unitIds) {
        Set<UserVO> users = Sets.newHashSet();
        for (Long unitId : unitIds) {
            users.addAll(findAllUserByUnitId(unitId, 0L, null));
        }
        return users;
    }

    @Override
    public Set<UserVO> finAllUserByUnitAndGroupId(String unitId, String groupId) {
        Set<UserVO> users = Sets.newHashSet();
        Long tenantId = UserUtils.getTenantId();
        users.addAll(findAllUserByUnitIdAndGroupId(Long.parseLong(unitId), tenantId, Long.valueOf(groupId)));

        return users;
    }

    @Override
    public List<Unit> getUnitTree(List<Unit> units) {
        return this.mergeUnit(units);
    }

    @Override
    public  Set<UserVO> finUserByUnit(Long unitId, String tenantId){
        Set<UserVO> users = Sets.newHashSet();
        users.addAll(findAllUserByUnitId(unitId, Long.parseLong(tenantId), null));
        return users;
    }
}


