package com.yozosoft.app.config.constant;

/**
 * system normal constants
 *
 * @author hongzhiqiang
 * @ClassName SystemConstants
 * @description: all services include constants , allow single service having self constant
 * @date 2024-04-23 12:15
 * @version: 1.0
 */
public class SystemConstants {

    public static final String CREATE_TIME = "createTime";

    public static final String UPDATE_TIME = "updateTime";

    public static final String SYSTEM_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static class MsgStr{
        public static final String NOT_BLANK = "长度不能为空!";
        public static final String MAX_10 = "长度不能超过10!";
        public static final String MAX_20 = "长度不能超过20!";
        public static final String MAX_30 = "长度不能超过30!";
        public static final String MAX_50 = "长度不能超过50!";
        public static final String MAX_100 = "长度不能超过100!";
        public static final String MAX_200 = "长度不能超过200!";
        public static final String MAX_300 = "长度不能超过300!";
        public static final String MAX_500 = "长度不能超过500!";
    }

    // 数字
    public static class Number {
        public static final Integer YES = 1;
        public static final Integer NO = 0;
        public static final String YES_STR = "1";
        public static final String YES_NO = "0";
    }

    // 符号
    public static class Symbol {
        public static final String DOT = ".";
    }

}
