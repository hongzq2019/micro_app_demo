package com.yozosoft.app.config.exception;

/**
 * @author hongzhiqiang
 * @ClassName AppException
 * @description:
 * @date 2024-05-09 18:06
 * @version: 1.0
 */
public class AppException extends RuntimeException{

    public AppException(){

    }

    public AppException(String msg){
        super(msg);
    }

    public AppException(Exception e, String msg){
        super(msg, e);
    }

}
