package com.gok.pboot.enumeration;

/**
 * 通用状态枚举
 */
public enum SysStatusEnum implements ValueEnum<Integer> {
    /**
     * 启用
     */
    ENABLE("启用", 0),
    /**
     * 禁用
     */
    DISABLE("禁用", 1),
    ;

    Integer value;
    String name;

    private SysStatusEnum(String name, Integer code){
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
