package com.hncy58.bigdata.gateway.cfg;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger接口文档生成类
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:03:02
 */
@Configuration
@EnableSwagger2
public class Swagger2Configuration {

	/**
	 * 通过 createRestApi函数来构建一个DocketBean 函数名,可以随意命名,喜欢什么命名就什么命名
	 */
	@Bean
	public Docket createRestApi() {
		return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo())// 调用apiInfo方法,创建一个ApiInfo实例,里面是展示在文档页面信息内容
				.select()
				// 控制暴露出去的路径下的实例
				// 如果某个接口不想暴露,可以使用以下注解
				// @ApiIgnore 这样,该接口就不会暴露在 swagger2 的页面下
				.apis(RequestHandlerSelectors.basePackage("com.hncy58.bigdata.gateway.controller")).paths(PathSelectors.any()).build();
	}

	// 构建 api文档的详细信息函数
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
				// 页面标题
				.title("使用 Swagger2 构建RESTful API")
				// 创建人
				.contact(new Contact("hncy58", "http://www.hncy58.com", "abc@hncy58,com"))
				// 版本号
				.version("1.0")
				// 描述
				.description("API 描述").build();
	}
}
