package com.yozosoft.app.feign.manage;

import com.yozosoft.app.config.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveManageService
 * @description:
 * @date 2023-08-07 16:02
 * @version: 1.0
 */
@FeignClient(value = "manage", fallback = ArchiveManageServiceFeignFallBack.class)
public interface ArchiveManageServiceFeign {

    @GetMapping("/archiveManageController/getManageList")
    Result getManageList();

}
