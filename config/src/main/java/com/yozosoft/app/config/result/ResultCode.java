package com.yozosoft.app.config.result;

public enum ResultCode {

    SUCCESS(true, "成功"), ERROR(false, "失败");

    ResultCode(boolean code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    private boolean code;

    private String describe;

    public boolean getCode() {
        return code;
    }

    public String getDescribe() {
        return describe;
    }
}
