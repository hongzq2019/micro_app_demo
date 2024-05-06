package com.yozosoft.app.config.result;

import java.util.Map;

/**
 * @author hongzhiqiang
 * @ClassName Result
 * @description:
 * @date 2023-08-14 13:59
 * @version: 1.0
 */
public class Result {

    private boolean code;

    private String msg;

    private Object data;

    private Map map;

    public boolean isCode() {
        return code;
    }

    public Map getMap() {
        return map;
    }

    public Result setMap(Map map) {
        this.map = map;
        return this;
    }

    public static String getSUCCESSMSG() {
        return SUCCESSMSG;
    }

    public static String getERRORMSG() {
        return ERRORMSG;
    }

    static final private String SUCCESSMSG = "操作成功！";
    static final private String ERRORMSG = "操作失败！";

    public Result() {
        super();
    }

    public Result(ResultCode resultCode, String message, Object data) {
        this.code = resultCode.getCode();
        this.msg = message;
        this.data = data;
    }

    public Result(boolean code, String msg, Map map) {
        this.code = code;
        this.msg = msg;
        this.map = map;
    }


    public Result(boolean code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(ResultCode resultCode, Object data) {
        this.code = resultCode.getCode();
        if (this.code) {
            this.msg = this.SUCCESSMSG;
        } else {
            if (data == null || "".equals(data)) {
                this.msg = this.ERRORMSG;
            } else {
                this.msg = (String) data;
            }
        }
        this.data = data;
    }

    public Result(Map map, Object data, ResultCode resultCode) {
        this.code = resultCode.getCode();
        if (this.code) {
            this.msg = this.SUCCESSMSG;
        } else {
            if (data == null || "".equals(data)) {
                this.msg = this.ERRORMSG;
            } else {
                this.msg = (String) data;
            }
        }
        this.data = data;
        this.map = map;
    }

    public boolean getCode() {
        return code;
    }

    public void setCode(boolean code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static Result success(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        result.setCode(true);
        return result;
    }
    public static Result success() {
        Result result = new Result();
        result.setMsg(SUCCESSMSG);
        result.setCode(true);
        return result;
    }
    public static Result success(Object data) {
        Result result = new Result();
        result.setMsg(SUCCESSMSG);
        result.setCode(true);
        result.setData(data);
        return result;
    }

    public static Result failed(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        result.setCode(false);
        return result;
    }

    public static Result failed(Object data) {
        Result result = new Result();
        result.setMsg(ERRORMSG);
        result.setCode(false);
        result.setData(data);
        return result;
    }

    public static Result failed(String msg, Object data) {
        Result result = new Result();
        result.setMsg(msg);
        result.setCode(false);
        result.setData(data);
        return result;
    }
}
