package com.gok.pboot.dict.rest;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.base.PageRequest;
import com.gok.pboot.base.PropertyFilters;
import com.gok.pboot.dict.service.ISystemVariableService;
import com.gok.pboot.platform.dict.entity.DataDictionary;
import com.gok.pboot.platform.dict.entity.DictionaryCategory;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 字典类别管理
 * @author funcas
 * @version 1.0
 * @date 2018年11月02日
 */
@RestController
@RequestMapping("/sys")
public class DictionaryCategoryController extends BaseController {

    private final ISystemVariableService systemVariableService;


    @Autowired
    public DictionaryCategoryController(ISystemVariableService systemVariableService) {
        this.systemVariableService = systemVariableService;
    }

    /**
     * 分页查询字典类别
     * @param pageRequest
     * @param request
     * @return
     */
    @GetMapping("/dict-categories")
    ////@PreAuthorize("hasAuthority('dictionary-category:list')")
    public ApiResult getDictCategorys(PageRequest pageRequest, HttpServletRequest request){
        return success(systemVariableService.findDictionaryCategories(pageRequest, PropertyFilters.get(request, true)));
    }

    /**
     * 更新或保存字典类别
     * @param entity
     * @return
     */
    @PostMapping("/dict-category")
    ////@PreAuthorize("hasAuthority('dictionary-category:save')")
    public ApiResult saveDictCategory(@Valid @RequestBody DictionaryCategory entity){
        systemVariableService.saveDictionaryCategory(entity);
        return success(entity);
    }

    /**
     * 删除字典类别
     * @param id
     * @return
     */
    @DeleteMapping("/dict-category/{id}")
    ////@PreAuthorize("hasAuthority('dictionary-category:delete')")
    public ApiResult deleteCategoryById(@PathVariable("id") Long id){
        List<Long> ids =  Lists.newArrayList(id);
        for (long cId: ids ) {
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("fk_category_id",cId);
            List<DataDictionary> lists = systemVariableService.findDataDictionaries(map);
            if(lists!=null&&lists.size()>0){
                return failureMsg("请先删除类别下对应的字典数据");
            }
            systemVariableService.deleteDictionaryCategories(Lists.newArrayList(id));
        }
        return success(id);
    }
}
