package com.gok.pboot.district.service;

import com.gok.pboot.district.resp.DistrictResp;

import java.util.List;
import java.util.Map;

/**
 * 地区service接口
 * @author wfs
 * @date 2023/09/26
 */
public interface DistrictService {

    /**
     * 根据上级id获取地区列表
     * @author  wfs
     * @date 2023/9/26
     * @param parentId   上级id
     * @return java.util.List<com.gok.pboot.district.resp.DistrictResp>
     */
    List<DistrictResp> listDistrictByParentId(String parentId);

    /**
     * 根据地区id集合（地区编码集合）获取地区信息列表
     * @param ids   地区编码集合
     * @return
     */
    List<DistrictResp> listDistrictByIds(List<String> ids);

    /**
     * 根据编码获取行政区信息
     * @author  wfs
     * @date 2023/9/27
     * @param districtCode  行政区编码
     * @return com.gok.pboot.district.resp.DistrictResp
     */
    DistrictResp getDistrictByCode(String districtCode);


    /**
     * 根据行政区编码list获取行政区代码-行政区名称map
     * @param districtCodeList 行政区代码list
     * @return
     */
    Map<String, String> getDistrictMapByCodes(List<String> districtCodeList);

    /**
     * 根据当前行政区编码获取上一级行政区id
     */
    String getParentIdByCode(String districtCode);

}
