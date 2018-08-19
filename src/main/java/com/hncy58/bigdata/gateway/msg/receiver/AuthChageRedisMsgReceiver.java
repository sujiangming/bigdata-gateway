package com.hncy58.bigdata.gateway.msg.receiver;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;
import com.hncy58.bigdata.gateway.msg.handler.Handler;
import com.hncy58.bigdata.gateway.service.RedisService;

/**
 * Redis消息接收器
 * 
 * @author tdz
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @date 2018年8月7日 上午9:32:49
 */
@Service
public class AuthChageRedisMsgReceiver<T> extends RedisService<T> {

	Logger log = LoggerFactory.getLogger(AuthChageRedisMsgReceiver.class);

	@Value("${redis.pubsub.patterntopic:pubsub}")
	private String patternTopic;

	@Autowired
	@Qualifier("userRoleChangeMsgHandler")
	private Handler userMsgHandler;

	@Autowired
	@Qualifier("roleChangeMsgHandler")
	private Handler roleMsgHandler;

	@Autowired
	@Qualifier("authChangeMsgHandler")
	private Handler authMsgHandler;

	/**
	 * 接收到redis消息处理
	 * 
	 * @param msg
	 */
	public void receiveMessage(String srcMsg) {
		// 解决string序列化之后不是字符串问题
		if (!srcMsg.contains("{") || !srcMsg.endsWith("}")) {
			log.info("received redis msg is not json string, msg:{}", srcMsg);
		}
		log.debug("received redis msg:{}", srcMsg);
		AuthChangeMsg msg = new AuthChangeMsg(srcMsg.substring(srcMsg.indexOf("{")));
		log.info("received redis msg, type:{}, operate:{}, data:{}", msg.getType(), msg.getOperate(), msg.getData());

		if (StringUtils.isEmpty(msg.getType()) || StringUtils.isEmpty(msg.getOperate()) || msg.getData() == null)
			return;

		try {
			handle(msg);
		} catch (Exception e) {
			log.error("消息处理异常：" + e.getMessage(), e);
		}
	}

	/**
	 * 处理消息
	 * 
	 * @param msg
	 */
	private void handle(AuthChangeMsg msg) {
		switch (msg.getType()) {
		case "user":
			userMsgHandler.handle(msg);
			break;
		case "role":
			roleMsgHandler.handle(msg);
			break;
		case "res":
			authMsgHandler.handle(msg);
			break;
		default:
			break;
		}
	}
}
