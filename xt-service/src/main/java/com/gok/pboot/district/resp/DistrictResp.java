package com.gok.pboot.district.resp;

import lombok.Data;

/**
 * 地区返回参数
 * @author wfs
 * @date 2023/09/26
 */

@Data
public class DistrictResp {

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
}
