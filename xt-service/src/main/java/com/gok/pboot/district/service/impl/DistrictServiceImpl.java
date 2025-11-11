package com.gok.pboot.district.service.impl;

import com.gok.pboot.CollectionUtils;
import com.gok.pboot.ConverterUtils;
import com.gok.pboot.district.mapper.DistrictMapper;
import com.gok.pboot.district.po.DistrictPo;
import com.gok.pboot.district.resp.DistrictResp;
import com.gok.pboot.district.service.DistrictService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 地区业务逻辑处理
 * @author wfs
 * @date 2023/09/26
 */

@Slf4j
@Service
public class DistrictServiceImpl implements DistrictService {

    @Autowired
    private DistrictMapper districtMapper;

    @Override
    public List<DistrictResp> listDistrictByParentId(String parentId) {
        List<DistrictPo> districtPoList = districtMapper.listDistrictByParentId(parentId);
        List<DistrictResp> districtRespList = new ArrayList<>(1);
        if (CollectionUtils.isNotEmpty(districtPoList)) {
            districtRespList = ConverterUtils.converte(districtPoList, DistrictResp.class);
        }
        return districtRespList;
    }

    @Override
    public List<DistrictResp> listDistrictByIds(List<String> ids) {
        List<DistrictPo> districtPoList = new ArrayList<>(1);
        if (CollectionUtils.isNotEmpty(ids)) {
            districtPoList = districtMapper.listDistrictByIds(ids);
        }
        return ConverterUtils.converte(districtPoList, DistrictResp.class);

    }

    @Override
    public DistrictResp getDistrictByCode(String districtCode) {
        DistrictPo districtPo = districtMapper.getDistrictByCode(districtCode);
        return ConverterUtils.converte(districtPo, DistrictResp.class);
    }


    @Override
    public Map<String, String> getDistrictMapByCodes(List<String> districtCodeList) {
        Map<String, String> districtMap = new HashMap<>();

        if (CollectionUtils.isNotEmpty(districtCodeList)) {
            // 去重
            districtCodeList = districtCodeList.stream().distinct().collect(Collectors.toList());
            // 根据地区编码集合获取地区信息
            List<DistrictResp> districtList = listDistrictByIds(districtCodeList);
            // 转化为map
            districtMap = districtList.stream().collect(Collectors.toMap(DistrictResp::getDistrictCode, DistrictResp::getDistrictName));
        }

        return districtMap;
    }

    @Override
    public String getParentIdByCode(String districtCode) {
        return districtMapper.getParentIdByCode(districtCode);
    }
}
