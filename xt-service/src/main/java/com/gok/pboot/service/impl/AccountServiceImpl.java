package com.gok.pboot.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.BeanUtils;
import com.gok.pboot.PasswordChecker;
import com.gok.pboot.auth.*;
import com.gok.pboot.auth.enumeration.BaseState;
import com.gok.pboot.auth.enumeration.GroupType;
import com.gok.pboot.auth.vo.*;
import com.gok.pboot.base.*;
import com.gok.pboot.config.BaseConfig;
import com.gok.pboot.enumeration.ApiResultEnum;
import com.gok.pboot.enumeration.entity.PlatformTypeEnum;
import com.gok.pboot.enumeration.entity.ResourceType;
import com.gok.pboot.enumeration.entity.UserType;
import com.gok.pboot.enumeration.entity.VerifyCodeType;
import com.gok.pboot.exception.ServiceException;
import com.gok.pboot.mapper.*;
import com.gok.pboot.redis.RedisUtil;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.utils.VerifyCodeUtils;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.*;
import java.util.stream.Collectors;


/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月11日
 */
@Slf4j
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class AccountServiceImpl extends BaseBizService implements IAccountService {

    private final UserMapper userMapper;
    private final GroupMapper groupMapper;
    private final ResourceMapper resourceMapper;
    private final PasswordEncoder passwordEncoder;
    private final UnitMapper unitMapper;
    private final AccountMapper accountMapper;
    private final RedisUtil redisUtil;

    /**
     * 业务员角色id（固定）
     * @author  wfs
     * @date 2023/9/26
     */
    public static final String SALESMAN_GROUP_ID = "1669618854919385089";

    @Autowired
    public AccountServiceImpl(UserMapper userMapper, GroupMapper groupMapper, ResourceMapper resourceMapper
            , @Lazy PasswordEncoder passwordEncoder, UnitMapper unitMapper, AccountMapper accountMapper
            , RedisUtil redisUtil) {

        this.userMapper = userMapper;
        this.groupMapper = groupMapper;
        this.resourceMapper = resourceMapper;
        this.passwordEncoder = passwordEncoder;
        this.unitMapper = unitMapper;
        this.accountMapper = accountMapper;
        this.redisUtil = redisUtil;
    }

    @Override
    public Account getAccount(String userName) {
        return accountMapper.getByUsername(userName);
    }

    /**
     * 获取用户
     *
     * @param id 用户主键 ID
     * @return 用户实体 Map
     */
    @Override
    public User getUser(Long id) {
        User user = userMapper.selectById(id);
        //查询角色
        if (null != user) {
            user.setGroups(groupMapper.getUserGroupList(Collections.singletonList(id)));
        }
        return user;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveUser(User entity) {

        if (entity.getUnitId() != null) {
            Unit unit = unitMapper.selectById(entity.getUnitId());
            if (unit == null) {
                throw new ServiceException("上级部门不存在，请重新选择");
            }
        }
        if (entity.getId() != null) {
            updateUser(entity);
        } else {
            insertUser(entity);
        }
    }


    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delBatchByLogic(List<Long> ids) {
        userMapper.delBatchByLogic(ids);
    }

    /**
     * 新增用户
     *
     * @param user 用户实体 Map
     */
    private void insertUser(User user) {

        if (!isUsernameUnique(user.getUsername())) {
            throw new ServiceException("登录账户[" + user.getUsername() + "]已存在");
        }
        int count = accountMapper.getCountByPhone(user.getPhone());
        if (count > 0) {
            throw new ServiceException("手机号[" + user.getPhone() + "]已存在");
        }
        //保存账户
        Account account = BeanUtils.copyObject(user, Account.class);
        String encryptPassword = passwordEncoder.encode(user.getPassword());
        account.setDefTenant(user.getTenantId());
        account.setDefType(user.getType());
        account.setPassword(encryptPassword);
        account.setMtime(new Timestamp(System.currentTimeMillis()));
        BaseBuildEntity.buildInsert(account);
        accountMapper.insert(account);

        // 保存用户
        user.setType(account.getDefType());
        user.setAccountId(account.getId());
        BaseBuildEntity.buildInsert(user);
        user.setMtime(new Timestamp(System.currentTimeMillis()));
        //设置部门
        userMapper.insert(user);

        if (CollectionUtils.isNotEmpty(user.getGroups())) {
            Long id = user.getId();
            userMapper.insertGroupAssociation(id, user.getGroups());
        }
    }

    /**
     * 更新用户
     *
     * @param entity 用户实体 Map
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUser(User entity) {

        Long accountId = userMapper.selectById(entity.getId()).getAccountId();
        //校验当前用户名是否重复
        Account accountByUsername = accountMapper.getAccountByUsername(entity.getUsername(), accountId);
        if (accountByUsername != null) {
            throw new ServiceException("用户名已存在，请重新输入");
        }


        Long id = entity.getId();
        //用户只能更新状态、组织机构、角色
        User user = new User();
        user.setId(entity.getId());
        user.setState(entity.getState());
        user.setUnitId(entity.getUnitId());
        user.setMtime(new Timestamp(System.currentTimeMillis()));
        userMapper.updateById(user);
        Account account = new Account();
        account.setId(accountId);
        account.setUsername(entity.getUsername());
        account.setNickname(entity.getNickname());
        account.setPhone(entity.getPhone());
        account.setMtime(new Timestamp(System.currentTimeMillis()));
        accountMapper.updateById(account);
        userMapper.deleteGroupAssociation(id);
        if (CollectionUtils.isNotEmpty(entity.getGroups())) {
            userMapper.insertGroupAssociation(id, entity.getGroups());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateTenantPhone(UserVO userVO) {
        List<UserVO> userVOList = userMapper.findByTenantAndType(userVO.getTenantId(), UserType.ADMIN.getValue());
        userVO.setId(userVOList.get(0).getId());
        List<User> phoneUser = userMapper.getByPhone(userVO.getPhone(), userVO.getId());
        if (CollectionUtils.isNotEmpty(phoneUser)) {
            throw new ServiceException("手机号[" + userVO.getPhone() + "]已存在");
        }
        return userMapper.updatePhone(userVO.getId(), userVO.getPhone());
    }

    /**
     * 更新用户密码
     *
     * @param entity      用户实体 Map
     * @param oldPassword 当前密码
     * @param newPassword 新密码
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUserPassword(User entity, String oldPassword, String newPassword) {
        if (!passwordEncoder.matches(oldPassword, entity.getPassword())) {
            throw new ServiceException("当前密码不正确");
        }
        checkPassword(newPassword);
        userMapper.updatePassword(entity.getId(), passwordEncoder.encode(newPassword));
    }


    /**
     * 删除用户
     *
     * @param ids 用户主键 ID 集合
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUsers(List<Long> ids, Long tenantId) {

        if (CollectionUtils.isEmpty(ids)) {
            return;
        }

        for (Long id : ids) {
            User entity = getUser(id);
            if (!tenantId.equals(entity.getTenantId())) {
                throw new ServiceException("非法操作！");
            }
            deleteUser(entity);
        }
    }

    @Override
    public List<User> findUsersByOrgId(Long orgId) {
        return userMapper.findUserByOrgId(orgId);
    }


    /**
     * 删除用户
     *
     * @param entity 用户实体 Map
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUser(User entity) {
        Long id = entity.getId();

        List<Group> groups = getUserGroups(id);

        for (Group g : groups) {
            if (g.getId().equals(BaseConfig.getAdminId())) {
                throw new ServiceException("这是管理员帐号，不允许删除");
            }
        }

        userMapper.deleteGroupAssociation(id);
        userMapper.deleteById(id);
    }

    /**
     * 根据租户编号和用户名获取用户
     *
     * @param username 用户名
     * @param tenantNo 租户编号
     * @param type     用户类型
     * @return
     */
    @Override
    public User getLoginUser(String username, String tenantNo, String type) {
        return userMapper.getLoginUser(username, tenantNo, type);
    }

    /**
     * 获取用户集合
     *
     * @param username 用户名
     * @param tenantNo 租户编号
     * @return
     */
    @Override
    public List<User> getUsersByUsernameAndTenantNo(String username, String tenantNo) {
        return userMapper.getUsersByUsernameAndTenantNo(username, tenantNo);
    }

    @Override
    public List<User> getUsersByPhoneAndTenantNo(String phone, String tenantNo) {
        return userMapper.getUsersByPhoneAndTenantNo(phone, tenantNo);
    }

    @Override
    public Account getUsersByPhoneAndName(String phone, String username) {
        return accountMapper.getByUsernameAndPhone(username, phone);
    }

    /**
     * 判断用户登录帐号是否唯一
     *
     * @param username 登录帐号
     * @return true 表示唯一，否则 false
     */
    @Override
    public boolean isUsernameUnique(String username) {
        return getAccount(username) == null;
    }


    /**
     * 查询用户
     *
     * @param filter 查询条件
     * @return 用户实体 Map 的分页对象
     */
    @Override
    public Page<User> findUsers(PageRequest pageRequest, Map<String, Object> filter) {
        processDataScopeFilter(filter, User.ALIAS);
        Page<User> page = userMapper.find(new Page<>(pageRequest.getPageNumber(), pageRequest.getPageSize()), filter);
        List<User> userList = page.getRecords();
        if (CollectionUtils.isNotEmpty(userList)) {
            List<Long> idList = userList.stream().map(User::getId).collect(Collectors.toList());
            //查询id所在角色组
            List<Group> groupList = groupMapper.getUserGroupList(idList);
            //循环给用户赋角色
            for (User user : userList) {
                List<Group> userGroup = new ArrayList<>();
                for (Group group : groupList) {
                    if (user.getId().equals(group.getUserId())) {
                        userGroup.add(group);
                    }
                }
                user.setGroups(userGroup);
            }
        }
        return page;
    }

    //----------------------------------- 组管理 ----------------------------------------//

    /**
     * 获取组
     *
     * @param id 组主键 ID
     * @return 组实体 Map
     */
    @Override
    public Group getGroup(Long id) {
        return groupMapper.selectById(id);
    }

    /**
     * 获取用户所在的组
     *
     * @param userId 用户主键 ID
     * @return 组实体 Map 集合
     */
    @Override
    public List<Group> getUserGroups(Long userId) {
        return groupMapper.getUserGroups(userId);
    }

    /**
     * 删除组
     *
     * @param ids 组主键 ID 集合
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteGroups(List<Long> ids) {

        if (CollectionUtils.isEmpty(ids)) {
            return;
        }

        for (Long id : ids) {
            groupMapper.deleteResourceAssociation(id);
            groupMapper.deleteUserAssociation(id);
            groupMapper.deleteById(id);
        }
    }

    /**
     * 保存组
     *
     * @param entity 组实体 Map
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = "userResourceCache", allEntries = true)
    public void saveGroup(Group entity) {
        //添加只能添加普通角色
        entity.setGroupType(GroupType.GENERAL.getValue());
        if (entity.getId() != null) {
            updateGroup(entity);
        } else {
            entity.setId(IdWorker.getId());
            insertGroup(entity);
        }
    }

    @Override
    public List<UserVO> findByGroupId(Long groupId, Integer userType) {
        return userMapper.findUserByGroupId(groupId, userType);
    }

    /**
     * 更新组
     *
     * @param entity 组实体 Map
     */
    private void updateGroup(Group entity) {
        Long id = entity.getId();
        List<Long> unitIds = entity.getUnitIds();
        List<Long> resourceIds = entity.getResourceIds();
        groupMapper.updateById(entity);

        groupMapper.deleteResourceAssociation(id);
        groupMapper.deleteUnitAssociation(id);
        if (CollectionUtils.isNotEmpty(resourceIds)) {
            groupMapper.insertResourceAssociation(id, resourceIds);
        }
        if (CollectionUtils.isNotEmpty(unitIds)) {
            groupMapper.insertUnitAssociation(id, unitIds);
        }
    }

    /**
     * 新增组
     *
     * @param entity 组实体 Map
     */
    private void insertGroup(Group entity) {
        String name = entity.getName();
        List<Long> resourceIds = entity.getResourceIds();
        List<Long> unitIds = entity.getUnitIds();
        if (!isGroupNameUnique(name)) {
            throw new ServiceException("组名称[" + name + "]已存在");
        }

        groupMapper.insert(entity);
        Long id = entity.getId();

        if (CollectionUtils.isNotEmpty(resourceIds)) {
            groupMapper.insertResourceAssociation(id, resourceIds);
        }

        if (CollectionUtils.isNotEmpty(unitIds)) {
            groupMapper.insertUnitAssociation(id, unitIds);
        }
    }

    /**
     * 判断组名称是否存在
     *
     * @param name 组名称
     * @return ture 表示存在，否则 false。
     */
    @Override
    public boolean isGroupNameUnique(String name) {
        return !groupMapper.isNameUnique(name);
    }

    /**
     * 查询组
     *
     * @param filter 查询条件
     * @return 组实体 Map 的分页对象
     */
    @Override
    public Page<Group> findGroups(PageRequest pageRequest, Map<String, Object> filter) {
        processDataScopeFilter(filter, Group.GROUP_ALIAS);
        if (isSuperAdmin()) {
            filter.put("superAdmin", "1");
        }
        return groupMapper.find(new Page<>(pageRequest.getPageNumber(), pageRequest.getPageSize()), filter);
    }

    @Override
    public List<Group> findGroupList(GroupSearchVO searchVO) {
        return groupMapper.findGroupList(searchVO);
    }

    //----------------------------------- 资源管理 ----------------------------------------//

    /**
     * 获取资源
     *
     * @param id 资源主键 ID
     * @return 资源实体 Map
     */
    @Override
    public Resource getResource(Long id, Long tenantId) {
        return resourceMapper.selectOne(new QueryWrapper<Resource>().eq("id", id).eq("tenant_id", tenantId));
    }


    /**
     * 根据租户id获取所有资源
     *
     * @return 资源实体 Map 集合
     */
    @Override
    public List<Resource> getResources(Long tenantId) {
        return resourceMapper.getAll(tenantId);
    }

    @Override
    public List<Resource> getCheckedResources(Long defaultTenantId, Long tenantId, Boolean isTenant) {
        return this.mergeResources(resourceMapper.getCheckedResources(defaultTenantId, tenantId, isTenant));
    }

    /**
     * 获取用户资源
     *
     * @param userId 用户主键 ID
     * @return 资源实体 Map 集合
     */
    @Override
    @Cacheable(value = "userResourceCache", key = "#userId")
    public List<Resource> getUserResources(Long userId) {
        return resourceMapper.getUserResources(userId);
    }

    /**
     * 获取组资源
     *
     * @param groupId 组主键 ID
     * @return 资源实体 Map 集合
     */
    @Override
    public List<Resource> getGroupResources(Long groupId) {
        return resourceMapper.getGroupResources(groupId);
    }


    /**
     * 删除资源
     *
     * @param ids 资源主键 ID 集合
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = "userResourceCache", allEntries = true)
    public void deleteResources(List<Long> ids, Long tenantId) {

        if (CollectionUtils.isEmpty(ids)) {
            return;
        }

        for (Long id : ids) {
            deleteResource(id, tenantId);
        }
    }

    /**
     * 删除资源
     *
     * @param id       资源主键 ID
     * @param tenantId 租户ID
     */
    private void deleteResource(Long id, Long tenantId) {
        List<Resource> children = resourceMapper.getChildren(id, tenantId);

        if (!children.isEmpty()) {
            Long resourceTenantId = children.get(0).getTenantId();
            if (!tenantId.equals(resourceTenantId)) {
                throw new ServiceException("非法操作！");
            }
            for (Resource c : children) {
                Long temp = c.getId();
                deleteResource(temp, tenantId);
            }

        }

        resourceMapper.deleteGroupAssociation(id);
        resourceMapper.deleteById(id);
    }

    /**
     * 平台保存资源
     *
     * @param entity 资源实体 Map
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = "userResourceCache", allEntries = true)
    public void saveResource(Resource entity) {

        if (entity.getSort() == null) {
            entity.setSort(resourceMapper.selectCount(new QueryWrapper<>()));
        }
        //如果父类和子类平台类型不一致 将父类平台类型变更为全部
        if (null != entity.getFkParentId()) {
            Resource resource = resourceMapper.selectById(entity.getFkParentId());
            if (resource.getPlatformType().equals(entity.getPlatformType())) {
                resource.setPlatformType(PlatformTypeEnum.ALL.getValue());
            }
            resourceMapper.updateById(resource);
        }

        if (entity.getId() != null) {
            resourceMapper.updateById(entity);
            //查询默认菜单
            Resource defaultResource = resourceMapper.getByFkId(entity.getId());
            if (defaultResource != null) {
                resourceMapper.updateByFkEntity(entity);
                Resource updateFk = entity;
                updateFk.setId(defaultResource.getId());
                //更改租户菜单
                resourceMapper.updateByFkEntity(updateFk);
            }
        } else {
            entity.setResourceFkId(-1L);
//            entity.setId(IdWorker.getId());
            resourceMapper.insert(entity);
        }
    }

    /**
     * 合并资源，要获取资源的父类通过 "parent" key 来获取，如果不存在 "parent" key 表示该资源 Map 为根节点，
     * 要获取资源的子类通过 "children" key 来获取
     *
     * @param resources 要合并的资源实体 Map 集合
     * @return 合并好的树形资源实体 Map 集合
     */
    @Override
    public List<Resource> mergeResources(List<Resource> resources) {
        return mergeResources(resources, null);
    }

    /**
     * 合并资源，要获取资源的父类通过 "parent" key 来获取，如果不存在 "parent" key 表示该资源 Map 为根节点，
     * 要获取资源的子类通过 "children" key 来获取
     *
     * @param resources  要合并的资源实体 Map 集合
     * @param ignoreType 要忽略资源类型
     * @return 合并好的树形资源实体 Map 集合
     */
    @Override
    public List<Resource> mergeResources(List<Resource> resources, ResourceType ignoreType) {

        List<Resource> result = Lists.newArrayList();

        for (Resource entity : resources) {

            Long parentId = entity.getFkParentId();
            Integer type = entity.getType();

            if (parentId == null && (ignoreType == null || !ignoreType.getValue().equals(type))) {
                recursionResource(entity, resources, ignoreType);
                result.add(entity);
            }

        }

        return result;
    }

    /**
     * 递归并合并资源到指定的父类
     *
     * @param parent     父类
     * @param resources  资源实体 Map 集合
     * @param ignoreType 要忽略不合并的资源类型
     */
    private void recursionResource(Resource parent,
                                   List<Resource> resources,
                                   ResourceType ignoreType) {

        for (Resource entity : resources) {
            Long parentId = entity.getFkParentId();

            if (parentId == null) {
                continue;
            }

            Integer type = entity.getType();
            Long id = parent.getId();
            boolean isIgnore = ignoreType == null || !ignoreType.getValue().equals(type);
            if (isIgnore && parentId.equals(id)) {
                recursionResource(entity, resources, ignoreType);
                List<Resource> children = parent.getChildren();
                if (children != null) {
                    entity.setParent(parent);
                    children.add(entity);
                }
            }
        }
    }

    @Override
    public List<Resource> getResourcesByGroupId(Long groupId, Long tenantId) {
        return mergeResources(resourceMapper.selectGroupResources(groupId, tenantId, !BaseConfig.getLandlordId().equals(tenantId)));
    }

    @Override
    public List<String> getCheckedResourceIds(Long groupId, Long tenantId) {
        return resourceMapper.getResourceByGroupIds(groupId, tenantId);
    }

    @Override
    public List<User> getListByUnitId(Long unitId, Long tenantId) {
        Map<String, Object> filter = new HashMap<>(3);
        filter.put("unitId", unitId);
        filter.put("tenantId", tenantId);
        return userMapper.find(filter);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveAdminUser(User entity) {
        Long tenantId = entity.getTenantId();
        Long unitId = IdWorker.getId();
        Long groupId = IdWorker.getId();
        //保存租户机构
        Unit unit = entity.getUnit();
        unit.setId(unitId);
        unit.setState(BaseState.ENABLE.getValue());
        unit.setTenantId(tenantId);
        unit.setParentId(0L);

        unitMapper.insert(unit);
        //保存角色
        Group group = new Group();
        group.setId(groupId);
        group.setDataScope(3);
        group.setUnitId(-1L);
        group.setGroupType(GroupType.ADMIN.getValue());
        group.setTenantId(tenantId);
        group.setName("超级管理员");
        groupMapper.insert(group);
        groupMapper.insertUnitAssociation(groupId, Arrays.asList(unitId));
        entity.setGroups(Arrays.asList(group));
        entity.setUnitId(unitId);
        entity.setState(BaseState.ENABLE.getValue());
        entity.setType(UserType.ADMIN.getValue());
        insertUser(entity);
        //查询默认权限
        List<Resource> resourceList = getResources(BaseConfig.getResourceTenantId());
        if (CollectionUtils.isNotEmpty(resourceList)) {
            //添加资源
            List<Resource> saveList = mergeSaveResources(resourceList, tenantId, PlatformTypeEnum.TENANT.getValue());
            resourceMapper.batchSave(saveList);
            List<Long> resourceIds = saveList.stream().map(Resource::getId).collect(Collectors.toList());
            //添加角色菜单权限
            groupMapper.insertResourceAssociation(groupId, resourceIds);
        }
    }

    @Override
    public List<UserVO> getUserList(UserSearchVO searchVO) {
        return userMapper.getUserList(searchVO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = "userResourceCache", allEntries = true)
    public void saveDefaultResource(List<Long> resourceIdList) {
        if (CollectionUtils.isEmpty(resourceIdList)) {
            throw new ServiceException("没有选中资源");
        }
        processResource(resourceIdList, BaseConfig.getResourceTenantId(), false);
    }

    /**
     * 菜单处理
     *
     * @param resourceIdList
     * @param tenantId
     * @param isTenant
     */
    private void processResource(List<Long> resourceIdList, Long tenantId, boolean isTenant) {
        List<Resource> resourceList = resourceMapper.findByIdList(resourceIdList, true);
        //查询租户拥有的权限
        List<Resource> tenantResourceList = resourceMapper.getAll(tenantId);
        List<Resource> checkDelResourceList = new ArrayList<>();
        checkDelResourceList.addAll(resourceList);
        if (CollectionUtils.isNotEmpty(resourceList)) {
            //判断租户是否有存在权限
            if (CollectionUtils.isNotEmpty(tenantResourceList)) {
                //去除存在的权限
                removeResource(resourceList, tenantResourceList);
                //删除不存在的权限
                processDeleteResource(checkDelResourceList, tenantResourceList, tenantId, isTenant);
            }
            //添加权限
            insertTenantResource(resourceList, tenantId, isTenant);
        }
    }

    /**
     * 去除存在的权限
     *
     * @param resourceList
     * @param tenantResourceList
     */
    private void removeResource(List<Resource> resourceList, List<Resource> tenantResourceList) {
        //去除存在的权限
        Iterator<Resource> iterator = resourceList.iterator();
        while (iterator.hasNext()) {
            Resource resource = iterator.next();
            for (Resource tenant : tenantResourceList) {
                if (resource.getId().equals(tenant.getResourceFkId())) {
                    iterator.remove();
                    break;
                }
            }
        }
    }

    /**
     * 处理需要删除的资源菜单
     *
     * @param checkDelResourceList
     * @param tenantResourceList
     * @param tenantId
     * @param isTenant
     */
    private void processDeleteResource(List<Resource> checkDelResourceList, List<Resource> tenantResourceList, Long tenantId, boolean isTenant) {
        List<Long> deleteIdList = new ArrayList<>();
        for (Resource tenant : tenantResourceList) {
            boolean unCheck = true;
            for (Resource resource : checkDelResourceList) {
                if (resource.getId().equals(tenant.getResourceFkId())) {
                    unCheck = false;
                    break;
                }
            }
            if (unCheck) {
                deleteIdList.add(tenant.getId());
            }
        }
        deleteTenantResource(deleteIdList, tenantId, isTenant);
    }

    /**
     * 添加资源菜单
     *
     * @param resourceList 需要保存的菜单
     * @param tenantId     租户ID
     * @param isTenant     是否租户菜单,true 租户菜单 false 默认菜单
     */
    private void insertTenantResource(List<Resource> resourceList, Long tenantId, boolean isTenant) {
        if (CollectionUtils.isNotEmpty(resourceList)) {
            //添加资源
            List<Resource> saveList = mergeSaveResources(resourceList, tenantId, PlatformTypeEnum.TENANT.getValue());
            resourceMapper.batchSave(saveList);
            if (isTenant) {
                List<Long> resourceIds = saveList.stream().map(Resource::getId).collect(Collectors.toList());
                Group group = groupMapper.getSuperGroupByTenantId(tenantId, GroupType.ADMIN.getValue());
                //添加角色菜单权限
                groupMapper.insertResourceAssociation(group.getId(), resourceIds);
            }
        }
    }

    /**
     * 删除租户菜单
     *
     * @param deleteIdList 需要删除的菜单id集合
     * @param tenantId
     * @param isTenant     是否租户菜单,true 租户菜单 false 默认菜单
     */
    private void deleteTenantResource(List<Long> deleteIdList, Long tenantId, boolean isTenant) {
        if (CollectionUtils.isNotEmpty(deleteIdList)) {
            resourceMapper.deleteByIdsAndTenantId(deleteIdList, tenantId);
            if (isTenant) {
                //删除菜单组权限
                groupMapper.deleteResourceListAssociation(deleteIdList);
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = "userResourceCache", allEntries = true)
    public void saveTenantResource(List<Long> resourceIdList, Long tenantId) {
        if (CollectionUtils.isEmpty(resourceIdList)) {
            throw new ServiceException("没有选中资源");
        }
        processResource(resourceIdList, tenantId, true);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void setOpenIdByUsername(String username, String openId) {
        accountMapper.setOpenIdByUsername(username, openId);
    }

    @Override
    public List<User> getUsersByIdList(List<Long> ids) {
        return userMapper.selectBatchIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void resetPassword(UserVO userVO) {
        String password = userVO.getPhone().substring(userVO.getPhone().length() - 6);
        userMapper.updatePassword(userVO.getId(), passwordEncoder.encode(password));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveGroupUser(GroupVO groupVO) {
        if (UserType.TEACHER.getValue().equals(groupVO.getUserType()) || UserType.STUDENT.getValue().equals(groupVO.getUserType())) {
            userMapper.deleteGroupUser(groupVO.getId(), groupVO.getUserType());
            userMapper.saveGroupUser(groupVO);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void editTeacherGroup(User user) {
        userMapper.deleteGroupAssociation(user.getId());
        if (CollectionUtils.isNotEmpty(user.getGroups())) {
            userMapper.insertGroupAssociation(user.getId(), user.getGroups());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUserOnly(User user) {
        userMapper.updateById(user);
    }

    /**
     * 用户，账户分离获取用户信息运维专用
     *
     * @param begin limit开始
     * @param end   limit结束
     * @return
     */
    @Override
    public List<UserVO> getOperationsUsers(int begin, int end) {
        return userMapper.getOperationsUsers(begin, end);
    }

    @Override
    public Account getAccountById(Long id) {
        return accountMapper.selectById(id);
    }

    @Override
    public Account getByPhone(String phone) {
        return accountMapper.selectOne(new QueryWrapper<Account>().eq("phone", phone));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertBatch(List<User> users) {
        userMapper.insertBatch(users);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Account saveAccount(RegisterVO vo) {
        if (!isUsernameUnique(vo.getUserName())) {
            throw new ServiceException("登录账户[" + vo.getUserName() + "]已存在");
        }
        Account account = new Account();
        account.setPassword(vo.getPassword());
        account.setNickname(vo.getNickname());
        account.setUsername(vo.getUserName());
        account.setPhone(vo.getPhone());
        account.setDefTenant(vo.getTenantId());
        BaseBuildEntity.buildInsert(account);
        account.setPassword(passwordEncoder.encode(account.getPassword()));
        accountMapper.insert(account);
        return account;
    }

    @Override
    public Long updatePasswordFirst(RegisterVO vo) {
        VerifyCodeUtils.verifyCode(vo.getVerifyCode(),redisUtil,vo.getPhone(), VerifyCodeType.UPDATE_PASSWORD.getValue());
        Account account = accountMapper.getByUsernameAndPhone(vo.getUserName(), vo.getPhone());
        if (account != null) {
            return account.getId();
        } else {
            return null;
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePasswordSecond(Account account) {
        checkPassword(account.getPassword());
        accountMapper.updatePassword(account.getId(), passwordEncoder.encode(account.getPassword()));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ApiResult updatePhone(RegisterVO vo) {
        boolean checkSuccess = VerifyCodeUtils.verifyCode(vo.getVerifyCode(),redisUtil,vo.getPhone(), VerifyCodeType.UPDATE_PHONE.getValue());
        if (!checkSuccess){
            return ApiResult.failureMsg("验证码错误", ApiResultEnum.VALIDATION_FAILURE);
        }
        int countByPhone = accountMapper.getCountByPhone(vo.getPhone());
        if (countByPhone != 0) {
            return ApiResult.failureMsg("手机号码重复", ApiResultEnum.VALIDATION_FAILURE);
        }
        return ApiResult.success(accountMapper.updatePhone(vo.getId(), vo.getPhone()));
    }

    @Override
    public List<Long> countTenantId(Long accountId) {
        return userMapper.countTenantId(accountId);
    }

    @Override
    public Map<String, User> getByPhoneList(List<String> phoneList) {
        return userMapper.getParentsByPhoneList(phoneList);
    }

    @Override
    public List<Dict> findTypeByAccount(User user) {
        Integer type = user.getType();
        user.setType(null);
        List<User> byUserFilter = userMapper.findByUserFilter(user);
        List<Dict> typeList = new ArrayList<>(byUserFilter.size());
        for (User temp : byUserFilter) {
            Dict dict = new Dict(UserType.getNameByValue(temp.getType()), temp.getType());
            if (dict.getValue().equals(type)) {
                dict.setCurrentFlag(BaseConstants.YES);
            }
            typeList.add(dict);
        }
        return typeList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateState(UserVO vo) {
        return userMapper.updateState(vo);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateEntity(Account account) {
        return accountMapper.updateById(account);
    }

    @Override
    public Boolean checkPassword(RegisterVO vo) {
        Account account = accountMapper.selectById(vo.getAccountId());
        return passwordEncoder.matches(vo.getPassword(), account.getPassword());
    }

    public void checkPassword(String password) {
        if (StringUtils.isEmpty(password)) {
            throw new ServiceException("新密码不能为空");
        }
        PasswordChecker passwordChecker = new PasswordChecker();
        if (!passwordChecker.checkRuleMiddle(password)) {
            throw new ServiceException("弱密码,请重新修改");
        }
    }

    @Override
    public List<User> findByUserFilter(User user) {
        return userMapper.findByUserFilter(user);
    }


    @Override
    public Account findByOpenId(String openId) {
        return accountMapper.findByOpenId(openId);
    }


    @Override
    public List<Account> findByPhoneList(List<String> phoneList) {
        return accountMapper.getByPhoneList(phoneList);
    }

    @Override
    public Map<Long, User> getUserMapByAccountIdList(UserSearchVO vo) {
        return userMapper.getUserMapByAccountIdList(vo);
    }

    @Override
    public List<String> getIdListByUsername(String username) {
        return userMapper.getIdListByUsername(username);
    }
    @Override
    public void updateAuthInformationByUserId(Account account) {
        accountMapper.updateAuthInformationByUserId(account);
    }

    @Override
    public List<String> getIdListByCarrier(String carrier) {
        return userMapper.getIdListByCarrier(carrier);
    }

    @Override
    public void saveDriverAccount(Account account) {
        accountMapper.insert(account);
    }

    @Override
    public void saveDriverUser(User user) {
        userMapper.insert(user);
    }


    @Override
    public User getUserByPhone(String phone) {
        return userMapper.getUserByPhone(phone);
    }

    @Override
    public User getUserById(String userId) {
        return userMapper.getUserByUserId(userId);
    }

    @Override
    public Account getAccountByUsername(String username, Long accountId) {
        return accountMapper.getAccountByUsername(username, accountId);
    }

    @Override
    public Account getAuthStatusById(Long accountId) {
        return accountMapper.getAuthStatusById(accountId);
    }

    @Override
    public Account getAccountByIdNumber(String idNumber, Long accountId) {
        return accountMapper.getAccountByIdNumber(idNumber, accountId);
    }

    @Override
    public void updateAuthByAccountId(Account authAccount) {
        accountMapper.updateAuthByAccountId(authAccount);
    }

    @Override
    public Integer getCountByIdNumber(Account account) {
        return accountMapper.getCountByIdNumber(account);
    }

    @Override
    public Integer getCountByPhone(Account account) {
        return accountMapper.getCountNumberByPhone(account);
    }

    @Override
    public List<UnitUserVO> getUsersByGroup(Set<Long> ids) {
        List<UnitUserVO> usersByGroup = userMapper.findUsersByGroup(ids);
        return usersByGroup;
    }

    @Override
    public List<Group> findGroupByIds(List<Long> ids) {
        return groupMapper.findGroupByIds(ids);
    }

    /**
     * 合并资源把树结果资源转成单个list集合
     *
     * @param resources 待转换资源
     * @param tenantId  租户ID
     * @param platform  平台类型
     * @return 转换后的list
     */
    private List<Resource> mergeSaveResources(List<Resource> resources, Long tenantId, Integer platform) {
        List<Resource> result = Lists.newArrayList();
        for (Resource entity : resources) {
            Long parentId = entity.getFkParentId();
            Long oldId = entity.getId();
            Long newId = IdWorker.getId();
            Resource newEntity = BeanUtils.copyObject(entity, Resource.class);
            if (parentId != null) {
                //查询父级id
                Resource parentResource = resourceMapper.selectById(parentId);
                Resource addResource = null;
                if (null != parentResource) {
                    parentResource.setResourceFkId(parentId);
                    addResource = resourceMapper.getByQuery(parentResource, tenantId);
                }
                if (parentResource == null || addResource == null) {
                    continue;
                }
                newEntity.setFkParentId(addResource.getId());
            }
            newEntity.setTenantId(tenantId);
            newEntity.setPlatformType(platform);
            newEntity.setResourceFkId(oldId);
            newEntity.setId(newId);
            result.add(newEntity);
            recursionResource(oldId, newId, tenantId, resources, result, platform);
        }

        return result;
    }

    /**
     * 递归合并，将符合条件的资源加到list集合
     *
     * @param oldParentId 旧编号(数据库查询出来的编号)
     * @param newParentId 新编号
     * @param tenantId    租户id
     * @param resources   待转换资源
     * @param result      转换后资源
     * @param platform    平台类型
     */
    private void recursionResource(Long oldParentId, Long newParentId, Long tenantId, List<Resource> resources, List<Resource> result, Integer platform) {

        for (Resource entity : resources) {
            Long parentId = entity.getFkParentId();
            if (parentId == null) {
                continue;
            }
            if (parentId.equals(oldParentId)) {
                Long oldId = entity.getId();
                Long newId = IdWorker.getId();
                Resource newEntity = entity;
                newEntity.setId(newId);
                newEntity.setTenantId(tenantId);
                newEntity.setFkParentId(newParentId);
                newEntity.setPlatformType(platform);
                newEntity.setResourceFkId(oldId);
                result.add(newEntity);
                recursionResource(oldId, newId, tenantId, resources, result, platform);
            }
        }
    }
}
