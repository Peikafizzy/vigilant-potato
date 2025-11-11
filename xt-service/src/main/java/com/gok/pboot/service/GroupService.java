package com.gok.pboot.service;

import com.gok.pboot.auth.Group;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 分组service接口
 * @author wfs
 * @date 2023/09/26
 */
public interface GroupService {


    /**
     * 根据用户id获取角色id列表
     * @author  wfs
     * @date 2023/9/26
     * @param userId    用户id
     * @return
     */
    List<Long> getGroupIdsByUserId(Long userId);


    /**
     * 获取用户所在的组
     *
     * @param userId 用户主键 ID
     * @return 组实体 Map 集合
     */
    List<Group> getUserGroups(@Param("userId") Long userId);
}
