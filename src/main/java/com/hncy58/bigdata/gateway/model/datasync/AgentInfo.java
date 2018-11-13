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
public class AgentInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String svr_name;
	private String svr_group;
	private int svr_type;
	private int source_type;
	private int dest_type;
	private int status;
	private int heartbeat_interval = -1;
	private int max_heartbeat_fail_cnt = -1;
	private String remark;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date update_time;

	public AgentInfo() {
		super();
	}

	public AgentInfo(int id, String svr_name, String svr_group, int svr_type, int source_type, int dest_type,
			int status, String remark, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.svr_name = svr_name;
		this.svr_group = svr_group;
		this.svr_type = svr_type;
		this.source_type = source_type;
		this.dest_type = dest_type;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.update_time = update_time;
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
