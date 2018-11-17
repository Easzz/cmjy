package com.shenxuan.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan({"com.shenxuan.common.dao"})
@SpringBootApplication(exclude={DataSourceAutoConfiguration.class},scanBasePackages="com.shenxuan")
public class AdminApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(AdminApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(AdminApplication.class);
	}
/*
	@Bean
	public ServletRegistrationBean servletRegistrationBean(DispatcherServlet dispatcherServlet) {
		ServletRegistrationBean<DispatcherServlet> servletServletRegistrationBean = new ServletRegistrationBean<>(dispatcherServlet);
		servletServletRegistrationBean.addUrlMappings("/*");
		return servletServletRegistrationBean;
	}
*/

}
