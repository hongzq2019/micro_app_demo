package com.yozosoft.app.dto;

import com.yozosoft.app.config.constant.SystemConstants;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * @author hongzhiqiang
 * @ClassName CollectDto
 * @description:
 * @date 2024-04-23 10:03
 * @version: 1.0
 */
@Data
public class CollectDto {

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String totalName;

    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    private String realName;

    @Min(value = 0)
    @Max(value = 9999)
    private int year;

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String projectName;

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String projectNumber;

}
