package com.gok.pboot.file.enumeration;

import com.gok.pboot.enumeration.ValueEnum;

/**
 * 文件路径前缀枚举
 * @author wfs
 */

public enum FilePathEnum implements ValueEnum<Integer> {


    /**
     * 产品
     */
    PRODUCT(0, "product"),

    /**
     * 面值
     */
    DENOMINATION(1, "denomination"),

    /**
     * banner
     */
    BANNER(2, "banner"),

    /**
     * 地区
     */
    AREA(3, "area"),

    /**
     * 支付
     */
    PAYMENT(4, "payment"),

    ;

    private String name;
    private Integer value;

    private FilePathEnum(Integer value, String name) {
        this.value = value;
        this.name = name;
    }

    @Override
    public Integer getValue() {
        return value;
    }

    @Override
    public String getName() {
        return name;
    }

    /**
     * 根据value获取name
     * @param value
     * @return
     */
    public static String getNameByValue(Integer value) {
        for (FilePathEnum e : FilePathEnum.values()) {
            if (e.getValue().equals(value)) {
                return e.getName();
            }
        }
        return "";
    }
}
