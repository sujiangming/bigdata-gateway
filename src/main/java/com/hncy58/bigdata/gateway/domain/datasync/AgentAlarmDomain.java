package com.hncy58.bigdata.gateway.domain.datasync;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:34:32
 */
public class AgentAlarmDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String svr_name;
	private String svr_group;
	private int svr_type = -1;
	private int alarm_type = -1;
	private int alarm_level = -1;
	private int status = -1;
	private String remark;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType = "asc";

	public AgentAlarmDomain() {
		super();
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

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public void setSortFiled() {

		if (StringUtils.isEmpty(this.getSortType())) {
			// 默认升序
			this.setSortType("asc");
		}
	}
}
