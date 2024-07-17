package com.yozosoft.app.config.mate;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yozosoft.app.config.constant.SystemConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统数据字典
 *
 * @author hongzhiqiang
 * @ClassName DataDicEntity
 * @description: system data dictionary
 * @date 2024-07-17 9:55
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("data_dic")
public class DataDicEntity implements Serializable {

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    private String dicCode;

    private String dicName;

    private String dicDesc;

    private String dicType;

    private String dicOrder;

    private Integer isDelete;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.INSERT, value = "CREATE_TIME")
    private Date createTime;

    @JsonFormat(pattern = SystemConstants.SYSTEM_TIME_FORMAT)
    @TableField(fill = FieldFill.UPDATE, value = "UPDATE_TIME")
    private Date updateTime;

}
