package com.yozosoft.app.manage.controller;

import com.alibaba.fastjson.JSONObject;
import com.yozosoft.app.manage.constant.ElasticConstant;
import com.yozosoft.app.config.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.core.CountRequest;
import org.elasticsearch.client.core.CountResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hongzhiqiang
 * @ClassName ElasticSearchController
 * @description:
 * @date 2023-11-23 10:50
 * @version: 1.0
 */
@RestController
@RequestMapping(value = "/elasticSearchController")
@RefreshScope
@Slf4j
public class ElasticSearchController extends ElasticSearchBaseController {

    @Resource
    private RestHighLevelClient restHighLevelClient;

    @PostMapping(value = "/getList")
    public Result getList(@RequestBody JSONObject requestBody) throws Exception {

        String indices = requestBody.getString("indices");
        int pageNum = requestBody.getInteger("pageNum");
        int pageSize = requestBody.getInteger("pageSize");
        GetIndexRequest existsRequest = new GetIndexRequest(indices);
        boolean exists = restHighLevelClient.indices().exists(existsRequest, RequestOptions.DEFAULT);
        if (!exists){
            throw new Exception("索引不存在");
        }
        SearchRequest searchRequest = new SearchRequest(indices);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

        // 设置查询字段
        searchSourceBuilder.fetchSource(new String[]{"TM", "DH", "ND", "CREATE_TIME","FLMC"}, new String[]{});

        // 设置分页
        int from = (pageNum - 1) * pageSize;
        searchSourceBuilder.from(from);
        searchSourceBuilder.size(pageSize);

        // 高级查询
        BoolQueryBuilder lastBuilder = QueryBuilders.boolQuery();
        //boolQueryBuilder.must(QueryBuilders.matchQuery("TM", "测").operator(Operator.AND).minimumShouldMatch("75"));
        //boolQueryBuilder.must(QueryBuilders.termsQuery("TM", "测试", "测", "萌"));
        //BoolQueryBuilder numberBoolQuery = new BoolQueryBuilder();
        //numberBoolQuery.must(QueryBuilders.termQuery("DH.keyword","WS-CSQZ-2023-CSB-CSYL-D30-00003"));
        //numberBoolQuery.should(QueryBuilders.matchQuery("ND","2023"));
        //boolQueryBuilder.must(numberBoolQuery);
        BoolQueryBuilder mustQueryBuilder = QueryBuilders.boolQuery();
        mustQueryBuilder.must(QueryBuilders.matchQuery("FLMC","测"));

        BoolQueryBuilder shouldQueryBuilder = QueryBuilders.boolQuery();
        shouldQueryBuilder.should(QueryBuilders.termsQuery("FLMC", "试用"));

        lastBuilder.should(mustQueryBuilder);
        lastBuilder.should(shouldQueryBuilder);

        searchSourceBuilder.query(lastBuilder);

        // 设置排序
        searchSourceBuilder.sort(ElasticConstant.oderFiled, SortOrder.DESC);

        // 字段高亮
        searchSourceBuilder.highlighter(getHighLightBuilder());

        // ES 查询
        searchRequest.source(searchSourceBuilder);
        SearchResponse search = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);

        // 单条件数量
        CountRequest countRequest = new CountRequest(indices);
        countRequest.query(lastBuilder);
        CountResponse count = restHighLevelClient.count(countRequest, RequestOptions.DEFAULT);
        long countSize = count.getCount();
        log.info("查询总数量: {}", countSize);

        log.info("DSL:{}", searchRequest.toString());
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> list = new ArrayList<>();
        for (SearchHit hit : search.getHits()) {
            Map<String, Object> sourceMap = hit.getSourceAsMap();
            Map<String, HighlightField> highlightFields = hit.getHighlightFields();
            HighlightField title = highlightFields.get(ElasticConstant.highLightFiled);
            if (null != title) {
                Text[] fragments = title.getFragments();
                StringBuilder highLightNames = new StringBuilder();
                for (Text text : fragments) {
                    highLightNames.append(text);
                }
                sourceMap.put(ElasticConstant.highLightFiled, highLightNames.toString());
            }
            list.add(hit.getSourceAsMap());
        }
        result.put("total", String.valueOf(search.getHits().getTotalHits().value));
        result.put("list", list);
        return Result.success(result);
    }

}
