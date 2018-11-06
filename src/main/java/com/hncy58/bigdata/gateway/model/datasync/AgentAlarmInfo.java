package com.hncy58.bigdata.gateway.model.datasync;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:34:32
 */
public class AgentAlarmInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String svr_name;
	private String svr_group;
	private int svr_type;
	private int alarm_type;
	private int alarm_level;
	private int status;
	private String remark;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date update_time;

	public AgentAlarmInfo() {
		super();
	}

	public AgentAlarmInfo(int id, String svr_name, String svr_group, int svr_type, int alarm_type, int alarm_level,
			int status, String remark, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.svr_name = svr_name;
		this.svr_group = svr_group;
		this.svr_type = svr_type;
		this.alarm_type = alarm_type;
		this.alarm_level = alarm_level;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.update_time = update_time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSvr_name() {
		return svr_name;
	}

	public void setSvr_name(String svr_name) {
		this.svr_name = svr_name;
	}

	public String getSvr_group() {
		return svr_group;
	}

	public void setSvr_group(String svr_group) {
		this.svr_group = svr_group;
	}

	public int getSvr_type() {
		return svr_type;
	}

	public void setSvr_type(int svr_type) {
		this.svr_type = svr_type;
	}

	public int getAlarm_type() {
		return alarm_type;
	}

	public void setAlarm_type(int alarm_type) {
		this.alarm_type = alarm_type;
	}

	public int getAlarm_level() {
		return alarm_level;
	}

	public void setAlarm_level(int alarm_level) {
		this.alarm_level = alarm_level;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

}
