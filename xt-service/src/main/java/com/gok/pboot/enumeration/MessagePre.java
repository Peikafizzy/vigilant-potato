package com.gok.pboot.enumeration;

/**
 * 短信验证前缀
 *
 * @author chenjr
 * @createDate 2019-08-20 14:42
 */
public enum MessagePre {
    LOGIN("LOGIN","0"),
    BIND("BIND","1"),
    UNBIND("UNBIND","2"),
    UNKNOWN_STATUS("未知状态","3");

    private String name;
    private String value;

    private MessagePre(String name, String value){
        this.value = value;
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public String getName() {
        return name;
    }

    public static MessagePre getMessagePre(String value){
        for(MessagePre resultEnum : MessagePre.values()){
            if(resultEnum.getValue().equals(value)){
                return resultEnum;
            }
        }
        return UNKNOWN_STATUS;
    }

}
