package com.gok.pboot.service.impl;

import com.gok.pboot.config.RedisConfig;
import com.gok.pboot.config.VerifyConfig;
import com.gok.pboot.enumeration.entity.YesOrNoEnum;
import com.gok.pboot.redis.RedisUtil;
import com.gok.pboot.service.ISystemCommonService;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月09日
 */
@Service
public class SystemCommonSerivceImpl implements ISystemCommonService {

    @Resource
    private DefaultKaptcha defaultKaptcha;

    private final RedisUtil redisUtil;

    @Autowired
    public SystemCommonSerivceImpl(RedisUtil redisUtil) {
        this.redisUtil = redisUtil;
    }

    @Override
    public void updateVerifyCodeStatus(Integer status) {
        String o= RedisConfig.getCache().put(VerifyConfig.REDIS_PHONE_CODE_ENABLE,String.valueOf(YesOrNoEnum.YES.getValue().equals(status)));
//        redisUtil.set(VerifyConfig.REDIS_PHONE_CODE_ENABLE, YesOrNoEnum.YES.getValue().equals(status));
    }
}
