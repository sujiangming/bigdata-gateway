package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.model.AuditInfo;
import com.hncy58.bigdata.gateway.service.AuditService;

@Service("auditMsgHandler")
public class AuditMsgHandler implements Handler<AuditInfo> {

	Logger log = LoggerFactory.getLogger(AuditMsgHandler.class);

	@Autowired
	private AuditService auditService;

	@Override
	public Object handle(AuditInfo msg) {

		log.info("res msg handler start to handle msg:{}", msg);
		if (msg == null)
			return null;

		int ret = auditService.save(msg);

		log.info("audit info save ret:{}", ret);

		return ret;
	}
}
