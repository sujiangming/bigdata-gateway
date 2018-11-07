package com.hncy58.bigdata.gateway.service.datasync;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaMonitorDomain;
import com.hncy58.bigdata.gateway.model.datasync.KafkaConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.KafkaMonitorInfo;

public interface KafkaService {

	Page<KafkaMonitorInfo> selectMonitor(int pageNo, int pageSize, KafkaMonitorDomain queryAudit);
	
	Page<KafkaConfInfo> selectConf(int pageNo, int pageSize, KafkaConfDomain queryAudit);

	int addConf(KafkaConfInfo domain);

	int modifyConf(KafkaConfInfo domain);

	int deleteConf(String id);
}
