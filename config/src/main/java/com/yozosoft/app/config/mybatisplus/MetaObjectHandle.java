package com.yozosoft.app.config.mybatisplus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.yozosoft.app.config.constant.SystemConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 元数据默认值
 *
 * @author hongzhiqiang
 * @ClassName MetaObjectHandle
 * @description: while insert or update , some metaObject could be changing
 * @date 2024-04-23 12:14
 * @version: 1.0
 */
@Component
@Slf4j
public class MetaObjectHandle implements MetaObjectHandler {

    /**
     * 插入时自动填充
     *
     * @param metaObject 元数据项
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName(SystemConstants.CREATE_TIME, new Date(), metaObject);
    }

    /**
     * 更新时自动填充
     *
     * @param metaObject 元数据项
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(SystemConstants.UPDATE_TIME, new Date(), metaObject);
    }
}
