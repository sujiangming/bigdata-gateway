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
public class CanalMonitorDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int date_id = -1;
	private String canal_id;
	private String db_id;
	private String tbl_id;
	private String start_bin_file;
	private long start_offset = -1;
	private String remark;
	private String cur_bin_file;
	private long cur_offset = -1;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date start_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date end_time;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType = "asc";

	public CanalMonitorDomain() {
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

	public String getCanal_id() {
		return canal_id;
	}

	public void setCanal_id(String canal_id) {
		this.canal_id = canal_id;
	}

	public String getDb_id() {
		return db_id;
	}

	public void setDb_id(String db_id) {
		this.db_id = db_id;
	}

	public String getTbl_id() {
		return tbl_id;
	}

	public void setTbl_id(String tbl_id) {
		this.tbl_id = tbl_id;
	}

	public String getStart_bin_file() {
		return start_bin_file;
	}

	public void setStart_bin_file(String start_bin_file) {
		this.start_bin_file = start_bin_file;
	}

	public long getStart_offset() {
		return start_offset;
	}

	public void setStart_offset(long start_offset) {
		this.start_offset = start_offset;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCur_bin_file() {
		return cur_bin_file;
	}

	public void setCur_bin_file(String cur_bin_file) {
		this.cur_bin_file = cur_bin_file;
	}

	public long getCur_offset() {
		return cur_offset;
	}

	public void setCur_offset(long cur_offset) {
		this.cur_offset = cur_offset;
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
