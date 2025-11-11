package com.gok.pboot.dict.rest;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.base.PropertyFilters;
import com.gok.pboot.dict.service.ISystemVariableService;
import com.gok.pboot.dict.util.VariableUtils;
import com.gok.pboot.enumeration.FieldType;
import com.gok.pboot.platform.dict.entity.DataDictionary;
import com.gok.pboot.platform.dict.vo.DataDictionaryVO;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * 数据字典管理
 * @author funcas
 * @version 1.0
 * @date 2018年11月02日
 */
@RestController
@RequestMapping("/sys")
public class DataDictionaryController extends BaseController {

    private final ISystemVariableService systemVariableService;

    @Autowired
    public DataDictionaryController(ISystemVariableService systemVariableService) {
        this.systemVariableService = systemVariableService;
    }

    /**
     * 分页查询所有数据字典列表
     * @param pageRequest
     * @param request
     * @return
     */
    @GetMapping("/dicts")
    ////@PreAuthorize("hasAuthority('data-dictionary:list')")
    public Object getDicts(PageRequest pageRequest, HttpServletRequest request){
        return success(systemVariableService.findDataDictionaries(pageRequest, PropertyFilters.get(request, true)));
    }

    @GetMapping("/field-types")
    public Object getFieldTypes() {
        List<Map<String, Object>> result = Lists.newArrayList();
        for(FieldType fieldType : FieldType.values()){
            Map<String, Object> dictionary = Maps.newHashMap();
            dictionary.put(VariableUtils.DEFAULT_VALUE_NAME, fieldType.getValue().getName());
            dictionary.put(VariableUtils.DEFAULT_KEY_NAME, fieldType.name());
            result.add(dictionary);
        }
        return success(result);
    }

    /**
     * 根据字典类别code获取字典数据
     * @param code
     * @return
     */
    @GetMapping("/dictsSelect/{code}")
    public Object dictsSelect(@PathVariable("code") String code) {
        return success(VariableUtils.get(code));
    }

    /**
     * 保存数据字典
     * @param entity
     * @return
     */
    @PostMapping("/dict")
    ////@PreAuthorize("hasAuthority('data-dictionary:save')")
    public Object saveDict(@Valid @RequestBody DataDictionary entity){
        systemVariableService.saveDataDictionary(entity);
        return success(entity);
    }

    /**
     * 删除数据字典
     * @param id
     * @return
     */
    @DeleteMapping("/dict/{id}")
    ////@PreAuthorize("hasAuthority('data-dictionary:delete')")
    public Object delDict(@PathVariable("id") Long id){
        systemVariableService.deleteDataDictionaries(Lists.newArrayList(id));
        return success(id);
    }

    /**
     * 根据code获取记录
     * @param code
     * @return
     */
    @GetMapping("/dict/getByCode/{code}")
    public ApiResult<DataDictionaryVO> getByCode(@PathVariable("code") String code){
       return success(systemVariableService.getDataDictionary(code));
    }

    /**
     * 根据类别code获取记录
     * @param code
     * @return
     */
    @GetMapping("/dict/getByCategoryCode/{code}")
    public ApiResult<List<DataDictionaryVO>> getByCategoryCode(@PathVariable("code") String code){
        return success(systemVariableService.getDataDictionaries(code));
    }
}
