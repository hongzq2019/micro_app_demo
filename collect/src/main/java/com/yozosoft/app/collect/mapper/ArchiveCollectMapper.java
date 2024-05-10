package com.yozosoft.app.collect.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yozosoft.app.entity.collect.CollectEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author hongzhiqiang
 * @ClassName ArchiveCollectDao
 * @description:
 * @date 2024-04-22 16:54
 * @version: 1.0
 */
@Mapper
public interface ArchiveCollectMapper extends BaseMapper<CollectEntity> {

    Integer countByYear(@Param("year") int year);

    List<Map<String, Object>> queryCollectConfig(@Param("collectId") String collectId,
                                                 @Param("projectName") String projectName);

}
