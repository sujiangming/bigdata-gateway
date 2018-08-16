package com.hncy58.bigdata.gateway.msg.receiver;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.github.pagehelper.util.StringUtil;
import com.hncy58.bigdata.gateway.msg.handler.Handler;
import com.hncy58.bigdata.gateway.service.RedisService;

/**
 * Redis消息接收器
 * @author tdz
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @date 2018年8月7日 上午9:32:49
 */
@Service
public class RedisMsgReceiver<T> extends RedisService<T> {
	
	Logger log = LoggerFactory.getLogger(RedisMsgReceiver.class);
	
	@Value("${redis.pubsub.patterntopic:pubsub}")
	private String patternTopic;

	@Autowired
	@Qualifier("userMsgHandler")
	private Handler userMsgHandler;
	
	@Autowired
	@Qualifier("authorityMsgHandler")
	private Handler authorityMsgHandler;
	
	/**
	 * 接收到redis消息处理
	 * @param msg 消息内容<br>
	 * <bold>格式：</bold>
	 * {"oprSubject":"user","oprType":"add","data":{"userId":11}}
	 * 
	 */
	public void receiveMessage(String msg) {
		// 这里是收到通道的消息之后执行的方法
		log.info("received redis msg:{}", msg);
		
		if(StringUtils.isEmpty(msg))
			return;

		try {
			JSONObject json = new JSONObject(msg);
			// {"oprSubject":"user","oprType":"add","data":{"userId":11}}
			String oprSubject = ObjectUtils.toString(json.get("oprSubject"));
			String oprType = ObjectUtils.toString(json.get("oprType"));
			Object data = json.get("data");
			
			if(StringUtil.isNotEmpty(oprSubject)) {
				handle(oprSubject, oprType, data);
			}
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 * 处理消息
	 * @param oprSubject
	 * @param oprType
	 * @param data
	 */
	private void handle(String oprSubject, String oprType, Object data) {
		switch (oprSubject) {
		case "user":
			userMsgHandler.handle(oprSubject, oprType, data);
			break;
		case "auth":
			authorityMsgHandler.handle(oprSubject, oprType, data);
			break;
		default:
			break;
		}
	}
}
