package com.yozosoft.app.manage.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.entity.manage.ManageEntity;
import com.yozosoft.app.manage.mapper.ArchiveManageMapper;
import com.yozosoft.app.service.manage.ArchiveManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveManageServiceImpl
 * @description:
 * @date 2024-05-06 17:00
 * @version: 1.0
 */
@Service
public class ArchiveManageServiceImpl extends ServiceImpl<ArchiveManageMapper, ManageEntity> implements ArchiveManageService {

    @Autowired
    private ArchiveManageMapper archiveManageMapper;

    /**
     * 获取配置类信息
     *
     * @param collectId collectId
     * @return Result
     */
    @Override
    public Result getManageList(String collectId) {

        QueryWrapper<ManageEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ManageEntity::getCollectId, collectId);
        List<ManageEntity> resultList = archiveManageMapper.selectList(queryWrapper);

        return Result.success(resultList);
    }
}
