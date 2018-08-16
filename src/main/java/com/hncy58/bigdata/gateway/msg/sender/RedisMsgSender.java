package com.hncy58.bigdata.gateway.msg.sender;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.service.RedisService;

/**
 * Redis消息发送器
 * @author tdz
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @date 2018年8月7日 上午9:33:10
 */
@Service
public class RedisMsgSender<T> extends RedisService<T> {
	
	Logger log = LoggerFactory.getLogger(RedisMsgSender.class);
	
	@Value("${redis.pubsub.patterntopic:pubsub}")
	private String patternTopic;

	public void sendMessage(T msg) {
		log.info("start send redis msg:{}", msg);
		sendChannelMess(patternTopic, msg);
		log.info("end send redis msg:{}", msg);
	}

}
