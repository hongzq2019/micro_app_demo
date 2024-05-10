package com.yozosoft.app.service.manage;

import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.dto.ManageDto;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectService
 * @description:
 * @date 2023-08-11 15:36
 * @version: 1.0
 */
public interface ArchiveManageService {

    Result addManage(ManageDto manageDto);

    Result getManageList(String collectId);

}
