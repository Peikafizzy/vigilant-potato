package com.gok.pboot.enumeration;

/**
 * 通用是否枚举
 * @author wfs
 * @date 2024/07/22
 */
public enum SysWhetherEnum implements ValueEnum<Integer> {
    /**
     * 否
     */
    NO("否", 0),
    /**
     * 是
     */
    YES("是", 1),
    ;

    Integer value;
    String name;

    private SysWhetherEnum(String name, Integer code) {
        this.value = code;
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
}