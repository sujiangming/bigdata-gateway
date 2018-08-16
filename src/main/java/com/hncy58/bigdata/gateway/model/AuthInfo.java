package com.hncy58.bigdata.gateway.model;

import java.io.Serializable;
import java.util.List;

public class AuthInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int userId;
	private int userCode;
	private List<RoleInfo> roles;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public List<RoleInfo> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleInfo> roles) {
		this.roles = roles;
	}
}
