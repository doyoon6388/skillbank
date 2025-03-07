package com.skillbank.main.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Value("${upload}")
    private String upload;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 외부 폴더의 파일을 /file/** 경로로 서빙
        registry.addResourceHandler("/file/**")
                .addResourceLocations("file:" + upload);

        // 클래스패스 내 정적 리소스를 /resources/** 경로로 서빙
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("classpath:/static/");
    }
}
