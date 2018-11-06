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
public class HBaseAuditDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String db_name;
	private String table_name;
	private int del_size = -1;
	private int status = -1;
	private String remark;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date start_time;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date end_time;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType = "asc";

	public HBaseAuditDomain() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDb_name() {
		return db_name;
	}

	public void setDb_name(String db_name) {
		this.db_name = db_name;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public int getDel_size() {
		return del_size;
	}

	public void setDel_size(int del_size) {
		this.del_size = del_size;
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

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
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
