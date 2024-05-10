package com.yozosoft.app.service.collect;

import com.yozosoft.app.dto.CollectDto;
import com.yozosoft.app.config.result.Result;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectService
 * @description:
 * @date 2023-08-11 15:36
 * @version: 1.0
 */
public interface ArchiveCollectService{

    Result getArchiveCollectList(String collectId);

    Result addArchiveCollect(CollectDto collectDto);

    Result getArchiveCollectConfig(String collectId, String projectName);

}
