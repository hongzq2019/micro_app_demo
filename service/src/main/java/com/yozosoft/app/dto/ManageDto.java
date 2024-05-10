package com.yozosoft.app.dto;

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

    @NotBlank
    private String collectId;

    @NotBlank
    @Length(max = 30)
    private String projectName;

    @NotBlank
    @Length(max = 30)
    private String projectNumber;

    private int maxNumber;

}
