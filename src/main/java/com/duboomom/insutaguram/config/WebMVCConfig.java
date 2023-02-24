package com.duboomom.insutaguram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.duboomom.insutaguram.common.FileManagerService;
import com.duboomom.insutaguram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") // 모든 페이지에 대하여 인터셉터를 거치도록
		.excludePathPatterns("/user/signout", "/static/**", "/images/**"); 
		// 로그아웃, static, image 파일 경로는 인터셉터 거치지 않도록 따로 빼기
	}
	
}
