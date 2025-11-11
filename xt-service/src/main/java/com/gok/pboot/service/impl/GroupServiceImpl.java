package com.gok.pboot.service.impl;

import com.gok.pboot.auth.Group;
import com.gok.pboot.mapper.GroupMapper;
import com.gok.pboot.service.GroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 分组业务逻辑处理
 * @author wfs
 * @date 2023/09/26
 */

@Slf4j
@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    private GroupMapper groupMapper;


    @Override
    public List<Long> getGroupIdsByUserId(Long userId) {
        return groupMapper.getGroupIdsByUserId(userId);
    }

    @Override
    public List<Group> getUserGroups(Long userId) {
        return groupMapper.getUserGroups(userId);
    }




}
