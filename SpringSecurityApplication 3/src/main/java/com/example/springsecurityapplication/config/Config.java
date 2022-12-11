package com.example.springsecurityapplication.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Locale;

@Configuration
public class Config implements WebMvcConfigurer {
    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // ** - какой либо текст
        String slash = System.getProperty("os.name").toLowerCase().contains("windows") ? "" : "/";
        uploadPath = uploadPath.replace('\\', '/');
        registry.addResourceHandler("/img/**")
                .addResourceLocations("file:/" + slash + uploadPath + "/");
    }
}
