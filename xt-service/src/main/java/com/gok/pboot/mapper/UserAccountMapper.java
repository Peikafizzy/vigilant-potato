package com.gok.pboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gok.pboot.entity.ClientUserAccount;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ClientUserAccountMapper extends BaseMapper<ClientUserAccount> {

    @Select("SELECT * FROM client_user_account WHERE phone = #{value} LIMIT 1")
    ClientUserAccount findByPhone(String phone);

    @Select("SELECT * FROM client_user_account WHERE email = #{value} LIMIT 1")
    ClientUserAccount findByEmail(String email);

    @Select("SELECT * FROM client_user_account WHERE username = #{value} LIMIT 1")
    ClientUserAccount findByUsername(String username);
}

