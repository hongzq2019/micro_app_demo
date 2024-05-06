package com.yozosoft.app.collect.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yozosoft.app.entity.collect.CollectEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectDao
 * @description:
 * @date 2024-04-22 16:54
 * @version: 1.0
 */
@Mapper
public interface ArchiveCollectMapper extends BaseMapper<CollectEntity> {

    Integer countByYear(String year);

}
