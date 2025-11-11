package com.gok.pboot.dict.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.platform.dict.entity.DataDictionary;
import com.gok.pboot.platform.dict.vo.DataDictionaryVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 数据字典数据访问
 *
 */
@Mapper
public interface DataDictionaryMapper extends BaseMapper<DataDictionary> {

    Page<DataDictionaryVO> find(Page<DataDictionary> page, @Param("filter") Map<String, Object> filter);

    List<DataDictionaryVO> find(@Param("filter") Map<String, Object> filter);
    /**
     * 判断代码是否唯一
     *
     * @param code 代码
     *
     * @return true 表示唯一，否则 false
     */
    boolean isCodeUnique(@Param("code") String code);


    List<DataDictionaryVO> findByCategoryCode(@Param("filter") Map<String, Object> filter);

    /**
     * 根据编码获取字典记录
     * @param code
     * @return
     */
    DataDictionaryVO getVOByCode(@Param("code") String code);
}
