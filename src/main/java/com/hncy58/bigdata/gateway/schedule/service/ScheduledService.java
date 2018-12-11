package com.hncy58.bigdata.gateway.schedule.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class ScheduledService {

	Logger log = LoggerFactory.getLogger(ScheduledService.class);

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void deleteAuditRecord() {
		String sql = "delete from sys_user_opr_log where DATEDIFF(now(), opr_time) > 7 ";
		int cnt = jdbcTemplate.update(sql);
		log.info("deleted {} audit records.", cnt);
	}

}
