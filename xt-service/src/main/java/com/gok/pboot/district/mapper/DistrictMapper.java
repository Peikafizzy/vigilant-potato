package com.gok.pboot.district.mapper;

import com.gok.pboot.district.po.DistrictPo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wfs
 * @date 2023/09/26
 */

@Mapper
public interface DistrictMapper {

    /**
     * 根据上级id获取地区列表
     * @author  wfs
     * @date 2023/9/26
     * @param parentId   上级id
     * @return java.util.List<com.gok.pboot.district.po.DistrictPo>
     */
    List<DistrictPo> listDistrictByParentId(@Param("parentId") String parentId);

    /**
     * 根据地区编码集合获取地区信息
     * @param ids   地区编码集合
     * @return
     */
    List<DistrictPo> listDistrictByIds(@Param("districtIds") List<String> ids);

    /**
     * 根据行政区编码获取行政区信息
     * @author  wfs
     * @date 2023/9/27
     * @param districtCode   行政区编码
     * @return com.gok.pboot.district.po.DistrictPo
     */
    DistrictPo getDistrictByCode(@Param("districtCode") String districtCode);

    /**
     * 获取省份列表
     * @author chx
     * @date 2023/10/25
     * @return java.util.List<com.gok.pboot.dict.po.DataDictionaryPo>
     */
    List<DistrictPo> listProvince();

    /**
     * 根据当前行政区编码获取上一级行政区id
     * @param districtCode
     * @return
     */
    String getParentIdByCode(@Param("districtCode") String districtCode);

}
