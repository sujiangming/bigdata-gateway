/*
Navicat MySQL Data Transfer

Source Server         : 162.16.4.9
Source Server Version : 50714
Source Host           : 162.16.4.9:3306
Source Database       : bigdata

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-08-25 12:09:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `par_dept_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '上级部门编码',
  `dept_code` varchar(50) NOT NULL COMMENT '部门编码（按照两位一级部门设置编码，从00-99）',
  `dept_name` varchar(100) NOT NULL COMMENT '部门名称',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `mobile_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `leader` varchar(50) DEFAULT NULL COMMENT '负责人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_sys_dept_code` (`dept_code`) USING BTREE COMMENT '系统部门编码唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '01', '科技部', '长银五八信息科技部', '18888888888', '88888888@hncy58.com', '瞿乐湘', null, null);
INSERT INTO `sys_dept` VALUES ('2', '01', '0101', '开发中心', null, '110', '110@hncy58.com', '李妮科', null, null);
INSERT INTO `sys_dept` VALUES ('3', '02', '0102', '运维中心', '', '112', '112@hncy58.com', '鲁健翔', null, null);
INSERT INTO `sys_dept` VALUES ('4', '03', '0104', 'AJAX测试部门', '', '119', '119@hncy58.com', '瞿乐湘', null, null);

-- ----------------------------
-- Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `res_type` int(11) NOT NULL DEFAULT '1' COMMENT '资源类型：0：根节点，1：菜单，2: 虚拟菜单，3：接口',
  `res_name` varchar(255) NOT NULL,
  `res_uri` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '1' COMMENT '资源排序优先级，越低优先级越高',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  `res_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '0', '0', '根节点', 'overview', '1', '2018-08-23 15:24:49', '2018-08-24 12:03:09', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('2', '1', '1', '今日概览', 'overview', '1', '2018-08-23 15:25:40', '2018-08-24 09:37:37', '实施进件、授信、借款情况', 'dashboard');
INSERT INTO `sys_res` VALUES ('3', '1', '1', '客户中心', 'customer', '2', '2018-08-23 15:26:38', '2018-08-24 09:37:37', '用户模块', 'component');
INSERT INTO `sys_res` VALUES ('4', '1', '1', '报表中心', 'reports', '3', '2018-08-23 15:27:24', '2018-08-24 09:37:37', '报表（T+1）', 'chart');
INSERT INTO `sys_res` VALUES ('5', '1', '1', '系统管理', 'system', '4', '2018-08-23 18:26:19', '2018-08-24 09:37:37', '系统用户、角色、资源、审计管理 ', 'lock');
INSERT INTO `sys_res` VALUES ('6', '2', '1', '申请环节', 'applyment', '2', '2018-08-23 15:24:46', '2018-08-24 09:37:38', null, 'edit');
INSERT INTO `sys_res` VALUES ('7', '2', '1', '借款环节', 'loan', '3', '2018-08-23 15:24:45', '2018-08-24 09:37:38', null, 'clipboard');
INSERT INTO `sys_res` VALUES ('8', '3', '1', '客户概览', 'fullview', '2', '2018-08-23 15:24:40', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('9', '3', '1', '客户查询', 'personas', '1', '2018-08-23 15:24:38', '2018-08-24 09:37:38', null, 'peoples');
INSERT INTO `sys_res` VALUES ('10', '3', '1', '客户画像', 'single', '4', '2018-08-23 15:24:37', '2018-08-24 09:37:38', null, 'people');
INSERT INTO `sys_res` VALUES ('11', '4', '1', '风控报表', 'risk', '2', '2018-08-23 15:43:11', '2018-08-24 09:37:38', null, 'guide');
INSERT INTO `sys_res` VALUES ('12', '4', '1', '运营报表', 'operate', '4', '2018-08-23 15:24:32', '2018-08-24 09:37:38', null, 'drag');
INSERT INTO `sys_res` VALUES ('13', '4', '1', '财务报表', 'profit', '4', '2018-08-23 15:24:31', '2018-08-24 09:37:38', null, 'money');
INSERT INTO `sys_res` VALUES ('14', '4', '1', 'HR报表', 'hr', '1', '2018-08-23 15:24:30', '2018-08-24 09:37:38', null, 'peoples');
INSERT INTO `sys_res` VALUES ('15', '11', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:28', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('16', '11', '1', '风控授信报表', 'table', '1', '2018-08-23 15:24:27', '2018-08-24 09:37:38', null, 'table');
INSERT INTO `sys_res` VALUES ('17', '12', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:26', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('18', '12', '1', '每日新增余额', 'balance', '1', '2018-08-23 15:24:25', '2018-08-24 09:37:38', null, 'money');
INSERT INTO `sys_res` VALUES ('19', '12', '1', '运营报表', 'table', '1', '2018-08-23 15:24:24', '2018-08-24 09:37:38', null, 'table');
INSERT INTO `sys_res` VALUES ('20', '13', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:22', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('21', '13', '1', '创利报表', 'table', '1', '2018-08-23 15:24:20', '2018-08-24 09:37:38', null, 'table');
INSERT INTO `sys_res` VALUES ('22', '13', '1', '客户级基础数据', 'cust', '1', '2018-08-23 15:24:19', '2018-08-24 09:37:38', null, 'user');
INSERT INTO `sys_res` VALUES ('23', '13', '1', '借据级基础数据', 'loan', '1', '2018-08-23 15:24:18', '2018-08-24 09:37:38', null, 'documentation');
INSERT INTO `sys_res` VALUES ('24', '14', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:17', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('25', '14', '1', 'HR报表', 'table', '1', '2018-08-23 15:24:16', '2018-08-24 09:37:38', null, 'table');
INSERT INTO `sys_res` VALUES ('26', '5', '1', '用户管理', 'user', '1', '2018-08-23 18:25:35', '2018-08-24 09:37:38', '用户资源管理 ', 'peoples');
INSERT INTO `sys_res` VALUES ('27', '5', '1', '角色管理', 'role', '2', '2018-08-23 15:29:25', '2018-08-24 09:37:38', '角色管理', 'people');
INSERT INTO `sys_res` VALUES ('28', '5', '1', '菜单管理', 'menu', '3', '2018-08-23 15:28:53', '2018-08-24 09:37:38', '菜单资源权限管理', 'list');
INSERT INTO `sys_res` VALUES ('44', '5', '1', '接口管理', 'interface', '4', '2018-08-23 19:24:16', '2018-08-25 10:03:48', '接口资源管理', 'icon');
INSERT INTO `sys_res` VALUES ('45', '5', '1', '审计管理', 'audit', '5', '2018-08-23 19:24:59', '2018-08-24 16:27:59', '审计查看 ', 'edit');
INSERT INTO `sys_res` VALUES ('49', '-1', '3', '风控系统接口1', 'www.baidu.com', '0', '2018-08-24 11:43:35', '2018-08-24 12:42:29', '风控接口菜单1', null);
INSERT INTO `sys_res` VALUES ('51', '-1', '3', '风控接口2', 'www.sohu.com', '0', '2018-08-24 12:42:54', '2018-08-25 11:50:47', '测试', null);
INSERT INTO `sys_res` VALUES ('52', '-1', '3', 'test', 'test', '0', '2018-08-24 15:55:39', '2018-08-25 11:50:47', '1212', null);
INSERT INTO `sys_res` VALUES ('55', '-1', '3', '测试', '测试', '0', '2018-08-25 11:15:57', '2018-08-25 12:09:44', '测', null);
INSERT INTO `sys_res` VALUES ('56', '-1', '3', 'tdz_test', '/local/api/role/linkRes', '1', null, '2018-08-25 12:09:44', null, null);
INSERT INTO `sys_res` VALUES ('57', '1', '1', '测试', '测试', '100', '2018-08-25 12:02:01', '2018-08-25 12:02:01', '测试', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_type` int(11) NOT NULL DEFAULT '1' COMMENT '1：普通角色，0：超级管理员',
  `role_name` varchar(255) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', null, '0', '超级管理员', null, '2018-08-09 09:10:47', null);
INSERT INTO `sys_role` VALUES ('2', null, '1', '唐顶志abc', null, '2018-08-06 23:37:40', null);
INSERT INTO `sys_role` VALUES ('3', null, '1', '唐顶志', null, '2018-08-06 23:40:14', '2018-08-06 08:00:00');
INSERT INTO `sys_role` VALUES ('4', null, '1', '唐顶志', null, '2018-08-06 23:45:38', '2018-08-06 15:45:39');
INSERT INTO `sys_role` VALUES ('5', null, '1', '唐顶志', null, '2018-08-06 23:47:06', '2018-08-06 15:47:06');
INSERT INTO `sys_role` VALUES ('26', null, '1', 'test', 'test', '2018-08-22 16:53:25', '2018-08-22 16:53:25');

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_role_res` (`role_id`,`res_id`) USING BTREE COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `user_code` varchar(50) NOT NULL COMMENT '用户编码',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `mobile_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `dept_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '所属部门编码',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `login_status` int(11) DEFAULT '0' COMMENT '登录状态，1：登录，0：未登录',
  `act_status` int(11) DEFAULT '1' COMMENT '账户状态，1：正常（启用），2：锁定（禁用），9：删除（暂未使用，物理删除）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_sys_user_code` (`user_code`) COMMENT '系统用户表用户编码唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123456', 'admin', 'administrator', '110@qq.com', '110', '1111', 'none', '1', '1', '2018-08-09 09:03:36', '2018-08-24 10:44:14');
INSERT INTO `sys_user` VALUES ('2', 'linike', '123456', '李妮科', '开发中心主任', '1002@hncy58.com', '18888886666', '0101', '主任', '1', '1', '2018-08-13 00:11:22', '2018-08-23 10:23:23');
INSERT INTO `sys_user` VALUES ('3', '1003', '123456', '鲁健翔', '运维中心经理', '1001@hncy58.com', '18888888888', '0101', '部门经理', '1', '1', '2018-08-06 16:31:10', '2018-08-24 11:08:51');
INSERT INTO `sys_user` VALUES ('4', '1004', '123456', '刘志超', '开发中心职员', '1001@hncy58.com', '18888888888', '0101', '职员', '0', '1', '2018-08-06 16:31:10', '2018-08-23 09:23:58');
INSERT INTO `sys_user` VALUES ('5', 'tokings', '123456', '唐顶志', 'test', '1001@hncy58.com', '18888888888', '0101', '职员', '1', '1', '2018-08-06 16:31:10', '2018-08-24 11:09:23');
INSERT INTO `sys_user` VALUES ('25', '1111', '123456', 'test', 'test', '1002@hncy58.com', '18888886666', '0101', '主任', '1', '1', '2018-08-21 16:45:02', '2018-08-23 15:00:06');
INSERT INTO `sys_user` VALUES ('27', 'xyr', '123456', '向艳蓉', '向艳蓉', '1002@hncy58.com', '18888886666', '0101', '主任', '1', '1', '2018-08-23 10:10:04', '2018-08-24 15:44:21');
INSERT INTO `sys_user` VALUES ('28', 'wrx', '123456', '王仁兴', '王仁兴', 'wrx@hncy58.com', '18888886666', '0101', null, '1', '1', '2018-08-24 10:57:11', '2018-08-24 10:57:54');

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` timestamp NULL DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_opr_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_opr_log`;
CREATE TABLE `sys_user_opr_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `req_url` varchar(255) DEFAULT NULL,
  `query_str` varchar(255) DEFAULT NULL,
  `rmt_ip_addr` varchar(255) DEFAULT NULL,
  `local_ip_addr` varchar(255) DEFAULT NULL,
  `req_method` varchar(255) DEFAULT NULL,
  `opr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9696 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_opr_log
-- ----------------------------
INSERT INTO `sys_user_opr_log` VALUES ('9678', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:26', '');
INSERT INTO `sys_user_opr_log` VALUES ('9679', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:26', '');
INSERT INTO `sys_user_opr_log` VALUES ('9680', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:28', '');
INSERT INTO `sys_user_opr_log` VALUES ('9681', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:28', '');
INSERT INTO `sys_user_opr_log` VALUES ('9682', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:43', '');
INSERT INTO `sys_user_opr_log` VALUES ('9683', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:44', '');
INSERT INTO `sys_user_opr_log` VALUES ('9684', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:07:44', '');
INSERT INTO `sys_user_opr_log` VALUES ('9685', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:11', '');
INSERT INTO `sys_user_opr_log` VALUES ('9686', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:12', '');
INSERT INTO `sys_user_opr_log` VALUES ('9687', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:12', '');
INSERT INTO `sys_user_opr_log` VALUES ('9688', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1,2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:14', '');
INSERT INTO `sys_user_opr_log` VALUES ('9689', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1,2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:28', '');
INSERT INTO `sys_user_opr_log` VALUES ('9690', 'token#1#5937033252864', '1', '/local/api/res/select', 'pid=-1&pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:30', '');
INSERT INTO `sys_user_opr_log` VALUES ('9691', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20000&pid=6&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 12:08:30', '');
INSERT INTO `sys_user_opr_log` VALUES ('9692', 'token#1#5937033252864', '1', '/local/api/res/unlinkParentRes', 'pResId=-1&resIds=55,56', '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 12:08:33', '');
INSERT INTO `sys_user_opr_log` VALUES ('9693', 'token#1#5937033252864', '1', '/local/api/res/linkParentRes', 'pResId=6&resIds=undefined,52', '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 12:08:33', '');
INSERT INTO `sys_user_opr_log` VALUES ('9694', 'token#1#5937033252864', '1', '/local/api/res/unlinkParentRes', 'pResId=-1&resIds=55,56', '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 12:08:51', '');
INSERT INTO `sys_user_opr_log` VALUES ('9695', 'token#1#5937033252864', '1', '/local/api/res/linkParentRes', 'pResId=6&resIds=undefined,52', '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 12:08:51', '');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_user_role` (`user_id`,`role_id`) COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '超级管理员', null, null);
INSERT INTO `sys_user_role` VALUES ('2', '27', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('3', '25', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('87', '2', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('97', '5', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('98', '3', '1', null, null, null);
