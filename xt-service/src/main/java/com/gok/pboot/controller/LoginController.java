package com.gok.pboot.controller;

import com.gok.pboot.entity.UserAccount;
import com.gok.pboot.service.IAccountService;
import com.gok.pboot.service.IUserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/sys")
public class LoginController {

    private final IUserAccountService userAccountService;  // new service (self)
    private final PasswordEncoder passwordEncoder;
    private final RedisTemplate<String, Object> redisTemplate;

    @Autowired
    public LoginController(
            IAccountService accountService,
            IUserAccountService userAccountService,
            PasswordEncoder passwordEncoder,
            RedisTemplate<String, Object> redisTemplate
    ) {
        this.userAccountService = userAccountService;
        this.passwordEncoder = passwordEncoder;
        this.redisTemplate = redisTemplate;
    }

    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, String> data) {
        String account = data.get("account");
        String password = data.get("password");

        // 1. Find user by account type
        Optional<UserAccount> optionalUser;
        if (account.contains("@")) {
            optionalUser = userAccountService.findByEmail(account);
        } else if (account.matches("^1\\d{10}$")) {
            optionalUser = userAccountService.findByPhone(account);
        } else {
            optionalUser = userAccountService.findByUsername(account);
        }

        // 2. Fake hash for timing attack safety
        String fakeHash = "$2a$10$abcdefghijklmnopqrstuv";
        boolean passwordMatches = passwordEncoder.matches(
                password,
                optionalUser.map(UserAccount::getPasswordHash).orElse(fakeHash)
        );

        if (!passwordMatches) {
            throw new RuntimeException("Invalid account or password"); // generic
        }

        UserAccount user = optionalUser.get(); // safe, because passwordMatches already validated

        // 3. Generate token and store in Redis
        String token = "token-" + UUID.randomUUID().toString();
        redisTemplate.opsForValue().set(token, user.getId());

        // 4. Return response for vue-element-admin
        Map<String, Object> dataResp = new HashMap<>();
        dataResp.put("token", token);

        Map<String, Object> resp = new HashMap<>();
        resp.put("code", 20000);
        resp.put("data", dataResp);

        return resp;
    }

    // ---------------- GET USER INFO ----------------
    @GetMapping("/user/info")
    public Map<String, Object> getUserInfo(@RequestParam String token) {
        Object uidObj = redisTemplate.opsForValue().get(token);
        if (uidObj == null) {
            throw new RuntimeException("Invalid or expired token");
        }
        Long uid = Long.valueOf(uidObj.toString());

        UserAccount user = userAccountService.getById(uid);

        Map<String, Object> result = new HashMap<>();
        result.put("name", user.getUsername());
        result.put("roles", Arrays.asList("admin")); // replace with actual roles if available
        result.put("avatar", null);

        Map<String, Object> resp = new HashMap<>();
        resp.put("code", 20000);
        resp.put("data", result);

        return resp;
    }

    // ---------------- LOGOUT ----------------
    @PostMapping("/logout")
    public Map<String, Object> logout(@RequestParam String token) {
        redisTemplate.delete(token);

        Map<String, Object> resp = new HashMap<>();
        resp.put("code", 20000);
        resp.put("data", "Logout successful");
        return resp;
    }
}
