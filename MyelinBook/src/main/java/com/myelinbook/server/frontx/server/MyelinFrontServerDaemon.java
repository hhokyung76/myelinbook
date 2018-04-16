package com.myelinbook.server.frontx.server;



import static com.mediaflow.tips.common.Constants.*;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.mediaflow.tips.server.message.processor.TipsDataProcessorImpl;
import com.mediaflow.tips.server.message.queue.TipsQueueManager;
import com.mediaflow.tips.server.rabbitmq.TipsImageServerRabbitMQManager;
import com.mediaflow.tips.server.thread.manager.TipsServerPoolManager;
import com.mediaflow.tips.server.vertx.TipsImageServerVerticle;

import io.vertx.core.Verticle;
import io.vertx.core.Vertx;

@Component
public class MyelinFrontServerDaemon {
	private static final Logger log = LoggerFactory.getLogger(MyelinFrontServerDaemon.class);

	@Value("${tipsimg.repository.path}")
    private String imgPath;
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private TipsQueueManager tipsQueueManager;
	@Autowired
	private TipsImageServerRabbitMQManager tipsImageServerRabbitMQManager;
	@Autowired
	private TipsServerPoolManager tipsServerPoolManager;
	

	@Value("${tipsimg.ftp.repository.path}")
	private String tipsImageFtpPath;

	@Value("${tipsimg.repository.path}")
	private String tipsImagePath;
	
	@PreDestroy
	public void preDestroy() {
		log.info("Called preDestroy");
		
	}
	
	
	public void startAll() throws Exception {
		log.info("TinyFarmerQueueManager size: "+tipsQueueManager.getQueueMap().size());

	    Vertx vertx = Vertx.vertx();
	    TipsImageServerVerticle tipsImageVerticle = new TipsImageServerVerticle(); 
	    tipsImageVerticle.setSpringContext(context, tipsImageFtpPath, tipsImagePath);
	    vertx.deployVerticle(tipsImageVerticle);
		
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
