package com.hncy58.bigdata.gateway;

import javax.servlet.Filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.hncy58.bigdata.gateway.filter.LocalRequestFilter;

@Configuration
@ServletComponentScan
public class ServletInitializeConfiguration extends SpringBootServletInitializer {

	@Autowired
	private LocalRequestFilter localRequestFilter;

    @Bean
    public FilterRegistrationBean contextFilterRegistrationBean() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(requestFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setName("localRequestFilter");
        registrationBean.setOrder(1);
        return registrationBean;
    }
    
    /**
     * 实例化本地请求过滤器
     * @return
     */
    @Bean
    public Filter requestFilter() {
        return localRequestFilter;
    }

}
