package com.yozosoft.app.feign.collect;

import com.yozosoft.app.dto.CollectDto;
import com.yozosoft.app.service.collect.ArchiveCollectService;
import com.yozosoft.app.config.result.Result;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectServiceFeignFallBack
 * @description:
 * @date 2024-04-10 17:55
 * @version: 1.0
 */
public class ArchiveCollectServiceFeignFallBack implements ArchiveCollectService{

    @Override
    public Result getArchiveCollectList(String collectId) {
        return Result.failed("系统开小差,收集");
    }

    @Override
    public Result addArchiveCollect(CollectDto collectDto) {
        return Result.failed("系统开小差,收集");
    }

    @Override
    public Result getArchiveCollectConfig(String collectId, String projectName) {
        return Result.failed("系统开小差,收集");
    }
}
