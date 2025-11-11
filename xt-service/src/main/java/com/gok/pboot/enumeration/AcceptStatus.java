package com.gok.pboot.enumeration;

/**
 * @author 14831
 * @description
 * @create 2024/7/11 9:03
 */
public enum AcceptStatus implements ValueEnum<Integer>{

    /**
     * 未受理
     */
    NOT_ENTERTAINED(0, "未受理"),

    /**
     * 已受理
     */
    HAVE_ACCEPTED(1, "已受理");

    private Integer value;
    private String name;

    AcceptStatus(Integer value, String name){
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
}
