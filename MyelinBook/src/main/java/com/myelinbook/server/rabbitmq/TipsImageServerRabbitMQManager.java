package com.mediaflow.tips.server.rabbitmq;


//import static com.mediaflow.configuration.Constants.*;
//import static com.mediaflow.net.event.Event.*;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.mediaflow.tips.server.message.queue.TipsQueueManager;
import com.mediaflow.tips.server.rabbitmq.worker.RabbitImageDataReceiver;
import com.mediaflow.tips.server.thread.manager.TipsServerPoolManager;
import com.mediaflow.tips.utils.NetworkUtils;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

@Component
public class TipsImageServerRabbitMQManager {
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TipsQueueManager tipsQueueManager;
	@Autowired
	private TipsServerPoolManager tinyServerPoolManager;

	@Autowired
	private ApplicationContext context;
	
	
	private ConnectionFactory rabbitFactory;
	private Connection rabbitMQConn;

	private RabbitImageDataReceiver rabbitImageDataReceiver1;
	private RabbitImageDataReceiver rabbitImageDataReceiver2;
	
	@Value("${rabbitmq.username}")
    private String rabbitUserName;
	
	@Value("${rabbitmq.password}")
    private String rabbitPasswd;
	
	@Value("${rabbitmq.host}")
    private String rabbitHost;
	
	@Value("${rabbitmq.port}")
    private String rabbitPort;
	
	@PostConstruct
	public void postConstruct() throws IOException, InterruptedException {
		log.info("Called @PostConstruct");
		log.info("rabbitUserName:"+rabbitUserName);
		log.info("rabbitPasswd:"+rabbitPasswd);
		log.info("rabbitHost:"+rabbitHost);
		log.info("rabbitPort:"+rabbitPort);

	}
	
	@PreDestroy
	public void preDestroy() throws IOException, InterruptedException {
		log.info("Called preDestroy");

	}

	public TipsImageServerRabbitMQManager() {
		
	}
	
	public void startWorker() throws Exception {
		
		rabbitFactory = new ConnectionFactory();
		rabbitFactory.setUsername(rabbitUserName); 
		rabbitFactory.setPassword(rabbitPasswd);
		rabbitFactory.setHost(rabbitHost);
//		rabbitFactory.setPort(Integer.parseInt(rabbitPort));
		rabbitFactory.setAutomaticRecoveryEnabled(true);
		rabbitFactory.setRequestedHeartbeat(5000);

		try {
			rabbitMQConn = rabbitFactory.newConnection();
		} catch (IOException | TimeoutException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rabbitImageDataReceiver1 = (RabbitImageDataReceiver) context.getBean("rabbitImageDataReceiver");
		rabbitImageDataReceiver1.setTipsQueueManager(tipsQueueManager);
		rabbitImageDataReceiver1.setRabbitMQConn(rabbitMQConn);
		tinyServerPoolManager.execute(rabbitImageDataReceiver1);
		
		rabbitImageDataReceiver2 = (RabbitImageDataReceiver) context.getBean("rabbitImageDataReceiver");
		rabbitImageDataReceiver2.setTipsQueueManager(tipsQueueManager);
		rabbitImageDataReceiver2.setRabbitMQConn(rabbitMQConn);
		tinyServerPoolManager.execute(rabbitImageDataReceiver2);
		
	}
	
	

}
