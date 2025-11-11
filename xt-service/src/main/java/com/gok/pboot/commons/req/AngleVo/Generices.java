
package com.gok.pboot.commons.req.AngleVo;

import lombok.Data;

import java.util.List;

/**
 * @version 1.0
 * @description: TODO
 * @Author lize
 * @Date 2024/8/23 13:58
 */
@Data
public class Generices<T>{
    private Integer total;

    private List<T> pages;
}