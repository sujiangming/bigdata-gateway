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
public class CanalMonitorInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int date_id;
	private String canal_id;
	private String db_id;
	private String tbl_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date start_time;
	private String start_bin_file;
	private long start_offset = -1;
	private int update_count = 0;
	private String remark;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date update_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date cur_time;
	private String cur_bin_file;
	private long cur_offset = -1;

	public int getUpdate_count() {
		return update_count;
	}

	public void setUpdate_count(int update_count) {
		this.update_count = update_count;
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

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
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

	public Date getCur_time() {
		return cur_time;
	}

	public void setCur_time(Date cur_time) {
		this.cur_time = cur_time;
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

}
