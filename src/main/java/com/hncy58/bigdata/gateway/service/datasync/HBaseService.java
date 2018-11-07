package com.hncy58.bigdata.gateway.service.datasync;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseAuditDomain;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseConfDomain;
import com.hncy58.bigdata.gateway.model.datasync.HBaseAuditInfo;
import com.hncy58.bigdata.gateway.model.datasync.HBaseConfInfo;

public interface HBaseService {

	Page<HBaseAuditInfo> selectAudit(int pageNo, int pageSize, HBaseAuditDomain queryAudit);
	
	Page<HBaseConfInfo> selectConf(int pageNo, int pageSize, HBaseConfDomain queryAudit);

	int addConf(HBaseConfInfo domain);

	int modifyConf(HBaseConfInfo domain);

	int deleteConf(String id);
}
