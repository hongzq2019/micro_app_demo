package com.yozosoft.app.dto;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author hongzhiqiang
 * @ClassName CollectDto
 * @description:
 * @date 2024-04-23 10:03
 * @version: 1.0
 */
@Data
public class CollectDto {

    @NotBlank
    @Length(max = 30)
    private String totalName;

    @Length(max = 30)
    @NotBlank
    private String realName;

    @NotBlank
    @Length(min = 1, max = 4)
    private int year;

}
