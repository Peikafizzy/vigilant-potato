package com.gok.pboot.commons.service;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.dict.resp.DictResp;

import java.util.List;

/**
 * 通用接口
 * @author wfs
 * @date 2023/09/25
 */
public interface CommonService {

    /**
     * 根据字典类型获取字典列表
     * @author  wfs
     * @date 2023/9/25
     * @param dataType   字典类型
     * @return com.gok.pboot.base.ApiResult<java.util.List<com.gok.pboot.commons.resp.DictResp>>
     */
    ApiResult<List<DictResp>> getDictList(String dataType);
}
