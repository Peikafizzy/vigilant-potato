package com.gok.pboot.dict.resp;

import lombok.Data;

/**
 * 数据字典返回参数
 * @author wfs
 * @date 2023/09/25
 */

@Data
public class DictResp {

    /**
     * 数据字典key
     * @author  wfs
     * @date 2023/9/25
     */
    private String code;

    /**
     * 数据字典value
     * @author  wfs
     * @date 2023/9/25
     */
    private String value;
}
