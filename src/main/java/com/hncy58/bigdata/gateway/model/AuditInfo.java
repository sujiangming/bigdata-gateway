package com.hncy58.bigdata.gateway.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 审计信息
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:34:32
 */
public class AuditInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String token;
	private String reqUrl;
	private String queryStr;
	private String rmtIpAddr;
	private String localIpAddr;
	private String reqMethod;
	private Date oprTime;
	private String mark;

	public AuditInfo() {
		super();
	}

	public AuditInfo(int id, String token, String reqUrl, String queryStr, String rmtIpAddr, String localIpAddr,
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
