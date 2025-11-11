package com.gok.pboot.commons.req;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author lize
 * @since 2024-08-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class HiAngleData implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "angle_data_id", type = IdType.AUTO)
    private Long angleDataId;

    private Long pointId;

    private BigDecimal angleX;


    private BigDecimal angleY;


    private BigDecimal accelX;


    private BigDecimal accelY;


    private BigDecimal angleXDelta;


    private BigDecimal angleYDelta;


    private BigDecimal accelXDelta;


    private BigDecimal accelYDelta;


    private BigDecimal communicationSignalStrength;


    private BigDecimal batteryVoltage;

    private BigDecimal temperature;

    private Date createTime;


}
