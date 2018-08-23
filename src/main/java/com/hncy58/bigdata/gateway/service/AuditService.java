package com.hncy58.bigdata.gateway.service;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.AuditDomain;
import com.hncy58.bigdata.gateway.model.AuditInfo;

public interface AuditService {

	int save(AuditInfo audit);

	Page<AuditInfo> select(int pageNo, int pageSize, AuditDomain queryAudit);
}
