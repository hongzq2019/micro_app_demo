package com.yozosoft.app.collect.impl;

import com.alibaba.nacos.common.utils.UuidUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yozosoft.app.collect.mapper.ArchiveCollectMapper;
import com.yozosoft.app.config.exception.AppException;
import com.yozosoft.app.config.result.Result;
import com.yozosoft.app.dto.CollectDto;
import com.yozosoft.app.dto.ManageDto;
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
import java.util.Map;

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

        Result manageListResult = archiveManageServiceFeign.getManageList(collectId);
        if (manageListResult.getCode()) {
            return Result.success(manageListResult.getData());
        }
        List<CollectEntity> collectEntities = baseMapper.selectList(new QueryWrapper<>());
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
    public Result addArchiveCollect(CollectDto collectDto){

        int i = collectMapper.countByYear(collectDto.getYear());
        if (i > 0) {
            return Result.failed("年度重复");
        }

        // 保存收集信息
        CollectEntity collectEntity = new CollectEntity();
        String id = UuidUtils.generateUuid();
        collectEntity.setId(id);
        BeanUtils.copyProperties(collectDto, collectEntity);
        baseMapper.insert(collectEntity);

        // 同步保存管理配置信息
        ManageDto manageDto = new ManageDto();
        manageDto.setCollectId(id);
        manageDto.setProjectName(collectDto.getProjectName());
        manageDto.setProjectNumber(collectDto.getProjectNumber());
        Result result = archiveManageServiceFeign.saveMangeConfig(manageDto);
        if (result.getCode()){
            throw new AppException("管理保存异常!");
        }

        return Result.success();
    }

    /**
     * 模糊查询配置
     *
     * @param collectId   collectId
     * @param projectName projectName
     * @return Result
     */
    @Override
    public Result getArchiveCollectConfig(String collectId, String projectName) {
        List<Map<String, Object>> list = collectMapper.queryCollectConfig(collectId, projectName);
        return Result.success(list);
    }

}
