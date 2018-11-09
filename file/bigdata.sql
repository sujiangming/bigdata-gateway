/*
Navicat MySQL Data Transfer

Source Server         : 162.16.4.9
Source Server Version : 50714
Source Host           : 162.16.4.9:3306
Source Database       : bigdata

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-09 19:25:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agent_svr_alarm
-- ----------------------------
DROP TABLE IF EXISTS `agent_svr_alarm`;
CREATE TABLE `agent_svr_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `svr_name` varchar(255) NOT NULL,
  `svr_group` varchar(255) NOT NULL,
  `svr_type` int(11) DEFAULT NULL COMMENT '代理服务类型',
  `alarm_type` int(11) DEFAULT NULL COMMENT '告警类型：\r\n1：数据采集服务,\r\n2：监控服务,\r\n3：数据消费服务',
  `alarm_level` int(11) DEFAULT NULL COMMENT '告警级别（4：紧急告警、3：主要告警、2：次要告警、1：提示告警）',
  `status` int(11) DEFAULT NULL COMMENT '处理状态（0：初始，1：处理，...，9：删除）',
  `remark` varchar(20480) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5663 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_svr_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for agent_svr_info
-- ----------------------------
DROP TABLE IF EXISTS `agent_svr_info`;
CREATE TABLE `agent_svr_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `svr_name` varchar(255) NOT NULL,
  `svr_group` varchar(255) NOT NULL,
  `svr_type` int(11) DEFAULT NULL COMMENT '代理服务类型（1：数据采集服务，2：监控服务，3：数据消费服务，……）',
  `source_type` int(11) DEFAULT NULL COMMENT '输入源类型（1：MYSQL，2：Kafka，3：HBase，4：Kudu，5：Hive，6：HDFS...）',
  `dest_type` int(11) DEFAULT NULL COMMENT '目标源类型（1：MYSQL，2：Kafka，3：HBase，4：Kudu，5：Hive，6：HDFS...）',
  `status` int(11) DEFAULT NULL COMMENT '代理服务状态（0：下线，1：正常，2：备用，...，9：删除）',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_agent_name_group` (`svr_name`,`svr_group`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_svr_info
-- ----------------------------
INSERT INTO `agent_svr_info` VALUES ('9', 'kafkaTopicMonitor', 'kafkaTopicMonitorGroup', '2', '0', '0', '1', '心跳上报', '2018-10-25 16:38:58', '2018-11-09 19:23:35');
INSERT INTO `agent_svr_info` VALUES ('10', 'kafka_to_hbase_1', 'KafkaToHBaseGroup', '2', '2', '2', '0', null, '2018-10-26 16:08:21', '2018-10-29 09:27:45');
INSERT INTO `agent_svr_info` VALUES ('11', 'KafkaToHBase', 'KafkaToHBaseGroup', '2', '2', '2', '0', '心跳上报', '2018-10-30 14:49:25', '2018-11-05 11:17:31');
INSERT INTO `agent_svr_info` VALUES ('12', 'hbaseTableDataDelete', 'hbaseTableDataDeleteGroup', '2', '0', '0', '1', '心跳上报', '2018-10-31 19:27:36', '2018-11-05 09:11:45');
INSERT INTO `agent_svr_info` VALUES ('13', 'KafkaToHDFS', 'KafkaToHDFSGroup', '2', '2', '2', '1', '心跳上报', '2018-11-02 09:38:26', '2018-11-09 19:23:35');
INSERT INTO `agent_svr_info` VALUES ('14', 'CanalClient9_236_1', 'CanalToKafkaGroupTest', '1', '1', '2', '0', '监测到服务中断信号，退出服务！', '2018-11-05 16:44:39', '2018-11-08 13:13:26');
INSERT INTO `agent_svr_info` VALUES ('15', 'KafkaToHBase9_236_2', 'KafkaToHBaseGroupTest', '2', '2', '3', '2', '监测到服务中断信号，退出服务！', '2018-11-05 16:45:25', '2018-11-08 12:15:42');
INSERT INTO `agent_svr_info` VALUES ('16', 'KafkaToHBase9_236_1', 'KafkaToHBaseGroupTest', '2', '2', '3', '0', '监测到服务中断信号，退出服务！', '2018-11-05 17:15:39', '2018-11-08 12:15:46');
INSERT INTO `agent_svr_info` VALUES ('17', 'CanalClient9_236_2', 'CanalToKafkaGroupTest', '1', '1', '2', '0', '监测到服务中断信号，退出服务！', '2018-11-06 18:03:24', '2018-11-06 18:08:42');
INSERT INTO `agent_svr_info` VALUES ('18', 'CanalClient162.16.9.236', 'canal_kafka_group_1 ', '1', '1', '2', '1', '心跳上报', '2018-11-06 20:03:34', '2018-11-09 19:23:33');
INSERT INTO `agent_svr_info` VALUES ('19', 'CanalClient162.16.9.236_2', 'canal_kafka_group_1 ', '1', '1', '2', '0', '监测到服务中断信号，退出服务！', '2018-11-06 20:08:48', '2018-11-07 19:02:59');
INSERT INTO `agent_svr_info` VALUES ('20', 'KafkaClient162.16.9.236_1 ', 'KafkaToHbaseGroup ', '2', '2', '3', '1', '心跳上报', '2018-11-07 10:02:46', '2018-11-09 19:23:31');
INSERT INTO `agent_svr_info` VALUES ('21', 'KafkaToKudu', 'KafkaToKuduGroup', '2', '2', '2', '1', '心跳上报', '2018-11-07 15:11:19', '2018-11-09 19:23:35');
INSERT INTO `agent_svr_info` VALUES ('22', 'KafkaClient162.16.9.236_2 ', 'KafkaToHbaseGroup ', '2', '2', '3', '2', '备用服务', '2018-11-07 15:56:09', '2018-11-07 19:25:26');

-- ----------------------------
-- Table structure for canal_extract_tbl_cfg
-- ----------------------------
DROP TABLE IF EXISTS `canal_extract_tbl_cfg`;
CREATE TABLE `canal_extract_tbl_cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_grp` varchar(255) NOT NULL,
  `canal_id` varchar(255) NOT NULL,
  `tbl_id` varchar(255) NOT NULL,
  `db_id` varchar(255) NOT NULL,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL COMMENT '抽取状态（0：未同步，1：同步中，9：删除）',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_canal_db_tbl_cfg` (`canal_id`,`tbl_id`,`db_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of canal_extract_tbl_cfg
-- ----------------------------
INSERT INTO `canal_extract_tbl_cfg` VALUES ('1', 'CanalToKafkaGroupTest', '162.16.6.181:3306', 'test_table', 'canal_tsdb', '0', '9', '', null, '2018-11-09 19:15:41');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('2', 'CanalToKafkaGroupTest', '162.16.6.181:3306', 'test_table2', 'canal_tsdb', '0', '9', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('5', 'CanalToKafkaGroupTest', '162.16.6.181:3306', 'test_table1', 'canal_tsdb', '0', '9', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('6', 'canal_kafka_group_1', '162.16.4.9:3306', 'isop_employee\r\n', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('7', 'canal_kafka_group_1', '162.16.4.9:3306', 'isop_department', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('8', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('9', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer_account', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('10', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_contact', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('11', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_base', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('12', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_cust_address', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('13', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_occupation', 'migration_sdv_isop', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('14', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('15', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_credit', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('16', 'canal_kafka_group_1', '162.16.4.9:3306', 'his_customer_credit', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('17', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer_credit_apply_log', 'risk_uat', '0', '1', '', null, '2018-11-08 10:32:02');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('18', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_credit_frozen', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('19', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_credit_unfrozen', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('20', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_zmxy', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('21', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer_blacklist', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('22', 'canal_kafka_group_1', '162.16.4.9:3306', 'call_ack_task', 'risk_uat', '0', '9', '修改为删除状态', null, '2018-11-08 10:30:49');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('23', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_baiqishi', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('24', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_tongdun', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('25', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_tongdun_education', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('26', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_cs_insurance', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('27', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_cs_accum_found', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('28', 'canal_kafka_group_1', '162.16.4.9:3306', 'interface_log', 'risk_uat', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('29', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_channel_info', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('30', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_loan', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('31', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_loan_reg', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('32', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_loan_reg_hst', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('33', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_acct', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('34', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_plan', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('35', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_customer', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('36', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_order', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('37', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_order_hst', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('38', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_loan_bal_rpt', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('39', 'canal_kafka_group_1', '162.16.4.9:3306', 'ccs_overdue_hst_rpt', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('40', 'canal_kafka_group_1', '162.16.4.9:3306', 'tpl_customer', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('41', 'canal_kafka_group_1', '162.16.4.9:3306', 'tpl_loan_info', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('42', 'canal_kafka_group_1', '162.16.4.9:3306', 'tpl_repay_info', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('43', 'canal_kafka_group_1', '162.16.4.9:3306', 'tpl_trade_register', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('44', 'canal_kafka_group_1', '162.16.4.9:3306', 'tpl_txn_register', 'prodccsdb', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('45', 'canal_kafka_group_1', '162.16.4.9:3306', 'wechatmember', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('46', 'canal_kafka_group_1', '162.16.4.9:3306', 'loan_user_info', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('47', 'canal_kafka_group_1', '162.16.4.9:3306', 'his_loan_user_info', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('48', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer_login_record', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('49', 'canal_kafka_group_1', '162.16.4.9:3306', 'customer_verify_record', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('50', 'canal_kafka_group_1', '162.16.4.9:3306', 'feedback_record', 'wechat2', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('51', 'canal_kafka_group_1', '162.16.6.181:3306', 'inf_customer_credit', 'riskcontrol', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('52', 'canal_kafka_group_1', '162.16.6.181:3306', 'inf_customer', 'riskcontrol', '0', '1', null, null, null);
INSERT INTO `canal_extract_tbl_cfg` VALUES ('56', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_borrow', 'migration_sdv_isop', '0', '1', '实时看板需要此表数据', '2018-11-08 10:57:22', '2018-11-08 10:57:22');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('57', 'canal_kafka_group_1', '162.16.4.9:3306', 'inf_customer_decoration', 'migration_sdv_isop', '0', '1', '实时看板需要此表数据', '2018-11-08 10:58:53', '2018-11-08 10:58:53');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('58', 'canal_kafka_group_1', '162.16.6.181:3306', 'customer', 'isop', '0', '1', '', '2018-11-09 18:55:34', '2018-11-09 19:10:39');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('59', 'canal_kafka_group_1', '162.16.6.181:3306', 'customer_account', 'isop', '0', '1', '', '2018-11-09 18:55:55', '2018-11-09 19:10:34');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('60', 'canal_kafka_group_1', '162.16.6.181:3306', 'dict_card_bin', 'payment', '0', '1', '', '2018-11-09 19:06:06', '2018-11-09 19:10:29');
INSERT INTO `canal_extract_tbl_cfg` VALUES ('61', 'canal_kafka_group_1', '162.16.6.181:3306', 'wechatmember', 'wechat', '0', '1', '', '2018-11-09 19:09:59', '2018-11-09 19:09:59');

-- ----------------------------
-- Table structure for canal_extract_tbl_monitor
-- ----------------------------
DROP TABLE IF EXISTS `canal_extract_tbl_monitor`;
CREATE TABLE `canal_extract_tbl_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `date_id` int(11) NOT NULL COMMENT '  日期(格式:YYYYMMDD)',
  `canal_id` varchar(255) NOT NULL COMMENT 'canalId',
  `db_id` varchar(255) NOT NULL COMMENT '同步的数据库名',
  `tbl_id` varchar(255) NOT NULL COMMENT '同步的表名',
  `start_time` datetime(3) DEFAULT NULL COMMENT '当前同步表在当天最早的变更时间',
  `start_bin_file` varchar(64) DEFAULT NULL COMMENT '当前同步表对应的binlog文件名',
  `start_offset` bigint(20) DEFAULT NULL COMMENT '当前同步表对应binlog文件的起始偏移量',
  `update_count` int(10) DEFAULT '0' COMMENT '按天累计的数据行的变更次数（插入+更新+删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cur_time` datetime(3) DEFAULT NULL COMMENT '当前处理到的binlog时间',
  `cur_bin_file` varchar(64) DEFAULT NULL COMMENT '当前同步到的binlog文件名',
  `cur_offset` bigint(20) DEFAULT NULL COMMENT '当前同步到的binlog偏移量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_canal_db_tbl_monitor` (`date_id`,`canal_id`,`db_id`,`tbl_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of canal_extract_tbl_monitor
-- ----------------------------
INSERT INTO `canal_extract_tbl_monitor` VALUES ('8', '20181106', '162.16.6.181:3306', 'canal_tsdb', 'test_table', '2018-11-06 15:21:13.000', 'mysql-bin.000016', '448769967', '0', '更新数据条数:243', '2018-11-06 15:31:06', '2018-11-06 18:41:22', '2018-11-06 18:41:07.000', 'mysql-bin.000016', '450757821');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('9', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-01 09:15:10.000', 'master-bin.000158', '961181891', '0', '更新数据条数:227', '2018-11-06 20:05:40', '2018-11-06 20:05:51', '2018-11-01 09:46:43.000', 'master-bin.000158', '977648979');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('10', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-01 09:15:10.000', 'master-bin.000158', '961303575', '0', '更新数据条数:33', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:43.000', 'master-bin.000158', '977647690');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('11', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan', '2018-11-01 09:15:10.000', 'master-bin.000158', '961309465', '0', '更新数据条数:128', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:42.000', 'master-bin.000158', '976015061');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('12', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-01 09:15:10.000', 'master-bin.000158', '961343817', '0', '更新数据条数:127', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:43.000', 'master-bin.000158', '977659982');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('13', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg_hst', '2018-11-01 09:15:10.000', 'master-bin.000158', '961347767', '0', '更新数据条数:104', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:42.000', 'master-bin.000158', '976016372');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('14', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-01 09:15:10.000', 'master-bin.000158', '961373689', '0', '更新数据条数:365', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:43.000', 'master-bin.000158', '977661070');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('15', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_order_hst', '2018-11-01 09:15:10.000', 'master-bin.000158', '961391377', '0', '更新数据条数:505', '2018-11-06 20:05:41', '2018-11-06 20:05:51', '2018-11-01 09:46:42.000', 'master-bin.000158', '976040627');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('16', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_plan', '2018-11-01 09:15:10.000', 'master-bin.000158', '961530930', '0', '更新数据条数:439', '2018-11-06 20:05:42', '2018-11-06 20:05:51', '2018-11-01 09:46:42.000', 'master-bin.000158', '976068239');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('17', '20181101', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-01 09:30:22.000', 'master-bin.000158', '964839787', '0', '更新数据条数:2', '2018-11-06 20:05:45', '2018-11-06 20:05:51', '2018-11-01 09:35:04.000', 'master-bin.000158', '965196111');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('18', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_bal_rpt', '2018-11-01 09:39:25.000', 'master-bin.000158', '966708781', '0', '更新数据条数:284', '2018-11-06 20:05:47', '2018-11-06 20:06:52', '2018-11-01 09:59:53.000', 'master-bin.000158', '996862630');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('19', '20181101', '162.16.4.9:3306', 'prodccsdb', 'ccs_overdue_hst_rpt', '2018-11-01 09:43:13.000', 'master-bin.000158', '971541797', '0', '更新数据条数:64', '2018-11-06 20:05:49', '2018-11-06 20:06:52', '2018-11-01 09:59:53.000', 'master-bin.000158', '996854761');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('20', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_contact', '2018-11-01 10:18:38.000', 'master-bin.000158', '998926479', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:57', '2018-11-06 20:05:57', '2018-11-01 10:18:38.000', 'master-bin.000158', '998926479');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('21', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-01 10:18:38.000', 'master-bin.000158', '998926906', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:57', '2018-11-06 20:05:57', '2018-11-01 10:18:38.000', 'master-bin.000158', '998926906');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('22', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-01 10:18:38.000', 'master-bin.000158', '998929498', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:57', '2018-11-06 20:05:57', '2018-11-01 10:18:38.000', 'master-bin.000158', '998929498');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('23', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-01 10:18:38.000', 'master-bin.000158', '998929866', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:57', '2018-11-06 20:05:57', '2018-11-01 10:18:38.000', 'master-bin.000158', '998929866');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('24', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-01 10:18:38.000', 'master-bin.000158', '998931676', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:57', '2018-11-06 20:05:57', '2018-11-01 10:18:38.000', 'master-bin.000158', '998931676');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('25', '20181101', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-01 10:18:38.000', 'master-bin.000158', '998943311', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:18:38.000', 'master-bin.000158', '998943311');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('26', '20181101', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-01 10:18:38.000', 'master-bin.000158', '998943757', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:18:38.000', 'master-bin.000158', '998943757');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('27', '20181101', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-01 10:18:38.000', 'master-bin.000158', '998944374', '0', '本轮总计更新数据条数:3', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:18:38.000', 'master-bin.000158', '998944374');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('28', '20181101', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-01 10:18:38.000', 'master-bin.000158', '998945242', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:18:38.000', 'master-bin.000158', '998945242');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('29', '20181101', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-01 10:18:38.000', 'master-bin.000158', '998945731', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:18:38.000', 'master-bin.000158', '998945731');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('30', '20181101', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-01 10:49:31.000', 'master-bin.000158', '1000938811', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 10:49:31.000', 'master-bin.000158', '1000938811');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('31', '20181101', '162.16.4.9:3306', 'wechat2', 'loan_user_info', '2018-11-01 11:32:18.000', 'master-bin.000158', '1009053906', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 11:32:18.000', 'master-bin.000158', '1009053906');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('32', '20181101', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-01 11:32:18.000', 'master-bin.000158', '1009060816', '0', '本轮总计更新数据条数:2', '2018-11-06 20:05:58', '2018-11-06 20:05:58', '2018-11-01 11:32:18.000', 'master-bin.000158', '1009060816');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('33', '20181101', '162.16.4.9:3306', 'wechat2', 'customer_login_record', '2018-11-01 16:25:36.000', 'master-bin.000158', '1056878899', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:59', '2018-11-06 20:05:59', '2018-11-01 16:25:36.000', 'master-bin.000158', '1056878899');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('34', '20181101', '162.16.4.9:3306', 'wechat2', 'his_loan_user_info', '2018-11-01 16:27:18.000', 'master-bin.000158', '1057121072', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:59', '2018-11-06 20:05:59', '2018-11-01 16:27:18.000', 'master-bin.000158', '1057121072');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('35', '20181101', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-01 16:27:23.000', 'master-bin.000158', '1057144659', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:59', '2018-11-06 20:05:59', '2018-11-01 16:27:23.000', 'master-bin.000158', '1057144659');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('36', '20181101', '162.16.4.9:3306', 'migration_sdv_isop', 'customer_account', '2018-11-01 16:28:18.000', 'master-bin.000158', '1057595758', '0', '本轮总计更新数据条数:2', '2018-11-06 20:05:59', '2018-11-06 20:05:59', '2018-11-01 16:28:18.000', 'master-bin.000158', '1057595758');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('37', '20181101', '162.16.4.9:3306', 'risk_uat', 'inf_zmxy', '2018-11-01 16:56:34.000', 'master-bin.000158', '1060123225', '0', '本轮总计更新数据条数:1', '2018-11-06 20:05:59', '2018-11-06 20:05:59', '2018-11-01 16:56:34.000', 'master-bin.000158', '1060123225');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('38', '20181101', '162.16.4.9:3306', 'risk_uat', 'call_ack_task', '2018-11-01 17:55:56.000', 'master-bin.000158', '1070684438', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:01', '2018-11-06 20:06:01', '2018-11-01 17:55:56.000', 'master-bin.000158', '1070684438');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('39', '20181102', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-02 08:56:46.000', 'master-bin.000159', '51254075', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:06', '2018-11-06 20:06:06', '2018-11-02 08:56:46.000', 'master-bin.000159', '51254075');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('40', '20181102', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-02 08:56:47.000', 'master-bin.000159', '51256488', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:06', '2018-11-06 20:06:06', '2018-11-02 08:56:47.000', 'master-bin.000159', '51256488');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('41', '20181102', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-02 09:01:25.000', 'master-bin.000159', '51547279', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:06', '2018-11-06 20:06:06', '2018-11-02 09:01:25.000', 'master-bin.000159', '51547279');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('42', '20181102', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-02 09:01:25.000', 'master-bin.000159', '51547994', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:06', '2018-11-06 20:06:06', '2018-11-02 09:01:25.000', 'master-bin.000159', '51547994');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('43', '20181102', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-02 10:19:29.000', 'master-bin.000159', '59854809', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:06', '2018-11-06 20:06:06', '2018-11-02 10:19:29.000', 'master-bin.000159', '59854809');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('44', '20181102', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-02 11:24:33.000', 'master-bin.000159', '67295083', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:24:33.000', 'master-bin.000159', '67295083');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('45', '20181102', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-02 11:24:33.000', 'master-bin.000159', '67297461', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:24:33.000', 'master-bin.000159', '67297461');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('46', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_contact', '2018-11-02 11:36:03.000', 'master-bin.000159', '68054272', '0', '本轮总计更新数据条数:2', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68054272');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('47', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'customer_account', '2018-11-02 11:36:03.000', 'master-bin.000159', '68054724', '0', '本轮总计更新数据条数:2', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68054724');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('48', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-02 11:36:03.000', 'master-bin.000159', '68057293', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68057293');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('49', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-02 11:36:03.000', 'master-bin.000159', '68062090', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68062090');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('50', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-02 11:36:03.000', 'master-bin.000159', '68062568', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68062568');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('51', '20181102', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-02 11:36:03.000', 'master-bin.000159', '68064756', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68064756');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('52', '20181102', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-02 11:36:03.000', 'master-bin.000159', '68073736', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68073736');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('53', '20181102', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-02 11:36:03.000', 'master-bin.000159', '68074218', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68074218');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('54', '20181102', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-02 11:36:03.000', 'master-bin.000159', '68074783', '0', '本轮总计更新数据条数:2', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68074783');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('55', '20181102', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-02 11:36:03.000', 'master-bin.000159', '68075435', '0', '本轮总计更新数据条数:2', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:36:03.000', 'master-bin.000159', '68075435');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('56', '20181102', '162.16.4.9:3306', 'wechat2', 'customer_login_record', '2018-11-02 11:40:50.000', 'master-bin.000159', '68352851', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:40:50.000', 'master-bin.000159', '68352851');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('57', '20181102', '162.16.4.9:3306', 'wechat2', 'loan_user_info', '2018-11-02 11:42:38.000', 'master-bin.000159', '68423092', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:42:38.000', 'master-bin.000159', '68423092');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('58', '20181102', '162.16.4.9:3306', 'wechat2', 'his_loan_user_info', '2018-11-02 11:54:04.000', 'master-bin.000159', '68899912', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:54:04.000', 'master-bin.000159', '68899912');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('59', '20181102', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-02 11:54:09.000', 'master-bin.000159', '68937548', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:54:09.000', 'master-bin.000159', '68937548');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('60', '20181102', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-02 11:54:09.000', 'master-bin.000159', '68938086', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:54:09.000', 'master-bin.000159', '68938086');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('61', '20181102', '162.16.4.9:3306', 'risk_uat', 'inf_zmxy', '2018-11-02 11:54:10.000', 'master-bin.000159', '68944469', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:07', '2018-11-06 20:06:07', '2018-11-02 11:54:10.000', 'master-bin.000159', '68944469');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('62', '20181103', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-03 00:00:00.000', 'master-bin.000159', '107585930', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:11', '2018-11-06 20:06:11', '2018-11-03 00:00:00.000', 'master-bin.000159', '107585930');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('63', '20181103', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-03 13:48:49.000', 'master-bin.000159', '144362916', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:15', '2018-11-06 20:06:15', '2018-11-03 13:48:49.000', 'master-bin.000159', '144362916');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('64', '20181103', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-03 13:49:07.000', 'master-bin.000159', '144377524', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:15', '2018-11-06 20:06:15', '2018-11-03 13:49:07.000', 'master-bin.000159', '144377524');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('65', '20181104', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-04 00:00:00.000', 'master-bin.000159', '173437051', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:19', '2018-11-06 20:06:19', '2018-11-04 00:00:00.000', 'master-bin.000159', '173437051');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('66', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-05 00:00:00.000', 'master-bin.000159', '238119366', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:26', '2018-11-06 20:06:26', '2018-11-05 00:00:00.000', 'master-bin.000159', '238119366');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('67', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg_hst', '2018-11-05 09:54:01.000', 'master-bin.000159', '266890112', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 09:54:01.000', 'master-bin.000159', '266890112');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('68', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-05 09:54:01.000', 'master-bin.000159', '266893349', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 09:54:01.000', 'master-bin.000159', '266893349');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('69', '20181105', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-05 10:36:00.000', 'master-bin.000159', '268473317', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 10:36:00.000', 'master-bin.000159', '268473317');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('70', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-05 10:36:00.000', 'master-bin.000159', '268494577', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 10:36:00.000', 'master-bin.000159', '268494577');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('71', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-05 10:36:00.000', 'master-bin.000159', '268494911', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 10:36:00.000', 'master-bin.000159', '268494911');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('72', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-05 10:36:00.000', 'master-bin.000159', '268495229', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 10:36:00.000', 'master-bin.000159', '268495229');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('73', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-05 10:36:00.000', 'master-bin.000159', '268499170', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 10:36:00.000', 'master-bin.000159', '268499170');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('74', '20181105', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-05 11:06:33.000', 'master-bin.000159', '278878585', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:06:33.000', 'master-bin.000159', '278878585');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('75', '20181105', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-05 11:09:40.000', 'master-bin.000159', '280152505', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:40.000', 'master-bin.000159', '280152505');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('76', '20181105', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-05 11:09:40.000', 'master-bin.000159', '280154080', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:40.000', 'master-bin.000159', '280154080');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('77', '20181105', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-05 11:09:40.000', 'master-bin.000159', '280195847', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:40.000', 'master-bin.000159', '280195847');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('78', '20181105', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-05 11:09:40.000', 'master-bin.000159', '280196385', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:40.000', 'master-bin.000159', '280196385');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('79', '20181105', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-05 11:09:41.000', 'master-bin.000159', '280203265', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:41.000', 'master-bin.000159', '280203265');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('80', '20181105', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-05 11:09:49.000', 'master-bin.000159', '280280908', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:09:49.000', 'master-bin.000159', '280280908');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('81', '20181105', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-05 11:11:03.000', 'master-bin.000159', '280428492', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:30', '2018-11-06 20:06:30', '2018-11-05 11:11:03.000', 'master-bin.000159', '280428492');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('82', '20181105', '162.16.4.9:3306', 'wechat2', 'customer_login_record', '2018-11-05 14:02:50.000', 'master-bin.000159', '297871868', '0', '更新数据条数:11', '2018-11-06 20:06:30', '2018-11-06 20:06:52', '2018-11-05 17:21:50.000', 'master-bin.000159', '370554304');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('83', '20181105', '162.16.4.9:3306', 'wechat2', 'his_loan_user_info', '2018-11-05 14:02:56.000', 'master-bin.000159', '297877069', '0', '更新数据条数:5', '2018-11-06 20:06:30', '2018-11-06 20:06:52', '2018-11-05 17:23:43.000', 'master-bin.000159', '370710860');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('84', '20181105', '162.16.4.9:3306', 'wechat2', 'loan_user_info', '2018-11-05 14:02:56.000', 'master-bin.000159', '297877320', '0', '更新数据条数:10', '2018-11-06 20:06:30', '2018-11-06 20:06:52', '2018-11-05 17:23:43.000', 'master-bin.000159', '370710610');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('85', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_contact', '2018-11-05 14:07:50.000', 'master-bin.000159', '298115514', '0', '更新数据条数:16', '2018-11-06 20:06:30', '2018-11-06 20:06:52', '2018-11-05 17:27:24.000', 'master-bin.000159', '371324012');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('86', '20181105', '162.16.4.9:3306', 'migration_sdv_isop', 'customer_account', '2018-11-05 14:08:20.000', 'master-bin.000159', '298137099', '0', '更新数据条数:8', '2018-11-06 20:06:30', '2018-11-06 20:06:52', '2018-11-05 17:46:30.000', 'master-bin.000159', '375829776');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('87', '20181105', '162.16.4.9:3306', 'risk_uat', 'call_ack_task', '2018-11-05 17:17:32.000', 'master-bin.000159', '369999517', '0', '更新数据条数:13', '2018-11-06 20:06:31', '2018-11-06 20:06:52', '2018-11-05 17:31:54.000', 'master-bin.000159', '371841380');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('88', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-05 17:18:30.000', 'master-bin.000159', '370107722', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:31', '2018-11-06 20:06:31', '2018-11-05 17:18:30.000', 'master-bin.000159', '370107722');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('89', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-05 17:18:30.000', 'master-bin.000159', '370110707', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:31', '2018-11-06 20:06:31', '2018-11-05 17:18:30.000', 'master-bin.000159', '370110707');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('90', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan', '2018-11-05 17:34:21.000', 'master-bin.000159', '372396551', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:31', '2018-11-06 20:06:31', '2018-11-05 17:34:21.000', 'master-bin.000159', '372396551');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('91', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_plan', '2018-11-05 17:34:24.000', 'master-bin.000159', '372516673', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:31', '2018-11-06 20:06:31', '2018-11-05 17:34:24.000', 'master-bin.000159', '372516673');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('92', '20181105', '162.16.4.9:3306', 'prodccsdb', 'ccs_order_hst', '2018-11-05 17:35:14.000', 'master-bin.000159', '373033905', '0', '更新数据条数:37', '2018-11-06 20:06:31', '2018-11-06 20:06:52', '2018-11-05 17:38:26.000', 'master-bin.000159', '374433788');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('93', '20181106', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-06 01:45:33.000', 'master-bin.000159', '440972151', '0', '更新数据条数:7', '2018-11-06 20:06:33', '2018-11-06 22:55:03', '2018-11-06 22:54:41.000', 'master-bin.000159', '786700091');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('94', '20181106', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-06 14:46:50.000', 'master-bin.000159', '547377849', '0', '更新数据条数:2', '2018-11-06 20:06:34', '2018-11-06 22:55:03', '2018-11-06 22:54:54.000', 'master-bin.000159', '786706798');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('95', '20181106', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-06 16:13:00.000', 'master-bin.000159', '699946693', '0', '更新数据条数:3', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:33:57.000', 'master-bin.000159', '756967645');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('96', '20181106', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-06 16:13:00.000', 'master-bin.000159', '699947018', '0', '更新数据条数:10', '2018-11-06 20:06:37', '2018-11-06 20:21:08', '2018-11-06 20:20:53.000', 'master-bin.000159', '775685939');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('97', '20181106', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-06 16:13:00.000', 'master-bin.000159', '699948593', '0', '更新数据条数:13', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:34:31.000', 'master-bin.000159', '757272893');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('98', '20181106', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-06 16:13:01.000', 'master-bin.000159', '699954099', '0', '更新数据条数:4', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:33:57.000', 'master-bin.000159', '756987381');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('99', '20181106', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-06 16:13:01.000', 'master-bin.000159', '699983834', '0', '更新数据条数:14', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:33:59.000', 'master-bin.000159', '757032810');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('100', '20181106', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-06 16:13:02.000', 'master-bin.000159', '699984372', '0', '更新数据条数:3', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:33:58.000', 'master-bin.000159', '756986903');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('101', '20181106', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-06 16:13:02.000', 'master-bin.000159', '699991793', '0', '更新数据条数:3', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:33:58.000', 'master-bin.000159', '757008149');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('102', '20181106', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-06 16:13:04.000', 'master-bin.000159', '700127517', '0', '更新数据条数:8', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:34:31.000', 'master-bin.000159', '757272522');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('103', '20181106', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557257', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:37', '2018-11-06 20:06:37', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557257');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('104', '20181106', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557588', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:37', '2018-11-06 20:06:37', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557588');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('105', '20181106', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557906', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:37', '2018-11-06 20:06:37', '2018-11-06 16:31:01.000', 'master-bin.000159', '739557906');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('106', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-06 16:41:57.000', 'master-bin.000159', '740413777', '0', '更新数据条数:4', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:36:19.000', 'master-bin.000159', '757412866');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('107', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-06 16:41:57.000', 'master-bin.000159', '740416151', '0', '更新数据条数:54', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:40:28.000', 'master-bin.000159', '759075312');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('108', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-06 16:41:57.000', 'master-bin.000159', '740422983', '0', '更新数据条数:8', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:40:01.000', 'master-bin.000159', '758084863');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('109', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-06 16:41:57.000', 'master-bin.000159', '740424424', '0', '更新数据条数:137', '2018-11-06 20:06:37', '2018-11-06 20:06:52', '2018-11-06 17:40:28.000', 'master-bin.000159', '759074002');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('110', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_plan', '2018-11-06 17:39:54.000', 'master-bin.000159', '757736753', '0', '更新数据条数:95', '2018-11-06 20:06:38', '2018-11-06 20:06:52', '2018-11-06 17:40:28.000', 'master-bin.000159', '759078373');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('111', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan', '2018-11-06 17:40:01.000', 'master-bin.000159', '758073231', '0', '更新数据条数:32', '2018-11-06 20:06:38', '2018-11-06 20:06:52', '2018-11-06 17:40:04.000', 'master-bin.000159', '758526627');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('112', '20181106', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg_hst', '2018-11-06 17:40:01.000', 'master-bin.000159', '758076358', '0', '本轮总计更新数据条数:1', '2018-11-06 20:06:38', '2018-11-06 20:06:38', '2018-11-06 17:40:01.000', 'master-bin.000159', '758076358');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('113', '20181107', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-07 00:10:31.000', 'master-bin.000159', '792051441', '5', '更新数据条数', '2018-11-07 00:10:33', '2018-11-07 22:02:32', '2018-11-07 22:02:06.000', 'master-bin.000160', '168032556');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('114', '20181107', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-07 09:08:16.000', 'master-bin.000159', '831907922', '1', '更新数据条数与当前时间', '2018-11-07 09:08:18', '2018-11-07 17:50:04', '2018-11-07 17:50:01.000', 'master-bin.000160', '132607309');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('115', '20181107', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-07 10:08:21.000', 'master-bin.000159', '850634820', '17', '更新数据条数', '2018-11-07 10:08:23', '2018-11-07 17:35:28', '2018-11-07 17:35:14.000', 'master-bin.000160', '129982969');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('116', '20181107', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-07 15:06:22.000', 'master-bin.000159', '898663637', '6', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:35:28', '2018-11-07 17:35:11.000', 'master-bin.000160', '129858861');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('117', '20181107', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-07 15:06:22.000', 'master-bin.000159', '898665556', '24', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:36:30', '2018-11-07 17:35:29.000', 'master-bin.000160', '130152225');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('118', '20181107', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-07 15:06:23.000', 'master-bin.000159', '898671084', '6', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:35:28', '2018-11-07 17:35:06.000', 'master-bin.000160', '129824162');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('119', '20181107', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-07 15:06:23.000', 'master-bin.000159', '898701519', '26', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:35:28', '2018-11-07 17:35:14.000', 'master-bin.000160', '129926932');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('120', '20181107', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-07 15:06:23.000', 'master-bin.000159', '898702057', '6', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:35:28', '2018-11-07 17:35:12.000', 'master-bin.000160', '129881872');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('121', '20181107', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-07 15:06:24.000', 'master-bin.000159', '898708957', '6', '更新数据条数', '2018-11-07 15:06:25', '2018-11-07 17:35:28', '2018-11-07 17:35:13.000', 'master-bin.000160', '129895180');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('122', '20181107', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-07 15:08:15.000', 'master-bin.000159', '900385030', '12', '更新数据条数', '2018-11-07 15:08:15', '2018-11-07 17:36:30', '2018-11-07 17:35:29.000', 'master-bin.000160', '130151854');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('123', '20181107', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-07 15:36:58.000', 'master-bin.000159', '925134397', '6', '更新数据条数', '2018-11-07 15:37:01', '2018-11-07 17:36:30', '2018-11-07 17:35:42.000', 'master-bin.000160', '130210753');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('124', '20181107', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-07 15:36:58.000', 'master-bin.000159', '925134734', '6', '更新数据条数', '2018-11-07 15:37:01', '2018-11-07 17:36:30', '2018-11-07 17:35:42.000', 'master-bin.000160', '130211084');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('125', '20181107', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-07 15:36:58.000', 'master-bin.000159', '925135052', '6', '更新数据条数', '2018-11-07 15:37:01', '2018-11-07 17:36:30', '2018-11-07 17:35:42.000', 'master-bin.000160', '130211402');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('126', '20181107', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-07 17:50:01.000', 'master-bin.000160', '132604931', '1', '初始化记录', '2018-11-07 17:50:04', '2018-11-07 17:50:04', '2018-11-07 17:50:01.000', 'master-bin.000160', '132604931');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('127', '20181107', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-07 17:50:01.000', 'master-bin.000160', '132614185', '2', '更新数据条数', '2018-11-07 17:50:04', '2018-11-07 17:50:47', '2018-11-07 17:50:02.000', 'master-bin.000160', '132622618');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('128', '20181107', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-07 17:50:01.000', 'master-bin.000160', '132615626', '3', '更新数据条数', '2018-11-07 17:50:04', '2018-11-07 17:50:47', '2018-11-07 17:50:02.000', 'master-bin.000160', '132623694');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('129', '20181107', '162.16.6.181:3306', 'riskcontrol', 'inf_customer_credit', '2018-11-07 19:05:18.000', 'mysql-bin.000016', '461946222', '200872', '更新数据条数', '2018-11-07 19:04:48', '2018-11-07 23:58:16', '2018-11-07 23:58:46.000', 'mysql-bin.000016', '748375636');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('130', '20181107', '162.16.6.181:3306', 'riskcontrol', 'inf_customer', '2018-11-07 19:06:01.000', 'mysql-bin.000016', '461950512', '1200420', '更新数据条数', '2018-11-07 19:05:31', '2018-11-07 23:58:16', '2018-11-07 23:58:07.000', 'mysql-bin.000016', '748369706');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('131', '20181107', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-07 22:00:02.000', 'master-bin.000160', '167844391', '1', '初始化记录', '2018-11-07 22:00:17', '2018-11-07 22:00:17', '2018-11-07 22:00:02.000', 'master-bin.000160', '167844391');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('132', '20181108', '162.16.6.181:3306', 'riskcontrol', 'inf_customer', '2018-11-08 00:01:21.000', 'mysql-bin.000016', '748384143', '11554409', '更新数据条数', '2018-11-08 00:00:36', '2018-11-08 23:59:21', '2018-11-08 23:59:59.000', 'mysql-bin.000019', '14220449');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('133', '20181108', '162.16.6.181:3306', 'riskcontrol', 'inf_customer_credit', '2018-11-08 00:01:21.000', 'mysql-bin.000016', '748384584', '1094939', '更新数据条数', '2018-11-08 00:00:36', '2018-11-08 16:29:52', '2018-11-08 16:21:06.000', 'mysql-bin.000017', '549873615');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('134', '20181108', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-08 02:30:30.000', 'master-bin.000160', '197705156', '34', '更新数据条数', '2018-11-08 02:30:48', '2018-11-09 08:15:43', '2018-11-08 21:54:34.000', 'master-bin.000160', '405630326');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('135', '20181108', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-08 02:40:15.000', 'master-bin.000160', '198599783', '17', '更新数据条数', '2018-11-08 02:40:38', '2018-11-08 19:44:08', '2018-11-08 19:23:06.000', 'master-bin.000160', '384734410');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('136', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan', '2018-11-08 09:03:23.000', 'master-bin.000160', '234323644', '122', '更新数据条数', '2018-11-08 09:03:40', '2018-11-08 19:44:08', '2018-11-08 18:19:04.000', 'master-bin.000160', '374076255');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('137', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg_hst', '2018-11-08 09:03:23.000', 'master-bin.000160', '234329700', '20', '更新数据条数', '2018-11-08 09:03:40', '2018-11-08 19:44:08', '2018-11-08 18:00:55.000', 'master-bin.000160', '368418924');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('138', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-08 09:03:23.000', 'master-bin.000160', '234330487', '58', '更新数据条数', '2018-11-08 09:03:40', '2018-11-08 19:44:08', '2018-11-08 18:51:19.000', 'master-bin.000160', '379447546');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('139', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_plan', '2018-11-08 09:03:24.000', 'master-bin.000160', '234391077', '294', '更新数据条数', '2018-11-08 09:03:40', '2018-11-08 19:44:08', '2018-11-08 18:19:04.000', 'master-bin.000160', '374078175');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('140', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-08 09:03:24.000', 'master-bin.000160', '234401385', '165', '更新数据条数', '2018-11-08 09:03:40', '2018-11-08 19:44:08', '2018-11-08 18:51:18.000', 'master-bin.000160', '379438235');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('141', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-08 09:04:07.000', 'master-bin.000160', '234750108', '379', '更新数据条数', '2018-11-08 09:04:25', '2018-11-08 19:44:08', '2018-11-08 18:51:19.000', 'master-bin.000160', '379448620');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('142', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_customer', '2018-11-08 09:14:21.000', 'master-bin.000160', '242303598', '9', '更新数据条数', '2018-11-08 09:14:39', '2018-11-08 19:44:08', '2018-11-08 17:45:05.000', 'master-bin.000160', '364439389');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('143', '20181108', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-08 09:35:46.000', 'master-bin.000160', '244859361', '49', '更新数据条数与当前时间', '2018-11-08 09:36:03', '2018-11-08 20:16:10', '2018-11-08 20:16:10.000', 'master-bin.000160', '393384670');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('144', '20181108', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-08 09:35:46.000', 'master-bin.000160', '244860603', '63', '更新数据条数', '2018-11-08 09:36:03', '2018-11-09 08:15:43', '2018-11-08 20:16:10.000', 'master-bin.000160', '393383942');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('145', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'customer_account', '2018-11-08 09:37:49.000', 'master-bin.000160', '245222469', '23', '更新数据条数', '2018-11-08 09:38:05', '2018-11-08 19:44:08', '2018-11-08 19:42:25.000', 'master-bin.000160', '388472821');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('146', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-08 09:42:49.000', 'master-bin.000160', '246157649', '16', '更新数据条数', '2018-11-08 09:43:04', '2018-11-08 19:44:08', '2018-11-08 19:42:27.000', 'master-bin.000160', '388494104');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('147', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-08 09:42:49.000', 'master-bin.000160', '246157983', '14', '更新数据条数', '2018-11-08 09:43:04', '2018-11-08 19:44:08', '2018-11-08 19:42:27.000', 'master-bin.000160', '388494378');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('148', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-08 09:42:49.000', 'master-bin.000160', '246158301', '14', '更新数据条数', '2018-11-08 09:43:05', '2018-11-08 19:44:08', '2018-11-08 19:42:27.000', 'master-bin.000160', '388494608');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('149', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_contact', '2018-11-08 09:42:49.000', 'master-bin.000160', '246161865', '20', '更新数据条数', '2018-11-08 09:43:05', '2018-11-08 19:44:08', '2018-11-08 19:23:45.000', 'master-bin.000160', '384823207');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('150', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-08 09:44:42.000', 'master-bin.000160', '246985366', '24', '更新数据条数', '2018-11-08 09:44:59', '2018-11-09 08:15:43', '2018-11-08 20:16:13.000', 'master-bin.000160', '393461010');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('151', '20181108', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-08 09:44:42.000', 'master-bin.000160', '246987349', '26', '更新数据条数', '2018-11-08 09:44:59', '2018-11-09 08:15:43', '2018-11-08 20:16:10.000', 'master-bin.000160', '393322020');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('152', '20181108', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-08 09:44:42.000', 'master-bin.000160', '246989033', '16', '更新数据条数与当前时间', '2018-11-08 09:44:59', '2018-11-08 20:16:10', '2018-11-08 20:16:08.000', 'master-bin.000160', '393238480');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('153', '20181108', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-08 09:45:45.000', 'master-bin.000160', '247309701', '36', '更新数据条数', '2018-11-08 09:46:03', '2018-11-09 08:15:43', '2018-11-08 20:16:09.000', 'master-bin.000160', '393267227');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('154', '20181108', '162.16.4.9:3306', 'risk_uat', 'call_ack_task', '2018-11-08 09:45:46.000', 'master-bin.000160', '247355350', '4', '更新数据条数', '2018-11-08 09:46:03', '2018-11-08 09:48:34', '2018-11-08 09:47:22.000', 'master-bin.000160', '247692214');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('155', '20181108', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-08 09:47:01.000', 'master-bin.000160', '247502134', '11', '更新数据条数与当前时间', '2018-11-08 09:47:17', '2018-11-08 20:16:10', '2018-11-08 20:16:07.000', 'master-bin.000160', '393181119');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('156', '20181108', '162.16.4.9:3306', 'wechat2', 'loan_user_info', '2018-11-08 15:25:59.000', 'master-bin.000160', '316904269', '26', '更新数据条数', '2018-11-08 15:26:00', '2018-11-09 08:15:43', '2018-11-08 20:16:02.000', 'master-bin.000160', '393159458');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('157', '20181108', '162.16.4.9:3306', 'wechat2', 'customer_login_record', '2018-11-08 15:28:20.000', 'master-bin.000160', '317225366', '26', '更新数据条数', '2018-11-08 15:28:21', '2018-11-09 08:15:43', '2018-11-08 20:14:30.000', 'master-bin.000160', '392946173');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('158', '20181108', '162.16.4.9:3306', 'wechat2', 'his_loan_user_info', '2018-11-08 15:56:56.000', 'master-bin.000160', '322494806', '12', '更新数据条数与当前时间', '2018-11-08 15:56:57', '2018-11-08 20:16:04', '2018-11-08 20:16:02.000', 'master-bin.000160', '393159702');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('159', '20181108', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-08 16:17:08.000', 'master-bin.000160', '326744681', '15', '更新数据条数与当前时间', '2018-11-08 16:17:08', '2018-11-08 20:16:10', '2018-11-08 20:16:08.000', 'master-bin.000160', '393216215');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('160', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_borrow', '2018-11-08 17:26:36.000', 'master-bin.000160', '338126279', '30', '更新数据条数', '2018-11-08 17:27:19', '2018-11-08 19:44:08', '2018-11-08 18:43:39.000', 'master-bin.000160', '378083370');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('161', '20181108', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_decoration', '2018-11-08 17:44:45.000', 'master-bin.000160', '364346411', '26', '更新数据条数', '2018-11-08 17:44:46', '2018-11-08 19:44:08', '2018-11-08 19:23:45.000', 'master-bin.000160', '384833269');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('162', '20181108', '162.16.4.9:3306', 'prodccsdb', 'ccs_order_hst', '2018-11-08 17:52:58.000', 'master-bin.000160', '366089135', '85', '更新数据条数', '2018-11-08 17:53:00', '2018-11-08 19:44:08', '2018-11-08 18:14:46.000', 'master-bin.000160', '371258895');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('163', '20181108', '162.16.6.181:3306', 'canal_tsdb', 'test_table2', '2018-11-08 19:34:54.000', 'mysql-bin.000017', '767935287', '10', '更新数据条数', '2018-11-08 19:34:10', '2018-11-08 20:04:42', '2018-11-08 20:00:32.000', 'mysql-bin.000017', '767998327');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('164', '20181109', '162.16.6.181:3306', 'riskcontrol', 'inf_customer', '2018-11-09 00:00:05.000', 'mysql-bin.000019', '14226392', '50561358', '更新数据条数', '2018-11-09 08:16:32', '2018-11-09 19:22:43', '2018-11-09 19:22:12.000', 'mysql-bin.000026', '704959296');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('165', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_credit_frozen', '2018-11-09 09:27:59.000', 'master-bin.000160', '498833686', '2', '更新数据条数与当前时间', '2018-11-09 09:28:01', '2018-11-09 11:04:48', '2018-11-09 11:04:47.000', 'master-bin.000160', '526390359');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('166', '20181109', '162.16.4.9:3306', 'risk_uat', 'his_customer_credit', '2018-11-09 09:27:59.000', 'master-bin.000160', '498833994', '14', '更新数据条数', '2018-11-09 09:28:01', '2018-11-09 19:20:36', '2018-11-09 11:10:05.000', 'master-bin.000160', '527130058');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('167', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_customer_credit', '2018-11-09 09:27:59.000', 'master-bin.000160', '498834385', '14', '更新数据条数', '2018-11-09 09:28:01', '2018-11-09 19:20:36', '2018-11-09 11:10:05.000', 'master-bin.000160', '527130643');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('168', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_occupation', '2018-11-09 09:51:37.000', 'master-bin.000160', '501894794', '2', '更新数据条数与当前时间', '2018-11-09 09:51:41', '2018-11-09 11:13:05', '2018-11-09 11:13:03.000', 'master-bin.000160', '528098097');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('169', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_contact', '2018-11-09 09:51:37.000', 'master-bin.000160', '501897663', '2', '初始化记录', '2018-11-09 09:51:41', '2018-11-09 09:51:41', '2018-11-09 09:51:37.000', 'master-bin.000160', '501897663');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('170', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_base', '2018-11-09 09:51:37.000', 'master-bin.000160', '501899306', '2', '更新数据条数与当前时间', '2018-11-09 09:51:41', '2018-11-09 11:13:05', '2018-11-09 11:13:03.000', 'master-bin.000160', '528097448');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('171', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_cust_address', '2018-11-09 09:51:38.000', 'master-bin.000160', '501920767', '2', '更新数据条数与当前时间', '2018-11-09 09:51:41', '2018-11-09 11:13:05', '2018-11-09 11:13:03.000', 'master-bin.000160', '528097779');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('172', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'customer_account', '2018-11-09 09:51:38.000', 'master-bin.000160', '501921341', '1', '初始化记录', '2018-11-09 09:51:41', '2018-11-09 09:51:41', '2018-11-09 09:51:38.000', 'master-bin.000160', '501921341');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('173', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'inf_customer_borrow', '2018-11-09 09:51:38.000', 'master-bin.000160', '501923014', '3', '初始化记录', '2018-11-09 09:51:41', '2018-11-09 09:51:41', '2018-11-09 09:51:38.000', 'master-bin.000160', '501923014');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('174', '20181109', '162.16.4.9:3306', 'migration_sdv_isop', 'customer', '2018-11-09 09:51:38.000', 'master-bin.000160', '501924304', '2', '更新数据条数', '2018-11-09 09:51:41', '2018-11-09 10:26:57', '2018-11-09 10:12:19.000', 'master-bin.000160', '505514273');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('175', '20181109', '162.16.4.9:3306', 'risk_uat', 'customer_credit_apply_log', '2018-11-09 10:12:19.000', 'master-bin.000160', '505506867', '1', '初始化记录', '2018-11-09 10:12:19', '2018-11-09 10:12:19', '2018-11-09 10:12:19.000', 'master-bin.000160', '505506867');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('176', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_customer', '2018-11-09 10:12:19.000', 'master-bin.000160', '505507192', '2', '更新数据条数', '2018-11-09 10:12:19', '2018-11-09 10:26:57', '2018-11-09 10:12:22.000', 'master-bin.000160', '505632681');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('177', '20181109', '162.16.4.9:3306', 'risk_uat', 'interface_log', '2018-11-09 10:12:20.000', 'master-bin.000160', '505547741', '4', '更新数据条数', '2018-11-09 10:12:22', '2018-11-09 10:26:57', '2018-11-09 10:12:22.000', 'master-bin.000160', '505578154');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('178', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_baiqishi', '2018-11-09 10:12:20.000', 'master-bin.000160', '505548279', '1', '初始化记录', '2018-11-09 10:12:22', '2018-11-09 10:12:22', '2018-11-09 10:12:20.000', 'master-bin.000160', '505548279');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('179', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_tongdun', '2018-11-09 10:12:20.000', 'master-bin.000160', '505555608', '1', '初始化记录', '2018-11-09 10:12:23', '2018-11-09 10:12:23', '2018-11-09 10:12:20.000', 'master-bin.000160', '505555608');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('180', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_order', '2018-11-09 10:20:20.000', 'master-bin.000160', '506984632', '400', '更新数据条数', '2018-11-09 10:20:23', '2018-11-09 19:22:44', '2018-11-09 19:22:00.000', 'master-bin.000160', '661810746');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('181', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_acct', '2018-11-09 10:20:25.000', 'master-bin.000160', '507104705', '58', '更新数据条数', '2018-11-09 10:20:26', '2018-11-09 19:20:36', '2018-11-09 18:12:07.000', 'master-bin.000160', '651903470');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('182', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_plan', '2018-11-09 10:20:25.000', 'master-bin.000160', '507107744', '106', '更新数据条数', '2018-11-09 10:20:26', '2018-11-09 19:20:36', '2018-11-09 18:12:07.000', 'master-bin.000160', '651890636');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('183', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan', '2018-11-09 10:20:58.000', 'master-bin.000160', '507396975', '42', '更新数据条数', '2018-11-09 10:21:00', '2018-11-09 19:20:36', '2018-11-09 18:12:07.000', 'master-bin.000160', '651906133');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('184', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg_hst', '2018-11-09 10:20:58.000', 'master-bin.000160', '507399077', '7', '更新数据条数', '2018-11-09 10:21:00', '2018-11-09 19:20:36', '2018-11-09 18:12:05.000', 'master-bin.000160', '651816492');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('185', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_loan_reg', '2018-11-09 10:20:58.000', 'master-bin.000160', '507399853', '22', '更新数据条数', '2018-11-09 10:21:00', '2018-11-09 19:20:36', '2018-11-09 18:12:05.000', 'master-bin.000160', '651817279');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('186', '20181109', '162.16.4.9:3306', 'risk_uat', 'inf_credit_unfrozen', '2018-11-09 11:04:47.000', 'master-bin.000160', '526388886', '1', '初始化记录', '2018-11-09 11:04:48', '2018-11-09 11:04:48', '2018-11-09 11:04:47.000', 'master-bin.000160', '526388886');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('187', '20181109', '162.16.4.9:3306', 'wechat2', 'wechatmember', '2018-11-09 11:33:39.000', 'master-bin.000160', '535398243', '5', '更新数据条数', '2018-11-09 11:33:40', '2018-11-09 19:20:36', '2018-11-09 18:17:07.000', 'master-bin.000160', '652648165');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('188', '20181109', '162.16.4.9:3306', 'wechat2', 'feedback_record', '2018-11-09 11:33:52.000', 'master-bin.000160', '535418563', '2', '更新数据条数', '2018-11-09 11:33:55', '2018-11-09 19:20:36', '2018-11-09 15:11:37.000', 'master-bin.000160', '575011400');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('189', '20181109', '162.16.4.9:3306', 'prodccsdb', 'ccs_order_hst', '2018-11-09 14:57:56.000', 'master-bin.000160', '571364128', '59', '更新数据条数', '2018-11-09 14:57:58', '2018-11-09 19:20:36', '2018-11-09 18:12:04.000', 'master-bin.000160', '651715759');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('190', '20181109', '162.16.6.181:3306', 'riskcontrol', 'inf_customer_credit', '2018-11-09 18:28:59.000', 'mysql-bin.000026', '100261754', '239528', '更新数据条数', '2018-11-09 18:28:18', '2018-11-09 19:22:43', '2018-11-09 19:22:24.000', 'mysql-bin.000026', '707920079');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('191', '20181109', '162.16.6.181:3306', 'isop', 'customer', '2018-11-09 19:10:47.000', 'mysql-bin.000026', '492815020', '208734', '更新数据条数', '2018-11-09 19:10:14', '2018-11-09 19:22:43', '2018-11-09 19:22:15.000', 'mysql-bin.000026', '705894774');
INSERT INTO `canal_extract_tbl_monitor` VALUES ('192', '20181109', '162.16.6.181:3306', 'wechat', 'wechatmember', '2018-11-09 19:19:09.000', 'mysql-bin.000026', '649900546', '12096', '更新数据条数', '2018-11-09 19:18:31', '2018-11-09 19:22:43', '2018-11-09 19:22:17.000', 'mysql-bin.000026', '706452562');

-- ----------------------------
-- Table structure for hbase_tbl_batch_del_audit
-- ----------------------------
DROP TABLE IF EXISTS `hbase_tbl_batch_del_audit`;
CREATE TABLE `hbase_tbl_batch_del_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(255) DEFAULT '',
  `table_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0：失败，1：成功）',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `del_size` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hbase_tbl_batch_del_audit
-- ----------------------------
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('4', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:42:33', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('5', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:42:34', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('6', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:42:34', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('7', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:43:11', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('8', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:43:11', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('9', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 18:43:11', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('10', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:29:03', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('11', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:29:03', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('12', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:29:03', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('13', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:30:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('14', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:30:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('15', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:30:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('16', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:35:16', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('17', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:35:16', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('18', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:35:16', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('19', 'ccs', 'account', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:41:13', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('20', 'ccs', 'customer', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:41:13', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('21', 'ccs', 'order', '1', '2018-10-30 00:00:00', '2018-10-31 00:00:00', '0', '2018-10-31 19:41:13', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('22', 'ccs', 'account', '1', '2018-10-31 00:00:00', '2018-11-01 00:00:00', '0', '2018-10-31 19:45:29', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('23', 'ccs', 'customer', '1', '2018-10-31 00:00:00', '2018-11-01 00:00:00', '221907', '2018-10-31 19:45:34', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('24', 'ccs', 'order', '1', '2018-10-31 00:00:00', '2018-11-01 00:00:00', '0', '2018-10-31 19:45:34', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('25', 'ccs', 'account', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:56:08', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('26', 'ccs', 'customer', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:56:08', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('27', 'ccs', 'order', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:56:08', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('28', 'ccs', 'account', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:07', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('29', 'ccs', 'customer', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:07', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('30', 'ccs', 'order', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:07', 'fail');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('31', 'ccs', 'account', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:49', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('32', 'ccs', 'customer', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:49', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('33', 'ccs', 'order', '1', '2018-11-03 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 08:58:49', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('34', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '46993', '2018-11-05 08:59:37', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('35', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '46872', '2018-11-05 08:59:38', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('36', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '46995', '2018-11-05 08:59:38', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('37', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:01:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('38', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:01:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('39', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:01:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('40', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '1922', '2018-11-05 09:03:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('41', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '1831', '2018-11-05 09:03:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('42', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '1993', '2018-11-05 09:03:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('43', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '26614', '2018-11-05 09:05:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('44', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '27020', '2018-11-05 09:05:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('45', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '27305', '2018-11-05 09:05:37', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('46', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '22563', '2018-11-05 09:07:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('47', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '22084', '2018-11-05 09:07:39', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('48', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '21963', '2018-11-05 09:07:40', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('49', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:09:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('50', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:09:36', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('51', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:09:37', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('52', 'ccs', 'account', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:11:35', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('53', 'ccs', 'customer', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:11:37', 'success');
INSERT INTO `hbase_tbl_batch_del_audit` VALUES ('54', 'ccs', 'order', '1', '2018-11-02 00:00:00', '2018-11-06 00:00:00', '0', '2018-11-05 09:11:38', 'success');

-- ----------------------------
-- Table structure for hbase_tbl_batch_del_cfg
-- ----------------------------
DROP TABLE IF EXISTS `hbase_tbl_batch_del_cfg`;
CREATE TABLE `hbase_tbl_batch_del_cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(255) DEFAULT '',
  `table_name` varchar(255) NOT NULL,
  `start_days_from_now` int(11) NOT NULL DEFAULT '1',
  `delete_days` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0：禁用，1：启用，9：删除）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_hbase_delete_db_table` (`db_name`,`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hbase_tbl_batch_del_cfg
-- ----------------------------
INSERT INTO `hbase_tbl_batch_del_cfg` VALUES ('1', 'ccs', 'account', '-1', '4', '1', null, null, null);
INSERT INTO `hbase_tbl_batch_del_cfg` VALUES ('2', 'ccs', 'customer', '-1', '4', '1', null, null, null);
INSERT INTO `hbase_tbl_batch_del_cfg` VALUES ('3', 'ccs', 'order', '-1', '4', '1', null, null, null);
INSERT INTO `hbase_tbl_batch_del_cfg` VALUES ('4', '22', '11', '11', '11', '9', '2018-11-07 15:13:19', '2018-11-07 17:56:55', '修改为删除状态');

-- ----------------------------
-- Table structure for kafka_topic_grp_cfg
-- ----------------------------
DROP TABLE IF EXISTS `kafka_topic_grp_cfg`;
CREATE TABLE `kafka_topic_grp_cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) NOT NULL,
  `grp_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '监控状态（0：禁用，1：启用，9：删除）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_kafka_topic_group_cfg` (`topic_name`,`grp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kafka_topic_grp_cfg
-- ----------------------------
INSERT INTO `kafka_topic_grp_cfg` VALUES ('2', 'test-topic-1', 'ConsumerToHDFSApp', '1', '2018-10-25 14:43:06', '2018-11-07 17:26:37', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('3', 'test-topic-2', 'ConsumerToHDFSApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('4', 'test-topic-3', 'ConsumerToHDFSApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('6', 'test-topic-3', 'ConsumerToHBaseApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('7', 'test-topic-2', 'ConsumerToHBaseApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('9', 'test-topic-1', 'ConsumerToHBaseApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('11', 'test-topic-3', 'ConsumerToKuduApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('12', 'test-topic-2', 'ConsumerToKuduApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('13', 'test-topic-1', 'ConsumerToKuduApp', '1', '2018-10-25 14:43:06', '2018-10-25 14:43:06', 'for test');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('14', 'test_sync_migration_sdv_isop_0', 'ConsumerToHDFSApp', '1', '2018-11-07 11:20:40', '2018-11-07 17:51:00', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('15', 'test_sync_risk_uat_0', 'ConsumerToHDFSApp', '1', '2018-11-07 11:22:57', '2018-11-07 17:51:20', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('16', 'test_sync_prodccsdb_0', 'ConsumerToHDFSApp', '1', '2018-11-07 11:24:23', '2018-11-07 17:51:07', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('17', 'test_sync_wechat2_0', 'ConsumerToHDFSApp', '1', '2018-11-07 11:24:45', '2018-11-07 17:51:28', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('18', 'test_sync_riskcontrol_0', 'ConsumerToHDFSApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('19', 'test_sync_migration_sdv_isop_0', 'ConsumerToKuduApp', '1', '2018-11-07 11:26:59', '2018-11-07 11:26:59', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('20', 'test_sync_risk_uat_0', 'ConsumerToKuduApp', '1', '2018-11-07 11:30:01', '2018-11-07 11:30:01', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('21', 'test_sync_prodccsdb_0', 'ConsumerToKuduApp', '1', '2018-11-07 11:30:48', '2018-11-08 08:58:53', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('25', 'test_sync_wechat2_0', 'ConsumerToKuduApp', '1', '2018-11-07 11:24:45', '2018-11-07 17:51:28', '');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('26', 'test_sync_riskcontrol_0', 'ConsumerToKuduApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', '');
INSERT INTO `kafka_topic_grp_cfg` VALUES ('27', 'test_sync_migration_sdv_isop_0', 'ConsumerToHBaseApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('28', 'test_sync_risk_uat_0', 'ConsumerToHBaseApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('29', 'test_sync_prodccsdb_0', 'ConsumerToHBaseApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('30', 'test_sync_wechat2_0', 'ConsumerToHBaseApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);
INSERT INTO `kafka_topic_grp_cfg` VALUES ('31', 'test_sync_riskcontrol_0', 'ConsumerToHBaseApp', '1', '2018-11-07 11:25:03', '2018-11-07 11:25:03', null);

-- ----------------------------
-- Table structure for kafka_topic_grp_monitor
-- ----------------------------
DROP TABLE IF EXISTS `kafka_topic_grp_monitor`;
CREATE TABLE `kafka_topic_grp_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_id` int(11) NOT NULL COMMENT '日期ID，格式YYYYMMdd',
  `topic_name` varchar(255) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `grp_name` varchar(255) NOT NULL,
  `start_offset` bigint(20) DEFAULT NULL,
  `curr_offset` bigint(20) DEFAULT NULL,
  `latest_offset` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_kafka_topic_group_partition_monitor` (`topic_name`,`partition_id`,`grp_name`,`date_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kafka_topic_grp_monitor
-- ----------------------------
INSERT INTO `kafka_topic_grp_monitor` VALUES ('9', '20181025', 'test-topic-1', '0', 'KafkaToHBaseGroup', '0', '10108200', '10108200', null, '2018-10-25 16:19:57', '2018-10-25 19:27:25');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('10', '20181025', 'test-topic-1', '0', 'kafka_hdfs_group_2', '0', '10108200', '10108200', null, '2018-10-25 16:19:57', '2018-10-25 19:27:25');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('11', '20181025', 'test-topic-2', '0', 'kafka_hdfs_group_2', '0', '0', '0', null, '2018-10-25 16:19:57', '2018-10-25 19:27:25');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('12', '20181025', 'test-topic-2', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-10-25 16:19:57', '2018-10-25 19:27:25');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('15', '20181030', 'test-topic-1', '0', 'KafkaToHBaseGroup', '0', null, '10129200', null, '2018-10-30 14:43:31', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('16', '20181030', 'test-topic-1', '0', 'kafka_hdfs_group_2', '0', null, '10129200', null, '2018-10-30 14:43:31', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('17', '20181030', 'test-topic-2', '0', 'kafka_hdfs_group_2', '0', null, '0', null, '2018-10-30 14:43:32', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('18', '20181030', 'test-topic-2', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-10-30 14:43:32', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('19', '20181030', 'sync_isop_1', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-10-30 14:43:32', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('20', '20181030', 'test-topic-3', '0', 'ConsumerToHBaseApp', '0', '1006185', '1006185', null, '2018-10-30 14:43:32', '2018-10-30 17:19:52');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('21', '20181031', 'test-topic-1', '0', 'KafkaToHBaseGroup', '0', null, '10129200', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('22', '20181031', 'test-topic-1', '0', 'kafka_hdfs_group_2', '0', null, '10129200', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('23', '20181031', 'test-topic-2', '0', 'kafka_hdfs_group_2', '0', null, '0', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('24', '20181031', 'test-topic-2', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('25', '20181031', 'sync_isop_1', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('26', '20181031', 'test-topic-3', '0', 'ConsumerToHBaseApp', '0', '2006185', '2006185', null, '2018-10-31 10:18:54', '2018-10-31 11:30:38');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('27', '20181102', 'test-topic-1', '0', 'KafkaToHBaseGroup', '10129200', null, '10229200', null, '2018-11-02 09:33:21', '2018-11-02 09:49:40');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('28', '20181102', 'test-topic-1', '0', 'kafka_hdfs_group_2', '10129200', null, '10229200', null, '2018-11-02 09:33:21', '2018-11-02 09:50:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('29', '20181102', 'test-topic-2', '0', 'kafka_hdfs_group_2', '0', null, '100000', null, '2018-11-02 09:33:21', '2018-11-02 09:50:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('30', '20181102', 'test-topic-2', '0', 'KafkaToHBaseGroup', '0', null, '100000', null, '2018-11-02 09:33:21', '2018-11-02 09:49:40');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('31', '20181102', 'sync_isop_1', '0', 'KafkaToHBaseGroup', '0', null, '0', null, '2018-11-02 09:33:21', '2018-11-02 09:49:40');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('32', '20181102', 'test-topic-3', '0', 'ConsumerToHBaseApp', '0', '2106185', '2106185', null, '2018-11-02 09:33:21', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('33', '20181102', 'test-topic-2', '0', 'ConsumerToHBaseApp', '0', '100000', '100000', null, '2018-11-02 09:48:39', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('34', '20181102', 'test-topic-1', '0', 'ConsumerToHBaseApp', '10129200', '10229200', '10229200', null, '2018-11-02 09:49:00', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('35', '20181102', 'test-topic-3', '0', 'ConsumerToHDFSApp', '0', '2106185', '2106185', null, '2018-11-02 09:50:10', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('36', '20181102', 'test-topic-1', '0', 'ConsumerToHDFSApp', '10129200', '10229200', '10229200', null, '2018-11-02 09:50:20', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('37', '20181102', 'test-topic-2', '0', 'ConsumerToHDFSApp', '0', '100000', '100000', null, '2018-11-02 09:50:20', '2018-11-02 18:44:09');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('38', '20181105', 'test-topic-1', '0', 'ConsumerToHDFSApp', '10129200', '10329200', '10329200', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('39', '20181105', 'test-topic-2', '0', 'ConsumerToHDFSApp', '0', '200000', '200000', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('40', '20181105', 'test-topic-3', '0', 'ConsumerToHBaseApp', '0', '4206185', '4206185', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('41', '20181105', 'test-topic-2', '0', 'ConsumerToHBaseApp', '0', '200000', '200000', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('42', '20181105', 'test-topic-1', '0', 'ConsumerToHBaseApp', '10129200', '10329200', '10329200', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('43', '20181105', 'test-topic-3', '0', 'ConsumerToHDFSApp', '0', '2206185', '4206185', null, '2018-11-05 09:01:00', '2018-11-05 11:17:47');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('44', '20181107', 'test-topic-1', '0', 'ConsumerToHDFSApp', '2424096', '2424096', '2424096', null, '2018-11-07 11:36:33', '2018-11-07 17:24:37');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('45', '20181107', 'test-topic-2', '1', 'ConsumerToHDFSApp', '0', '887380', '887433', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('46', '20181107', 'test-topic-2', '0', 'ConsumerToHDFSApp', '0', '888908', '889067', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('47', '20181107', 'test-topic-3', '1', 'ConsumerToHDFSApp', '1984', '2219', '2219', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('48', '20181107', 'test-topic-3', '0', 'ConsumerToHDFSApp', '2016', '2281', '2281', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('49', '20181107', 'test-topic-3', '1', 'ConsumerToHBaseApp', '1984', null, '2219', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('50', '20181107', 'test-topic-3', '0', 'ConsumerToHBaseApp', '2016', null, '2281', null, '2018-11-07 11:36:33', '2018-11-07 23:53:33');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('51', '20181107', 'test-topic-2', '1', 'ConsumerToHBaseApp', '0', null, '887433', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('52', '20181107', 'test-topic-2', '0', 'ConsumerToHBaseApp', '0', null, '889067', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('53', '20181107', 'test-topic-1', '0', 'ConsumerToHBaseApp', '2424096', null, '2424096', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('54', '20181107', 'test-topic-3', '1', 'ConsumerToKuduApp', '1984', '2219', '2219', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('55', '20181107', 'test-topic-3', '0', 'ConsumerToKuduApp', '2016', '2281', '2281', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('56', '20181107', 'test-topic-2', '1', 'ConsumerToKuduApp', '0', '887270', '887433', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('57', '20181107', 'test-topic-2', '0', 'ConsumerToKuduApp', '0', '888930', '889067', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('58', '20181107', 'test-topic-1', '0', 'ConsumerToKuduApp', '2424096', '2424096', '2424096', null, '2018-11-07 11:36:33', '2018-11-07 23:53:34');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('59', '20181108', 'test-topic-2', '1', 'ConsumerToHDFSApp', '0', '1748436', '1748436', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('60', '20181108', 'test-topic-2', '0', 'ConsumerToHDFSApp', '0', '1752736', '1752736', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('61', '20181108', 'test-topic-3', '1', 'ConsumerToHDFSApp', '1984', '2219', '2219', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('62', '20181108', 'test-topic-3', '0', 'ConsumerToHDFSApp', '2016', '2281', '2281', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('63', '20181108', 'test-topic-3', '1', 'ConsumerToHBaseApp', '1984', null, '2219', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('64', '20181108', 'test-topic-3', '0', 'ConsumerToHBaseApp', '2016', null, '2281', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('65', '20181108', 'test-topic-2', '1', 'ConsumerToHBaseApp', '0', null, '1748436', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('66', '20181108', 'test-topic-2', '0', 'ConsumerToHBaseApp', '0', null, '1752736', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('67', '20181108', 'test-topic-1', '0', 'ConsumerToHBaseApp', '2424096', null, '2424096', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('68', '20181108', 'test-topic-3', '1', 'ConsumerToKuduApp', '1984', '2219', '2219', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('69', '20181108', 'test-topic-3', '0', 'ConsumerToKuduApp', '2016', '2281', '2281', null, '2018-11-07 23:53:44', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('70', '20181108', 'test-topic-2', '1', 'ConsumerToKuduApp', '0', '1748436', '1748436', null, '2018-11-07 23:53:44', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('71', '20181108', 'test-topic-2', '0', 'ConsumerToKuduApp', '0', '1752736', '1752736', null, '2018-11-07 23:53:44', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('72', '20181108', 'test-topic-1', '0', 'ConsumerToKuduApp', '2424096', '2424096', '2424096', null, '2018-11-07 23:53:44', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('83', '20181108', 'test-topic-1', '0', 'ConsumerToHDFSApp', '2424096', '2424096', '2424096', null, '2018-11-08 15:31:15', '2018-11-08 23:53:19');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('104', '20181108', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToHDFSApp', '0', '142', '142', null, '2018-11-08 15:40:56', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('105', '20181108', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToHDFSApp', '0', '105', '105', null, '2018-11-08 15:40:56', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('106', '20181108', 'test_sync_risk_uat_0', '1', 'ConsumerToHDFSApp', '0', '226', '226', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('107', '20181108', 'test_sync_risk_uat_0', '0', 'ConsumerToHDFSApp', '0', '141', '141', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('108', '20181108', 'test_sync_prodccsdb_0', '1', 'ConsumerToHDFSApp', '0', '450', '450', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('109', '20181108', 'test_sync_prodccsdb_0', '0', 'ConsumerToHDFSApp', '0', '732', '732', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('110', '20181108', 'test_sync_wechat2_0', '1', 'ConsumerToHDFSApp', '0', '96', '96', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('111', '20181108', 'test_sync_wechat2_0', '0', 'ConsumerToHDFSApp', '0', '105', '105', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('112', '20181108', 'test_sync_riskcontrol_0', '0', 'ConsumerToHDFSApp', '0', '250873', '251005', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('113', '20181108', 'test_sync_riskcontrol_0', '1', 'ConsumerToHDFSApp', '0', '258043', '258043', null, '2018-11-08 15:41:08', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('114', '20181108', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToKuduApp', '0', '142', '142', null, '2018-11-08 15:41:20', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('115', '20181108', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToKuduApp', '0', '105', '105', null, '2018-11-08 15:41:20', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('116', '20181108', 'test_sync_risk_uat_0', '1', 'ConsumerToKuduApp', '0', '226', '226', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('117', '20181108', 'test_sync_risk_uat_0', '0', 'ConsumerToKuduApp', '0', '141', '141', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('118', '20181108', 'test_sync_prodccsdb_0', '1', 'ConsumerToKuduApp', '0', '450', '450', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('119', '20181108', 'test_sync_prodccsdb_0', '0', 'ConsumerToKuduApp', '0', '732', '732', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('120', '20181108', 'test_sync_wechat2_0', '1', 'ConsumerToKuduApp', '0', '96', '96', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('121', '20181108', 'test_sync_wechat2_0', '0', 'ConsumerToKuduApp', '0', '105', '105', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('122', '20181108', 'test_sync_riskcontrol_0', '0', 'ConsumerToKuduApp', '0', '251005', '251005', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('123', '20181108', 'test_sync_riskcontrol_0', '1', 'ConsumerToKuduApp', '0', '258043', '258043', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('124', '20181108', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToHBaseApp', '0', null, '142', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('125', '20181108', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToHBaseApp', '0', null, '105', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('126', '20181108', 'test_sync_risk_uat_0', '1', 'ConsumerToHBaseApp', '0', null, '226', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('127', '20181108', 'test_sync_risk_uat_0', '0', 'ConsumerToHBaseApp', '0', null, '141', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('128', '20181108', 'test_sync_prodccsdb_0', '1', 'ConsumerToHBaseApp', '0', null, '450', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('129', '20181108', 'test_sync_prodccsdb_0', '0', 'ConsumerToHBaseApp', '0', null, '732', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('130', '20181108', 'test_sync_wechat2_0', '1', 'ConsumerToHBaseApp', '0', null, '96', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('131', '20181108', 'test_sync_wechat2_0', '0', 'ConsumerToHBaseApp', '0', null, '105', null, '2018-11-08 15:41:32', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('132', '20181108', 'test_sync_riskcontrol_0', '0', 'ConsumerToHBaseApp', '0', null, '251005', null, '2018-11-08 15:41:33', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('133', '20181108', 'test_sync_riskcontrol_0', '1', 'ConsumerToHBaseApp', '0', null, '258043', null, '2018-11-08 15:41:33', '2018-11-08 23:53:20');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('134', '20181109', 'test-topic-1', '0', 'ConsumerToHDFSApp', '2424096', null, '2424096', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('135', '20181109', 'test-topic-2', '1', 'ConsumerToHDFSApp', '0', null, '1748436', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('136', '20181109', 'test-topic-2', '0', 'ConsumerToHDFSApp', '0', null, '1752736', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('137', '20181109', 'test-topic-3', '1', 'ConsumerToHDFSApp', '1984', null, '2219', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('138', '20181109', 'test-topic-3', '0', 'ConsumerToHDFSApp', '2016', null, '2281', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('139', '20181109', 'test-topic-3', '1', 'ConsumerToHBaseApp', '1984', null, '2219', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('140', '20181109', 'test-topic-3', '0', 'ConsumerToHBaseApp', '2016', null, '2281', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('141', '20181109', 'test-topic-2', '1', 'ConsumerToHBaseApp', '0', null, '1748436', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('142', '20181109', 'test-topic-2', '0', 'ConsumerToHBaseApp', '0', null, '1752736', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('143', '20181109', 'test-topic-1', '0', 'ConsumerToHBaseApp', '2424096', null, '2424096', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('144', '20181109', 'test-topic-3', '1', 'ConsumerToKuduApp', '1984', null, '2219', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('145', '20181109', 'test-topic-3', '0', 'ConsumerToKuduApp', '2016', null, '2281', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('146', '20181109', 'test-topic-2', '1', 'ConsumerToKuduApp', '0', null, '1748436', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('147', '20181109', 'test-topic-2', '0', 'ConsumerToKuduApp', '0', null, '1752736', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('148', '20181109', 'test-topic-1', '0', 'ConsumerToKuduApp', '2424096', null, '2424096', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('149', '20181109', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToHDFSApp', '0', '152', '152', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('150', '20181109', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToHDFSApp', '0', '109', '109', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('151', '20181109', 'test_sync_risk_uat_0', '1', 'ConsumerToHDFSApp', '0', '260', '260', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('152', '20181109', 'test_sync_risk_uat_0', '0', 'ConsumerToHDFSApp', '0', '161', '161', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('153', '20181109', 'test_sync_prodccsdb_0', '1', 'ConsumerToHDFSApp', '0', '909', '909', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('154', '20181109', 'test_sync_prodccsdb_0', '0', 'ConsumerToHDFSApp', '0', '1124', '1124', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('155', '20181109', 'test_sync_wechat2_0', '1', 'ConsumerToHDFSApp', '0', '108', '108', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('156', '20181109', 'test_sync_wechat2_0', '0', 'ConsumerToHDFSApp', '0', '107', '107', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('157', '20181109', 'test_sync_riskcontrol_0', '0', 'ConsumerToHDFSApp', '0', '1003110', '1003177', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('158', '20181109', 'test_sync_riskcontrol_0', '1', 'ConsumerToHDFSApp', '0', '1002679', '1002708', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('159', '20181109', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToKuduApp', '0', '152', '152', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('160', '20181109', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToKuduApp', '0', '109', '109', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('161', '20181109', 'test_sync_risk_uat_0', '1', 'ConsumerToKuduApp', '0', '260', '260', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('162', '20181109', 'test_sync_risk_uat_0', '0', 'ConsumerToKuduApp', '0', '161', '161', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('163', '20181109', 'test_sync_prodccsdb_0', '1', 'ConsumerToKuduApp', '0', '909', '909', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('164', '20181109', 'test_sync_prodccsdb_0', '0', 'ConsumerToKuduApp', '0', '1124', '1124', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('165', '20181109', 'test_sync_wechat2_0', '1', 'ConsumerToKuduApp', '0', '108', '108', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('166', '20181109', 'test_sync_wechat2_0', '0', 'ConsumerToKuduApp', '0', '107', '107', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('167', '20181109', 'test_sync_riskcontrol_0', '0', 'ConsumerToKuduApp', '0', '1003110', '1003185', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('168', '20181109', 'test_sync_riskcontrol_0', '1', 'ConsumerToKuduApp', '0', '1002697', '1002708', null, '2018-11-08 23:53:50', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('169', '20181109', 'test_sync_migration_sdv_isop_0', '1', 'ConsumerToHBaseApp', '0', null, '152', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('170', '20181109', 'test_sync_migration_sdv_isop_0', '0', 'ConsumerToHBaseApp', '0', null, '109', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('171', '20181109', 'test_sync_risk_uat_0', '1', 'ConsumerToHBaseApp', '0', null, '260', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('172', '20181109', 'test_sync_risk_uat_0', '0', 'ConsumerToHBaseApp', '0', null, '161', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('173', '20181109', 'test_sync_prodccsdb_0', '1', 'ConsumerToHBaseApp', '0', null, '909', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('174', '20181109', 'test_sync_prodccsdb_0', '0', 'ConsumerToHBaseApp', '0', null, '1124', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('175', '20181109', 'test_sync_wechat2_0', '1', 'ConsumerToHBaseApp', '0', null, '108', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('176', '20181109', 'test_sync_wechat2_0', '0', 'ConsumerToHBaseApp', '0', null, '107', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('177', '20181109', 'test_sync_riskcontrol_0', '0', 'ConsumerToHBaseApp', '0', null, '1003193', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');
INSERT INTO `kafka_topic_grp_monitor` VALUES ('178', '20181109', 'test_sync_riskcontrol_0', '1', 'ConsumerToHBaseApp', '0', null, '1002708', null, '2018-11-08 23:53:51', '2018-11-09 19:23:10');

-- ----------------------------
-- Table structure for oozie_task
-- ----------------------------
DROP TABLE IF EXISTS `oozie_task`;
CREATE TABLE `oozie_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `exec_date` datetime DEFAULT NULL,
  `task_status` int(11) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_oozie_task_name` (`task_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oozie_task
-- ----------------------------
INSERT INTO `oozie_task` VALUES ('1', 'shell-wf', '2018-08-30 09:17:31', '1', 'test', '2018-08-30 10:12:09');
INSERT INTO `oozie_task` VALUES ('2', 'shell-wf2', '2018-08-30 09:17:31', '1', 'test', '2018-08-30 15:43:13');
INSERT INTO `oozie_task` VALUES ('3', 'shell-wf3', '2018-08-30 09:17:31', '0', 'test', '2018-08-30 09:17:35');
INSERT INTO `oozie_task` VALUES ('4', 'shell-wf4', '2018-08-30 09:17:31', '0', 'test', '2018-08-30 09:17:35');

-- ----------------------------
-- Table structure for sync_table_schema
-- ----------------------------
DROP TABLE IF EXISTS `sync_table_schema`;
CREATE TABLE `sync_table_schema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` varchar(255) NOT NULL,
  `db_id` varchar(255) NOT NULL,
  `table_type` int(11) DEFAULT NULL COMMENT '数据表类型',
  `schema_json` varchar(4096) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_table_schema_db_tbl` (`table_id`,`db_id`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sync_table_schema
-- ----------------------------
INSERT INTO `sync_table_schema` VALUES ('1', 'account', 'ccs', '1', '[\r\n	{\r\n		\"name\": \"id\",\r\n		\"type\": \"STRING\",\r\n		\"pkType\": \"rangePartition\"\r\n	},\r\n	{\r\n		\"name\": \"name\",\r\n		\"type\": \"STRING\",\r\n		\"nullable\": false\r\n	},\r\n	{\r\n		\"name\": \"cert_id\",\r\n		\"type\": \"STRING\",\r\n		\"nullable\": false\r\n	},\r\n	{\r\n		\"name\": \"gender\",\r\n		\"type\": \"INT8\",\r\n		\"nullable\": true\r\n	},\r\n	{\r\n		\"name\": \"year_income\",\r\n		\"type\": \"FLOAT\",\r\n		\"nullable\": true\r\n	},\r\n	{\r\n		\"name\": \"birth\",\r\n		\"type\": \"UNIXTIME_MICROS\",\r\n		\"nullable\": true\r\n	}\r\n]', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for sys_btn_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_btn_res`;
CREATE TABLE `sys_btn_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `group_code` varchar(50) NOT NULL COMMENT '所属组编码，后续可根据组编码获取类似有权访问的下拉列表',
  `name` varchar(100) NOT NULL COMMENT '显示名称',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `value` varchar(255) DEFAULT NULL COMMENT '对应值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_btn_res_group_code` (`group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_btn_res
-- ----------------------------
INSERT INTO `sys_btn_res` VALUES ('1', '1', '1001', '工薪贷', '100101', '1101', '工薪贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('2', '1', '1001', '装修贷', '100102', '3101', '装修贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('3', '1', '1001', '学子贷', '100103', '2101', '学子贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('4', '1', '1002', '长沙银行', '100201', 'BCS', '长沙银行支付渠道', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('5', '1', '1002', '农业银行', '100202', 'ABC', '农业银行支付渠道', '2018-10-11 10:28:58');

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
  `pid` int(11) DEFAULT NULL COMMENT '-1: 没有父节点',
  `res_type` int(11) NOT NULL DEFAULT '1' COMMENT '资源类型：0：根节点，1：菜单，2: 虚拟菜单，3：接口',
  `res_name` varchar(255) NOT NULL,
  `res_uri` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '1' COMMENT '资源排序优先级，越低优先级越高',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  `res_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '0', '0', '根节点', 'overview', '1', '2018-08-23 15:24:49', '2018-08-24 12:03:09', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('2', '1', '1', '今日概览', 'overview', '1', '2018-08-23 15:25:40', '2018-08-24 09:37:37', '实施进件、授信、借款情况', 'dashboard');
INSERT INTO `sys_res` VALUES ('3', '1', '1', '客户中心', 'customer', '2', '2018-08-23 15:26:38', '2018-08-24 09:37:37', '用户模块', 'component');
INSERT INTO `sys_res` VALUES ('4', '1', '1', '报表中心', 'reports', '3', '2018-08-23 15:27:24', '2018-08-28 09:59:21', '报表（T+1）', 'chart');
INSERT INTO `sys_res` VALUES ('5', '1', '1', '系统管理', 'system', '4', '2018-08-23 18:26:19', '2018-08-27 12:48:27', '用户、角色、资源、审计管理 ', 'lock');
INSERT INTO `sys_res` VALUES ('6', '2', '1', '申请环节', 'applyment', '2', '2018-08-23 15:24:46', '2018-08-24 09:37:38', null, 'edit');
INSERT INTO `sys_res` VALUES ('7', '2', '1', '借款环节', 'loan', '3', '2018-08-23 15:24:45', '2018-09-06 11:27:02', '', 'clipboard');
INSERT INTO `sys_res` VALUES ('8', '3', '1', '客户概览', 'fullview', '1', '2018-08-23 15:24:40', '2018-08-28 09:46:21', '', 'example');
INSERT INTO `sys_res` VALUES ('9', '3', '1', '客户查询', 'personas', '2', '2018-08-23 15:24:38', '2018-08-28 09:46:31', '', 'peoples');
INSERT INTO `sys_res` VALUES ('10', '3', '1', '客户画像', 'single', '4', '2018-08-23 15:24:37', '2018-08-24 09:37:38', null, 'people');
INSERT INTO `sys_res` VALUES ('11', '4', '1', '风控报表', 'risk', '2', '2018-08-23 15:43:11', '2018-08-24 09:37:38', null, 'guide');
INSERT INTO `sys_res` VALUES ('12', '4', '1', '运营报表', 'operate', '1', '2018-08-23 15:24:32', '2018-08-28 09:46:47', '', 'drag');
INSERT INTO `sys_res` VALUES ('13', '4', '1', '财务报表', 'profit', '3', '2018-08-23 15:24:31', '2018-08-28 09:47:10', '', 'money');
INSERT INTO `sys_res` VALUES ('14', '4', '1', 'HR报表', 'hr', '4', '2018-08-23 15:24:30', '2018-08-28 09:47:02', '', 'peoples');
INSERT INTO `sys_res` VALUES ('15', '11', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:28', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('16', '11', '1', '风控授信报表', 'table', '2', '2018-08-23 15:24:27', '2018-08-28 09:47:59', '', 'table');
INSERT INTO `sys_res` VALUES ('20', '13', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:22', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('21', '13', '1', '创利报表', 'table', '2', '2018-08-23 15:24:20', '2018-08-28 09:47:24', '', 'table');
INSERT INTO `sys_res` VALUES ('22', '13', '1', '基础数据', 'base', '3', '2018-08-23 15:24:19', '2018-08-31 11:03:51', '', 'table');
INSERT INTO `sys_res` VALUES ('24', '14', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:17', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('25', '14', '1', 'HR报表', 'table', '2', '2018-08-23 15:24:16', '2018-08-28 09:48:54', '', 'table');
INSERT INTO `sys_res` VALUES ('26', '5', '1', '用户管理', 'user', '1', '2018-08-23 18:25:35', '2018-08-24 09:37:38', '用户资源管理 ', 'peoples');
INSERT INTO `sys_res` VALUES ('27', '5', '1', '角色管理', 'role', '2', '2018-08-23 15:29:25', '2018-08-24 09:37:38', '角色管理', 'people');
INSERT INTO `sys_res` VALUES ('28', '5', '1', '菜单管理', 'menu', '3', '2018-08-23 15:28:53', '2018-08-24 09:37:38', '菜单资源权限管理', 'list');
INSERT INTO `sys_res` VALUES ('44', '5', '1', '接口管理', 'interface', '4', '2018-08-23 19:24:16', '2018-08-25 10:03:48', '接口资源管理', 'icon');
INSERT INTO `sys_res` VALUES ('45', '5', '1', '审计管理', 'audit', '5', '2018-08-23 19:24:59', '2018-08-24 16:27:59', '审计查看 ', 'edit');
INSERT INTO `sys_res` VALUES ('49', '57', '3', '风控系统接口1', 'www.baidu.com', '0', '2018-08-24 11:43:35', '2018-08-27 14:33:11', '风控接口菜单1', null);
INSERT INTO `sys_res` VALUES ('51', '57', '3', '风控接口2', 'www.sohu.com', '0', '2018-08-24 12:42:54', '2018-08-27 14:33:11', '测试', null);
INSERT INTO `sys_res` VALUES ('58', '9', '3', '客户中心-客户查询-根据关键词查询客户信息', '/backbond/api/v1/personas/getCustomerByKeyword', '0', '2018-08-27 11:11:33', '2018-08-28 09:40:02', 'keyword 关键词\npageSize 页大小\npageNo 页码（从1开始）', null);
INSERT INTO `sys_res` VALUES ('59', '6', '3', '今日进件列表', '/backbond/api/v1/board/applyList', '0', '2018-08-27 11:13:34', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('60', '10', '3', '客户中心-客户画像-根据客户身份证号查询客户信息', '/backbond/api/v1/personas/getCustomerByCertId', '0', '2018-08-27 11:14:45', '2018-08-28 09:41:07', 'cert_id 身份证ID', null);
INSERT INTO `sys_res` VALUES ('61', '6', '3', '今日申请授信列表', '/backbond/api/v1/board/applyAcceptList', '0', '2018-08-27 11:14:56', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('62', '6', '3', '今日申请授信拒绝总数列表', '/backbond/api/v1/board/applyRejectList', '0', '2018-08-27 11:16:10', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('63', '10', '3', '客户中心-客户画像-获取客户关系图谱信息', '/backbond/api/v1/personas/getCustomerRelationShip', '0', '2018-08-27 11:16:35', '2018-08-28 09:41:07', 'param：cert_id', null);
INSERT INTO `sys_res` VALUES ('64', '6', '3', '今日申请授信状态列表', '/backbond/api/v1/board/applyStat', '0', '2018-08-27 11:17:25', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('65', '8', '3', '客户中心-客户概览-地区分布情况', '/backbond/api/v1/personas/getCityCodeStatistical', '0', '2018-08-27 11:17:55', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('66', '8', '3', '客户中心-客户概览-获取客户总数接口 注册客户总数 授信客户总数 贷款客户总数', '/backbond/api/v1/personas/getCustomerCntAllStatistical', '0', '2018-08-27 11:18:47', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('67', '6', '3', '今日概览申请情况概要', '/backbond/api/v1/board/applyOverview', '0', '2018-08-27 11:18:53', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('68', '6', '3', '申请界面实时统计实时进件表前N位', '/backbond/api/v1/board/applyTopN', '0', '2018-08-27 11:19:55', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('69', '8', '3', '客户中心-客户概览-渠道分布情况', '/backbond/api/v1/personas/getChannelCodeStatistical', '0', '2018-08-27 11:20:17', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('70', '8', '3', '客户中心-客户概览-学历分布情况', '/backbond/api/v1/personas/getHighestDegreeStatistical', '0', '2018-08-27 11:21:15', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('71', '8', '3', '客户中心-客户概览-年龄分布情况', '/backbond/api/v1/personas/getAgeSegmentStatistical', '0', '2018-08-27 11:21:55', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('72', '6', '3', '今日概览申请界面进件渠道分布列表', '/backbond/api/v1/board/applyChannelStat', '0', '2018-08-27 11:22:17', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('73', '8', '3', '客户中心-客户概览-所属行业分布情况', '/backbond/api/v1/personas/getIndustryStatistical', '0', '2018-08-27 11:22:37', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('74', '6', '3', '今日概览申请界面客户经理分布列表', '/backbond/api/v1/board/applyIntroducerStat', '0', '2018-08-27 11:23:07', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('75', '8', '3', '客户中心-客户概览-注册客户每月数据统计', '/backbond/api/v1/personas/getCustomerRegisterTotalCntMonthStatistical', '0', '2018-08-27 11:23:54', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('76', '6', '3', '今日概览申请界面地区分布列表Top10', '/backbond/api/v1/board/applyAddrStat', '0', '2018-08-27 11:24:00', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('77', '8', '3', '客户中心-客户概览-授信客户每月数据统计', '/backbond/api/v1/personas/getCustomerCreditCntMonthStatistical', '0', '2018-08-27 11:24:35', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('78', '7', '3', '今日概览借款概要数据', '/backbond/api/v1/board/loanOverview', '0', '2018-08-27 11:25:01', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('79', '8', '3', '客户中心-客户概览-贷款客户每月数据统计', '/backbond/api/v1/personas/getCustomerBorrowCntMonthStatistical', '0', '2018-08-27 11:25:13', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('80', '7', '3', '今日概览借款界面实时曲线（借款笔数、借款金额）', '/backbond/api/v1/board/loanStat', '0', '2018-08-27 11:26:12', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('81', '129', '3', '公共接口-系统展示', '/backbond/api/v1/common/dict/getDict', '0', '2018-08-27 11:26:39', '2018-09-18 19:42:26', '获取字典数据 ', null);
INSERT INTO `sys_res` VALUES ('82', '7', '3', '今日概览借款界面借据表TopN', '/backbond/api/v1/board/loanTopN', '0', '2018-08-27 11:27:08', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('83', '25', '3', '报表中心-HR报表-按业务利率汇总报表', '/backbond/api/v1/rpt/hr/hrStatisticalByIntroducerAndRate', '0', '2018-08-27 11:27:38', '2018-09-04 17:24:44', '', null);
INSERT INTO `sys_res` VALUES ('84', '7', '3', '今日概览借款界面渠道分布数据', '/backbond/api/v1/board/loanChannelStat', '0', '2018-08-27 11:27:58', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('85', '24', '3', '报表中心-HR报表-查询营销人员统计业务汇总，统计到指定日期的业务数据', '/backbond/api/v1/rpt/hr/hrStatisticalOverviewByIntroducer', '0', '2018-08-27 11:28:20', '2018-09-04 17:24:34', '', null);
INSERT INTO `sys_res` VALUES ('86', '7', '3', '今日概览借款界面客户经理分布', '/backbond/api/v1/board/loanIntroducerStat', '0', '2018-08-27 11:28:23', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('87', '24', '3', '报表中心-HR报表-查询按照利率分组统计客户总数和客户授信总额数据', '/backbond/api/v1/rpt/hr/getHRStatisticalOverviewByRate', '0', '2018-08-27 11:28:58', '2018-09-04 17:24:34', '@param startDt 开始日期（参数格式:yyyymmdd) @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('88', '7', '3', '今日概览借款界面地区分布', '/backbond/api/v1/board/loanAddrStat', '0', '2018-08-27 11:29:30', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('89', '7', '3', '今日借款一览表', '/backbond/api/v1/board/loanList', '0', '2018-08-27 11:30:05', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('90', '-1', '3', '报表中心-运营报表-运营全量授信报表', '/backbond/api/v1/rpt/operate/allCreditReport', '0', '2018-08-27 11:31:20', '2018-10-29 10:14:01', '@param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('91', '-1', '3', '报表中心-运营报表-每日新增余额报表', '/backbond/api/v1/rpt/operate/getDailyBalanceReport', '0', '2018-08-27 11:32:10', '2018-10-29 10:14:01', 'param buzDt 开始日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('92', '-1', '3', '报表中心-运营报表-报表概览', '/backbond/api/v1/rpt/operate/ccsBizSummaryOverview', '0', '2018-08-27 11:33:27', '2018-10-29 10:14:01', '@param batchDt 批量日期\n@param accuType 累计类型 M|月累计Q|季累计Y|年累计', null);
INSERT INTO `sys_res` VALUES ('93', '7', '3', '今日授信1小时一览表', '/backbond/api/v1/board/loan1HourList', '0', '2018-08-27 11:34:33', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('94', '20', '3', '报表中心-财务报表-报表概览-客户创利TOP10数据', '/backbond/api/v1/rpt/profit/createProfitTopNByCustomer', '0', '2018-08-27 11:34:57', '2018-09-19 09:23:38', '@param startDt 开始日期（参数格式:yyyymmdd)\n @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('95', '7', '3', '今日授信4小时一览表', '/backbond/api/v1/board/loan4HourList', '0', '2018-08-27 11:34:57', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('96', '7', '3', '今日授信24小时一览表', '/backbond/api/v1/board/loan24HourList', '0', '2018-08-27 11:35:21', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('97', '20', '3', '报表中心-创利报表-按照营销人员统计利润TOP10', '/backbond/api/v1/rpt/profit/createProfitTopNByIntroducer', '0', '2018-08-27 11:36:17', '2018-09-19 09:23:38', 'param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('99', '21', '3', '报表中心-财务报表-创利报表-创利客户级报表数据', '/backbond/api/v1/rpt/profit/createProfitByCustomer', '0', '2018-08-27 11:38:00', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd) param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('100', '21', '3', '报表中心-财务报表-创利报表-创利借据级报表数据', '/backbond/api/v1/rpt/profit/createProfitByLoan', '0', '2018-08-27 11:39:12', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd)\nparam endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('101', '22', '3', '报表中心-财务报表-查询客户级基础数据', '/backbond/api/v1/rpt/profit/profitCertId', '0', '2018-08-27 11:40:11', '2018-08-31 11:04:19', 'busiDate 业务日期,（参数格式:yyyyMMdd)\ncertId 身份证号（可选）', null);
INSERT INTO `sys_res` VALUES ('102', '22', '3', '报表中心-财务报表-借据级基础数据', '/backbond/api/v1/rpt/profit/profitBillno', '0', '2018-08-27 11:41:15', '2018-08-31 11:04:19', 'busiDate 业务日期,（参数格式:yyyyMMdd)\ncertId 身份证号（可选）\n billno 借据号（可选）', null);
INSERT INTO `sys_res` VALUES ('120', '21', '3', '报表中心-财务报表-下载客户级创利报表数据', '/backbond/api/v1/rpt/profit/exportCreateProfitByCustomer', '0', '2018-08-27 14:37:34', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)\n@param introducer 营销人员（可选）', null);
INSERT INTO `sys_res` VALUES ('121', '21', '3', '报表中心-财务报表-下载借据级创利报表数据', '/backbond/api/v1/rpt/profit/exportCreateProfitByLoan', '0', '2018-08-27 14:38:54', '2018-08-27 15:05:53', '', null);
INSERT INTO `sys_res` VALUES ('123', '25', '3', '报表中心-HR报表-按照营销人员、利率分组,下载客户总数和授信总额数据', '/backbond/api/v1/rpt/hr/exportHRStatisticalByIntroducerAndRate', '0', '2018-08-27 14:57:30', '2018-09-04 17:24:44', '', null);
INSERT INTO `sys_res` VALUES ('124', '-1', '3', '报表中心-运营报表-下载运营全量授信报表', '/backbond/api/v1/rpt/operate/exportAllCreditReport', '0', '2018-08-27 14:58:28', '2018-10-29 10:14:01', '', null);
INSERT INTO `sys_res` VALUES ('126', '57', '1', '测试1', 'user', '100', '2018-08-28 09:26:43', '2018-08-28 09:26:43', '', 'bug');
INSERT INTO `sys_res` VALUES ('127', '9', '3', '客户中心-客户查询-根据客户身份证号查询客户信息', '/backbond/api/v1/personas/getCustomerByCertId', '0', '2018-08-28 09:37:37', '2018-08-28 09:40:02', '', null);
INSERT INTO `sys_res` VALUES ('128', '9', '3', '客户中心-客户查询-获取客户关系图谱信息', '/backbond/api/v1/personas/getCustomerRelationShip', '0', '2018-08-28 09:37:59', '2018-08-28 09:40:02', '', null);
INSERT INTO `sys_res` VALUES ('129', '1', '2', '公共接口', 'null', '100', '2018-08-28 09:44:01', '2018-09-17 17:19:36', '', 'component');
INSERT INTO `sys_res` VALUES ('131', '130', '1', '123', '123', '100', '2018-08-28 10:01:45', '2018-08-28 10:04:01', '', 'chart');
INSERT INTO `sys_res` VALUES ('132', '130', '1', '333', '123', '100', '2018-08-28 10:01:54', '2018-08-28 10:04:51', '', 'chart');
INSERT INTO `sys_res` VALUES ('133', '130', '1', '333', '123', '100', '2018-08-28 10:01:55', '2018-08-28 10:01:55', '', 'chart');
INSERT INTO `sys_res` VALUES ('135', '12', '1', '报表概览', 'fullview2', '1', '2018-08-28 15:38:26', '2018-10-23 10:26:22', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('151', '12', '1', '新增余额表', 'newBalance', '100', '2018-08-29 09:03:20', '2018-08-29 09:03:20', '', 'money');
INSERT INTO `sys_res` VALUES ('152', '11', '1', '风控信贷报表', 'credit', '100', '2018-08-30 10:10:54', '2018-08-30 10:13:55', '', 'table');
INSERT INTO `sys_res` VALUES ('153', '11', '1', '风控逾期报表', 'overdue', '100', '2018-08-30 10:57:48', '2018-08-30 10:57:48', '', 'table');
INSERT INTO `sys_res` VALUES ('154', '129', '3', '公共接口-用户登录', '/local/api/user/getByToken', '0', '2018-08-31 10:16:35', '2018-09-18 19:42:26', '获取用户个人信息', null);
INSERT INTO `sys_res` VALUES ('155', '129', '3', '公共接口-用户登录', '/local/api/user/updatePWDByToken', '0', '2018-08-31 10:17:24', '2018-09-18 19:42:26', '设置个人密码', null);
INSERT INTO `sys_res` VALUES ('156', '26', '3', '系统管理-用户管理', '/local/api/user/select', '0', '2018-08-31 10:24:27', '2018-08-31 10:28:29', '获取用户列表', null);
INSERT INTO `sys_res` VALUES ('157', '26', '3', '系统管理-用户管理', '/local/api/user/getRoleByUserId', '0', '2018-08-31 10:24:53', '2018-08-31 10:28:29', '请求获取用户角色信息', null);
INSERT INTO `sys_res` VALUES ('158', '26', '3', '系统管理-用户管理', '/local/api/user/add', '0', '2018-08-31 10:25:18', '2018-08-31 10:28:29', '创建用户', null);
INSERT INTO `sys_res` VALUES ('159', '26', '3', '系统管理-用户管理', '/local/api/user/update', '0', '2018-08-31 10:25:32', '2018-08-31 10:28:29', '更新用户信息', null);
INSERT INTO `sys_res` VALUES ('160', '26', '3', '系统管理-用户管理', '/local/api/user/delete', '0', '2018-08-31 10:25:53', '2018-08-31 10:28:29', '删除用户', null);
INSERT INTO `sys_res` VALUES ('161', '26', '3', '系统管理-用户管理', '/local/api/role/all', '0', '2018-08-31 10:27:02', '2018-08-31 10:28:29', '获取所有角色列表', null);
INSERT INTO `sys_res` VALUES ('162', '27', '3', '系统管理-角色管理', '/local/api/role/select', '0', '2018-08-31 10:32:04', '2018-08-31 10:39:52', '获取角色列表', null);
INSERT INTO `sys_res` VALUES ('163', '27', '3', '系统管理-角色管理', '/local/api/role/add', '0', '2018-08-31 10:32:48', '2018-08-31 10:39:52', '创建角色', null);
INSERT INTO `sys_res` VALUES ('164', '27', '3', '系统管理-角色管理', '/local/api/role/update', '0', '2018-08-31 10:33:09', '2018-08-31 10:39:52', '更新角色', null);
INSERT INTO `sys_res` VALUES ('165', '27', '3', '系统管理-角色管理', '/local/api/role/delete', '0', '2018-08-31 10:36:27', '2018-08-31 10:39:52', '删除角色', null);
INSERT INTO `sys_res` VALUES ('166', '27', '3', '系统管理-角色管理', '/local/api/role/getResourceByRoleId', '0', '2018-08-31 10:36:58', '2018-08-31 10:39:52', '通过角色获取资源列表', null);
INSERT INTO `sys_res` VALUES ('167', '27', '3', '系统管理-角色管理', '/local/api/role/linkRes', '0', '2018-08-31 10:37:25', '2018-08-31 10:39:52', '关联用户-角色', null);
INSERT INTO `sys_res` VALUES ('168', '27', '3', '系统管理-角色管理', '/local/api/auth/menu/getAll', '0', '2018-08-31 10:38:00', '2018-08-31 10:39:52', '获取菜单树', null);
INSERT INTO `sys_res` VALUES ('169', '13', '1', '资产负债表', 'balanceSheet', '100', '2018-08-31 10:39:29', '2018-08-31 10:45:39', '', 'table');
INSERT INTO `sys_res` VALUES ('170', '13', '1', '利润表', 'profitStatement', '100', '2018-08-31 10:40:38', '2018-08-31 10:45:24', '', 'table');
INSERT INTO `sys_res` VALUES ('171', '28', '3', '系统管理-菜单管理', '/local/api/auth/menu/getAll', '0', '2018-08-31 10:41:48', '2018-08-31 10:45:32', '获取菜单树', null);
INSERT INTO `sys_res` VALUES ('172', '28', '3', '系统管理-菜单管理', '/local/api/res/select', '0', '2018-08-31 10:42:07', '2018-08-31 10:45:32', '获取菜单项（数组）', null);
INSERT INTO `sys_res` VALUES ('173', '28', '3', '系统管理-菜单管理', '/local/api/res/add', '0', '2018-08-31 10:42:31', '2018-08-31 10:45:32', '创建菜单项', null);
INSERT INTO `sys_res` VALUES ('174', '28', '3', '系统管理-菜单管理', '/local/api/res/update', '0', '2018-08-31 10:42:47', '2018-08-31 10:45:32', '更新菜单项', null);
INSERT INTO `sys_res` VALUES ('175', '28', '3', '系统管理-菜单管理', '/local/api/res/deleteMenu', '0', '2018-08-31 10:43:02', '2018-08-31 10:45:32', '删除菜单项', null);
INSERT INTO `sys_res` VALUES ('176', '28', '3', '系统管理-菜单管理', '/local/api/res/unlinkParentRes', '0', '2018-08-31 10:43:45', '2018-08-31 10:45:32', '取消关联菜单与接口资源', null);
INSERT INTO `sys_res` VALUES ('177', '28', '3', '系统管理-菜单管理', '/local/api/res/linkParentRes', '0', '2018-08-31 10:43:56', '2018-08-31 10:45:32', '关联菜单与接口资源', null);
INSERT INTO `sys_res` VALUES ('178', '44', '3', '系统管理-接口管理', '/local/api/res/get', '0', '2018-08-31 10:46:43', '2018-08-31 10:49:24', '通过id获取接口信息', null);
INSERT INTO `sys_res` VALUES ('179', '44', '3', '系统管理-接口管理', '/local/api/res/select', '0', '2018-08-31 10:47:05', '2018-08-31 10:49:24', '获取接口列表', null);
INSERT INTO `sys_res` VALUES ('180', '44', '3', '系统管理-接口管理', '/local/api/res/add', '0', '2018-08-31 10:47:31', '2018-08-31 10:49:24', '创建接口', null);
INSERT INTO `sys_res` VALUES ('181', '44', '3', '系统管理-接口管理', '/local/api/res/update', '0', '2018-08-31 10:47:48', '2018-08-31 10:49:24', '更新接口', null);
INSERT INTO `sys_res` VALUES ('182', '44', '3', '系统管理-接口管理', '/local/api/res/deleteInterface', '0', '2018-08-31 10:48:04', '2018-08-31 10:49:24', '删除接口', null);
INSERT INTO `sys_res` VALUES ('183', '45', '3', '系统管理-审计管理', '/local/api/audit/select', '0', '2018-08-31 10:49:25', '2018-08-31 10:50:36', '查询审计信息', null);
INSERT INTO `sys_res` VALUES ('184', '129', '3', '公共接口-用户登录', '/local/api/login', '0', '2018-08-31 10:57:36', '2018-09-18 19:42:26', '用户登录', null);
INSERT INTO `sys_res` VALUES ('185', '129', '3', '公共接口-用户登录', '/local/api/logout', '0', '2018-08-31 10:57:52', '2018-09-18 19:42:26', '用户登出', null);
INSERT INTO `sys_res` VALUES ('186', '25', '3', 'HR报表-下载按照营销人员、利率分组,下载户数、授信额度、贷款余额数据', '/backbond/api/v1/rpt/hr/exportHRStatisticalByRate', '0', '2018-08-31 15:19:51', '2018-09-04 17:24:44', '@param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('187', '25', '3', 'HR报表-按利率统计报表，可指定营销人员与利率', '/backbond/api/v1/rpt/hr/hrStatisticalByRate', '0', '2018-08-31 15:23:43', '2018-09-04 17:24:44', '@startDt 开始日期（参数格式:yyyymmdd)\n@endDt 结束日期（参数格式:yyyymmdd)\n@introducerName 营销人员姓名[可选]\n@introducerId 营销人员编码[可选]\n@rates 万元日利率(多个之间用半角逗号分隔)[可选]', null);
INSERT INTO `sys_res` VALUES ('188', '24', '3', '报表概览-统计万元日利率对应的户数、授信额度、贷款余额分布情况', '/backbond/api/v1/rpt/hr/hrOverviewByRate', '0', '2018-08-31 15:26:58', '2018-09-04 17:24:34', '@param startDt 开始日期（参数格式:yyyymmdd) @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('189', '151', '3', '报表中心-运营报表-查询放款与还款统计数据', '/backbond/api/v1/rpt/operate/getLoanAndRepay', '0', '2018-09-03 16:52:24', '2018-09-04 11:01:42', '@param startDt 开始日期\n@param endDt 结束日期\n@param accuType 类型 :M|月,Q|季,Y|年,A|金额,C|渠道(暂时还没有)', null);
INSERT INTO `sys_res` VALUES ('190', '151', '3', '报表中心-运营报表-下载放款与还款统计数据', '/backbond/api/v1/rpt/operate/exportLoanAndRepay', '0', '2018-09-03 16:58:15', '2018-09-04 11:01:42', '@param startDt 开始日期 @param endDt 结束日期 @param accuType 类型 :M|月,Q|季,Y|年,A|金额,C|渠道(暂时还没有)', null);
INSERT INTO `sys_res` VALUES ('191', '135', '3', '运营报表-报表概览-查询放款情况数据', '/backbond/api/v1/rpt/operate/getLoanAccumOverview', '0', '2018-09-03 17:01:21', '2018-09-11 16:10:20', '@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('192', '135', '3', '报表中心-运营报表-下载放款与还款统计数据', '/backbond/api/v1/rpt/operate/exportLoanAccumOverview', '0', '2018-09-03 17:02:34', '2018-09-11 16:10:20', '@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('201', '15', '3', '表概览-查询进件户数、授信户数、授信总额、贷款余额户数、贷款余额统计数据', '/backbond/api/v1/rpt/risk/getCustomerOverview', '0', '2018-09-04 11:06:16', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据)\n@param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('202', '15', '3', '风控概览-客户类型分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByProduct', '0', '2018-09-04 14:58:50', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('203', '15', '3', '风控概览-授信状态分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByCreditStatus', '0', '2018-09-04 15:24:15', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('204', '15', '3', '风控概览-万元日利率分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByRate', '0', '2018-09-04 15:25:17', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('205', '15', '3', '风控概览-按统计类型统计营销人员授信TOP10', '/backbond/api/v1/rpt/risk/getCustomerOverviewTopByIntroducer', '0', '2018-09-04 16:53:06', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间@param accuType 统计类型 :T|进件户数,C|授信户数,A|授信金额', null);
INSERT INTO `sys_res` VALUES ('206', '15', '3', '风控概览-按统计类型统计营销团队授信TOP6', '/backbond/api/v1/rpt/risk/getCustomerOverviewTopByIntroducerRelat', '0', '2018-09-04 16:55:16', '2018-09-04 17:29:28', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间@param accuType 统计类型 :T|进件户数,C|授信户数,A|授信金额', null);
INSERT INTO `sys_res` VALUES ('207', '16', '3', '风控报表-风控授信报表-查询风控授信全量报表数据', '/backbond/api/v1/rpt/risk/getRiskCreditAll', '0', '2018-09-06 10:13:25', '2018-09-11 11:44:04', '2、可自主搜索：客户姓名、证件号码、产品类型、授信状态、单位名称、审批人、营销人员。\n3、可自主设置申请日期段，如20180601至20180620自行搜索客户信息。', null);
INSERT INTO `sys_res` VALUES ('208', '16', '3', '风控报表-风控授信报表-下载风控授信全量报表数据', '/backbond/api/v1/rpt/risk/exportRiskCreditAll', '0', '2018-09-06 10:17:49', '2018-09-11 11:44:04', '2、可自主搜索：客户姓名、证件号码、产品类型、授信状态、单位名称、审批人、营销人员。 3、可自主设置申请日期段，如20180601至20180620自行搜索客户信息。', null);
INSERT INTO `sys_res` VALUES ('210', '153', '3', '风控报表-风控逾期报表-按页查询借据级全量信息表数据', '/backbond/api/v1/rpt/risk/getOverdueByBillno', '0', '2018-09-06 16:06:46', '2018-09-12 17:04:51', '@param statDt 统计日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('211', '153', '3', '风控报表-风控逾期报表-下载信贷五级分类数据', '/backbond/api/v1/rpt/risk/exportOverdueByCreditRate', '0', '2018-09-06 19:39:34', '2018-09-12 17:04:51', '@param busiDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('212', '153', '3', '风控报表-风控逾期报表-查询信贷五级分类数据', '/backbond/api/v1/rpt/risk/getOverdueByCreditRate', '0', '2018-09-06 19:39:38', '2018-09-12 17:04:51', '@param busiDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('213', '153', '3', '查询风控逾期报表-查询指定借据号从委外日开始的还款记录数据', '/backbond/api/v1/rpt/risk/getOverdueOutsourcingRepayInfoByBillNo', '0', '2018-09-07 12:01:47', '2018-09-12 17:04:51', '@param wwDt 委外日期(yyyyMMdd)\n@param duebillNo 借据号', null);
INSERT INTO `sys_res` VALUES ('214', '153', '3', '查询风控逾期报表-委外收款统计数据', '/backbond/api/v1/rpt/risk/getOverdueOutsourcingInfoByBillNo', '0', '2018-09-07 12:01:51', '2018-09-12 17:04:51', '@param wwDt 委外日期(yyyyyMMdd)\n@param dbDt	 对比日期(yyyyMMdd)\n@param duebillNos 借据号串(空格，换行或者逗号等非数字作为分隔符)', null);
INSERT INTO `sys_res` VALUES ('215', '153', '3', '风控报表-风控逾期报表-下载城市逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByCity', '0', '2018-09-08 16:17:10', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('216', '153', '3', '风控报表-风控逾期报表-下载省份逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByProvince', '0', '2018-09-08 16:17:29', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('217', '153', '3', '风控报表-风控逾期报表-下载年龄逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByAge', '0', '2018-09-08 16:17:47', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('218', '153', '3', '风控报表-风控逾期报表-下载营销人员逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByIntroducer', '0', '2018-09-08 16:18:06', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('219', '153', '3', '风控报表-风控逾期报表-按页查询客户经理逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByIntroducer', '0', '2018-09-08 16:18:50', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('220', '153', '3', '风控报表-风控逾期报表-按页查询省份逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByProvince', '0', '2018-09-08 16:19:10', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('221', '153', '3', '风控报表-风控逾期报表-按页查询城市逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByCity', '0', '2018-09-08 16:19:23', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('222', '153', '3', '风控报表-风控逾期报表-按页查询年龄逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByAge', '0', '2018-09-08 16:19:37', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('223', '153', '3', '风控报表-风控概览-查询逾期情况统计数据', '/backbond/api/v1/rpt/risk/getOverdueOverviewByday', '0', '2018-09-08 16:24:32', '2018-09-12 17:04:51', '@param busiDt统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('224', '135', '3', '运营报表-报表概览-查询快乐秒贷数据', '/backbond/api/v1/rpt/operate/getHappyLoanOverviewByDay', '0', '2018-09-11 11:04:40', '2018-09-11 16:10:20', '\n@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('225', '16', '3', '风控报表-风控授信报表-查询营销业务统计数据', '/backbond/api/v1/rpt/risk/getCreditByIntroducer', '0', '2018-09-11 11:20:13', '2018-09-11 11:44:04', 'startDt	开始日期	integer\nendDt	结束日期	integer\nintroducer	营销人名称 string\nintroducerRelation	营销团队名称 string\npageSize	页大小 integer\npageNo	页码（从1开始）integer', null);
INSERT INTO `sys_res` VALUES ('226', '152', '3', '风控报表-风控信贷报表-风控信贷情况表(按页)', '/backbond/api/v1/rpt/risk/getRiskLoanByProduct', '0', '2018-09-12 09:01:57', '2018-09-12 16:59:06', '@param busiDt	 统计时间点(日期yyyyMMdd)\n@param pageSize	页大小\n@param pageNo	页码(从1开始)', null);
INSERT INTO `sys_res` VALUES ('227', '152', '3', '风控报表-风控信贷报表-风控信贷情况表(下载)', '/backbond/api/v1/rpt/risk/exportRiskLoanByProduct', '0', '2018-09-12 11:08:36', '2018-09-12 16:59:06', '@param busiDt	 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('228', '152', '3', '风控报表-风控信贷报表-客户经理借款报表(下载)', '/backbond/api/v1/rpt/risk/exportRiskLoanByIntroducer', '0', '2018-09-12 11:09:57', '2018-09-12 16:59:06', '风控报表-风控信贷报表-风控信贷情况表(下载)\n/backbond/api/v1/rpt/risk/exportRiskLoanByProduct\n@param busiDt	统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('229', '153', '3', '风控报表-风控逾期报表-借据级全量信息表(下载)', '/backbond/api/v1/rpt/risk/exportOverdueByBillno', '0', '2018-09-12 13:04:53', '2018-09-12 17:04:51', 'statDt	(required)统计日期\ndueBillNo	借据号\ncustName	客户姓名\ncertId	身份证号\nstartActiveDt	借款日期范围起始值[yyyyMMdd]\nendActiveDt	借款日期范围结束值[yyyyMMdd]\nbillNoStatus	借据状态(0|正常,1|已结清,2|逾期)\nstartOverdueDays	逾期天数范围最小值\nendOverdueDays	逾期天数范围最大值', null);
INSERT INTO `sys_res` VALUES ('230', '152', '3', '风控报表-风控信贷报表-查询客户经理借款报表数据', '/backbond/api/v1/rpt/risk/getRiskLoanByIntroducer', '0', '2018-09-12 16:59:33', '2018-09-12 16:59:06', '@param busiDt 统计时间点', null);
INSERT INTO `sys_res` VALUES ('231', '153', '3', '风控报表-风控逾期报表-查询逾期时间情况表数据', '/backbond/api/v1/rpt/risk/getOverdueStatisticsByOverdueDays', '0', '2018-09-12 17:02:40', '2018-09-12 17:04:51', 'busiDt:  统计时间点(日期)\nminOverdueDays:  最小逾期天数[可选]\nmaxOverdueDays:  最大逾期天数[可选]', null);
INSERT INTO `sys_res` VALUES ('245', '20', '3', '报表中心-财务报表-查询客户创利等级分布', '/backbond/api/v1/rpt/profit/customerLevelOverview', '0', '2018-09-18 17:23:40', '2018-09-19 09:23:38', 'param: busiDt', null);
INSERT INTO `sys_res` VALUES ('246', '20', '3', '财务报表-报表概览-按照营销人员统计利润TOP10', '/backbond/api/v1/rpt/profit/createProfitAmtTopNByIntroducer', '0', '2018-09-18 17:24:51', '2018-09-19 09:23:38', 'param: startDt \nparam: endDt', null);
INSERT INTO `sys_res` VALUES ('247', '20', '3', '财务报表-报表概览-按照营销人员统计创利客户数TOP10', '/backbond/api/v1/rpt/profit/createProfitCustomerCountTopNByIntroducer', '0', '2018-09-18 17:26:44', '2018-09-19 09:23:38', '', null);
INSERT INTO `sys_res` VALUES ('250', '1', '1', '数据驾驶舱', 'index', '0', '2018-09-21 11:26:58', '2018-09-29 15:37:12', '', 'chart');
INSERT INTO `sys_res` VALUES ('251', '250', '1', '业务情况', 'indexBusiness', '1', '2018-09-21 11:28:09', '2018-09-25 10:26:55', '', 'nested');
INSERT INTO `sys_res` VALUES ('252', '250', '1', '数据透视', 'dataView', '5', '2018-09-21 15:18:47', '2018-09-29 15:56:05', '', 'excel');
INSERT INTO `sys_res` VALUES ('253', '250', '1', '营销情况', 'marketing', '4', '2018-09-25 10:12:43', '2018-09-29 15:38:25', '', 'chart');
INSERT INTO `sys_res` VALUES ('254', '250', '1', '运营情况', 'indexOperate', '2', '2018-09-25 10:27:42', '2018-09-25 10:29:28', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('255', '250', '1', '逾期情况', 'indexOverdue', '3', '2018-09-26 11:12:17', '2018-09-26 11:12:17', '', 'example');
INSERT INTO `sys_res` VALUES ('256', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据', '/backbond/api/v1/personas/home/getBusinessByBusiDt', '0', '2018-09-28 11:30:45', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('257', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据', '/backbond/api/v1/personas/home/getCreditStatusOfBusinessByBusiDt', '0', '2018-10-10 16:13:13', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('258', '251', '3', '首页-业务情况-按指定维度查询指定时间范围内的业务情况数据', '/backbond/api/v1/personas/home/getBusinessByDateDim', '0', '2018-10-10 16:13:52', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('259', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据(各利率下的授信总额度)', '/backbond/api/v1/personas/home/getRateAmtOfBusinessByBusiDt', '0', '2018-10-10 16:14:19', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('260', '254', '3', '首页-运营情况-按指定维度查询指定时间范围内的运营情况数据', '/backbond/api/v1/personas/home/getOperationByDateDim', '0', '2018-10-10 16:14:50', '2018-10-29 10:14:02', '', null);
INSERT INTO `sys_res` VALUES ('261', '254', '3', '首页-运营情况-查询截至到某一时间点的运营情况数据', '/backbond/api/v1/personas/home/getOperationByBusiDt', '0', '2018-10-10 16:15:09', '2018-10-29 10:14:02', '', null);
INSERT INTO `sys_res` VALUES ('262', '255', '3', '首页-逾期情况-逾期情况与不良情况数据表(表格展示)', '/backbond/api/v1/personas/home/getOverdueAndBadByBusiDt', '0', '2018-10-10 16:15:24', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('263', '255', '3', '首页-逾期情况-将到期贷款情况-时间点数据', '/backbond/api/v1/personas/home/getOverdueOfExpiredByBusiDt', '0', '2018-10-10 16:15:39', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('264', '255', '3', '首页-逾期情况-逾期情况与不良情况-时间点数据', '/backbond/api/v1/personas/home/getOverdueVsBadByBusiDt', '0', '2018-10-10 16:15:55', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('265', '255', '3', '首页-逾期情况-逾期率、不良率、首逾率对比情况-维度数据', '/backbond/api/v1/personas/home/getOverdueOfRatioByDateDim', '0', '2018-10-10 16:16:09', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('267', '3', '1', '用户蛛网图', 'userRadar', '100', '2018-10-16 09:29:32', '2018-10-16 09:29:32', '', 'component');
INSERT INTO `sys_res` VALUES ('268', '5', '1', '系统监控', 'monitor', '100', '2018-10-23 11:01:10', '2018-10-23 11:01:10', '', 'nested');
INSERT INTO `sys_res` VALUES ('269', '254', '3', '主页-运营情况-根据产品查询指定维度点的累计放款笔数情况数据', '/backbond/api/v1/personas/home/getOperationPayChannel', '0', '2018-10-29 10:08:57', '2018-10-29 10:14:02', '', null);
INSERT INTO `sys_res` VALUES ('270', '252', '3', '首页-数据透视-时间点数据', '/backbond/api/v1/personas/home/getPerspectByStatType', '0', '2018-10-29 10:09:54', '2018-10-29 10:11:10', '', null);
INSERT INTO `sys_res` VALUES ('271', '253', '3', '主页-营销情况-时间段数据(按页)', '/backbond/api/v1/personas/home/getMarketingDetailByStatType', '0', '2018-10-29 10:10:49', '2018-10-29 10:12:30', '', null);
INSERT INTO `sys_res` VALUES ('272', '253', '3', '主页-营销情况-TOP10数据', '/backbond/api/v1/personas/home/getMarketingTopNByStatType', '0', '2018-10-29 10:11:31', '2018-10-29 10:12:30', '', null);
INSERT INTO `sys_res` VALUES ('273', '1', '1', '平台监控', 'monitor', '5', '2018-10-29 10:36:27', '2018-10-29 10:38:29', '', 'bug');
INSERT INTO `sys_res` VALUES ('274', '273', '1', '代理服务监控', 'agent', '3', '2018-10-29 10:38:04', '2018-10-29 10:38:55', '', 'bug');
INSERT INTO `sys_res` VALUES ('275', '273', '1', 'canal监控', 'canal', '1', '2018-10-29 10:38:56', '2018-10-29 10:38:42', '', 'bug');
INSERT INTO `sys_res` VALUES ('276', '273', '1', 'kafka主题', 'kafka', '2', '2018-10-29 10:39:31', '2018-10-29 16:39:40', '', 'bug');
INSERT INTO `sys_res` VALUES ('277', '276', '1', '主题配置', 'kafkaCfg', '1', '2018-10-29 16:38:10', '2018-10-29 16:37:38', '', 'edit');
INSERT INTO `sys_res` VALUES ('278', '276', '1', '监控数据', 'kafkaMonitor', '2', '2018-10-29 16:38:49', '2018-10-29 16:52:29', '', 'bug');
INSERT INTO `sys_res` VALUES ('279', '275', '1', 'canal配置', 'canalCfg', '1', '2018-11-07 09:58:53', '2018-11-07 09:58:53', '', 'documentation');
INSERT INTO `sys_res` VALUES ('280', '275', '1', 'canal监控', 'canalMonitor', '2', '2018-11-07 10:18:31', '2018-11-07 10:18:31', '', 'bug');
INSERT INTO `sys_res` VALUES ('281', '273', '1', 'hbase监控', 'hbase', '100', '2018-11-07 14:53:54', '2018-11-07 14:53:54', '', 'bug');
INSERT INTO `sys_res` VALUES ('282', '281', '1', 'hbase配置', 'hbaseCfg', '1', '2018-11-07 14:54:17', '2018-11-07 14:54:17', '', 'documentation');
INSERT INTO `sys_res` VALUES ('283', '281', '1', 'hbase审计', 'hbaseAudit', '100', '2018-11-07 14:55:01', '2018-11-07 14:55:01', '', 'bug');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '', '0', '超级管理员', '', '2018-08-09 09:10:47', '2018-11-01 11:31:37');
INSERT INTO `sys_role` VALUES ('2', '', '1', '系统管理员', '', '2018-08-06 23:37:40', '2018-11-01 15:41:46');
INSERT INTO `sys_role` VALUES ('27', '7527da8954f3407b379efe25bf551beb', '1', '普通用户', '', '2018-08-27 11:00:43', '2018-09-18 16:28:20');
INSERT INTO `sys_role` VALUES ('47', '1fa3a89253fcca5c5697baa960e9350f', '1', '报表角色', '', '2018-09-18 11:11:32', '2018-11-01 15:41:57');
INSERT INTO `sys_role` VALUES ('50', '202cb962ac59075b964b07152d234b70', '1', '驾驶舱+今日概览', '123', '2018-09-18 17:01:13', '2018-11-01 15:42:07');

-- ----------------------------
-- Table structure for sys_role_btn_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_btn_res`;
CREATE TABLE `sys_role_btn_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_role_res` (`role_id`,`res_id`) USING BTREE COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_btn_res
-- ----------------------------
INSERT INTO `sys_role_btn_res` VALUES ('894', '27', '1', '2018-10-11 10:34:04');
INSERT INTO `sys_role_btn_res` VALUES ('896', '27', '2', '2018-10-11 10:34:04');
INSERT INTO `sys_role_btn_res` VALUES ('897', '27', '3', '2018-10-11 10:34:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('124', '2', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('125', '2', '26', null, null, null);
INSERT INTO `sys_role_res` VALUES ('126', '2', '27', null, null, null);
INSERT INTO `sys_role_res` VALUES ('127', '2', '28', null, null, null);
INSERT INTO `sys_role_res` VALUES ('128', '2', '44', null, null, null);
INSERT INTO `sys_role_res` VALUES ('129', '2', '45', null, null, null);
INSERT INTO `sys_role_res` VALUES ('154', '27', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('155', '27', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('156', '27', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('157', '27', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('158', '27', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('159', '27', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('160', '27', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('177', '27', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('178', '1', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('179', '1', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('180', '1', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('181', '1', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('182', '1', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('183', '1', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('184', '1', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('185', '1', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('186', '1', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('190', '1', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('191', '1', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('192', '1', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('193', '1', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('194', '1', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('195', '1', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('196', '1', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('198', '1', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('199', '1', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('200', '1', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('201', '1', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('202', '1', '26', null, null, null);
INSERT INTO `sys_role_res` VALUES ('203', '1', '27', null, null, null);
INSERT INTO `sys_role_res` VALUES ('204', '1', '28', null, null, null);
INSERT INTO `sys_role_res` VALUES ('205', '1', '44', null, null, null);
INSERT INTO `sys_role_res` VALUES ('206', '1', '45', null, null, null);
INSERT INTO `sys_role_res` VALUES ('207', '1', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('213', '27', '58', null, null, null);
INSERT INTO `sys_role_res` VALUES ('214', '27', '59', null, null, null);
INSERT INTO `sys_role_res` VALUES ('215', '27', '60', null, null, null);
INSERT INTO `sys_role_res` VALUES ('216', '27', '61', null, null, null);
INSERT INTO `sys_role_res` VALUES ('217', '27', '62', null, null, null);
INSERT INTO `sys_role_res` VALUES ('218', '27', '63', null, null, null);
INSERT INTO `sys_role_res` VALUES ('219', '27', '64', null, null, null);
INSERT INTO `sys_role_res` VALUES ('220', '27', '65', null, null, null);
INSERT INTO `sys_role_res` VALUES ('221', '27', '66', null, null, null);
INSERT INTO `sys_role_res` VALUES ('222', '27', '67', null, null, null);
INSERT INTO `sys_role_res` VALUES ('223', '27', '68', null, null, null);
INSERT INTO `sys_role_res` VALUES ('224', '27', '69', null, null, null);
INSERT INTO `sys_role_res` VALUES ('225', '27', '70', null, null, null);
INSERT INTO `sys_role_res` VALUES ('226', '27', '71', null, null, null);
INSERT INTO `sys_role_res` VALUES ('227', '27', '72', null, null, null);
INSERT INTO `sys_role_res` VALUES ('228', '27', '73', null, null, null);
INSERT INTO `sys_role_res` VALUES ('229', '27', '74', null, null, null);
INSERT INTO `sys_role_res` VALUES ('230', '27', '75', null, null, null);
INSERT INTO `sys_role_res` VALUES ('231', '27', '76', null, null, null);
INSERT INTO `sys_role_res` VALUES ('232', '27', '77', null, null, null);
INSERT INTO `sys_role_res` VALUES ('233', '27', '78', null, null, null);
INSERT INTO `sys_role_res` VALUES ('234', '27', '79', null, null, null);
INSERT INTO `sys_role_res` VALUES ('235', '27', '80', null, null, null);
INSERT INTO `sys_role_res` VALUES ('237', '27', '82', null, null, null);
INSERT INTO `sys_role_res` VALUES ('239', '27', '84', null, null, null);
INSERT INTO `sys_role_res` VALUES ('241', '27', '86', null, null, null);
INSERT INTO `sys_role_res` VALUES ('243', '27', '88', null, null, null);
INSERT INTO `sys_role_res` VALUES ('244', '27', '89', null, null, null);
INSERT INTO `sys_role_res` VALUES ('248', '27', '93', null, null, null);
INSERT INTO `sys_role_res` VALUES ('250', '27', '95', null, null, null);
INSERT INTO `sys_role_res` VALUES ('251', '27', '96', null, null, null);
INSERT INTO `sys_role_res` VALUES ('278', '27', '127', null, null, null);
INSERT INTO `sys_role_res` VALUES ('279', '27', '128', null, null, null);
INSERT INTO `sys_role_res` VALUES ('290', '27', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('292', '27', '135', null, null, null);
INSERT INTO `sys_role_res` VALUES ('295', '27', '151', null, null, null);
INSERT INTO `sys_role_res` VALUES ('300', '27', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('301', '27', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('302', '27', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('303', '27', '152', null, null, null);
INSERT INTO `sys_role_res` VALUES ('304', '27', '153', null, null, null);
INSERT INTO `sys_role_res` VALUES ('321', '27', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('322', '27', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('323', '27', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('324', '27', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('329', '27', '99', null, null, null);
INSERT INTO `sys_role_res` VALUES ('330', '27', '100', null, null, null);
INSERT INTO `sys_role_res` VALUES ('332', '27', '102', null, null, null);
INSERT INTO `sys_role_res` VALUES ('333', '27', '120', null, null, null);
INSERT INTO `sys_role_res` VALUES ('334', '27', '121', null, null, null);
INSERT INTO `sys_role_res` VALUES ('335', '27', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('336', '27', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('337', '27', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('338', '27', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('339', '27', '83', null, null, null);
INSERT INTO `sys_role_res` VALUES ('340', '27', '85', null, null, null);
INSERT INTO `sys_role_res` VALUES ('341', '27', '87', null, null, null);
INSERT INTO `sys_role_res` VALUES ('342', '27', '123', null, null, null);
INSERT INTO `sys_role_res` VALUES ('502', '27', '170', null, null, null);
INSERT INTO `sys_role_res` VALUES ('503', '27', '169', null, null, null);
INSERT INTO `sys_role_res` VALUES ('558', '27', '101', null, null, null);
INSERT INTO `sys_role_res` VALUES ('559', '27', '186', null, null, null);
INSERT INTO `sys_role_res` VALUES ('560', '27', '187', null, null, null);
INSERT INTO `sys_role_res` VALUES ('561', '27', '188', null, null, null);
INSERT INTO `sys_role_res` VALUES ('562', '27', '189', null, null, null);
INSERT INTO `sys_role_res` VALUES ('563', '27', '190', null, null, null);
INSERT INTO `sys_role_res` VALUES ('564', '27', '191', null, null, null);
INSERT INTO `sys_role_res` VALUES ('565', '27', '192', null, null, null);
INSERT INTO `sys_role_res` VALUES ('566', '27', '201', null, null, null);
INSERT INTO `sys_role_res` VALUES ('567', '27', '202', null, null, null);
INSERT INTO `sys_role_res` VALUES ('568', '27', '203', null, null, null);
INSERT INTO `sys_role_res` VALUES ('569', '27', '204', null, null, null);
INSERT INTO `sys_role_res` VALUES ('570', '27', '205', null, null, null);
INSERT INTO `sys_role_res` VALUES ('571', '27', '206', null, null, null);
INSERT INTO `sys_role_res` VALUES ('572', '27', '207', null, null, null);
INSERT INTO `sys_role_res` VALUES ('573', '27', '208', null, null, null);
INSERT INTO `sys_role_res` VALUES ('574', '27', '210', null, null, null);
INSERT INTO `sys_role_res` VALUES ('575', '27', '211', null, null, null);
INSERT INTO `sys_role_res` VALUES ('576', '27', '212', null, null, null);
INSERT INTO `sys_role_res` VALUES ('577', '27', '213', null, null, null);
INSERT INTO `sys_role_res` VALUES ('578', '27', '214', null, null, null);
INSERT INTO `sys_role_res` VALUES ('579', '27', '215', null, null, null);
INSERT INTO `sys_role_res` VALUES ('580', '27', '216', null, null, null);
INSERT INTO `sys_role_res` VALUES ('581', '27', '217', null, null, null);
INSERT INTO `sys_role_res` VALUES ('582', '27', '218', null, null, null);
INSERT INTO `sys_role_res` VALUES ('583', '27', '219', null, null, null);
INSERT INTO `sys_role_res` VALUES ('584', '27', '220', null, null, null);
INSERT INTO `sys_role_res` VALUES ('585', '27', '221', null, null, null);
INSERT INTO `sys_role_res` VALUES ('586', '27', '222', null, null, null);
INSERT INTO `sys_role_res` VALUES ('587', '27', '223', null, null, null);
INSERT INTO `sys_role_res` VALUES ('588', '27', '224', null, null, null);
INSERT INTO `sys_role_res` VALUES ('589', '27', '225', null, null, null);
INSERT INTO `sys_role_res` VALUES ('590', '27', '226', null, null, null);
INSERT INTO `sys_role_res` VALUES ('591', '27', '227', null, null, null);
INSERT INTO `sys_role_res` VALUES ('592', '27', '228', null, null, null);
INSERT INTO `sys_role_res` VALUES ('593', '27', '229', null, null, null);
INSERT INTO `sys_role_res` VALUES ('594', '27', '230', null, null, null);
INSERT INTO `sys_role_res` VALUES ('595', '27', '231', null, null, null);
INSERT INTO `sys_role_res` VALUES ('604', '47', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('605', '47', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('606', '47', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('607', '47', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('608', '47', '83', null, null, null);
INSERT INTO `sys_role_res` VALUES ('609', '47', '85', null, null, null);
INSERT INTO `sys_role_res` VALUES ('610', '47', '87', null, null, null);
INSERT INTO `sys_role_res` VALUES ('611', '47', '123', null, null, null);
INSERT INTO `sys_role_res` VALUES ('612', '47', '186', null, null, null);
INSERT INTO `sys_role_res` VALUES ('613', '47', '187', null, null, null);
INSERT INTO `sys_role_res` VALUES ('614', '47', '188', null, null, null);
INSERT INTO `sys_role_res` VALUES ('650', '2', '156', null, null, null);
INSERT INTO `sys_role_res` VALUES ('651', '2', '157', null, null, null);
INSERT INTO `sys_role_res` VALUES ('652', '2', '158', null, null, null);
INSERT INTO `sys_role_res` VALUES ('653', '2', '159', null, null, null);
INSERT INTO `sys_role_res` VALUES ('654', '2', '160', null, null, null);
INSERT INTO `sys_role_res` VALUES ('655', '2', '161', null, null, null);
INSERT INTO `sys_role_res` VALUES ('656', '2', '162', null, null, null);
INSERT INTO `sys_role_res` VALUES ('657', '2', '163', null, null, null);
INSERT INTO `sys_role_res` VALUES ('658', '2', '164', null, null, null);
INSERT INTO `sys_role_res` VALUES ('659', '2', '165', null, null, null);
INSERT INTO `sys_role_res` VALUES ('660', '2', '166', null, null, null);
INSERT INTO `sys_role_res` VALUES ('661', '2', '167', null, null, null);
INSERT INTO `sys_role_res` VALUES ('662', '2', '168', null, null, null);
INSERT INTO `sys_role_res` VALUES ('663', '2', '171', null, null, null);
INSERT INTO `sys_role_res` VALUES ('664', '2', '172', null, null, null);
INSERT INTO `sys_role_res` VALUES ('665', '2', '173', null, null, null);
INSERT INTO `sys_role_res` VALUES ('666', '2', '174', null, null, null);
INSERT INTO `sys_role_res` VALUES ('667', '2', '175', null, null, null);
INSERT INTO `sys_role_res` VALUES ('668', '2', '176', null, null, null);
INSERT INTO `sys_role_res` VALUES ('669', '2', '177', null, null, null);
INSERT INTO `sys_role_res` VALUES ('670', '2', '178', null, null, null);
INSERT INTO `sys_role_res` VALUES ('671', '2', '179', null, null, null);
INSERT INTO `sys_role_res` VALUES ('672', '2', '180', null, null, null);
INSERT INTO `sys_role_res` VALUES ('673', '2', '181', null, null, null);
INSERT INTO `sys_role_res` VALUES ('674', '2', '182', null, null, null);
INSERT INTO `sys_role_res` VALUES ('675', '2', '183', null, null, null);
INSERT INTO `sys_role_res` VALUES ('863', '27', '81', null, null, null);
INSERT INTO `sys_role_res` VALUES ('864', '27', '154', null, null, null);
INSERT INTO `sys_role_res` VALUES ('865', '27', '155', null, null, null);
INSERT INTO `sys_role_res` VALUES ('866', '27', '184', null, null, null);
INSERT INTO `sys_role_res` VALUES ('867', '27', '185', null, null, null);
INSERT INTO `sys_role_res` VALUES ('882', '27', '94', null, null, null);
INSERT INTO `sys_role_res` VALUES ('883', '27', '97', null, null, null);
INSERT INTO `sys_role_res` VALUES ('885', '27', '245', null, null, null);
INSERT INTO `sys_role_res` VALUES ('886', '27', '246', null, null, null);
INSERT INTO `sys_role_res` VALUES ('887', '27', '247', null, null, null);
INSERT INTO `sys_role_res` VALUES ('894', '50', '250', null, null, null);
INSERT INTO `sys_role_res` VALUES ('895', '50', '251', null, null, null);
INSERT INTO `sys_role_res` VALUES ('896', '50', '254', null, null, null);
INSERT INTO `sys_role_res` VALUES ('897', '50', '255', null, null, null);
INSERT INTO `sys_role_res` VALUES ('898', '50', '253', null, null, null);
INSERT INTO `sys_role_res` VALUES ('899', '50', '252', null, null, null);
INSERT INTO `sys_role_res` VALUES ('900', '50', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('901', '50', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('902', '50', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('903', '50', '59', null, null, null);
INSERT INTO `sys_role_res` VALUES ('904', '50', '61', null, null, null);
INSERT INTO `sys_role_res` VALUES ('905', '50', '62', null, null, null);
INSERT INTO `sys_role_res` VALUES ('906', '50', '64', null, null, null);
INSERT INTO `sys_role_res` VALUES ('907', '50', '67', null, null, null);
INSERT INTO `sys_role_res` VALUES ('908', '50', '68', null, null, null);
INSERT INTO `sys_role_res` VALUES ('909', '50', '72', null, null, null);
INSERT INTO `sys_role_res` VALUES ('910', '50', '74', null, null, null);
INSERT INTO `sys_role_res` VALUES ('911', '50', '76', null, null, null);
INSERT INTO `sys_role_res` VALUES ('912', '50', '78', null, null, null);
INSERT INTO `sys_role_res` VALUES ('913', '50', '80', null, null, null);
INSERT INTO `sys_role_res` VALUES ('914', '50', '82', null, null, null);
INSERT INTO `sys_role_res` VALUES ('915', '50', '84', null, null, null);
INSERT INTO `sys_role_res` VALUES ('916', '50', '86', null, null, null);
INSERT INTO `sys_role_res` VALUES ('917', '50', '88', null, null, null);
INSERT INTO `sys_role_res` VALUES ('918', '50', '89', null, null, null);
INSERT INTO `sys_role_res` VALUES ('919', '50', '93', null, null, null);
INSERT INTO `sys_role_res` VALUES ('920', '50', '95', null, null, null);
INSERT INTO `sys_role_res` VALUES ('921', '50', '96', null, null, null);
INSERT INTO `sys_role_res` VALUES ('922', '50', '256', null, null, null);
INSERT INTO `sys_role_res` VALUES ('923', '50', '257', null, null, null);
INSERT INTO `sys_role_res` VALUES ('924', '50', '258', null, null, null);
INSERT INTO `sys_role_res` VALUES ('925', '50', '259', null, null, null);
INSERT INTO `sys_role_res` VALUES ('926', '50', '260', null, null, null);
INSERT INTO `sys_role_res` VALUES ('927', '50', '261', null, null, null);
INSERT INTO `sys_role_res` VALUES ('928', '50', '262', null, null, null);
INSERT INTO `sys_role_res` VALUES ('929', '50', '263', null, null, null);
INSERT INTO `sys_role_res` VALUES ('930', '50', '264', null, null, null);
INSERT INTO `sys_role_res` VALUES ('931', '50', '265', null, null, null);
INSERT INTO `sys_role_res` VALUES ('932', '50', '269', null, null, null);
INSERT INTO `sys_role_res` VALUES ('933', '50', '270', null, null, null);
INSERT INTO `sys_role_res` VALUES ('934', '50', '271', null, null, null);
INSERT INTO `sys_role_res` VALUES ('935', '50', '272', null, null, null);
INSERT INTO `sys_role_res` VALUES ('936', '47', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('937', '47', '135', null, null, null);
INSERT INTO `sys_role_res` VALUES ('938', '47', '151', null, null, null);
INSERT INTO `sys_role_res` VALUES ('939', '47', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('940', '47', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('941', '47', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('942', '47', '152', null, null, null);
INSERT INTO `sys_role_res` VALUES ('943', '47', '153', null, null, null);
INSERT INTO `sys_role_res` VALUES ('944', '47', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('945', '47', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('946', '47', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('947', '47', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('948', '47', '170', null, null, null);
INSERT INTO `sys_role_res` VALUES ('949', '47', '169', null, null, null);
INSERT INTO `sys_role_res` VALUES ('950', '47', '94', null, null, null);
INSERT INTO `sys_role_res` VALUES ('951', '47', '97', null, null, null);
INSERT INTO `sys_role_res` VALUES ('952', '47', '99', null, null, null);
INSERT INTO `sys_role_res` VALUES ('953', '47', '100', null, null, null);
INSERT INTO `sys_role_res` VALUES ('954', '47', '101', null, null, null);
INSERT INTO `sys_role_res` VALUES ('955', '47', '102', null, null, null);
INSERT INTO `sys_role_res` VALUES ('956', '47', '120', null, null, null);
INSERT INTO `sys_role_res` VALUES ('957', '47', '121', null, null, null);
INSERT INTO `sys_role_res` VALUES ('958', '47', '189', null, null, null);
INSERT INTO `sys_role_res` VALUES ('959', '47', '190', null, null, null);
INSERT INTO `sys_role_res` VALUES ('960', '47', '191', null, null, null);
INSERT INTO `sys_role_res` VALUES ('961', '47', '192', null, null, null);
INSERT INTO `sys_role_res` VALUES ('962', '47', '201', null, null, null);
INSERT INTO `sys_role_res` VALUES ('963', '47', '202', null, null, null);
INSERT INTO `sys_role_res` VALUES ('964', '47', '203', null, null, null);
INSERT INTO `sys_role_res` VALUES ('965', '47', '204', null, null, null);
INSERT INTO `sys_role_res` VALUES ('966', '47', '205', null, null, null);
INSERT INTO `sys_role_res` VALUES ('967', '47', '206', null, null, null);
INSERT INTO `sys_role_res` VALUES ('968', '47', '207', null, null, null);
INSERT INTO `sys_role_res` VALUES ('969', '47', '208', null, null, null);
INSERT INTO `sys_role_res` VALUES ('970', '47', '210', null, null, null);
INSERT INTO `sys_role_res` VALUES ('971', '47', '211', null, null, null);
INSERT INTO `sys_role_res` VALUES ('972', '47', '212', null, null, null);
INSERT INTO `sys_role_res` VALUES ('973', '47', '213', null, null, null);
INSERT INTO `sys_role_res` VALUES ('974', '47', '214', null, null, null);
INSERT INTO `sys_role_res` VALUES ('975', '47', '215', null, null, null);
INSERT INTO `sys_role_res` VALUES ('976', '47', '216', null, null, null);
INSERT INTO `sys_role_res` VALUES ('977', '47', '217', null, null, null);
INSERT INTO `sys_role_res` VALUES ('978', '47', '218', null, null, null);
INSERT INTO `sys_role_res` VALUES ('979', '47', '219', null, null, null);
INSERT INTO `sys_role_res` VALUES ('980', '47', '220', null, null, null);
INSERT INTO `sys_role_res` VALUES ('981', '47', '221', null, null, null);
INSERT INTO `sys_role_res` VALUES ('982', '47', '222', null, null, null);
INSERT INTO `sys_role_res` VALUES ('983', '47', '223', null, null, null);
INSERT INTO `sys_role_res` VALUES ('984', '47', '224', null, null, null);
INSERT INTO `sys_role_res` VALUES ('985', '47', '225', null, null, null);
INSERT INTO `sys_role_res` VALUES ('986', '47', '226', null, null, null);
INSERT INTO `sys_role_res` VALUES ('987', '47', '227', null, null, null);
INSERT INTO `sys_role_res` VALUES ('988', '47', '228', null, null, null);
INSERT INTO `sys_role_res` VALUES ('989', '47', '229', null, null, null);
INSERT INTO `sys_role_res` VALUES ('990', '47', '230', null, null, null);
INSERT INTO `sys_role_res` VALUES ('991', '47', '231', null, null, null);
INSERT INTO `sys_role_res` VALUES ('992', '47', '245', null, null, null);
INSERT INTO `sys_role_res` VALUES ('993', '47', '246', null, null, null);
INSERT INTO `sys_role_res` VALUES ('994', '47', '247', null, null, null);
INSERT INTO `sys_role_res` VALUES ('995', '27', '250', null, null, null);
INSERT INTO `sys_role_res` VALUES ('996', '27', '251', null, null, null);
INSERT INTO `sys_role_res` VALUES ('997', '27', '254', null, null, null);
INSERT INTO `sys_role_res` VALUES ('998', '27', '255', null, null, null);
INSERT INTO `sys_role_res` VALUES ('999', '27', '253', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1000', '27', '252', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1001', '27', '256', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1002', '27', '257', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1003', '27', '258', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1004', '27', '259', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1005', '27', '260', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1006', '27', '261', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1007', '27', '262', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1008', '27', '263', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1009', '27', '264', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1010', '27', '265', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1011', '27', '269', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1012', '27', '270', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1013', '27', '271', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1014', '27', '272', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1015', '47', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1016', '47', '81', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1017', '47', '154', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1018', '47', '155', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1019', '47', '184', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1020', '47', '185', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1021', '50', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1022', '50', '81', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1023', '50', '154', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1024', '50', '155', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1025', '50', '184', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1026', '50', '185', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1027', '2', '273', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1028', '2', '275', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1029', '2', '276', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1030', '2', '277', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1031', '2', '278', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1032', '2', '274', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1033', '2', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1034', '2', '81', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1035', '2', '154', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1036', '2', '155', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1037', '2', '184', null, null, null);
INSERT INTO `sys_role_res` VALUES ('1038', '2', '185', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '696847befefd6e5ce7236b0e00f6b6ba', 'admin', 'administrator', '110@qq.com', '110', '1111', 'none', '1', '1', '2018-08-09 09:03:36', '2018-11-02 15:32:35');
INSERT INTO `sys_user` VALUES ('27', 'xyr', '696847befefd6e5ce7236b0e00f6b6ba', '向艳蓉', '向艳蓉', '1002@hncy58.com', '18888886666', '0101', '主任', '1', '1', '2018-08-23 10:10:04', '2018-11-07 10:50:37');
INSERT INTO `sys_user` VALUES ('28', 'wrx', '696847befefd6e5ce7236b0e00f6b6ba', '王仁兴', '王仁兴', 'wrx@hncy58.com', '18888886666', '0101', 'fasdf', '1', '1', '2018-08-24 10:57:11', '2018-09-27 08:54:00');
INSERT INTO `sys_user` VALUES ('29', 'xuehaiwei', '7ce634a719db7a92ad2dd3d85b307f9f', '薛海伟23', 'fasdfasdf', '', '18888888888', '信息科技部', 'asdfasd', '1', '1', '2018-08-25 16:42:16', '2018-11-07 18:57:33');
INSERT INTO `sys_user` VALUES ('71', 'tokings', '696847befefd6e5ce7236b0e00f6b6ba', 'tokings', '', '', '', '0', '', '1', '1', '2018-08-29 11:50:23', '2018-11-07 19:19:26');
INSERT INTO `sys_user` VALUES ('81', 'lds', '7ce634a719db7a92ad2dd3d85b307f9f', 'lds', '', '', '', '0', '', '1', '1', '2018-08-29 11:59:50', '2018-11-09 18:51:46');
INSERT INTO `sys_user` VALUES ('82', 'zhuhong', '7ce634a719db7a92ad2dd3d85b307f9f', '朱虹', '', '', '18888888888', '风险合规部', '', '1', '0', '2018-09-10 14:58:46', '2018-11-02 17:38:48');
INSERT INTO `sys_user` VALUES ('107', 'wjl01', '7ce634a719db7a92ad2dd3d85b307f9f', '12', '', '', '', '12', '', '1', '1', '2018-09-18 09:10:13', '2018-11-07 14:43:00');
INSERT INTO `sys_user` VALUES ('124', 'lzc', '7ce634a719db7a92ad2dd3d85b307f9f', 'liuzhichao', '', '', '', '信息科技部', '', '1', '1', '2018-10-09 08:41:24', '2018-11-07 11:21:12');
INSERT INTO `sys_user` VALUES ('130', 'tanfei', '7ce634a719db7a92ad2dd3d85b307f9f', '谭斐', '测试人员', null, '', '测试', '', '1', '1', '2018-10-24 10:00:39', '2018-10-29 17:24:23');
INSERT INTO `sys_user` VALUES ('131', 'xiaoning', '7ce634a719db7a92ad2dd3d85b307f9f', '邓小宁', '测试人员', null, '', '软件测试', '', '1', '1', '2018-10-24 10:36:26', '2018-11-01 11:14:26');
INSERT INTO `sys_user` VALUES ('132', 'zhangwenchao', '7ce634a719db7a92ad2dd3d85b307f9f', '张文超', '测试人员', '', '', '账务开发', '', '1', '1', '2018-10-24 10:40:28', '2018-10-24 16:14:40');

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
  PRIMARY KEY (`id`),
  KEY `idx_opr_log_user_id` (`user_id`) USING HASH,
  KEY `idx_opr_log_token` (`token`),
  KEY `idx_opr_log_opr_time` (`opr_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=919810 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '超级管理员', null, null);
INSERT INTO `sys_user_role` VALUES ('2', '27', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('101', '28', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('102', '29', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('111', '82', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('112', '91', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('114', '93', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('116', '98', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('117', '107', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('119', '109', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('120', '108', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('121', '99', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('122', '99', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('134', '71', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('137', '71', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('138', '124', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('141', '130', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('142', '131', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('143', '132', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('144', '107', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('145', '107', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('146', '81', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('147', '81', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('148', '81', '47', null, null, null);
INSERT INTO `sys_user_role` VALUES ('149', '81', '50', null, null, null);
INSERT INTO `sys_user_role` VALUES ('150', '81', '1', null, null, null);
