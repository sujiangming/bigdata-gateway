package com.hncy58.bigdata.gateway.model;

import java.io.Serializable;
import java.util.List;

/**
 * 角色资源信息
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月22日 下午4:35:20
 */
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