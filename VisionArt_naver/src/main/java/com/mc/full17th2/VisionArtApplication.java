package com.mc.full17th2;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
//@ComponentScan(basePackages = {"config", "controller", "dao", "dto", "service"})

@MapperScan("com.mc.full17th2.dao")
@SpringBootApplication
public class VisionArtApplication {

	public static void main(String[] args) {
		SpringApplication.run(VisionArtApplication.class, args);
	}

}
