package com.yozosoft.app.manage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author hongzhiqiang
 * @ClassName ClusterManageApplication
 * @description:
 * @date 2023-12-19 17:00
 * @version: 1.0
 */
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan(basePackages = "com.yozosoft")
@ComponentScan(basePackages = "com.yozosoft")
public class AppManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppManageApplication.class, args);
    }

}
