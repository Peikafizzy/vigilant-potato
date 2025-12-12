package com.gok.pboot.entity;

import com.gok.pboot.auth.User;
import lombok.Data;

@Data
public class UserAccount{  // extend the Maven User
    private String username;
    private String email;
}
