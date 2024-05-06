package com.yozosoft.app.collect.controller;

import com.yozosoft.app.collect.impl.ArchiveCollectServiceImpl;
import com.yozosoft.app.dto.CollectDto;
import com.yozosoft.app.config.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectController
 * @description:
 * @date 2023-08-07 15:58
 * @version: 1.0
 */
@Slf4j
@RestController
@RequestMapping(value = "/archiveCollectController")
public class ArchiveCollectController {

    @Autowired
    private ArchiveCollectServiceImpl archiveCollectService;

    @PostMapping(value = "/addArchiveCollect")
    public Result addArchiveCollect(@RequestBody CollectDto collectDto){
        return archiveCollectService.addArchiveCollect(collectDto);
    }

    @GetMapping(value = "/getArchiveCollectList")
    public Result getArchiveCollectList() {
        return archiveCollectService.getArchiveCollectList();
    }

}
