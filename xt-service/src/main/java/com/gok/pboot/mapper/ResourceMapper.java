package com.gok.pboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gok.pboot.auth.Resource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 资源数据访问
 *
 * @author funcas
 */
@Mapper
public interface ResourceMapper extends BaseMapper<Resource> {


    /**
     * 获取所有资源
     *
     * @param tenantId 租户ID 值
     *
     * @return 资源实体集合
     */
    List<Resource> getAll(@Param("tenantId") Long tenantId);

    /**
     * 获取相关联的子资源
     *
     * @param id 资源主键 ID
     * @param tenantId 租户ID
     *
     * @return 资源实体 Map 集合
     */
    List<Resource> getChildren(@Param("id") Long id, @Param("tenantId") Long tenantId);

    /**
     * 获取用户资源
     *
     * @param userId 用户主键 ID
     *
     * @return 资源实体 Map 集合
     */
    List<Resource> getUserResources(@Param("userId") Long userId);

    /**
     * 获取组资源
     *
     * @param groupId 组主键 ID
     *
     * @return 资源实体 Map 集合
     */
    List<Resource> getGroupResources(@Param("groupId") Long groupId);

    /**
     * 删除资源与组的关联
     *
     * @param id 资源主键 ID
     */
    void deleteGroupAssociation(@Param("id") Long id);

    /**
     * 根据角色查询菜单权限
     * @param groupId
     * @param tenantId
     * @param isTenant
     * @return
     */
    List<Resource> selectGroupResources(@Param("groupId") Long groupId, @Param("tenantId") Long tenantId, @Param("isTenant") Boolean isTenant);

    List<String> getResourceByGroupIds(@Param("groupId") Long groupId,@Param("tenantId") Long tenantId);

    /**
     * 通过id查询资源
     * @param idList
     * @param isTenant 是否租户
     * @return
     */
    List<Resource> findByIdList(@Param("idList") List<Long> idList, @Param("isTenant") Boolean isTenant);

    /**
     * 通过租户id删除资源
     * @param tenantId
     * @return
     */
    int deleteByTenantId(@Param("tenantId") Long tenantId);

    /**
     * 通过租户id和资源id删除资源
     * @param idList
     * @param tenantId
     * @return
     */
    int deleteByIdsAndTenantId(@Param("idList") List<Long> idList,@Param("tenantId") Long tenantId);

    /**
     * 批量保存资源
     * @param saveList
     * @return
     */
    int batchSave(@Param("saveList") List<Resource> saveList);

    /**
     * 获取所有资源
     * @param defaultTenantId
     * @param tenantId
     * @return 资源实体 Map 集合
     */
    public List<Resource> getCheckedResources(@Param("defaultTenantId") Long defaultTenantId, @Param("tenantId") Long tenantId, @Param("isTenant") Boolean isTenant);

    /**
     * 根据条件查询
     * @param resource
     * @param tenantId
     * @return
     */
    Resource getByQuery(@Param("resource") Resource resource, @Param("tenantId") Long tenantId);

    /**
     * 根据外键id查询
     * @param id
     * @return
     */
    Resource getByFkId(@Param("id") Long id);

    /**
     * 根据外键修改对象
     * @param resource
     */
    void updateByFkEntity(@Param("resource") Resource resource);

}
