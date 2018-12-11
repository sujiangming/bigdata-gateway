package com.hncy58.bigdata.gateway.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hncy58.bigdata.gateway.schedule.service.ScheduledService;

/**
 * 定时任务控制器
 * 
 * @author tokings
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年12月11日 上午11:15:46
 *
 */
@Component
@Async
public class ScheduledController {

	Logger log = LoggerFactory.getLogger(ScheduledController.class);

	@Autowired
	ScheduledService scheduledService;

	@Scheduled(cron = "0/10 * * * * ?")
	public void pushDataScheduled() {
		log.info("start deleting audit record scheduled!");
		scheduledService.deleteAuditRecord();
		log.info("end deleting audit record scheduled!");
	}

	/*
	@Scheduled(cron = "0/5 * * * * *")
	public void scheduled() {
		log.info("=====>>>>>使用cron  {}", System.currentTimeMillis());
	}

	@Scheduled(fixedRate = 5000)
	public void scheduled1() {
		log.info("=====>>>>>使用fixedRate{}", System.currentTimeMillis());
	}

	@Scheduled(fixedDelay = 5000)
	public void scheduled2() {
		log.info("=====>>>>>fixedDelay{}", System.currentTimeMillis());
	}
	*/
}
