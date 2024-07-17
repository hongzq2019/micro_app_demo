package com.yozosoft.app.manage.init;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yozosoft.app.config.constant.SystemConstants;
import com.yozosoft.app.config.mate.DataDicEntity;
import com.yozosoft.app.manage.impl.DataDicServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 字典初始化启动器
 *
 * @author hongzhiqiang
 * @ClassName DicInitRunner
 * @description:
 * @date 2024-07-17 12:12
 * @version: 1.0
 */
@Slf4j
@Component
public class DicInitRunner implements ApplicationRunner {

    @Autowired
    private DataDicServiceImpl dataDicService;

    @Resource
    private RedisTemplate redisTemplate;

    public DicInitRunner() {

    }

    /**
     * 在应用程序启动时运行的函数，用于初始化字典数据到Redis。
     *
     * @param args 应用程序启动参数，本方法中未使用。
     */
    @Override
    public void run(ApplicationArguments args) {
        log.info("初始化字典,开始加载 loading start");
        // 创建查询包装器，用于查询未删除的字典数据
        QueryWrapper<DataDicEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(DataDicEntity::getIsDelete, 0);
        // 查询所有未删除的字典数据
        List<DataDicEntity> dataDicEntityList = dataDicService.list(queryWrapper);
        // 根据字典类型对字典数据进行分组
        Map<String, List<DataDicEntity>> collect = dataDicEntityList.stream().collect(Collectors.groupingBy(DataDicEntity::getDicType));
        // 将分组后的字典数据逐个存入Redis的哈希表中
        for (String key : collect.keySet()) {
            redisTemplate.opsForHash().put(SystemConstants.SYSTEM_DIC, key, collect.get(key));
        }
        log.info("初始化字典,加载完成 loading finish");
    }

}