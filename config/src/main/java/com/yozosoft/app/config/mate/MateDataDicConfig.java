package com.yozosoft.app.config.mate;

import com.yozosoft.app.config.constant.SystemConstants;
import lombok.extern.slf4j.Slf4j;
import mybatis.mate.annotation.FieldBind;
import mybatis.mate.sets.IDataBind;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典自动双向绑定
 *
 * @author hongzhiqiang
 * @ClassName MateDataDic
 * @description:
 * @date 2024-07-17 9:40
 * @version: 1.0
 */
@Slf4j
@Component
public class MateDataDicConfig implements IDataBind {

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public String getNameByCode(FieldBind fieldBind, Object o) {

        // 获取字典类型
        String keyType = fieldBind.type();
        // 从redis获取字典
        Object dic = redisTemplate.opsForHash().get(SystemConstants.SYSTEM_DIC, keyType);
        if (dic instanceof List) {
            List<DataDicEntity> dicEntityList = (List<DataDicEntity>) dic;
            for (DataDicEntity dataDicEntity : dicEntityList) {
                if (dataDicEntity.getDicCode().equals(o)) {
                    return dataDicEntity.getDicName();
                }
            }
        }
        return null;
    }
}
