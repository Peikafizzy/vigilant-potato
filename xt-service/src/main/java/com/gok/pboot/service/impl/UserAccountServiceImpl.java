package com.gok.pboot.service.impl;

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
    public Optional<UserAccount> findByUsernameOrEmailOrPhone(String input) {
        return userAccountMapper.selectList(null)  // placeholder, you can write custom query
                .stream()
                .filter(u -> input.equals(u.getUsername())
                        || input.equals(u.getEmail())
                        || input.equals(u.getPhone()))
                .findFirst();
    }

    @Override
    public UserAccount save(UserAccount user) {
        // hash password before saving
        user.setPasswordHash(passwordEncoder.encode(user.getPasswordHash()));
        userAccountMapper.insert(user);
        return user;
    }
}

