package com.yozosoft.app.entity.manage;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yozosoft.app.config.constant.SystemConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author hongzhiqiang
 * @ClassName ManageEntity
 * @description:
 * @date 2024-05-06 16:52
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("ARCHIVE_MANAGE")
public class ManageEntity {

    @TableId(type = IdType.ASSIGN_UUID)
    private String id;

    private String collectId;

    private String projectName;

    private String projectNumber;

    private int maxNumber;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.INSERT, value = "CREATE_TIME")
    private Date createTime;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.UPDATE, value = "UPDATE_TIME")
    private Date updateTime;

}
