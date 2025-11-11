package com.gok.pboot.commons.req;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @version 1.0
 * @description: TODO
 * @Author lize
 * @Date 2024/8/21 14:35
 */
@Data
public class HiSubsideThreshold {
    private Long subsideThresholdId;

    private Long pointId;

    private BigDecimal displacementRedThreshold;

    private BigDecimal displacementOrangeThreshold;

    private BigDecimal displacementYellowThreshold;

    private BigDecimal displacementBlueThreshold;

    private Date createTime;

    private Long createId;

    private Long updateId;

    private Date updateTime;
}
