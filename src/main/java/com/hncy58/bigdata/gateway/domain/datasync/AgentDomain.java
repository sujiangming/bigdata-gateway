package com.hncy58.bigdata.gateway.domain.datasync;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 审计信息
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:34:32
 */
public class AgentDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String svr_name;
	private String svr_group;
	private int svr_type = -1;
	private int source_type = -1;
	private int dest_type = -1;
	private int status = -1;
	private int heartbeat_interval = -1;
	private int max_heartbeat_fail_cnt = -1;
	private String remark;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType = "asc";

	public AgentDomain() {
		super();
	}

	public int getHeartbeat_interval() {
		return heartbeat_interval;
	}

	public void setHeartbeat_interval(int heartbeat_interval) {
		this.heartbeat_interval = heartbeat_interval;
	}

	public int getMax_heartbeat_fail_cnt() {
		return max_heartbeat_fail_cnt;
	}

	public void setMax_heartbeat_fail_cnt(int max_heartbeat_fail_cnt) {
		this.max_heartbeat_fail_cnt = max_heartbeat_fail_cnt;
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

	public int getSource_type() {
		return source_type;
	}

	public void setSource_type(int source_type) {
		this.source_type = source_type;
	}

	public int getDest_type() {
		return dest_type;
	}

	public void setDest_type(int dest_type) {
		this.dest_type = dest_type;
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
