package com.gok.pboot.mapper;

import com.gok.pboot.entity.UserAccount;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAccountMapper extends BaseMapper<UserAccount> {
    // BaseMapper already provides basic CRUD: select, insert, update, delete
}
