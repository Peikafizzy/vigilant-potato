package com.gok.pboot.service;

import com.gok.pboot.entity.UserAccount;
import java.util.Optional;

public interface IUserAccountService {

    Optional<UserAccount> findByEmail(String email);
    Optional<UserAccount> findByPhone(String input);
    Optional<UserAccount> findByUsername(String account);
    UserAccount getById(Long id);
    UserAccount save(UserAccount user);

}

