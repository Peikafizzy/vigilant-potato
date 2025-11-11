package com.gok.pboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.Group;
import com.gok.pboot.auth.User;
import com.gok.pboot.auth.vo.GroupVO;
import com.gok.pboot.auth.vo.UnitUserVO;
import com.gok.pboot.auth.vo.UserSearchVO;
import com.gok.pboot.auth.vo.UserVO;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 用户数据访问
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {


    /**
     * 获取用户
     *
     * @param username 用户登录帐号或电子实体
     * @return 用户实体 Map
     */
    User getLoginUser(@Param("username") String username, @Param("tenantNo") String tenantNo, @Param("type") String type);

    List<User> getUsersByUsernameAndTenantNo(@Param("username") String username, @Param("tenantNo") String tenantNo);

    List<User> getUsersByPhoneAndTenantNo(@Param("phone") String phone, @Param("tenantNo") String tenantNo);


    /**
     * 根据手机获取用户
     *
     * @param phone
     * @param id
     * @return
     */
    List<User> getByPhone(@Param("phone") String phone, @Param("id") Long id);


    /**
     * 删除用户与组的关联
     *
     * @param id 用户主键 ID
     */
    void deleteGroupAssociation(@Param("id") Long id);


    /**
     * 更新密码
     *
     * @param id       用户主键 ID
     * @param password 密码
     */
    void updatePassword(@Param("id") Long id, @Param("password") String password);

    /**
     * 修改密码 手势  指纹
     *
     * @param entity
     */
    void updatePass(@Param("entity") User entity);

    /**
     * 修改手机号
     * @param id
     * @param phone
     * @return
     */
    int updatePhone(@Param("id") Long id, @Param("phone") String phone);

    /**
     * 新增用户与组的关联
     *
     * @param id     用户主键 ID
     * @param groups
     */
    void insertGroupAssociation(@Param("id") Long id, @Param("groups") List<Group> groups);


    /**
     * 查询用户
     *
     * @param filter 查询条件
     * @return 用户实体 Map集合
     */
    Page<User> find(Page<User> page, @Param("filter") Map<String, Object> filter);

    /**
     * 获取用户集合
     *
     * @param filter
     * @return
     */
    List<User> find(@Param("filter") Map<String, Object> filter);

    List<User> findUserByOrgId(@Param("orgId") Long orgId);

    List<String> getUserPerms(@Param("id") Long uid);

    User getByGesturePassword(@Param("ges_token") String gesToken);

    User getByFingerPassword(@Param("ges_token") String gesCode);

    /**
     * 根据条件查询用户列表
     *
     * @param searchVO
     * @return
     */
    List<UserVO> getUserList(UserSearchVO searchVO);


    int insertBatch(@Param("users") List<User> users);

    /**
     * 批量删除
     */
    Integer delBatchByLogic(@Param("ids") List<Long> ids);


    /**
     * 根据机构id获取用户
     *
     * @param unitId
     * @param tenantId
     * @param type
     * @return
     */
    List<UserVO> findByUnitId(@Param("unitId") Long unitId, @Param("tenantId") Long tenantId, @Param("userType") Integer type);

    /**
     * 根据机构id获取用户
     *
     * @param unitId
     * @param tenantId
     * @param groupId
     * @return
     */
    List<UserVO> findByUnitIdAndGroupId(@Param("unitId") Long unitId,
                                        @Param("tenantId") Long tenantId,
                                        @Param("groupId") Long groupId,
                                        @Param("userType")String userType);


    /**
     * 根据用户id修改openId
     * @author  wfs
     * @date 2023/10/7
     * @param id        用户id
     * @param openid    openId
     */
    void updateOpenidByUserId(@Param("id") Long id, @Param("openid") String openid);

    /**
     * 根据角色id和类型查询用户
     *
     * @param groupId
     * @param type
     * @return
     */
    List<UserVO> findUserByGroupId(@Param("groupId") Long groupId, @Param("type") Integer type);

    /**
     * 根据机构父级id获取用户
     *
     * @param unitIdList
     * @return
     */
    List<UserVO> findByUnitParentIds(@Param("unitIdList") List<Long> unitIdList);

    /**
     * 根据机构父级id获取用户
     *
     * @param unitIdList
     * @return
     */
    List<UserVO> findByUnitIds(@Param("unitIdList") List<Long> unitIdList);

    int deleteGroupUser(@Param("groupId") Long groupId, @Param("type") Integer type);

    /**
     * 添加角色用户
     *
     * @param groupVO
     * @return
     */
    int saveGroupUser(GroupVO groupVO);

    /**
     * 根据招行openid获取用户集合
     *
     * @param openId
     * @param type
     * @return
     */
    List<User> findUsers(@Param("openId") String openId, @Param("type") String type);

    /**
     * 用户，账户分离获取用户信息运维专用
     *
     * @param begin limit开始
     * @param end   limit结束
     * @return
     */
    List<UserVO> getOperationsUsers(@Param("begin") int begin, @Param("end") int end);

    /**
     * 角色ID集合查询用户
     *
     * @param groupIdList
     * @return
     */
    List<UnitUserVO> findUsersByGroup(@Param("groupIdList") Set<Long> groupIdList);

    /**
     * 电话集合查询用户信息
     *
     * @param phone 电话
     *
     * @author: yzs
     */
    @MapKey("phone")
    Map<String, User> getParentsByPhoneList(@Param("list") List<String> phone);

    /**
     *通过User
     * @author: yzs
     * @param user
     * @return java.util.List<com.gok.pboot.auth.vo.UserVO>
     */
    List<User> findByUserFilter(@Param("filter") User user);

    /**
     *批量更新状态
     * @author: yzs
     * @param vo  ids集合ID,state状态
     * @return int
     */
    int updateState(@Param("filter") UserVO vo);

    /**
     *通过账号ID统计所有租户
     * @author: yzs
     * @param accountId
     * @return java.util.List<java.lang.Long>
    //     */
    List<Long> countTenantId(Long accountId);

    /**
     * 根据租户id和类型查询用户
     * @param tenantId
     * @param type
     * @return
     */
    List<UserVO> findByTenantAndType(@Param("tenantId") Long tenantId, @Param("type") Integer type);

    /**
     *通过AccountID集合（accountIds）和类型（type）查询
     * @author: yzs
     * @param vo
     *
     */
    @MapKey("accountId")
    Map<Long, User>getUserMapByAccountIdList(@Param("filter") UserSearchVO vo);


    /**
     * 根据用户名查询用户id列表
     * @param username  用户名
     * @return  用户id列表
     */
    List<String> getIdListByUsername(@Param("username") String username);

    /**
     * 根据承运人获取用户id列表
     * @author chx
     * @date 2024/7/16
     * @param carrier 承运人
     * @return java.util.List<java.lang.String>
     */
    List<String> getIdListByCarrier(@Param("carrier") String carrier);

    /**
     * 根据手机号获取用户信息
     * @param phone 手机号
     * @return
     */
    User getUserByPhone(String phone);

    /**
     * 根据用户id获取用户信息
     * @param userId    用户id
     * @return
     */
    User getUserByUserId(String userId);
}
