package com.mediaflow.tips.jedis;

import redis.clients.jedis.Jedis;

public class MessageProducer {

	public static void main(String[] args) {
		Jedis jedis = new Jedis("192.168.0.42");

		for (int ii = 0; ii < 10000; ii++)
			jedis.rpush("queue", "Value "+ii);

	}

}