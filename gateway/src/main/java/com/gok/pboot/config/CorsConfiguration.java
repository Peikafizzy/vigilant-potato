package com.gok.pboot.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * 跨域配置
 * @author funcas
 * @version 1.0
 * @date 2018年10月30日
 */
@Configuration
@ConfigurationProperties(prefix="cors")
public class CorsConfiguration implements WebMvcConfigurer{

    private List<String> allowedOrigins;

    public List<String> getAllowedOrigins() {
        return allowedOrigins;
    }

    public void setAllowedOrigins(List<String> allowedOrigins) {
        this.allowedOrigins = allowedOrigins;
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(this.allowedOrigins.toArray(new String[this.allowedOrigins.size()]))
                .allowedMethods("GET", "POST", "DELETE","OPTIONS")
                .allowedHeaders("authorization","Authorization","Content-Type")
                .exposedHeaders("authorization","Authorization")
                .allowCredentials(true).maxAge(3600);
    }

}
