package com.hncy58.bigdata.gateway.model;

import java.io.Serializable;
import java.util.List;

public class RoleInfo implements Serializable {

		private static final long serialVersionUID = 1L;

		private int roleId;
		private List<Resource> resources;

		public int getRoleId() {
			return roleId;
		}

		public void setRoleId(int roleId) {
			this.roleId = roleId;
		}

		public List<Resource> getResources() {
			return resources;
		}

		public void setResources(List<Resource> resources) {
			this.resources = resources;
		}
	}