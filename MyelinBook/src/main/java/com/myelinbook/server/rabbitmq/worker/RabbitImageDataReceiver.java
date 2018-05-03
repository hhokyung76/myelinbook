package com.myelinbook.server.rabbitmq.worker;



import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.BlockingQueue;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.myelinbook.server.message.queue.MyelinBookQueueManager;
import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;

/**
 * rabbitmq 서버를 통해 허브와 통신을 주고 받는다. 1. 수신 내역 1.1. HeartBeat 1.2. SensorData 1.3.
 * ControlResult 2. 송신내역 2.1. ControllerScheduler 2.2. ManualControl
 * 
 * @author redskin
 *
 */
@Component
@Scope("prototype")
public class RabbitImageDataReceiver implements Runnable {
	/** Logger */
	public static final Logger log = LoggerFactory.getLogger(RabbitImageDataReceiver.class);

	private Connection rabbitMQConn;

	private Channel rabbitChannel = null;

    private MyelinBookQueueManager tipsQueueManager; // hub -> cloud
	
	private String hubId;
	
	private Gson gson;
	private JSONParser jsonParser ;

	public Connection getRabbitMQConn() {
		return rabbitMQConn;
	}

	
	public MyelinBookQueueManager getTipsQueueManager() {
		return tipsQueueManager;
	}


	public void setTipsQueueManager(MyelinBookQueueManager tipsQueueManager) {
		this.tipsQueueManager = tipsQueueManager;
	}


	public void setRabbitMQConn(Connection rabbitMQConn) {
		gson = new Gson();
		this.rabbitMQConn = rabbitMQConn;

		try {
			rabbitChannel = rabbitMQConn.createChannel();

			rabbitChannel.queueDeclare("test", true, false, false, null);

			Consumer consumer = new DefaultConsumer(rabbitChannel) {
		      @Override
		      public void handleDelivery(String consumerTag, Envelope envelope,
		                                 AMQP.BasicProperties properties, byte[] body) throws IOException {
		        String message = new String(body, "UTF-8");
		        

				Object imgData = gson.fromJson(message, Object.class);
				log.info("imgData: "+imgData.toString());
				
				try {
					tipsQueueManager.getQueueByName("test").put(imgData);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        /**
		         * Json 데이터 파싱 처리 전 BlockingQueue로 전달하여 처리하도록 구성 예정
		         * 2018.02.21
		         * 이호경
		         */
		        //tinyFarmerQueueManager.getQueueByName(EVENT_SEND_TO_SERVER_ON_MQ).offer(message);
		        log.info(" [x] Received '" + envelope.getRoutingKey() + "':'" + message + "'");
		      }
		    };
			rabbitChannel.basicConsume("test", true, consumer);

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	@Override
	public void run() {

		int msgCount = 0;
		while (!Thread.currentThread().isInterrupted()) {
			
		}
	}


}
