/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : bigdata

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-08-16 09:37:39
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  `res_code` varchar(255) NOT NULL,
  `p_res_code` varchar(255) DEFAULT NULL,
  `res_type` int(11) NOT NULL COMMENT '资源类型：1:uri,2:menu,3:button,4:api',
  `res_name` varchar(255) NOT NULL,
  `res_uri` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '1' COMMENT '资源排序优先级，越低优先级越高',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_res_code` (`res_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '01', '', '1', '总节点', '', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('2', '0102', '01', '1', '今日概览', '', '2', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('3', '0103', '01', '1', '客户中心', '', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('4', '0104', '01', '1', '报表中心', '', '2', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('5', '010401', '0104', '1', '运营报表', '/personas/test', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('6', '010402', '0104', '1', '风控报表', '/personas/main', '2', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('7', '010403', '0104', '1', '财务报表', '/user/user', '3', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('8', '010404', '0104', '1', 'HR报表', '/user/index1', '2', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('9', '010301', '0103', '1', '客户概览', '/user/index2', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('10', '010302', '0103', '1', '客户查询', '/user/index3', '4', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('11', '010303', '0103', '1', '客户画像', '/user/index4', '2', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('12', '010201', '0102', '1', '申请环节', '/user/index5', '4', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('13', '010202', '0102', '1', '借款环节', '/user/index6', '4', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('14', '01040101', '010401', '1', '报表概览', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('15', '01040102', '010401', '1', '每日新增余额', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('16', '01040103', '010401', '1', '运营报表', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('17', '01040201', '010402', '1', '报表概览', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('19', '01040202', '010402', '1', '风控授信报表', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('20', '01040203', '010402', '1', '2018三季度营销', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('21', '01040301', '010403', '1', '报表概览', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('22', '01040302', '010403', '1', '创利报表', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('23', '01040303', '010403', '1', '客户级基础数据', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('24', '01040304', '010403', '1', '借据级基础数据', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('25', '01040401', '010404', '1', '报表概览', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');
INSERT INTO `sys_res` VALUES ('26', '01040402', '010404', '1', 'HR报表', 'abc', '1', '2018-08-09 19:21:18', '2018-08-09 19:21:18', '演示数据');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) NOT NULL,
  `role_type` int(11) NOT NULL DEFAULT '1' COMMENT '1：普通角色，0：超级管理员',
  `role_name` varchar(255) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1000', '0', '超级管理员', null, '2018-08-09 09:10:47', null);
INSERT INTO `sys_role` VALUES ('2', '1001', '1', '唐顶志abc', null, '2018-08-06 23:37:40', null);
INSERT INTO `sys_role` VALUES ('3', '1002', '1', '唐顶志', null, '2018-08-06 23:40:14', '2018-08-06 08:00:00');
INSERT INTO `sys_role` VALUES ('4', '1003', '1', '唐顶志', null, '2018-08-06 23:45:38', '2018-08-06 15:45:39');
INSERT INTO `sys_role` VALUES ('5', '1004', '1', '唐顶志', null, '2018-08-06 23:47:06', '2018-08-06 15:47:06');
INSERT INTO `sys_role` VALUES ('9', '1112', '1', '1113', '1114', '2018-08-15 19:51:48', '2018-08-15 19:59:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('42', '2', '1', null, null, null);
INSERT INTO `sys_role_res` VALUES ('43', '2', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('44', '2', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('45', '2', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('46', '2', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('47', '2', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('48', '2', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('49', '2', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('50', '2', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('51', '2', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('52', '2', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('53', '2', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('54', '2', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('55', '2', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('56', '2', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('57', '2', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('58', '2', '17', null, null, null);
INSERT INTO `sys_role_res` VALUES ('59', '2', '19', null, null, null);
INSERT INTO `sys_role_res` VALUES ('60', '2', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('61', '2', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('62', '2', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('63', '2', '23', null, null, null);
INSERT INTO `sys_role_res` VALUES ('64', '2', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('65', '2', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('66', '2', '26', null, null, null);

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
  `login_status` int(11) DEFAULT '1' COMMENT '登录状态，0：正常登录，1：未登录，9：异常登录锁定',
  `act_status` int(11) DEFAULT '0' COMMENT '账户状态，0：正常，1：异常，9：删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_sys_user_code` (`user_code`) COMMENT '系统用户表用户编码唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1000', '88888888', '超级管理员', '超级管理员', null, null, '0', null, '1', '0', '2018-08-09 09:03:36', null);
INSERT INTO `sys_user` VALUES ('2', '1002', '88888888', '李妮科', '开发中心经理', '1001@hncy58.com', '18888888888', '0101', '部门经理', '0', '0', '2018-08-13 00:11:22', '2018-08-13 00:11:22');
INSERT INTO `sys_user` VALUES ('3', '1003', '88888888', '鲁健翔', '运维中心经理', '1001@hncy58.com', '18888888888', '0101', '部门经理', '1', '0', '2018-08-06 16:31:10', '2018-08-06 16:31:19');
INSERT INTO `sys_user` VALUES ('4', '1004', '88888888', '刘志超', '开发中心职员', '1001@hncy58.com', '18888888888', '0101', '职员', '0', '0', null, '2018-08-06 16:31:14');
INSERT INTO `sys_user` VALUES ('5', '1005', '88888888', '唐顶志', 'test', '1001@hncy58.com', '18888888888', '0101', '职员', '1', '0', null, null);
INSERT INTO `sys_user` VALUES ('20', '1111', '1111', '1234', null, null, null, '1111', null, '0', '0', null, '2018-08-15 17:41:01');

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
  `user_code` varchar(255) NOT NULL,
  `req_url` varchar(255) NOT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `req_method` varchar(255) DEFAULT NULL,
  `req_used` int(11) DEFAULT NULL,
  `opr_result` int(11) DEFAULT NULL,
  `opr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_opr_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '超级管理员', null, null);
INSERT INTO `sys_user_role` VALUES ('58', '2', '2', null, null, null);
