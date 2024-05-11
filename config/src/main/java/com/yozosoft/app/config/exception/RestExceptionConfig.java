package com.yozosoft.app.config.exception;

import com.yozosoft.app.config.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    /**
     * 系统级异常
     *
     * @param e Exception、RuntimeException
     * @return Result
     */
    @ExceptionHandler(value = {Exception.class, RuntimeException.class})
    public Result getException(Exception e) {
        log.error("Exception cause {}", e.getMessage(), e);
        return Result.failed("系统开小差!");
    }

    /**
     * 自定义异常
     *
     * @param appException AppException
     * @return Result
     */
    @ExceptionHandler(value = AppException.class)
    public Result getAppException(AppException appException) {
        return Result.failed(appException.getMessage());
    }

    /**
     * 参数校验异常
     *
     * @param exception MethodArgumentNotValidException
     * @return Result
     */
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Result getMethodArgumentNotValidException(MethodArgumentNotValidException exception) {
        List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
        Map<String, String> collect = fieldErrors.stream().
                collect(Collectors.toMap(FieldError::getField, DefaultMessageSourceResolvable::getDefaultMessage));
        return Result.failed(collect);

    }
}
