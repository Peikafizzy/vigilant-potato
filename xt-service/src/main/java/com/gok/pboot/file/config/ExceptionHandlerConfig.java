package com.gok.pboot.file.config;

import com.gok.pboot.base.ApiResult;
import com.gok.pboot.enumeration.ApiResultEnum;
import com.gok.pboot.file.exception.DocException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;

@ControllerAdvice
@Slf4j
public class ExceptionHandlerConfig {

    @ExceptionHandler(DocException.class)
    @ResponseBody
    public ApiResult docExceptionHandler(DocException e){
        log.debug("文件服务异常", e);
        return ApiResult.builder().apiResultEnum(ApiResultEnum.SERVICE_EXCEPTION).retMessage(e.getMessage()).build();
    }

    @ExceptionHandler(MultipartException.class)
    @ResponseBody
    public ApiResult multipartExceptionHandler(MultipartException e){
        log.debug("文件上传服务异常", e);
        return ApiResult.builder().apiResultEnum(ApiResultEnum.VALIDATION_FAILURE).retMessage(e.getMessage()).build();
    }

}
