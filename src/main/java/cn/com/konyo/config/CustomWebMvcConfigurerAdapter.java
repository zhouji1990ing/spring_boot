package cn.com.konyo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.com.konyo.core.controller.SessionHandlerInterceptor;

/**
 * file: CustomWebMvcConfigurerAdapter.java Created by jiaobuchong on 12/23/15.
 */
@Configuration
// 标注此文件为一个配置项，spring boot才会扫描到该配置。该注解类似于之前使用xml进行配置
public class CustomWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter {
    //拦截器配置
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration session = registry.addInterceptor(new SessionHandlerInterceptor());
        session.addPathPatterns("/**");
        session.excludePathPatterns("/");
        session.excludePathPatterns("/index/**");
        session.excludePathPatterns("/admin");
        session.excludePathPatterns("/admin/login");
        session.excludePathPatterns("/admin/doLogin");
        session.excludePathPatterns("/u/**");
    }
    
    //静态资源配置
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/favicon.ico")
                .addResourceLocations("/favicon.ico");
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/WEB-INF/resources/");
        registry.addResourceHandler("/ueditor/**")
                .addResourceLocations("/ueditor/").setCachePeriod(31556926);
        registry.addResourceHandler("/views/ftl/**")
                .addResourceLocations("/WEB-INF/views/ftl/");
    }
}