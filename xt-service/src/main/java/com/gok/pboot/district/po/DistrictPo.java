package com.gok.pboot.district.po;

import lombok.Data;

/**
 * @author wfs
 * @date 2023/09/26
 */

@Data
public class DistrictPo {

    /**
     * 地区id（等同于地区编码）
     * @author  wfs
     * @date 2023/9/26
     */
    private String districtId;


    /**
     * 上级id
     * @author  wfs
     * @date 2023/9/26
     */
    private String parentId;

    /**
     * 地区编码
     * @author  wfs
     * @date 2023/9/26
     */
    private String districtCode;

    /**
     * 地区名称
     * @author  wfs
     * @date 2023/9/26
     */
    private String districtName;

    /**
     * 区域等级(0-国家地区;1-省份;2-城市;3-区;4-县)
     * @author  wfs
     * @date 2023/9/26
     */
    private String districtLevel;

    /**
     * 查询简称
     * @author  wfs
     * @date 2023/9/26
     */
    private String spellName;

    /**
     * 版本
     * @author  wfs
     * @date 2023/9/26
     */
    private String version;

}
