package com.gok.pboot.service;

/**
 * @author funcas
 * @version 1.0
 * @date 2018年11月09日
 */
public interface ISystemCommonService {

    /**
     * 将是否启用手机验证码放入redis缓存
     * @param status
     */
    void updateVerifyCodeStatus(Integer status);
}
