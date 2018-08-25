package com.hncy58.bigdata.gateway.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.AuditDomain;
import com.hncy58.bigdata.gateway.model.AuditInfo;
import com.hncy58.bigdata.gateway.service.AuditService;
import com.hncy58.bigdata.gateway.util.Constant;

/**
 * 审计控制器
 * 
 * @author tokings
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月15日 上午11:51:24
 *
 */
@RestController
@RequestMapping("/api/audit")
public class AuditController {

	Logger log = LoggerFactory.getLogger(AuditController.class);

	@Autowired
	private AuditService auditService;

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, AuditDomain auditDomain) {

		Map<String, Object> ret = new HashMap<>();

		if (!StringUtils.isEmpty(auditDomain.getSortField()))
			auditDomain.setSortFiled();
			
		Page<AuditInfo> pageRet = auditService.select(pageNo, pageSize, auditDomain);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}
}
