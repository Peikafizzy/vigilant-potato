package com.gok.pboot;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.gok.pboot.config.EnableCustomResourceServer;
import com.gok.pboot.redis.single.EnableRedisSingle;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;

import javax.servlet.MultipartConfigElement;
import java.io.File;

@EnableRedisSingle
@EnableDiscoveryClient
@SpringBootApplication
@EnableCustomResourceServer
@MapperScan(annotationClass = Mapper.class,
		basePackages = {"com.gok.pboot.mapper", "com.gok.pboot.**.mapper"})
public class XtServiceApplication {

	@Bean
	public PaginationInterceptor paginationInterceptor() {
		return new PaginationInterceptor();
	}


	public static void main(String[] args) {
		SpringApplication.run(XtServiceApplication.class, args);
	}

	/**
	 * 文件上传临时路径
	 */
	@Bean
	MultipartConfigElement multipartConfigElement(Environment environment) {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		String location = System.getProperty("user.dir") + environment.getProperty("spring.servlet.multipart.location");
		File tmpFile = new File(location);
		if (!tmpFile.exists()) {
			tmpFile.mkdirs();
		}
		factory.setLocation(location);
		return factory.createMultipartConfig();
	}

}
