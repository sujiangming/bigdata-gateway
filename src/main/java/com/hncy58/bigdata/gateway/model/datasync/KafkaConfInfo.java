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
public class KafkaConfInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String topic_name;
	private String grp_name;
	private int status;
	private String remark;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date update_time;

	public KafkaConfInfo() {
		super();
	}

	public KafkaConfInfo(int id, String topic_name, String grp_name, int status, String remark, Date create_time,
			Date update_time) {
		super();
		this.id = id;
		this.topic_name = topic_name;
		this.grp_name = grp_name;
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

	public String getTopic_name() {
		return topic_name;
	}

	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}

	public String getGrp_name() {
		return grp_name;
	}

	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
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
