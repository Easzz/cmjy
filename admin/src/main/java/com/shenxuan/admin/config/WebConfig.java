package com.shenxuan.admin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * WebMvc配置
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/static/img/")
		;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//注册自定义拦截器，添加拦截路径和排除拦截路径
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/**").excludePathPatterns("/login")
				.excludePathPatterns("/static/**")
				.excludePathPatterns("/img/**")
		;
		registry.addInterceptor(new PermissionInterceptor())
				.addPathPatterns("/**").excludePathPatterns("/login")
				.excludePathPatterns("/static/**")
				.excludePathPatterns("/img/**")
		;
	}
	@Override
	public void configurePathMatch(PathMatchConfigurer configurer) {
		configurer.setUseSuffixPatternMatch(true);
	}
}
