package com.hncy58.bigdata.gateway;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.hncy58.bigdata.gateway.util.SnowflakeIdWorker;

/**
 * 网关启动类
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:01:40
 */
@EnableZuulProxy
@SpringBootApplication(scanBasePackages = "com.hncy58.bigdata.gateway")
@MapperScan(basePackages = { "com.hncy58.bigdata.gateway.mapper" })
@EnableTransactionManagement
public class BigdataGatewayApplication {

	/**
	 * 工作节点ID
	 */
	@Value("${cluster.workId:1}")
	private int workerId;

	/**
	 * 数据中心ID
	 */
	@Value("${cluster.dataCenterId:1}")
	private int datacenterId;

	public static void main(String[] args) {
		SpringApplication.run(BigdataGatewayApplication.class, args);
	}

	@Bean
	public SnowflakeIdWorker initTokenWorker() {
		return new SnowflakeIdWorker(workerId, datacenterId);
	}
}
