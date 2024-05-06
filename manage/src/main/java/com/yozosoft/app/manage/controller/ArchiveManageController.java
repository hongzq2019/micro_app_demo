package com.yozosoft.app.manage.controller;

import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.entity.manage.ManageEntity;
import com.yozosoft.app.manage.impl.ArchiveManageServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

    @Autowired
    private ArchiveManageServiceImpl archiveManageService;

    /**
     * 获取配置
     *
     * @param collectId collectId
     * @return Result
     */
    @GetMapping(value = "/getManageList")
    public Result getManageList(@RequestParam("collectId") String collectId) {
        Result result = archiveManageService.getManageList(collectId);
        if (result.getCode()) {
            List<ManageEntity> resultList = (List<ManageEntity>) result.getData();
            return Result.success(resultList);
        }
        return Result.failed("操作失败!");
    }

}
