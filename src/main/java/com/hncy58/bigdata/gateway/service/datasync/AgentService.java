package com.hncy58.bigdata.gateway.service.datasync;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.AgentAlarmDomain;
import com.hncy58.bigdata.gateway.domain.datasync.AgentDomain;
import com.hncy58.bigdata.gateway.model.datasync.AgentAlarmInfo;
import com.hncy58.bigdata.gateway.model.datasync.AgentInfo;

public interface AgentService {

	Page<AgentInfo> select(int pageNo, int pageSize, AgentDomain queryAudit);
	Page<AgentAlarmInfo> selectAlarm(int pageNo, int pageSize, AgentAlarmDomain domain);
}
