package com.hncy58.bigdata.gateway.controller.datasync;

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
import com.hncy58.bigdata.gateway.domain.datasync.KafkaConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaMonitorDomain;
import com.hncy58.bigdata.gateway.model.datasync.KafkaConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.KafkaMonitorInfo;
import com.hncy58.bigdata.gateway.service.datasync.KafkaService;
import com.hncy58.bigdata.gateway.util.Constant;

/**
 * Kafka主题监控控制器
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年11月1日 下午4:33:10
 *
 */
@RestController
@RequestMapping("/api/kafka")
public class KafkaTopicController {

	Logger log = LoggerFactory.getLogger(KafkaTopicController.class);

	@Autowired
	private KafkaService KafkaService;

	@RequestMapping(value = "/monitor/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, KafkaMonitorDomain domain) {

		Map<String, Object> ret = new HashMap<>();

		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
			
		Page<KafkaMonitorInfo> pageRet = KafkaService.selectMonitor(pageNo, pageSize, domain);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}
	
	@RequestMapping(value = "/conf/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, KafkaConfDomain domain) {
		
		Map<String, Object> ret = new HashMap<>();
		
		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
		
		Page<KafkaConfInfo> pageRet = KafkaService.selectConf(pageNo, pageSize, domain);
		
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());
		
		return ret;
	}
}
