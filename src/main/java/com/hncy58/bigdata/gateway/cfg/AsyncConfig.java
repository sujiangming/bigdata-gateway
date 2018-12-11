package com.hncy58.bigdata.gateway.cfg;

import java.util.concurrent.Executor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 * 
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年12月11日 上午11:23:33
 *
 */
@Configuration
@EnableAsync
public class AsyncConfig {

	/*
	 * 此处成员变量应该使用@Value从配置中读取
	 */
	private int corePoolSize = 10;
	private int maxPoolSize = 200;
	private int queueCapacity = 10;

	@Bean
	public Executor taskExecutor() {
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		executor.setCorePoolSize(corePoolSize);
		executor.setMaxPoolSize(maxPoolSize);
		executor.setQueueCapacity(queueCapacity);
		executor.initialize();
		return executor;
	}
}