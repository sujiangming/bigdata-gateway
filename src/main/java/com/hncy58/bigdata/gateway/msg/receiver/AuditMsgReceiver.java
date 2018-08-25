package com.hncy58.bigdata.gateway.msg.receiver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.model.AuditInfo;
import com.hncy58.bigdata.gateway.msg.handler.Handler;
import com.hncy58.bigdata.gateway.util.Utils;

/**
 * 审计消息接收器
 * 
 * @author tdz
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @date 2018年8月7日 上午9:32:49
 */
@Service("auditMsgReceiver")
public class AuditMsgReceiver implements MsgReceiver<String> {

	Logger log = LoggerFactory.getLogger(AuditMsgReceiver.class);

	@Value("${redis.pubsub.audit_topic.name:audit_topic}")
	private String auditTopic;

	@Autowired
	@Qualifier("auditMsgHandler")
	private Handler<AuditInfo> auditMsgHandler;

	/**
	 * 接收到redis消息处理
	 * 
	 * @param msg
	 */
	@Override
	public void receiveMessage(String srcMsg) {

		Jackson2JsonRedisSerializer<? extends Object> serializer = Utils.getJsonSerializer();
		Object ret = serializer.deserialize(srcMsg.getBytes());
		AuditInfo msg = null;
		if (ret instanceof AuditInfo)
			msg = (AuditInfo) ret;

		if (msg == null)
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
	private void handle(AuditInfo msg) {
		auditMsgHandler.handle(msg);
	}
}
