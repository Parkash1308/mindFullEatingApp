package com.mindfulEatingApp.mindfulEatingApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
public class MindfulEatingAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(MindfulEatingAppApplication.class, args);
	}

}
