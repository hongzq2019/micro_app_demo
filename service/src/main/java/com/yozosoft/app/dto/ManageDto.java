package com.yozosoft.app.dto;

import com.yozosoft.app.config.constant.SystemConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author hongzhiqiang
 * @ClassName ManageDto
 * @description:
 * @date 2024-05-09 17:01
 * @version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ManageDto {

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String collectId;

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String projectName;

    @NotBlank(message = SystemConstants.MsgStr.NOT_BLANK)
    @Length(max = 30, message = SystemConstants.MsgStr.MAX_30)
    private String projectNumber;

    private int maxNumber;

}
