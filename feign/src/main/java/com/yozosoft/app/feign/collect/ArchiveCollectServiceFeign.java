package com.yozosoft.app.feign.collect;

import com.yozosoft.app.feign.manage.ArchiveManageServiceFeignFallBack;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectFeignService
 * @description:
 * @date 2024-04-10 17:51
 * @version: 1.0
 */
@FeignClient(value = "collect", fallback = ArchiveManageServiceFeignFallBack.class)
public interface ArchiveCollectServiceFeign {

    @GetMapping("/archiveCollectController/getArchiveCollectList")
    String getArchiveCollectList();

}
