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
public class KafkaMonitorInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int date_id;
	private String topic_name;
	private int partition_id;
	private String grp_name;
	private int start_offset;
	private int curr_offset;
	private int latest_offset;
	private String remark;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date update_time;

	public KafkaMonitorInfo() {
		super();
	}

	public KafkaMonitorInfo(int id, int date_id, String topic_name, int partition_id, String grp_name, int start_offset,
			int curr_offset, int latest_offset, String remark, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.date_id = date_id;
		this.topic_name = topic_name;
		this.partition_id = partition_id;
		this.grp_name = grp_name;
		this.start_offset = start_offset;
		this.curr_offset = curr_offset;
		this.latest_offset = latest_offset;
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

	public int getDate_id() {
		return date_id;
	}

	public void setDate_id(int date_id) {
		this.date_id = date_id;
	}

	public String getTopic_name() {
		return topic_name;
	}

	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}

	public int getPartition_id() {
		return partition_id;
	}

	public void setPartition_id(int partition_id) {
		this.partition_id = partition_id;
	}

	public String getGrp_name() {
		return grp_name;
	}

	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
	}

	public int getStart_offset() {
		return start_offset;
	}

	public void setStart_offset(int start_offset) {
		this.start_offset = start_offset;
	}

	public int getCurr_offset() {
		return curr_offset;
	}

	public void setCurr_offset(int curr_offset) {
		this.curr_offset = curr_offset;
	}

	public int getLatest_offset() {
		return latest_offset;
	}

	public void setLatest_offset(int latest_offset) {
		this.latest_offset = latest_offset;
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
