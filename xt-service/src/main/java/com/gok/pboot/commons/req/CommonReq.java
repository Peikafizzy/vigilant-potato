package com.gok.pboot.commons.req;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 通用接口请求参数
 * @author wfs
 * @date 2023/09/25
 */

@Data
public class CommonReq {

    /**
     * 字典类型
     * @author  wfs
     * @date 2023/9/25
     */
    @NotNull(message = "字典类型不为空", groups = {DataDictGroup.class})
    private String dictionaryType;

    /**
     * 地区编码
     * @author  wfs
     * @date 2023/9/26
     */
    @NotNull(message = "地区编码不为空", groups = {DistrictGroup.class})
    private String districtCode;

    /**
     * 文件类型
     */
    private Integer pathType;

    /**
     * id
     */
    private String bizId;

    /**
     * 文件名
     */
    private String fileName;

    /**
     * 文件路径
     */
    private String filePath;

    /**
     * 数据字典校验数据
     * @author  wfs
     * @date 2023/9/25
     */
    public interface DataDictGroup{}

    /**
     * 地区校验数据
     * @author  wfs
     * @date 2023/9/25
     */
    public interface DistrictGroup{}
}
