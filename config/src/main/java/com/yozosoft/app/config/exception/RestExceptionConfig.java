package com.yozosoft.app.config.exception;

import com.yozosoft.app.config.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author hongzhiqiang
 * @ClassName RestExceptionConfig
 * @description:
 * @date 2023-08-14 12:22
 * @version: 1.0
 */
@RestControllerAdvice
@Slf4j
public class RestExceptionConfig {

    @ExceptionHandler(value = {Exception.class})
    public Result getException(Exception e) {
        log.error("Exception cause {}", e.getMessage(), e);
        return Result.failed("系统开小差!");
    }

    @ExceptionHandler(value = {RuntimeException.class})
    public Result getRunTimeException(RuntimeException e) {
        log.error("RunTimeException cause {}", e.getMessage(), e);
        return Result.failed("系统开小差!");
    }
}
