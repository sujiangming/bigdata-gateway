package com.hncy58.bigdata.gateway.msg.receiver;

/**
 * 消息接收器
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:57:36
 * @param <T>
 */
public interface MsgReceiver<T> {
	
	/**
	 * 接收消息
	 * @param srcMsg
	 */
	void receiveMessage(T srcMsg);
}
