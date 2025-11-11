package com.gok.pboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.Account;
import com.gok.pboot.auth.Group;
import com.gok.pboot.auth.Resource;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.vo.*;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.Dict;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.enumeration.entity.ResourceType;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年10月11日
 */
public interface IAccountService {

    /**
     * 根据用户名获取用户账户信息
     * @param userName
     * @return
     */
    Account getAccount(String userName);

    public User getUser(Long id);

    public void saveUser(User entity);



    public void delBatchByLogic(List<Long> ids);

    public void updateUser(User entity);

    /**
     * 修改手机号
     * @param userVO
     */
    public int updateTenantPhone(UserVO userVO);

    public void updateUserPassword(User entity, String oldPassword, String newPassword);

    /**
     * 根据租户编号和用户名获取用户
     * @param username   用户名
     * @param tenantNo   租户编号
     * @param type   用户类型
     * @return
     */
    public User getLoginUser(String username, String tenantNo, String type);

    /**
     * 获取用户集合
     * @param username  用户名
     * @param tenantNo  租户编号
     * @return
     */
    public List<User> getUsersByUsernameAndTenantNo(String username, String tenantNo);
    /**
     * 获取用户集合
     * @param phone  电话号码
     * @param tenantNo  租户编号
     * @return
     */
    public List<User> getUsersByPhoneAndTenantNo(String phone, String tenantNo);

    public Account getUsersByPhoneAndName(String phone, String username);

    public boolean isUsernameUnique(String username);

    public Page<User> findUsers(PageRequest pageRequest, Map<String, Object> filter);

    public void deleteUser(User entity);

    public void deleteUsers(List<Long> ids, Long tenantId);

    public List<User> findUsersByOrgId(Long orgId);

    /**
     * 获取组
     *
     * @param id 组主键 ID
     * @return 组实体 Map
     */
    public Group getGroup(Long id);

    /**
     * 获取用户所在的组
     *
     * @param userId 用户主键 ID
     * @return 组实体 Map 集合
     */
    public List<Group> getUserGroups(Long userId);

    /**
     * 删除组
     *
     * @param ids 组主键 ID 集合
     */
    public void deleteGroups(List<Long> ids);

    /**
     * 保存组
     *
     * @param entity 组实体 Map
     */
    public void saveGroup(Group entity);

    /**
     * 根据角色id和类型 查询角色关联的用户
     *
     * @param groupId
     * @param userType 1.教职工 2.学生
     * @return
     */
    List<UserVO> findByGroupId(Long groupId, Integer userType);

    /**
     * 判断组名称是否存在
     *
     * @param name 组名称
     * @return ture 表示存在，否则 false。
     */
    public boolean isGroupNameUnique(String name);

    /**
     * 查询组
     *
     * @param filter 查询条件
     * @return 组实体 Map 集合
     */
    public Page<Group> findGroups(PageRequest pageRequest, Map<String, Object> filter);

    /**
     * 根据条件查询角色集合
     *
     * @param searchVO
     * @return
     */
    List<Group> findGroupList(GroupSearchVO searchVO);


    //----------------------------------- 资源管理 ----------------------------------------//

    /**
     * 获取资源
     *
     * @param id       资源主键 ID
     * @param tenantId 租户 ID
     * @return 资源实体 Map
     */
    public Resource getResource(Long id, Long tenantId);

    /**
     * 获取所有资源
     *
     * @return 资源实体 Map 集合
     */
    public List<Resource> getResources(Long tenantId);

    /**
     * 获取所有资源
     * @param defaultTenantId
     * @param tenantId
     * @param isTenant
     * @return 资源实体 Map 集合
     */
    public List<Resource> getCheckedResources(Long defaultTenantId, Long tenantId, Boolean isTenant);

    /**
     * 获取用户资源
     *
     * @param userId 用户主键 ID
     * @return 资源实体 Map 集合
     */
    public List<Resource> getUserResources(Long userId);

    /**
     * 获取组资源
     *
     * @param groupId 组主键 ID
     * @return 资源实体 Map 集合
     */
    public List<Resource> getGroupResources(Long groupId);

    /**
     * 删除资源
     *
     * @param ids 资源主键 ID 集合
     * @param tenantId 租户idID
     */
    public void deleteResources(List<Long> ids, Long tenantId);

    /**
     * 保存资源
     *
     * @param entity 资源实体 Map
     */
    public void saveResource(Resource entity);

    /**
     * 合并资源，要获取资源的父类通过 "parent" key 来获取，如果不存在 "parent" key 表示该资源 Map 为根节点，
     * 要获取资源的子类通过 "children" key 来获取
     *
     * @param resources 要合并的资源实体 Map 集合
     * @return 合并好的树形资源实体 Map 集合
     */
    public List<Resource> mergeResources(List<Resource> resources);

    /**
     * 合并资源，要获取资源的父类通过 "parent" key 来获取，如果不存在 "parent" key 表示该资源 Map 为根节点，
     * 要获取资源的子类通过 "children" key 来获取
     *
     * @param resources  要合并的资源实体 Map 集合
     * @param ignoreType 要忽略资源类型
     * @return 合并好的树形资源实体 Map 集合
     */
    public List<Resource> mergeResources(List<Resource> resources, ResourceType ignoreType);

    /**
     * 获取组的资源
     * @param groupId 组id
     * @param tenantId 租户id
     * @return
     */
    public List<Resource> getResourcesByGroupId(Long groupId, Long tenantId);

    /**
     * 检测组资源
     * @param groupId
     * @param tenantId
     * @return
     */
    public List<String> getCheckedResourceIds(Long groupId, Long tenantId);

    /**
     * 根据机构id获取用户
     *
     * @param unitId 机构id
     * @param tenantId 租户id
     * @return
     */
    List<User> getListByUnitId(Long unitId, Long tenantId);

    /**
     * 创建租户时，默认管理员数据
     * @param entity
     */
    public void saveAdminUser(User entity);

    /**
     * 根据条件查询用户列表
     * @param searchVO
     * @return
     */
    List<UserVO> getUserList(UserSearchVO searchVO);

    /**
     * 添加默认菜单权限
     * @param resourceIdList
     */
    void saveDefaultResource(List<Long> resourceIdList);

    /**
     * 添加租户菜单
     * @param resourceIdList
     */
    void saveTenantResource(List<Long> resourceIdList, Long tenantId);


    /**
     * 根据用户名设置用户openId
     * @param username
     * @param openId
     */
    void setOpenIdByUsername(String username, String openId);


    /**
     * 根据用户id集合获取用户信息
     * @param ids
     * @return
     */
    List<User> getUsersByIdList(List<Long> ids);

    /**
     * 重置密码
     * @param userVO
     */
    void resetPassword(UserVO userVO);

    /**
     * 添加角色用户
     * @param groupVO
     */
    void saveGroupUser(GroupVO groupVO);

    /**
     * 编辑教职工角色
     * @param user
     */
    void editTeacherGroup(User user);

    /**
     * 通过角色ID查询用户
     *
     * @param ids
     * @return java.util.List<com.gok.pboot.auth.vo.UnitUserVO>
     * @author: yzs
     */
    List<UnitUserVO> getUsersByGroup(Set<Long> ids);

    List<Group> findGroupByIds(List<Long> ids);

    /**
     * 只修改tb_user 表信息
     * @param user
     */
    void updateUserOnly(User user);

    /**
     * 用户，账户分离获取用户信息运维专用
     * @param begin  limit开始
     * @param end       limit结束
     * @return
     */
    List<UserVO> getOperationsUsers(int begin, int end);

    /**
     * 根据id获取帐号信息
     * @param id
     * @return
     */
    Account getAccountById(Long id);
    /**
     * 根据电话获取帐号信息
     * @param phone
     * @return
     */
    Account getByPhone(String phone);
    /**
     *批量插入用户信息
     * @author: yzs
     * @param users
     * @return int
     */
    void insertBatch(List<User> users);
    /**
     *保存账号
     * @author: yzs
     * @param vo
     * @return int
     */
    Account saveAccount(RegisterVO vo);
    /**
     *忘记密码第一步---验证码判断和查询账号
     * @author: yzs
     * @param vo
     * @return java.lang.Long
     */
    Long updatePasswordFirst(RegisterVO vo);

    /**
     *忘记密码第二步--修改密码
     * @author: yzs
     * @param account
     * @return void
     */
   void updatePasswordSecond(Account account);
    /**
     *更新手机号码
     * @author: yzs
     * @param vo  包含ID phone
     * @return void
     */
   ApiResult updatePhone(RegisterVO vo);

    /**
     *通过账号ID统计租户
     * @author: yzs
     * @param accountId
     * @return java.util.List<java.lang.Long>
     */
    List<Long> countTenantId(Long accountId);

    /**
     *通过手机号码查询家长账号
     * @author: yzs
     * @param phoneList
     * @return
     */
    Map<String, User> getByPhoneList(List<String> phoneList);
    /**
     * 查询账号包含的身份
     * @author: yzs
     * @param  user
     * @return java.util.List<com.gok.pboot.base.Dict>
     */
    List<Dict> findTypeByAccount(User user);

    /**
     *批量更新状态
     * @author: yzs
     * @param vo  ids集合ID,state状态
     * @return int
     */
    int updateState(UserVO vo);

  int  updateEntity(Account account);

    /**
     *
     * @author: yzs
     * @param vo  使用accountId查询用户信息校验密码password
     * @return java.lang.Boolean
     */
  Boolean checkPassword(RegisterVO vo);

  Account findByOpenId(String openId);
   /**
     *user对象条件查询
     * @author: yzs
     * @param user
     * @return java.util.List<com.gok.pboot.auth.User>
     */
  List<User> findByUserFilter(User user);

    /**
     *根据手机号码集合
     * @author: yzs
     * @param phoneList
     * @return java.util.List<com.gok.pboot.auth.Account>
     */
    List<Account> findByPhoneList(List<String> phoneList);

    /**
     *通过AccountID集合（accountIds）和类型（type）查询
     * @author: yzs
     * @param vo
     * @return
     */
    Map<Long, User>getUserMapByAccountIdList(UserSearchVO vo);

    /**
     * 根据用户名称查询用户id列表
     * @param username 用户名称
     * @return  用户id列表
     */
    List<String> getIdListByUsername(String username);
    /**
     * 根据用户id编辑账号实名信息
     * @author chx
     * @date 2024/7/15
     * @param account 请求参数
     * @return void
     */
    void updateAuthInformationByUserId(Account account);

    /**
     * 根据承运人获取用户id列表
     * @author chx
     * @date 2024/7/16
     * @param carrier 承运人
     * @return java.util.List<java.lang.String>
     */
    List<String> getIdListByCarrier(String carrier);

    /**
     * 新增司机账号信息
     * @author chx
     * @date 2024/7/16
     * @param account 请求参数
     * @return void
     */
    void saveDriverAccount(Account account);

    /**
     * 新增司机用户信息
     * @author chx
     * @date 2024/7/16
     * @param user 请求参数
     * @return void
     */
    void saveDriverUser(User user);


    /**
     * 根据手机号获取账号信息
     * @param phone 手机号
     * @return
     */
    User getUserByPhone(String phone);

    /**
     * 根据用户id获取用户信息
     * @param userId    用户id
     */
    User getUserById(String userId);

    /**
     * 根据用户名查找账号信息
     * @param username  用户名
     * @param accountId 账号id
     * @return
     */
    Account getAccountByUsername(String username, Long accountId);

    /**
     * 根据账号id获取实名信息
     * @param accountId 账号id
     * @return 实名状态
     */
    Account getAuthStatusById(Long accountId);

    /**
     * 根据身份证查找账号信息
     * @param idNumber  身份证号
     * @param accountId 账号id
     * @return
     */
    Account getAccountByIdNumber(String idNumber, Long accountId);

    /**
     * 修改用户实名信息
     * @param authAccount   用户实名信息
     */
    void updateAuthByAccountId(Account authAccount);

    /**
     * 根据身份证获取账号数量
     * @author lpj
     * @date 2024/7/22
     * @param account 请求参数
     * @return java.lang.Integer
     */
    Integer getCountByIdNumber(Account account);

    /**
     * 根据手机号获取账号数量
     * @author lpj
     * @date 2024/7/22
     * @param account 请求参数
     * @return java.lang.Integer
     */
    Integer getCountByPhone(Account account);
}
