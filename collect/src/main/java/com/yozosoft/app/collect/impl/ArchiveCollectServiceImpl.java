package com.yozosoft.app.collect.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yozosoft.app.collect.mapper.ArchiveCollectMapper;
import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.dto.CollectDto;
import com.yozosoft.app.entity.collect.CollectEntity;
import com.yozosoft.app.feign.manage.ArchiveManageServiceFeign;
import com.yozosoft.app.service.collect.ArchiveCollectService;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectServiceImpl
 * @description:
 * @date 2023-08-11 15:37
 * @version: 1.0
 */
@Slf4j
@Service
@RefreshScope
public class ArchiveCollectServiceImpl extends ServiceImpl<ArchiveCollectMapper, CollectEntity> implements ArchiveCollectService {

    @Autowired
    private ArchiveManageServiceFeign archiveManageServiceFeign;

    @Autowired
    private ArchiveCollectMapper collectMapper;

    /**
     * 根据 collectId 获取配置
     *
     * @param collectId collectId
     * @return Result
     */
    @Override
    public Result getArchiveCollectList(String collectId) {
        List<CollectEntity> collectEntities = baseMapper.selectList(new QueryWrapper<>());
        Result manageListResult = archiveManageServiceFeign.getManageList(collectId);
        if (manageListResult.getCode()) {
            return Result.success(manageListResult.getData());
        }
        return Result.success(collectEntities);
    }

    /**
     * 添加收集
     *
     * @param collectDto collectDto
     * @return Result
     */
    @Override
    @GlobalTransactional(rollbackFor = {Exception.class, RuntimeException.class})
    public Result addArchiveCollect(CollectDto collectDto) {

        int i = collectMapper.countByYear(String.valueOf(collectDto.getYear()));
        if (i > 0) {
            return Result.failed("数据重复");
        }

        CollectEntity collectEntity = new CollectEntity();
        BeanUtils.copyProperties(collectDto, collectEntity);
        baseMapper.insert(collectEntity);
        return Result.success();
    }

}
