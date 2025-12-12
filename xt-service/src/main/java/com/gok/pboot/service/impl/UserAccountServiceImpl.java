package com.gok.pboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gok.pboot.entity.UserAccount;
import com.gok.pboot.mapper.UserAccountMapper;
import com.gok.pboot.service.IUserAccountService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

@Service
public class UserAccountServiceImpl implements IUserAccountService {

    @Autowired
    private UserAccountMapper userAccountMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Optional<UserAccount> findByEmail(String email) {
        return Optional.ofNullable(userAccountMapper.selectOne(new QueryWrapper<UserAccount>().eq("email", email)));
    }

    @Override
    public Optional<UserAccount> findByPhone(String phone) {
        return Optional.ofNullable(userAccountMapper.selectOne(new QueryWrapper<UserAccount>().eq("phone", phone)));
    }

    @Override
    public Optional<UserAccount> findByUsername(String username) {
        return Optional.ofNullable(userAccountMapper.selectOne(new QueryWrapper<UserAccount>().eq("username", username)));
    }

    @Override
    public UserAccount getById(Long id) {
        return userAccountMapper.selectById(id);
    }

    @Override
    public UserAccount save(UserAccount user) {
        // hash password before saving
        user.setPasswordHash(passwordEncoder.encode(user.getPasswordHash()));
        userAccountMapper.insert(user);
        return user;
    }
}

