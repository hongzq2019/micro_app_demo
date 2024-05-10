package com.yozosoft.app.config.thread;

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

    private final AtomicInteger theadSuffixId = new AtomicInteger(0);

    private final String name;

    private final boolean isDaemon;

    CommonThreadFactory(String threadSuffixName, boolean isDaemon){
        if (StringUtils.hasText(threadSuffixName)){
            threadSuffixName += ".";
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
