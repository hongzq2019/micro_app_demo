package com.yozosoft.app.collect.controller;

import com.alibaba.fastjson.JSONObject;
import com.yozosoft.app.collect.impl.ArchiveCollectServiceImpl;
import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.dto.CollectDto;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectController
 * @description:
 * @date 2023-08-07 15:58
 * @version: 1.0
 */
@Slf4j
@Validated
@RestController
@RequestMapping(value = "/archiveCollectController")
public class ArchiveCollectController {

    @Autowired
    private ArchiveCollectServiceImpl archiveCollectService;

    /**
     * 收集信息
     *
     * @param collectDto collectDto
     * @return Result
     */
    @PostMapping(value = "/addArchiveCollect")
    public Result addArchiveCollect(@RequestBody CollectDto collectDto) {
        return archiveCollectService.addArchiveCollect(collectDto);
    }

    /**
     * 获取对应配置信息
     *
     * @param collectId collectId
     * @return Result
     */
    @GetMapping(value = "/getArchiveCollectList")
    public Result getArchiveCollectList(@NotEmpty(message = "参数不能为空!")
                                        @RequestParam String collectId) {
        return archiveCollectService.getArchiveCollectList(collectId);
    }

    /**
     * 模糊查询单个配置
     *
     * @param req JSONObject
     * @return Result
     */
    @PostMapping(value = "/getArchiveCollectConfig")
    public Result getArchiveCollectConfig(@RequestBody JSONObject req) {
        String collectId = req.getString("collectId");
        String projectName = req.getString("projectName");
        return archiveCollectService.getArchiveCollectConfig(collectId, projectName);
    }
}
