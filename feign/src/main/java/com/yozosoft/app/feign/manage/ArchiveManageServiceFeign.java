package com.yozosoft.app.feign.manage;

import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.dto.ManageDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

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
    Result getManageList(@RequestParam("collectId") String collectId);

    @PostMapping("/archiveManageController/addManage")
    Result saveMangeConfig(@RequestBody ManageDto manageDto);

}
