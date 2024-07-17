package com.yozosoft.app.config.mate;

import mybatis.mate.databind.ISensitiveStrategy;
import mybatis.mate.strategy.SensitiveStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Function;

/**
 * 数据脱敏配置类
 *
 * @author hongzhiqiang
 * @ClassName SensitiveStrategy
 * @description: data sensitive strategy
 * @date 2024-07-17 16:18
 * @version: 1.0
 */
@Configuration
public class SensitiveStrategyConfig {

    @Bean
    public ISensitiveStrategy sensitiveStrategy() {
        SensitiveStrategy strategy = new SensitiveStrategy();
        strategy.addStrategy("projectNumber", projectNumberStrategy);
        strategy.addStrategy("IDCard", IDCardStrategy);
        return strategy;
    }

    /**
     * 项目编号脱敏策略
     */
    private final Function<String, String> projectNumberStrategy = value -> {
        if (value.length() > 4) {
            return value.substring(0, 4) + "****" + value.substring(value.length() - 4);
        }
        return value;
    };

    /**
     * 身份证号脱敏策略
     */
    private final Function<String, String> IDCardStrategy = value -> {
        if (value.length() == 15 || value.length() == 18) {
            return value.substring(0, 2) + "****" + value.substring(value.length() - 4);
        }
        return value;
    };
}
