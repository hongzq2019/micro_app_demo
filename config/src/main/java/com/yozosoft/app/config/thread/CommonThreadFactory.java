package com.yozosoft.app.config.thread;

import com.yozosoft.app.config.constant.SystemConstants;
import org.springframework.util.StringUtils;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author hongzhiqiang
 * @ClassName CommonThreadFactory
 * @description:
 * @date 2024-05-10 17:42
 * @version: 1.0
 */
public class CommonThreadFactory implements ThreadFactory {

    // 自增 Number
    private final AtomicInteger theadSuffixId = new AtomicInteger(0);

    // 线程名称前缀
    private final String name;

    // 是否为守护线程
    private final boolean isDaemon;

    /**
     * 设置统一线程前缀
     *
     * @param threadSuffixName threadSuffixName
     */
    CommonThreadFactory(String threadSuffixName) {
        if (StringUtils.hasText(threadSuffixName)) {
            threadSuffixName += SystemConstants.Symbol.DOT;
        }
        this.name = threadSuffixName;
        this.isDaemon = false;
    }

    /**
     * 设置统一线程前缀 + 是否为守护线程
     *
     * @param threadSuffixName threadSuffixName
     * @param isDaemon         isDaemon
     */
    CommonThreadFactory(String threadSuffixName, boolean isDaemon) {
        if (StringUtils.hasText(threadSuffixName)) {
            threadSuffixName += SystemConstants.Symbol.DOT;
        }
        this.name = threadSuffixName;
        this.isDaemon = isDaemon;
    }

    @Override
    public Thread newThread(Runnable runnable) {
        String theadName = this.name + theadSuffixId;
        Thread thread = new Thread(runnable, theadName);
        thread.setDaemon(isDaemon);
        return thread;
    }
}
