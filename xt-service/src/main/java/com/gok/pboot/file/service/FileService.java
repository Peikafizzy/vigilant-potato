package com.gok.pboot.file.service;

import com.gok.pboot.base.ApiResult;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * 文件相关操作处理
 * @author wfs
 */
public interface FileService {

    /**
     * 上传文件
     * @param file  文件流
     * @param pathType    文件路径前缀类型
     * @return  文件路径
     */
    ApiResult<String> upload(MultipartFile file, Integer pathType);

    /**
     * 下载文件
     * @param filePath  文件路径
     * @param fileName  文件名
     * @param response  响应对象
     */
    void download(String filePath, String fileName, HttpServletResponse response);
}
