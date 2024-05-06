package com.yozosoft.app.manage.controller;

import com.yozosoft.app.config.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveManageController
 * @description:
 * @date 2023-08-07 16:15
 * @version: 1.0
 */
@RestController
@RequestMapping(value = "/archiveManageController")
@RefreshScope
@Slf4j
public class ArchiveManageController {

    @Value("${size:20}")
    private String size;

    @GetMapping(value = "getManageList")
    public Result getManageList(){
        return Result.success("管理:"+size);
    }

}
