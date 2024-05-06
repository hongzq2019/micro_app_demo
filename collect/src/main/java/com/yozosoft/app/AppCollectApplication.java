package com.yozosoft.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author hongzhiqiang
 * @ClassName CollectApplication
 * @description:
 * @date 2023-08-07 15:42
 * @version: 1.0
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@MapperScan(basePackages = "com.yozosoft")
public class AppCollectApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppCollectApplication.class, args);
    }
}
