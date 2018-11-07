package com.hncy58.bigdata.gateway.controller.datasync;

import java.util.Date;
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
import com.hncy58.bigdata.gateway.domain.datasync.HBaseAuditDomain;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseConfDomain;
import com.hncy58.bigdata.gateway.model.datasync.HBaseAuditInfo;
import com.hncy58.bigdata.gateway.model.datasync.HBaseConfInfo;
import com.hncy58.bigdata.gateway.service.datasync.HBaseService;
import com.hncy58.bigdata.gateway.util.Constant;

/**
 * HBase表数据删除控制器
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年11月1日 下午4:33:10
 *
 */
@RestController
@RequestMapping("/api/hbase")
public class HBaseDeleteController {

	Logger log = LoggerFactory.getLogger(HBaseDeleteController.class);

	@Autowired
	private HBaseService service;

	@RequestMapping(value = "/conf/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, HBaseConfDomain domain) {

		Map<String, Object> ret = new HashMap<>();

		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
			
		Page<HBaseConfInfo> pageRet = service.selectConf(pageNo, pageSize, domain);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}
	
	@RequestMapping(value = "/audit/select", method = RequestMethod.GET)
	public Map<String, Object> selectAuditByPage(int pageNo, int pageSize, HBaseAuditDomain domain) {
		
		Map<String, Object> ret = new HashMap<>();
		
		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
		
		Page<HBaseAuditInfo> pageRet = service.selectAudit(pageNo, pageSize, domain);
		
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());
		
		return ret;
	}

	@RequestMapping(value = "/conf/add")
	public Map<String, Object> addConf(HBaseConfInfo domain) {

		Map<String, Object> ret = new HashMap<>();
		domain.setUpdate_time(new Date());
		domain.setCreate_time(new Date());

		try {
			int num = service.addConf(domain);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "7001");
				ret.put("msg", "添加HBase表数据删除监控配置失败");
			}
		} catch (Exception e) {
			ret.put("code", "7001");
			ret.put("msg", "添加HBase表数据删除监控配置失败," + e.getMessage());
		}

		return ret;
	}
	
	@RequestMapping(value = "/conf/modify")
	public Map<String, Object> modifyConf(HBaseConfInfo domain) {
		
		Map<String, Object> ret = new HashMap<>();
		domain.setUpdate_time(new Date());
		
		try {
			int num = service.modifyConf(domain);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "7002");
				ret.put("msg", "修改HBase表数据删除监控配置失败");
			}
		} catch (Exception e) {
			ret.put("code", "7002");
			ret.put("msg", "修改HBase表数据删除监控配置失败," + e.getMessage());
		}
		
		return ret;
	}
}
