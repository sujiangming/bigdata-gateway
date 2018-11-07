package com.hncy58.bigdata.gateway.service.datasync;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.CanalConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.CanalMonitorDomain;
import com.hncy58.bigdata.gateway.model.datasync.CanalConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.CanalMonitorInfo;

public interface CanalService {

	Page<CanalMonitorInfo> selectMonitor(int pageNo, int pageSize, CanalMonitorDomain domain);
	
	Page<CanalConfInfo> selectConf(int pageNo, int pageSize, CanalConfDomain domain);

	int addConf(CanalConfInfo model);

	int modifyConf(CanalConfInfo model);
}
