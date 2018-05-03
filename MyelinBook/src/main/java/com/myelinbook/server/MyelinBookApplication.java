package com.myelinbook.server;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.myelinbook.server.frontx.server.MyelinBookServerDaemon;

@SpringBootApplication
public class MyelinBookApplication implements CommandLineRunner {
	private static final org.slf4j.Logger log = LoggerFactory.getLogger(MyelinBookApplication.class);

	@Autowired
	private MyelinBookServerDaemon myelinBookServerDaemon;
	public static void main(String[] args) {
		SpringApplication.run(MyelinBookApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		myelinBookServerDaemon.startAll();
		for (int ii = 0; ii < 1000; ii++) {
			log.info("good=====");
			log.error("good");
			log.debug("good");
			log.trace("good");

			Thread.sleep(10000);
		}
	}
}
