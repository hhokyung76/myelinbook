package com.myelinbook.server.vertx;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import io.vertx.core.Vertx;

@SpringBootApplication
public class MyelinBookVertxApplication implements CommandLineRunner {
 
    private final Logger logger = LoggerFactory.getLogger(MyelinBookVertxApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(MyelinBookVertxApplication.class, args);
	}
	
	public void startVertx() {
		
		
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		Vertx vertx = Vertx.vertx();
		MyelinBookVerticle bookVerticle = new MyelinBookVerticle(); 
	    vertx.deployVerticle(bookVerticle);
	    
	}
}
