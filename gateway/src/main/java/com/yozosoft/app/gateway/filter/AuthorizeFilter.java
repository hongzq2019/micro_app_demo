package com.yozosoft.app.gateway.filter;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.Map;

/**
 * @author hongzhiqiang
 * @ClassName AuthorizeFilter 全局统一 Filter
 * @description:
 * @date 2023-08-03 18:12
 * @version: 1.0
 */
@Slf4j
@Component
@RefreshScope
public class AuthorizeFilter implements Ordered, GlobalFilter {

    private static final String TOKEN = "token";

    private static final String CONTENT_TYPE = "Content-Type";

    private static final String CONTENT_TYPE_VALUE = "application/json;charset=UTF-8";

    private static final String MULTI_FORM_DATA = "multi_form_data";

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        ServerHttpRequest request = exchange.getRequest();
        // 设置响应头
        ServerHttpResponse response = exchange.getResponse();
        response.getHeaders().add(CONTENT_TYPE, CONTENT_TYPE_VALUE);
        // 获取访问路径
        String path = exchange.getRequest().getPath().pathWithinApplication().value();
        HttpHeaders headers = request.getHeaders();
        String contentType = headers.getFirst(CONTENT_TYPE);
        log.info("请求地址: {} 全局统一拦截Header:{} 请求参数:{}", path, headers, request.getBody());
        // 文件上传放行
        if (StringUtils.isNotBlank(contentType) && contentType.contains(MULTI_FORM_DATA)) {
            return chain.filter(exchange);
        }
        // 未登录不放行
        if (headers.containsKey(TOKEN)) {
            return chain.filter(exchange);
        } else {
            Map<String, Object> resultMap = new HashMap<>(2);
            resultMap.put("code", false);
            resultMap.put("msg", "请先登录!");
            DataBuffer buffer = response.bufferFactory().wrap(JSON.toJSONBytes(resultMap));
            return response.writeWith(Mono.just(buffer));
        }
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE;
    }
}
