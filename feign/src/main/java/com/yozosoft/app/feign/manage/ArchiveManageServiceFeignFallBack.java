package com.yozosoft.app.feign.manage;

import com.yozosoft.app.service.manage.ArchiveManageService;
import org.springframework.stereotype.Service;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveManageServiceFallBack
 * @description:
 * @date 2023-08-14 17:00
 * @version: 1.0
 */
@Service
public class ArchiveManageServiceFeignFallBack implements ArchiveManageService {

    @Override
    public String getManageList() {
        return "系统开小差,管理";
    }
}
