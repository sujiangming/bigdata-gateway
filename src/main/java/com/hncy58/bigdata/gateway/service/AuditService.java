package com.hncy58.bigdata.gateway.service;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.AuditDomain;
import com.hncy58.bigdata.gateway.model.AuditInfo;

/**
 * 审计服务
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:11:50
 */
public interface AuditService {

	int save(AuditInfo audit);

	Page<AuditInfo> select(int pageNo, int pageSize, AuditDomain queryAudit);
}
