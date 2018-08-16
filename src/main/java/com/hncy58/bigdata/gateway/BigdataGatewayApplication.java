package com.hncy58.bigdata.gateway;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.hncy58.bigdata.gateway.filter.AuthorityFilter;
import com.hncy58.bigdata.gateway.util.SnowflakeIdWorker;

@EnableZuulProxy
@SpringBootApplication(scanBasePackages="com.hncy58.bigdata.gateway")
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
	
	@Autowired
	private AuthorityFilter authorityFilter;
	
	public static void main(String[] args) {
		SpringApplication.run(BigdataGatewayApplication.class, args);
	}
	
	@Bean
	public SnowflakeIdWorker initTokenWorker() {
		return new SnowflakeIdWorker(workerId, datacenterId);
	}
	
	@Bean
    public AuthorityFilter customZuulFilter(){
        return authorityFilter;
    }

}
