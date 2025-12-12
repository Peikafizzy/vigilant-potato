package com.gok.pboot.service;

import com.gok.pboot.entity.UserAccount;
import java.util.Optional;

public interface IUserAccountService {
    Optional<UserAccount> findByUsernameOrEmailOrPhone(String input);
    UserAccount save(UserAccount user);
}

