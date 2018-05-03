package com.myelinbook.server.frontx.server;



import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.myelinbook.server.message.queue.MyelinBookQueueManager;
import com.myelinbook.server.rabbitmq.MyelinBookRabbitMQManager;
import com.myelinbook.server.thread.manager.MyelinBookServerPoolManager;
import com.myelinbook.server.frontx.vertx.MyelinBookServerVerticle;

import io.vertx.core.Verticle;
import io.vertx.core.Vertx;

@Component
public class MyelinBookServerDaemon {
	private static final Logger log = LoggerFactory.getLogger(MyelinBookServerDaemon.class);

	//@Value("${tipsimg.repository.path}")
    private String imgPath;
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private MyelinBookQueueManager myelinBookQueueManager;
	@Autowired
	private MyelinBookRabbitMQManager myelinBookRabbitMQManager;
	@Autowired
	private MyelinBookServerPoolManager myelinBookServerPoolManager;
	

	//@Value("${tipsimg.ftp.repository.path}")
	private String tipsImageFtpPath;

	//@Value("${tipsimg.repository.path}")
	private String tipsImagePath;
	
	@PreDestroy
	public void preDestroy() {
		log.info("Called preDestroy");
		
	}
	
	
	public void startAll() throws Exception {
		log.info("myelinBookQueueManager size: "+myelinBookQueueManager.getQueueMap().size());

	    Vertx vertx = Vertx.vertx();
	    MyelinBookServerVerticle bookVerticle = new MyelinBookServerVerticle(); 
	    bookVerticle.setSpringContext(context, tipsImageFtpPath, tipsImagePath);
	    

	    MyelinBookServerVerticle bookVerticle2 = new MyelinBookServerVerticle(); 
	    bookVerticle2.setSpringContext(context, tipsImageFtpPath, tipsImagePath);
	    vertx.deployVerticle(bookVerticle);
	    vertx.deployVerticle(bookVerticle2);
		
//		tipsQueueManager.statusQueues();
//		
//		TipsDataProcessorImpl dataProcessorMain = (TipsDataProcessorImpl) context.getBean("tipsDataProcessorImpl");
//		dataProcessorMain.setConfigEntity(IMG_FLAG_MAIN, context);
//		tipsServerPoolManager.execute(dataProcessorMain);
//		tipsServerPoolManager.putThreadMap("TipsDataProcessor", dataProcessorMain);
//
//
//		TipsDataProcessorImpl dataProcessorCheck = (TipsDataProcessorImpl) context.getBean("tipsDataProcessorImpl");
//		dataProcessorCheck.setConfigEntity(IMG_FLAG_CHECK, context);
//		tipsServerPoolManager.execute(dataProcessorCheck);
//		tipsServerPoolManager.putThreadMap("dataProcessorCheck", dataProcessorCheck);
//
//		TipsDataProcessorImpl dataProcessorTag = (TipsDataProcessorImpl) context.getBean("tipsDataProcessorImpl");
//		dataProcessorTag.setConfigEntity(IMG_FLAG_TAG, context);
//		tipsServerPoolManager.execute(dataProcessorTag);
//		tipsServerPoolManager.putThreadMap("dataProcessorTag", dataProcessorTag);
//
//		TipsDataProcessorImpl dataProcessorPhoto= (TipsDataProcessorImpl) context.getBean("tipsDataProcessorImpl");
//		dataProcessorPhoto.setConfigEntity(IMG_FLAG_PHOTO, context);
//		tipsServerPoolManager.execute(dataProcessorPhoto);
//		tipsServerPoolManager.putThreadMap("dataProcessorTag", dataProcessorPhoto);
		

		//tipsImageServerRabbitMQManager.startWorker();
	}
}
