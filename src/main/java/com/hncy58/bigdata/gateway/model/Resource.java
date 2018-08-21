package com.hncy58.bigdata.gateway.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Resource implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int resType = 1;
	private String resName;
	private String pResCode;
	private String resCode;
	private String resUri;
	private int rank;
	private String mark;
	private String resIcon;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	public Resource() {
	}

	public Resource(int id, int resType, String resName, String pResCode, String resCode, String resUri, int rank,
			String resIcon) {
		super();
		this.id = id;
		this.resType = resType;
		this.resName = resName;
		this.pResCode = pResCode;
		this.resCode = resCode;
		this.resUri = resUri;
		this.rank = rank;
		this.resIcon = resIcon;
	}

	public String getResIcon() {
		return resIcon;
	}

	public void setResIcon(String resIcon) {
		this.resIcon = resIcon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getResType() {
		return resType;
	}

	public void setResType(int resType) {
		this.resType = resType;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getpResCode() {
		return pResCode;
	}

	public void setpResCode(String pResCode) {
		this.pResCode = pResCode;
	}

	public String getResUri() {
		return resUri;
	}

	public void setResUri(String resUri) {
		this.resUri = resUri;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return this.getId() + ":" + this.getResName() + ":" + this.getResType() + ":" + this.getResCode() + ":"
				+ this.getpResCode() + ":" + this.getRank() + ":" + this.getResUri();
	}

}
