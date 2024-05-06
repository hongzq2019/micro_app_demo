package com.yozosoft.app.manage.controller;

import com.yozosoft.app.manage.constant.ElasticConstant;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;

/**
 * @author hongzhiqiang
 * @ClassName ElasticSearchBaseController
 * @description:
 * @date 2023-11-23 15:16
 * @version: 1.0
 */
public class ElasticSearchBaseController {

    /**
     * 设置高亮
     *
     * @return HighlightBuilder
     */
    public HighlightBuilder getHighLightBuilder() {
        HighlightBuilder highlightBuilder = new HighlightBuilder();
        highlightBuilder.field(new HighlightBuilder.Field(ElasticConstant.highLightFiled));
        highlightBuilder.preTags(ElasticConstant.preTag);
        highlightBuilder.postTags(ElasticConstant.postTag);
        highlightBuilder.requireFieldMatch(true);
        return highlightBuilder;
    }
}
