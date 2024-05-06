package com.yozosoft.app.gateway.route;

import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.config.annotation.NacosConfigListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.event.RefreshRoutesEvent;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionWriter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;

/**
 * @author hongzhiqiang
 * @ClassName NacosDynamicRouteService
 * @description: gateWay 动态配置路由
 * @date 2023-08-03 17:27
 * @version: 1.0
 */
@Component
@Slf4j
public class NacosDynamicRouteService implements ApplicationContextAware {

    @Autowired
    private RouteDefinitionWriter routeDefinitionWriter;

    private ApplicationEventPublisher applicationEventPublisher;

    private static List<String> routeIds = new ArrayList<String>();

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationEventPublisher = applicationContext;
    }

    @NacosConfigListener(dataId = "gateway.yaml", groupId = "prod")
    public void routeConfigListener(String configInfo){
        // 清空路由
        clearRoute();
        List<RouteDefinition> gateWayRouteDefinitions = JSON.parseArray(configInfo, RouteDefinition.class);
        for (RouteDefinition routeDefinition : gateWayRouteDefinitions){
            // 添加路由
            addRoute(routeDefinition);
        }
        // 路由发布
        publish();
    }

    /**
     * 清空路由
     */
    private void clearRoute(){
        for(String s : routeIds){
            routeDefinitionWriter.delete(Mono.just(s)).subscribe();
        }
    }

    /**
     * 添加路由
     * @param routeDefinition
     */
    private void addRoute(RouteDefinition routeDefinition){
        routeDefinitionWriter.save(Mono.just(routeDefinition)).subscribe();
        routeIds.add(routeDefinition.getId());
    }

    private void publish(){
        this.applicationEventPublisher.publishEvent(new RefreshRoutesEvent(this.routeDefinitionWriter));
    }

}
