package com.gok.pboot.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author luolp
 * @date 2020-05-21 9:49
 * @desc 启动加载redis配置
 **/
@Component
@Order(1)
@Slf4j
public class RedisConfig implements ApplicationRunner {

    private static Map<String,String> cache = new ConcurrentHashMap<String, String>();

    @Value("${sys.login.phone-verify-code-enable: false}")
    private boolean phoneVerifyCodeEnable;

    @Override
    @Async
    public void run(ApplicationArguments args) throws Exception {
        cache.put(VerifyConfig.REDIS_PHONE_CODE_ENABLE,String.valueOf(phoneVerifyCodeEnable));
        log.info("redis缓存加载结束.");
    }

    public static Map<String, String> getCache() {
        return cache;
    }
}
