package com.gok.pboot.commons.service.impl;

import com.gok.pboot.ConverterUtils;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.commons.service.CommonService;
import com.gok.pboot.dict.resp.DictResp;
import com.gok.pboot.dict.service.ISystemVariableService;
import com.gok.pboot.platform.dict.vo.DataDictionaryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

/**
 * 通用接口业务逻辑处理
 * @author wfs
 * @date 2023/09/25
 */

@Service
@Slf4j
public class CommonServiceImpl implements CommonService {

    @Autowired
    private ISystemVariableService systemVariableService;


    @Override
    public ApiResult<List<DictResp>> getDictList(String dataType) {
        List<DataDictionaryVO> dataDictionaryList = systemVariableService.getDataDictionaries(dataType);
        dataDictionaryList.sort(Comparator.comparing(o -> Integer.parseInt(o.getCode())));
        return ApiResult.success(ConverterUtils.converte(dataDictionaryList, DictResp.class));
    }

}
