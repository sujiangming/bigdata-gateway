package com.hncy58.bigdata.gateway.domain;

import java.io.Serializable;
import java.util.Date;

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
public class AuditDomain implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String token;
	private int userId = -1;
	private String reqUrl;
	private String queryStr;
	private String rmtIpAddr;
	private String localIpAddr;
	private String reqMethod;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date oprTime;
	private String mark;

	private String userCode;
	private String userName;

	/** 排序字段 **/
	private String sortField;
	/** 排序类型(asc/desc) **/
	private String sortType;

	public AuditDomain() {
		super();
	}

	public AuditDomain(int id, String token, String reqUrl, String queryStr, String rmtIpAddr, String localIpAddr,
			String reqMethod, Date oprTime, String mark) {
		super();
		this.id = id;
		this.token = token;
		this.reqUrl = reqUrl;
		this.queryStr = queryStr;
		this.rmtIpAddr = rmtIpAddr;
		this.localIpAddr = localIpAddr;
		this.reqMethod = reqMethod;
		this.oprTime = oprTime;
		this.mark = mark;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getReqUrl() {
		return reqUrl;
	}

	public void setReqUrl(String reqUrl) {
		this.reqUrl = reqUrl;
	}

	public String getRmtIpAddr() {
		return rmtIpAddr;
	}

	public void setRmtIpAddr(String rmtIpAddr) {
		this.rmtIpAddr = rmtIpAddr;
	}

	public String getLocalIpAddr() {
		return localIpAddr;
	}

	public void setLocalIpAddr(String localIpAddr) {
		this.localIpAddr = localIpAddr;
	}

	public String getReqMethod() {
		return reqMethod;
	}

	public void setReqMethod(String reqMethod) {
		this.reqMethod = reqMethod;
	}

	public Date getOprTime() {
		return oprTime;
	}

	public void setOprTime(Date oprTime) {
		this.oprTime = oprTime;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

}
