package com.yozosoft.app.entity.collect;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yozosoft.app.config.constant.SystemConstants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author hongzhiqiang
 * @ClassName User
 * @description:
 * @date 2024-04-22 16:55
 * @version: 1.0
 */
@Data
@Builder
@TableName("archive_collect")
@AllArgsConstructor
@NoArgsConstructor
public class CollectEntity {

    @TableId(type = IdType.ASSIGN_UUID)
    private String id;

    private String totalName;

    private String realName;

    private int year;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.INSERT, value = "CREATE_TIME")
    private Date createTime;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.UPDATE, value = "UPDATE_TIME")
    private Date updateTime;
}
