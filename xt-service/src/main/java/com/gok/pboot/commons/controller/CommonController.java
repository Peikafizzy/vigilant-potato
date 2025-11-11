package com.gok.pboot.commons.controller;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.base.BaseController;
import com.gok.pboot.commons.req.CommonReq;
import com.gok.pboot.commons.service.CommonService;
import com.gok.pboot.dict.resp.DictResp;
import com.gok.pboot.file.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 通用接口
 * @author wfs
 * @date 2023/09/25
 */

@RestController
@RequestMapping("/sys/common")
public class CommonController extends BaseController {

    @Autowired
    private CommonService commonService;

    @Autowired
    private FileService fileService;

    /**
     * 获取数据字典
     * @author  wfs
     * @date 2023/9/26
     * @param req   请求参数
     * @return com.gok.pboot.base.ApiResult<java.util.List<com.gok.pboot.dict.resp.DictResp>>
     */
    @GetMapping("/getDict")
    public ApiResult<List<DictResp>> getDictList(@Validated(CommonReq.DataDictGroup.class) CommonReq req) {
        return commonService.getDictList(req.getDictionaryType());
    }

    /**
     * 文件上传
     * @param file  文件流
     * @param pathType  类型
     * @return
     */
    @PostMapping("/upload/{pathType}")
    public ApiResult webContractFileUpload(@RequestParam("file") MultipartFile file, @PathVariable("pathType") Integer pathType) {
        return fileService.upload(file, pathType);
    }

    /**
     * 通用文件下载接口
     */
    @PostMapping("/download")
    public void download(@RequestBody CommonReq req, HttpServletResponse response) {
        fileService.download(req.getFilePath(), req.getFileName(), response);
    }
}
