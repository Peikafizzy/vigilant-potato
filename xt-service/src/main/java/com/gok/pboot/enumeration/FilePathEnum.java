package com.gok.pboot.enumeration;

/**
 * @author: lpj
 * @description: 文件路径前缀枚举
 * @date: 2023/9/26 9:02
 * @version: 1.0
 */
public enum FilePathEnum implements ValueEnum<String>{
    /**
     * 企业
     */
    COMPANY("0", "company"),
    MONITORING("1", "monitoring");

    private String name;
    private String value;

    private FilePathEnum(String value, String name) {
        this.value = value;
        this.name = name;
    }

    @Override
    public String getValue() {
        return value;
    }

    @Override
    public String getName() {
        return name;
    }
}
