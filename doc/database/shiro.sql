/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-01-23 20:13:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_account
-- ----------------------------
DROP TABLE IF EXISTS `business_account`;
CREATE TABLE `business_account` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password_login` varchar(255) NOT NULL,
  `password_pay` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_email` varchar(255) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `state` char(1) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `person_id` varchar(50) DEFAULT NULL,
  `person_name` varchar(50) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `exception_reason` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_account
-- ----------------------------
INSERT INTO `business_account` VALUES ('1', 'zh_201701110001', '123456', '666666', 'zh_201701110001@163.com', '666666', '潍坊', '移动', '银牌会员', '0', '2017-01-14 09:01:48', '15764348765', '潍坊', '12312312313123123', '123', null, '123', '2017-01-11 11:05:22');
INSERT INTO `business_account` VALUES ('2', 'zh_201701110002', '111111', '111111', 'zh_201701110002@126.com', '111111', '潍坊', '电信', '铜牌会员', '0', '2017-01-12 14:43:39', '11111', '安丘', '11111', '李四', '删除', '123', '2017-01-11 14:39:57');
INSERT INTO `business_account` VALUES ('9', 'zh_201701120001', '222222', '2222222', 'zh_201701120001@163.com', '333333', '北京', '联通', '铜牌会员', '2', '2017-01-12 16:03:15', '2222', '海淀', '11111', '王五', 'asdf', 'asdf', '2017-01-12 16:03:21');
INSERT INTO `business_account` VALUES ('10', 'zh_201701140001', '222222', '222222', 'zh_201701140001@qq.com', '222222', '青岛', '移动', '钻石会员', '0', '2017-01-14 09:04:06', '15434322323', '高新区', '3729273646382742737', '王九', null, null, '2017-01-14 09:04:11');

-- ----------------------------
-- Table structure for business_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `business_bankcard`;
CREATE TABLE `business_bankcard` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_num` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_bankcard
-- ----------------------------
INSERT INTO `business_bankcard` VALUES ('1', '建设银行', '22223534456976543', '66666', '666666');

-- ----------------------------
-- Table structure for business_goods
-- ----------------------------
DROP TABLE IF EXISTS `business_goods`;
CREATE TABLE `business_goods` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `goods_num` varchar(100) NOT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `type` bigint(19) DEFAULT NULL,
  `type_limit` char(1) DEFAULT NULL,
  `shop_id` bigint(19) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_goods
-- ----------------------------
INSERT INTO `business_goods` VALUES ('1', '1', '2', '1', '2', '1', '2', '1');
INSERT INTO `business_goods` VALUES ('2', '2', '2', '2', '1', '0', '2', '2');
INSERT INTO `business_goods` VALUES ('3', '3', '3', '3', '3', '0', '2', '3');
INSERT INTO `business_goods` VALUES ('4', '4', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for business_setting
-- ----------------------------
DROP TABLE IF EXISTS `business_setting`;
CREATE TABLE `business_setting` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `limit_shop` int(11) DEFAULT NULL,
  `limit_good` int(11) DEFAULT NULL,
  `limit_number` int(11) DEFAULT NULL,
  `limit_money` float DEFAULT NULL,
  `limit_receipt_day` int(11) DEFAULT NULL,
  `limit_register_day` int(11) DEFAULT NULL,
  `limit_ip` int(11) DEFAULT NULL,
  `limit_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_setting
-- ----------------------------
INSERT INTO `business_setting` VALUES ('1', '1', '2', '3', '4', '7', '8', '5', '6');

-- ----------------------------
-- Table structure for business_shop
-- ----------------------------
DROP TABLE IF EXISTS `business_shop`;
CREATE TABLE `business_shop` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100) NOT NULL,
  `payment` float DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `commission_farming_app` float DEFAULT NULL,
  `commission_farming_pc` float DEFAULT NULL,
  `commission_receipt_evaluate` float DEFAULT NULL,
  `commission_receipt` float DEFAULT NULL,
  `commission_evaluate` float DEFAULT NULL,
  `cooperate_date` datetime DEFAULT NULL,
  `receipt_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_shop
-- ----------------------------
INSERT INTO `business_shop` VALUES ('1', '旗舰店', '0', '0', null, null, null, null, null, '2017-01-15 15:24:12', '0');
INSERT INTO `business_shop` VALUES ('2', '专卖店', '0', '0', '1', '2', '3', '4', '4', '2017-01-15 00:00:00', '1');

-- ----------------------------
-- Table structure for business_task
-- ----------------------------
DROP TABLE IF EXISTS `business_task`;
CREATE TABLE `business_task` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `type` char(1) DEFAULT NULL,
  `goods_num` varchar(100) DEFAULT NULL,
  `farming_type` varchar(100) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `order_num` varchar(100) DEFAULT NULL,
  `evaluate_world` varchar(255) DEFAULT NULL,
  `show_picture` char(1) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `owner_id` bigint(19) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `assign_time` datetime DEFAULT NULL,
  `complete_ip` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_task
-- ----------------------------
INSERT INTO `business_task` VALUES ('1', '0', '1', '1', '1', '1', null, null, null, null, '0', null, null, null, null, null, null, '2017-01-17 15:15:03', '1');
INSERT INTO `business_task` VALUES ('3', '1', null, '0', null, '111', '111', '111', '0', '123', '0', null, null, null, null, null, null, '2017-01-17 15:22:54', '1');
INSERT INTO `business_task` VALUES ('5', '2', null, null, null, null, '1232', null, null, null, '0', null, null, null, null, null, null, '2017-01-17 15:28:31', '1');
INSERT INTO `business_task` VALUES ('6', '3', null, '0', null, '123', '123', '123', '0', '123', '1', null, '1', 'admin', null, '2017-01-19 16:07:37', null, '2017-01-17 15:28:44', '1');
INSERT INTO `business_task` VALUES ('7', '0', '1', '0', '', '', null, null, null, null, '1', null, '1', 'admin', null, '2017-01-19 16:05:58', null, '2017-01-17 16:29:25', '1');

-- ----------------------------
-- Table structure for business_type
-- ----------------------------
DROP TABLE IF EXISTS `business_type`;
CREATE TABLE `business_type` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `mark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_type
-- ----------------------------
INSERT INTO `business_type` VALUES ('1', '男装', '男装');
INSERT INTO `business_type` VALUES ('2', '女装', '女装');
INSERT INTO `business_type` VALUES ('3', '皮鞋', '皮鞋');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '王家桥', '01', 'fi-social-windows', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'fi-social-github', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'fi-social-apple', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'fi-social-snapchat', '3', '0', '2015-12-06 13:12:18');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '系统管理', 'fi-folder', null, '90', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('3', '账号管理', '', null, '账号管理', 'fi-folder', null, '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', '1', '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('31', '正常账号', '/account/normal', 'ajax', '正常账号管理', 'fi-database', '3', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('32', '异常账号', '/account/abnormal', 'ajax', '异常账号管理', 'fi-info', '3', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('33', '回收站', '/account/recycle', 'ajax', '回收站', 'fi-trash', '3', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, null, 'fi-folder', null, '99', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, 'fi-unlock', null, '30', '0', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', 'ajax', null, 'fi-info', '221', '0', '0', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', 'iframe', null, 'fi-monitor', '221', '0', '0', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '系统图标', '/icons.html', 'ajax', null, 'fi-photo', '221', '0', '0', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('230', '列表', '/account/dataGrid', 'ajax', null, 'fi-list', '31', '0', '0', '1', '2017-01-11 11:17:38');
INSERT INTO `resource` VALUES ('231', '添加', '/account/add', 'ajax', null, 'fi-page-add', '31', '0', '0', '1', '2017-01-11 11:18:31');
INSERT INTO `resource` VALUES ('232', '编辑', '/account/edit', 'ajax', null, 'fi-page-edit', '31', '0', '0', '1', '2017-01-11 14:41:51');
INSERT INTO `resource` VALUES ('233', '删除', '/account/delete', 'ajax', null, 'fi-page-delete', '31', '0', '0', '1', '2017-01-11 14:42:26');
INSERT INTO `resource` VALUES ('234', '详细', '/account/detail', 'ajax', null, 'fi-zoom-in', '31', '0', '0', '1', '2017-01-12 15:05:53');
INSERT INTO `resource` VALUES ('235', '异常', '/account/excep', 'ajax', null, 'fi-info', '31', '0', '0', '1', '2017-01-12 19:20:21');
INSERT INTO `resource` VALUES ('236', '恢复', '/account/recovery', 'ajax', null, 'fi-info', '32', '0', '0', '1', '2017-01-12 20:35:49');
INSERT INTO `resource` VALUES ('237', '删除', '/account/deleab', 'ajax', null, 'fi-page-delete', '32', '0', '0', '1', '2017-01-12 20:52:46');
INSERT INTO `resource` VALUES ('238', '异常', '/account/excepre', 'ajax', null, 'fi-info', '33', '0', '0', '1', '2017-01-12 21:19:18');
INSERT INTO `resource` VALUES ('239', '业务设置', '', null, null, 'fi-folder', null, '20', '0', '0', '2017-01-14 10:24:35');
INSERT INTO `resource` VALUES ('240', '参数设置', '/setting/setPage', null, null, 'fi-wrench', '239', '1', '0', '0', '2017-01-14 10:26:43');
INSERT INTO `resource` VALUES ('241', '分类设置', '/type/manager', null, null, 'fi-folder', '239', '2', '0', '0', '2017-01-14 10:59:47');
INSERT INTO `resource` VALUES ('242', '列表', '/type/treeGrid', 'ajax', null, 'fi-list', '241', '0', '0', '1', '2017-01-14 11:03:10');
INSERT INTO `resource` VALUES ('243', '添加', '/type/add', 'ajax', null, 'fi-page-add', '241', '0', '0', '1', '2017-01-14 11:03:54');
INSERT INTO `resource` VALUES ('244', '编辑', '/type/edit', 'ajax', null, 'fi-page-edit', '241', '0', '0', '1', '2017-01-14 11:04:35');
INSERT INTO `resource` VALUES ('245', '删除', '/type/delete', 'ajax', null, 'fi-page-delete', '241', '0', '0', '1', '2017-01-14 11:05:10');
INSERT INTO `resource` VALUES ('246', '银行卡管理', '/bankcard/manager', null, null, 'fi-credit-card', '239', '2', '0', '0', '2017-01-15 13:02:44');
INSERT INTO `resource` VALUES ('247', '列表', '/bankcard/dataGrid', 'ajax', null, 'fi-list', '246', '0', '0', '1', '2017-01-15 13:04:45');
INSERT INTO `resource` VALUES ('248', '添加', '/bankcard/add', 'ajax', null, 'fi-page-add', '246', '0', '0', '1', '2017-01-15 13:06:14');
INSERT INTO `resource` VALUES ('249', '编辑', '/bankcard/edit', 'ajax', null, 'fi-page-edit', '246', '0', '0', '1', '2017-01-15 13:06:53');
INSERT INTO `resource` VALUES ('250', '删除', '/bankcard/delete', 'ajax', null, 'fi-page-delete', '246', '0', '0', '1', '2017-01-15 13:07:43');
INSERT INTO `resource` VALUES ('251', '店铺管理', '', null, null, 'fi-folder', null, '2', '0', '0', '2017-01-15 15:02:16');
INSERT INTO `resource` VALUES ('252', '店铺管理', '/shop/manager', null, null, 'fi-shopping-cart', '251', '0', '0', '0', '2017-01-15 15:04:42');
INSERT INTO `resource` VALUES ('253', '列表', '/shop/dataGrid', 'ajax', null, 'fi-list', '252', '0', '0', '1', '2017-01-15 13:04:45');
INSERT INTO `resource` VALUES ('254', '添加', '/shop/add', 'ajax', null, 'fi-page-add', '252', '0', '0', '1', '2017-01-15 13:06:14');
INSERT INTO `resource` VALUES ('255', '编辑', '/shop/edit', 'ajax', null, 'fi-page-edit', '252', '0', '0', '1', '2017-01-15 13:06:53');
INSERT INTO `resource` VALUES ('256', '删除', '/shop/delete', 'ajax', null, 'fi-page-delete', '252', '0', '0', '1', '2017-01-15 13:07:43');
INSERT INTO `resource` VALUES ('257', '任务管理', '', null, null, 'fi-folder', null, '3', '0', '0', '2017-01-17 10:44:57');
INSERT INTO `resource` VALUES ('258', '任务管理', '/task/manager', null, null, 'fi-folder', '257', '0', '0', '0', '2017-01-17 10:46:09');
INSERT INTO `resource` VALUES ('259', '列表', '/task/dataGrid', 'ajax', null, 'fi-list', '258', '0', '0', '1', '2017-01-17 10:48:33');
INSERT INTO `resource` VALUES ('260', '添加', '/task/add', 'ajax', null, 'fi-page-add', '258', '0', '0', '1', '2017-01-17 10:49:29');
INSERT INTO `resource` VALUES ('261', '编辑', '/task/edit', 'ajax', null, 'fi-page-edit', '258', '0', '0', '1', '2017-01-17 10:53:08');
INSERT INTO `resource` VALUES ('262', '删除', '/task/delete', 'ajax', null, 'fi-page-delete', '258', '0', '0', '1', '2017-01-17 10:54:01');
INSERT INTO `resource` VALUES ('263', '分配', '/task/distribution', 'ajax', null, 'fi-torso', '258', '0', '0', '1', '2017-01-18 10:14:50');
INSERT INTO `resource` VALUES ('264', '详细', '/task/detail', 'ajax', null, 'fi-zoom-in', '258', '0', '0', '1', '2017-01-19 16:15:25');
INSERT INTO `resource` VALUES ('265', '我的任务', '/task/myTask', null, null, 'fi-paperclip', '257', '0', '0', '0', '2017-01-19 16:37:51');
INSERT INTO `resource` VALUES ('266', '列表', '/task/myDataGrid', 'ajax', null, 'fi-list', '265', '0', '0', '1', '2017-01-17 10:48:33');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'de', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', 'pm', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', 'test', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1353 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('364', '7', '222');
INSERT INTO `role_resource` VALUES ('365', '7', '223');
INSERT INTO `role_resource` VALUES ('366', '7', '224');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('442', '2', '222');
INSERT INTO `role_resource` VALUES ('443', '2', '223');
INSERT INTO `role_resource` VALUES ('444', '2', '224');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('479', '8', '1');
INSERT INTO `role_resource` VALUES ('480', '8', '11');
INSERT INTO `role_resource` VALUES ('481', '8', '111');
INSERT INTO `role_resource` VALUES ('482', '8', '12');
INSERT INTO `role_resource` VALUES ('483', '8', '121');
INSERT INTO `role_resource` VALUES ('484', '8', '13');
INSERT INTO `role_resource` VALUES ('485', '8', '131');
INSERT INTO `role_resource` VALUES ('486', '8', '14');
INSERT INTO `role_resource` VALUES ('487', '8', '141');
INSERT INTO `role_resource` VALUES ('488', '8', '222');
INSERT INTO `role_resource` VALUES ('489', '8', '223');
INSERT INTO `role_resource` VALUES ('490', '8', '224');
INSERT INTO `role_resource` VALUES ('491', '8', '221');
INSERT INTO `role_resource` VALUES ('492', '8', '227');
INSERT INTO `role_resource` VALUES ('493', '8', '228');
INSERT INTO `role_resource` VALUES ('494', '8', '229');
INSERT INTO `role_resource` VALUES ('1287', '1', '3');
INSERT INTO `role_resource` VALUES ('1288', '1', '31');
INSERT INTO `role_resource` VALUES ('1289', '1', '230');
INSERT INTO `role_resource` VALUES ('1290', '1', '231');
INSERT INTO `role_resource` VALUES ('1291', '1', '232');
INSERT INTO `role_resource` VALUES ('1292', '1', '233');
INSERT INTO `role_resource` VALUES ('1293', '1', '234');
INSERT INTO `role_resource` VALUES ('1294', '1', '235');
INSERT INTO `role_resource` VALUES ('1295', '1', '32');
INSERT INTO `role_resource` VALUES ('1296', '1', '236');
INSERT INTO `role_resource` VALUES ('1297', '1', '237');
INSERT INTO `role_resource` VALUES ('1298', '1', '33');
INSERT INTO `role_resource` VALUES ('1299', '1', '238');
INSERT INTO `role_resource` VALUES ('1300', '1', '251');
INSERT INTO `role_resource` VALUES ('1301', '1', '252');
INSERT INTO `role_resource` VALUES ('1302', '1', '256');
INSERT INTO `role_resource` VALUES ('1303', '1', '253');
INSERT INTO `role_resource` VALUES ('1304', '1', '254');
INSERT INTO `role_resource` VALUES ('1305', '1', '255');
INSERT INTO `role_resource` VALUES ('1306', '1', '257');
INSERT INTO `role_resource` VALUES ('1307', '1', '258');
INSERT INTO `role_resource` VALUES ('1308', '1', '259');
INSERT INTO `role_resource` VALUES ('1309', '1', '260');
INSERT INTO `role_resource` VALUES ('1310', '1', '261');
INSERT INTO `role_resource` VALUES ('1311', '1', '262');
INSERT INTO `role_resource` VALUES ('1312', '1', '263');
INSERT INTO `role_resource` VALUES ('1313', '1', '264');
INSERT INTO `role_resource` VALUES ('1314', '1', '265');
INSERT INTO `role_resource` VALUES ('1315', '1', '266');
INSERT INTO `role_resource` VALUES ('1316', '1', '239');
INSERT INTO `role_resource` VALUES ('1317', '1', '240');
INSERT INTO `role_resource` VALUES ('1318', '1', '241');
INSERT INTO `role_resource` VALUES ('1319', '1', '242');
INSERT INTO `role_resource` VALUES ('1320', '1', '243');
INSERT INTO `role_resource` VALUES ('1321', '1', '244');
INSERT INTO `role_resource` VALUES ('1322', '1', '245');
INSERT INTO `role_resource` VALUES ('1323', '1', '246');
INSERT INTO `role_resource` VALUES ('1324', '1', '247');
INSERT INTO `role_resource` VALUES ('1325', '1', '248');
INSERT INTO `role_resource` VALUES ('1326', '1', '249');
INSERT INTO `role_resource` VALUES ('1327', '1', '250');
INSERT INTO `role_resource` VALUES ('1328', '1', '1');
INSERT INTO `role_resource` VALUES ('1329', '1', '11');
INSERT INTO `role_resource` VALUES ('1330', '1', '111');
INSERT INTO `role_resource` VALUES ('1331', '1', '112');
INSERT INTO `role_resource` VALUES ('1332', '1', '113');
INSERT INTO `role_resource` VALUES ('1333', '1', '114');
INSERT INTO `role_resource` VALUES ('1334', '1', '12');
INSERT INTO `role_resource` VALUES ('1335', '1', '121');
INSERT INTO `role_resource` VALUES ('1336', '1', '122');
INSERT INTO `role_resource` VALUES ('1337', '1', '123');
INSERT INTO `role_resource` VALUES ('1338', '1', '124');
INSERT INTO `role_resource` VALUES ('1339', '1', '125');
INSERT INTO `role_resource` VALUES ('1340', '1', '13');
INSERT INTO `role_resource` VALUES ('1341', '1', '131');
INSERT INTO `role_resource` VALUES ('1342', '1', '132');
INSERT INTO `role_resource` VALUES ('1343', '1', '133');
INSERT INTO `role_resource` VALUES ('1344', '1', '134');
INSERT INTO `role_resource` VALUES ('1345', '1', '14');
INSERT INTO `role_resource` VALUES ('1346', '1', '141');
INSERT INTO `role_resource` VALUES ('1347', '1', '142');
INSERT INTO `role_resource` VALUES ('1348', '1', '143');
INSERT INTO `role_resource` VALUES ('1349', '1', '144');
INSERT INTO `role_resource` VALUES ('1350', '1', '221');
INSERT INTO `role_resource` VALUES ('1351', '1', '227');
INSERT INTO `role_resource` VALUES ('1352', '1', '228');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8 COMMENT='系统日志';


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '6', '2015-12-06 13:13:03');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('53', '15', '8');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('70', '1', '1');
INSERT INTO `user_role` VALUES ('71', '1', '2');
INSERT INTO `user_role` VALUES ('72', '1', '7');
INSERT INTO `user_role` VALUES ('73', '1', '8');
