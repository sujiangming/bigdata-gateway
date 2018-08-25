/*
Navicat MySQL Data Transfer

Source Server         : 162.16.4.9
Source Server Version : 50714
Source Host           : 162.16.4.9:3306
Source Database       : bigdata

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-08-25 17:45:30
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
INSERT INTO `sys_res` VALUES ('49', '6', '3', '风控系统接口1', 'www.baidu.com', '0', '2018-08-24 11:43:35', '2018-08-25 14:00:57', '风控接口菜单1', null);
INSERT INTO `sys_res` VALUES ('51', '-1', '3', '风控接口2', 'www.sohu.com', '0', '2018-08-24 12:42:54', '2018-08-25 14:00:57', '测试', null);
INSERT INTO `sys_res` VALUES ('52', '-2', '3', 'test', 'test', '0', '2018-08-24 15:55:39', '2018-08-25 17:39:46', '1212 ', null);
INSERT INTO `sys_res` VALUES ('55', '-2', '3', '测试', '测试', '0', '2018-08-25 11:15:57', '2018-08-25 17:39:49', '测 ', null);
INSERT INTO `sys_res` VALUES ('56', '-1', '3', 'tdz_test', '/local/api/role/linkRes', '1', null, '2018-08-25 14:00:57', null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('115', '2', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('116', '2', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('117', '2', '52', null, null, null);
INSERT INTO `sys_role_res` VALUES ('118', '2', '49', null, null, null);
INSERT INTO `sys_role_res` VALUES ('119', '2', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('120', '2', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('121', '2', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('122', '2', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('123', '2', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('124', '2', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('125', '2', '26', null, null, null);
INSERT INTO `sys_role_res` VALUES ('126', '2', '27', null, null, null);
INSERT INTO `sys_role_res` VALUES ('127', '2', '28', null, null, null);
INSERT INTO `sys_role_res` VALUES ('128', '2', '44', null, null, null);
INSERT INTO `sys_role_res` VALUES ('129', '2', '45', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_user` VALUES ('29', 'xuehaiwei', '88888888', 'xuehaiwei', '', null, '18888888888', '信息科技部', '', '0', '1', '2018-08-25 16:42:16', '2018-08-25 16:42:16');

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
  `query_str` varchar(2048) DEFAULT NULL,
  `rmt_ip_addr` varchar(255) DEFAULT NULL,
  `local_ip_addr` varchar(255) DEFAULT NULL,
  `req_method` varchar(255) DEFAULT NULL,
  `opr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `access_ret` char(1) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10495 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_opr_log
-- ----------------------------
INSERT INTO `sys_user_opr_log` VALUES ('10266', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:24:30', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10267', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&endTime=2018-08-25%2016:11:20', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:24:31', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10268', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:24:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10269', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&endTime=2018-08-25%2016:11:20', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:24:34', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10270', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:24:37', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10271', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:24:38', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10272', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:24:44', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10273', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:24:44', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10274', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:25:03', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10275', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:17', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10276', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10277', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&startTime=2018-08-25+15:27:30&endTime=2018-08-25+16:27:30&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:23', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10278', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&startTime=2018-07-26+16:27:33&endTime=2018-08-25+16:27:33&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:29', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10279', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:25:29', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10280', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10281', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:33', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10282', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:38', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10283', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1,2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:25:39', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10284', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:19', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10285', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:19', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10286', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10287', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:24', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10288', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:24', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10289', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userName=admin&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:30', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10290', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userName=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10291', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=admin&userName=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:41', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10292', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:43', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10293', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=1111&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:55', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10294', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=0101&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:57', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10295', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:26:59', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10296', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:27:00', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10297', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:27:10', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10298', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=&loginStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:27:19', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10299', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&userCode=&userName=&deptCode=&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:27:24', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10300', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:27:36', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10301', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:28:00', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10302', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:28:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10303', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=id&sortType=asc&startTime=2018-08-25%2016:07:26&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:28:40', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10304', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:28:56', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10305', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:28:56', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10306', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:28:57', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10307', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:28:57', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10308', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:01', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10309', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10310', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10311', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&actStatus=0&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:13', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10312', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&actStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10313', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&actStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10314', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10315', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10316', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:27', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10317', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:29:28', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10318', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortType=asc&startTime=2018-08-25%2016:07:26&endTime=2018-08-25%2016:11:20&sortField=accessRet', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:29:42', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10319', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=accessRet&sortType=asc&startTime=2018-08-25%2016:07:26', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:29:52', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10320', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:07', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10321', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:07', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10322', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10323', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10324', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10325', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10326', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:20', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10327', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:46', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10328', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10329', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10330', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:51', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10331', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:30:52', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10332', '', '-1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=accessRet&sortType=asc&startTime=2018-08-25%2016:07:26', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:30:58', '0', '用户token为空');
INSERT INTO `sys_user_opr_log` VALUES ('10333', 'token#1', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=accessRet&sortType=asc&startTime=2018-08-25%2016:07:26', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:31:07', '0', '用户token令牌无效');
INSERT INTO `sys_user_opr_log` VALUES ('10334', 'token#1#5937033252864', '1', '/local/api/audit/select', 'pageNo=1&pageSize=20&userCode=&sortField=accessRet&sortType=asc&startTime=2018-08-25%2016:07:26', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 16:31:13', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10335', null, '-1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:31:18', '0', '用户token为空');
INSERT INTO `sys_user_opr_log` VALUES ('10336', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=&actStatus=0&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:31:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10337', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:32:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10338', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:32:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10339', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:32:27', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10340', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:32:27', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10341', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10342', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10343', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:28', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10344', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:28', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10345', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:28', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10346', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&loginStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:30', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10347', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:31', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10348', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&actStatus=0&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10349', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:34', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10350', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&actStatus=1&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10351', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:36:36', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10352', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:37:21', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10353', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:37:21', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10354', 'token#1#5937033252864', '1', '/local/api/user/add', null, '162.16.109.149', '162.16.109.102', 'POST', '2018-08-25 16:38:02', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10355', 'token#1#5937033252864', '1', '/local/api/user/add', null, '162.16.109.149', '162.16.109.102', 'POST', '2018-08-25 16:38:10', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10356', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:41:36', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10357', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:41:36', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10358', 'token#1#5937033252864', '1', '/local/api/user/add', null, '162.16.109.149', '162.16.109.102', 'POST', '2018-08-25 16:42:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10359', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:19', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10360', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10361', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:23', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10362', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:27', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10363', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:29', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10364', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:42:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10365', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:43:42', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10366', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:43:50', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10367', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:44:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10368', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:44:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10369', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:44:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10370', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:44:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10371', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:44:27', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10372', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:45:09', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10373', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:45:41', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10374', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:45:49', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10375', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:46:01', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10376', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=28', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:46:06', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10377', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:47:05', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10378', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:47:05', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10379', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:47:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10380', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:48:39', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10381', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:48:39', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10382', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:48:58', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10383', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:49:46', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10384', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:49:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10385', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:49:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10386', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:49:48', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10387', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:49:54', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10388', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:52:43', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10389', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10390', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:39', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10391', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:46', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10392', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:46', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10393', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10394', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10395', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:53:48', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10396', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:54:30', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10397', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:54:30', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10398', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:54:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10399', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:54:52', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10400', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:54:52', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10401', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:55:24', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10402', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:55:38', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10403', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:56:58', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10404', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:57:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10405', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:57:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10406', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:57:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10407', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=2', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:57:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10408', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 16:58:29', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10409', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:01:04', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10410', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:01:04', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10411', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:01:04', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10412', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:01:06', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10413', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:02:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10414', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:02:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10415', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:02:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10416', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:02:38', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10417', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:03:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10418', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:03:38', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10419', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:03:40', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10420', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:03:40', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10421', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:03:53', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10422', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:07:21', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10423', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:07:21', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10424', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:07:23', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10425', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:07:36', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10426', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:07:43', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10427', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:07:49', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10428', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:08:54', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10429', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:09:06', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10430', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:09:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10431', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:10:00', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10432', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:10:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10433', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:01', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10434', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:17', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10435', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:34', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10436', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10437', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10438', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:11:48', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10439', 'token#5#2248906248192', '5', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.102', '162.16.109.102', 'PUT', '2018-08-25 17:14:18', '0', '权限验证失败');
INSERT INTO `sys_user_opr_log` VALUES ('10440', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.102', '162.16.109.102', 'PUT', '2018-08-25 17:14:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10441', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=27', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 17:14:32', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10442', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:14:59', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10443', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:14:59', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10444', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.102', '162.16.109.102', 'GET', '2018-08-25 17:15:05', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10445', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=29', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:15:24', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10446', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:15:29', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10447', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:22:59', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10448', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:22:59', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10449', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=%7B%22userId%22:4%7D', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:23:04', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10450', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=%7B%22userId%22:27%7D', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:23:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10451', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:24:58', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10452', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:24:58', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10453', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=%7B%22userId%22:2%7D', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:25:01', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10454', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'id=%7B%22userId%22:27%7D', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:25:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10455', 'token#1#5937033252864', '1', '/local/api/user/getByToken', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:28:21', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10456', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:28:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10457', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:28:22', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10458', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:28:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10459', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:29:26', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10460', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:30:45', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10461', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:30:45', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10462', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:30:52', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10463', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:34:03', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10464', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:34:03', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10465', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:34:06', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10466', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:34:55', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10467', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:35:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10468', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:35:16', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10469', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:35:37', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10470', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:35:37', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10471', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:36:15', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10472', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:38:40', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10473', 'token#1#5937033252864', '1', '/local/api/res/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:38:44', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10474', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:38:44', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10475', 'token#1#5937033252864', '1', '/local/api/res/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:38:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10476', 'token#1#5937033252864', '1', '/local/api/res/select', 'pageNo=1&pageSize=20&resType=3', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:38:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10477', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:40:08', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10478', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:40:08', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10479', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:40:20', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10480', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:40:20', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10481', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:40:25', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10482', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:40:44', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10483', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10484', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:35', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10485', 'token#1#5937033252864', '1', '/local/api/auth/menu/getAll', 'resTypes=1', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:45', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10486', 'token#1#5937033252864', '1', '/local/api/role/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc&sort=%2Bid', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:45', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10487', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10488', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:47', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10489', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:41:50', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10490', 'token#1#5937033252864', '1', '/local/api/user/select', 'pageNo=1&pageSize=20&sortField=id&sortType=asc', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:42:23', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10491', 'token#1#5937033252864', '1', '/local/api/role/all', null, '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:42:23', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10492', 'token#1#5937033252864', '1', '/local/api/user/getRoleByUserId', 'userId=27', '162.16.109.149', '162.16.109.102', 'GET', '2018-08-25 17:43:14', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10493', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:43:18', '1', '超管访问');
INSERT INTO `sys_user_opr_log` VALUES ('10494', 'token#1#5937033252864', '1', '/local/api/user/update', null, '162.16.109.149', '162.16.109.102', 'PUT', '2018-08-25 17:44:08', '1', '超管访问');

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
