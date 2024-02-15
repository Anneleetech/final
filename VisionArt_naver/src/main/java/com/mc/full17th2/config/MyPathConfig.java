package com.mc.full17th2.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //servlet-context.xml 대신 현재 클래스 설정함.
public class MyPathConfig implements WebMvcConfigurer{

	 @Value("${museum.openapi.service-key}")
	    private String museumopenApiServiceKey;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/visionart/**").addResourceLocations("file:///usr/mydir/visionart/");
		registry.addResourceHandler("/attachment/**").addResourceLocations("file:///usr/mydir/visionart/attachment/");
	}
	//http://ip:port/visionart/파일명

}
