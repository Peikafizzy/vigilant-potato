package com.gok.pboot.file.service.impl;

import com.gok.pboot.DateUtils;
import com.gok.pboot.base.ApiResult;
import com.gok.pboot.enumeration.ApiResultEnum;
import com.gok.pboot.file.enumeration.FilePathEnum;
import com.gok.pboot.file.exception.DocException;
import com.gok.pboot.file.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Objects;

/**
 * 文件操作业务逻辑处理层
 * @author wfs
 */

@Service
@Slf4j
public class FileServiceImpl implements FileService {

    @Autowired
    MultipartConfigElement multipartConfigElement;

    @Override
    public ApiResult<String> upload(MultipartFile file, Integer pathType) {
        if(file == null){
            return ApiResult.failureMsg("文件不存在", ApiResultEnum.VALIDATION_FAILURE);
        }
        //获取文件后缀名
        String suffix = Objects.requireNonNull(file.getOriginalFilename())
                .substring(file.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
        //判断是否符合文件格式
        if(!"jpg".equals(suffix) && !"png".equals(suffix) && !"mp4".equals(suffix) && !"pdf".equals(suffix) && !"jpeg".equals(suffix)) {
            return ApiResult.failureMsg("非法类型", ApiResultEnum.VALIDATION_FAILURE);
        }
        log.info("文件大小{}", file.getSize());
        //对文件大小做校验，不得超过5mb
        //  若为图片不超过5M
        int size = 5;
        if ("mp4".equals(suffix)) {
            //  若为视频文件，大小不超过50M
            size = 50;
        }
        if (file.getSize() > size * 1024 * 1024) {
            throw new DocException("文件大小超出限制，不得大于"+ size +"M");
        }
        String filePath = upload(file, file.getOriginalFilename(), FilePathEnum.getNameByValue(pathType));
        return ApiResult.success(filePath);
    }

    @Override
    public void download(String filePath, String fileName, HttpServletResponse response) {
        //拼接完整路径
        String path = generateAbsoluteFilePath(filePath);
        try {
            InputStream inputStream = new FileInputStream(path);
            response.reset();
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            response.addHeader(HttpHeaders.CONTENT_DISPOSITION
                    , "attachment; filename=" + URLEncoder.encode(fileName, "utf-8"));
            ServletOutputStream outputStream = response.getOutputStream();
            byte[] b = new byte[10240];
            int len;
            while ((len = inputStream.read(b)) > 0) {
                outputStream.write(b, 0 ,len);
            }
            inputStream.close();
        } catch (Exception e) {
            log.error("文件下载失败", e);
        }
    }

    /**
     * 上传文件
     * @param multipartFile 文件流
     * @param fileName  文件名
     * @param businessName  业务名
     * @return
     */
    public String upload(MultipartFile multipartFile, String fileName, String businessName) {
        // 相对路径
        String filePath;
        try {
            filePath = generateFilePath(fileName, businessName);
            File file = new File(generateAbsoluteFilePath(filePath));
            if(!file.getParentFile().exists()){
                file.getParentFile().mkdirs();
            }
            multipartFile.transferTo(file);
            log.info("上传本地成功。");
        } catch (IOException e) {
            throw new DocException("上传本地失败: " + e.getMessage());
        }
        return filePath;
    }

    /**
     * 生成相对文件路径
     * @param fileName      文件名
     * @param businessName  业务名
     * @return  文件路径
     */
    protected String generateFilePath(String fileName, String businessName) {
        int randomLength = 4;
        //拼接文件路径
        StringBuilder filePath;
        filePath = new StringBuilder();
        filePath.append("/").append(businessName).append("/")
                .append(DateUtils.formatDate(new Date(), "yyyy-MM"))
                .append("/").append(DateUtils.getDate("yyyyMMddHHmmss"))
                .append(String.format("%0" + randomLength + "d", (int) (Math.random() * Math.pow(10, randomLength))))
                .append("_").append(fileName);
        return filePath.toString();
    }

    /**
     * 生成绝对文件路径
     * @param filePath  相对文件路径
     * @return
     */
    protected String generateAbsoluteFilePath(String filePath) {
        return multipartConfigElement.getLocation() + filePath;
    }

}
