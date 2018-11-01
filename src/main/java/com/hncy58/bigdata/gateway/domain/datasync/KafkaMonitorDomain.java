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
public class KafkaMonitorDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int date_id = -1;
	private String topic_name;
	private int partition_id = -1;
	private String grp_name;
	private int start_offset = -1;
	private int curr_offset = -1;
	private int latest_offset = -1;
	private String remark;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType = "asc";

	public KafkaMonitorDomain() {
		super();
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
