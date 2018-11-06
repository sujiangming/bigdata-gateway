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
import com.hncy58.bigdata.gateway.domain.datasync.AgentAlarmDomain;
import com.hncy58.bigdata.gateway.domain.datasync.AgentDomain;
import com.hncy58.bigdata.gateway.model.datasync.AgentAlarmInfo;
import com.hncy58.bigdata.gateway.model.datasync.AgentInfo;
import com.hncy58.bigdata.gateway.service.datasync.AgentService;
import com.hncy58.bigdata.gateway.util.Constant;

/**
 * 代理服务监控控制器
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年11月1日 下午4:33:10
 *
 */
@RestController
@RequestMapping("/api/agent")
public class AgentController {

	Logger log = LoggerFactory.getLogger(AgentController.class);

	@Autowired
	private AgentService agentService;

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, AgentDomain agentDomain) {

		Map<String, Object> ret = new HashMap<>();

		if (!StringUtils.isEmpty(agentDomain.getSortField()))
			agentDomain.setSortFiled();
			
		Page<AgentInfo> pageRet = agentService.select(pageNo, pageSize, agentDomain);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}
	
	@RequestMapping(value = "/alarm/select", method = RequestMethod.GET)
	public Map<String, Object> alarmSelectByPage(int pageNo, int pageSize, AgentAlarmDomain domain) {
		
		Map<String, Object> ret = new HashMap<>();
		
		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
		
		Page<AgentAlarmInfo> pageRet = agentService.selectAlarm(pageNo, pageSize, domain);
		
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());
		
		return ret;
	}
}
