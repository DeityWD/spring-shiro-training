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
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-10 11:20:00');
INSERT INTO `sys_log` VALUES ('392', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1484018431808&', '0:0:0:0:0:0:0:1', '2017-01-10 11:20:48');
INSERT INTO `sys_log` VALUES ('393', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-10 11:21:00');
INSERT INTO `sys_log` VALUES ('394', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-10 11:25:56');
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1484018431812&', '0:0:0:0:0:0:0:1', '2017-01-10 11:26:14');
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=8&resourceIds=1,11,111,12,121,13,131,14,141,222,223,224,221,227,228,229&', '0:0:0:0:0:0:0:1', '2017-01-10 11:26:33');
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-10 11:30:22');
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-01-10 11:30:54');
INSERT INTO `sys_log` VALUES ('399', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-01-10 12:10:21');
INSERT INTO `sys_log` VALUES ('400', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-10 12:11:16');
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1484018431827&', '0:0:0:0:0:0:0:1', '2017-01-10 12:11:24');
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:delete,[参数]:id=222&', '0:0:0:0:0:0:0:1', '2017-01-10 13:20:56');
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:delete,[参数]:id=223&', '0:0:0:0:0:0:0:1', '2017-01-10 13:21:06');
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:delete,[参数]:id=224&', '0:0:0:0:0:0:0:1', '2017-01-10 13:21:12');
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1484025975744&', '0:0:0:0:0:0:0:1', '2017-01-10 13:31:04');
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1484025975745&', '0:0:0:0:0:0:0:1', '2017-01-10 13:50:23');
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-10 14:24:19');
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-10 14:39:26');
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1484025975750&', '0:0:0:0:0:0:0:1', '2017-01-10 14:40:15');
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-01-10 14:51:04');
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-10 15:09:15');
INSERT INTO `sys_log` VALUES ('412', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-10 15:27:21');
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-11 11:16:06');
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/account/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-11 11:17:38');
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-11 11:17:44');
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/account/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-11 11:18:31');
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484104835826&', '0:0:0:0:0:0:0:1', '2017-01-11 11:20:54');
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,32,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-11 11:21:03');
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 11:21:12');
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:08:22');
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:13:31');
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:22:36');
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:23:38');
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:27:24');
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-11 13:27:38');
INSERT INTO `sys_log` VALUES ('426', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:27:48');
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:29:18');
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:30:17');
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:45:30');
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:51:20');
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 13:52:51');
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484113875356&', '0:0:0:0:0:0:0:1', '2017-01-11 13:59:24');
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1484113875359&', '0:0:0:0:0:0:0:1', '2017-01-11 13:59:59');
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2017-01-11 14:00:03');
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 14:00:12');
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 14:00:21');
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=111&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-11 14:00:29');
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=111&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-11 14:19:47');
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 14:25:16');
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=1&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-11 14:25:25');
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-11 14:39:45');
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=1&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-11 14:39:52');
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-11 14:41:14');
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/account/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-11 14:41:51');
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-11 14:41:54');
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/account/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-11 14:42:26');
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 14:43:26');
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484117021603&', '0:0:0:0:0:0:0:1', '2017-01-11 14:44:00');
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,32,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-11 14:44:04');
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 14:44:14');
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 14:46:45');
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484117206685&', '0:0:0:0:0:0:0:1', '2017-01-11 14:47:08');
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,32,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-11 14:47:17');
INSERT INTO `sys_log` VALUES ('454', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1484117206687&', '0:0:0:0:0:0:0:1', '2017-01-11 14:47:27');
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2017-01-11 14:47:31');
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 14:47:36');
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-11 15:02:32');
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484119872897&', '0:0:0:0:0:0:0:1', '2017-01-11 15:34:13');
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120117992&', '0:0:0:0:0:0:0:1', '2017-01-11 15:35:27');
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120117993&', '0:0:0:0:0:0:0:1', '2017-01-11 15:35:52');
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120168094&', '0:0:0:0:0:0:0:1', '2017-01-11 15:36:14');
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120214388&', '0:0:0:0:0:0:0:1', '2017-01-11 15:37:00');
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120290949&', '0:0:0:0:0:0:0:1', '2017-01-11 15:38:15');
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120290950&', '0:0:0:0:0:0:0:1', '2017-01-11 15:39:49');
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120498901&', '0:0:0:0:0:0:0:1', '2017-01-11 15:41:42');
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484120630725&', '0:0:0:0:0:0:0:1', '2017-01-11 15:44:00');
INSERT INTO `sys_log` VALUES ('467', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484121066634&', '0:0:0:0:0:0:0:1', '2017-01-11 15:51:17');
INSERT INTO `sys_log` VALUES ('468', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484121239333&', '0:0:0:0:0:0:0:1', '2017-01-11 15:54:07');
INSERT INTO `sys_log` VALUES ('469', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484121259666&', '0:0:0:0:0:0:0:1', '2017-01-11 15:54:42');
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1484121066636&', '0:0:0:0:0:0:0:1', '2017-01-11 15:56:48');
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1484121066637&', '0:0:0:0:0:0:0:1', '2017-01-11 15:57:06');
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484183981606&', '0:0:0:0:0:0:0:1', '2017-01-12 09:19:47');
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484183981608&', '0:0:0:0:0:0:0:1', '2017-01-12 09:20:20');
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484183981610&', '0:0:0:0:0:0:0:1', '2017-01-12 09:22:38');
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484183981612&', '0:0:0:0:0:0:0:1', '2017-01-12 09:22:54');
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184243494&', '0:0:0:0:0:0:0:1', '2017-01-12 09:24:09');
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184253507&', '0:0:0:0:0:0:0:1', '2017-01-12 09:24:17');
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184253508&', '0:0:0:0:0:0:0:1', '2017-01-12 09:24:30');
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184339760&', '0:0:0:0:0:0:0:1', '2017-01-12 09:25:44');
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184339762&', '0:0:0:0:0:0:0:1', '2017-01-12 09:28:42');
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184339763&', '0:0:0:0:0:0:0:1', '2017-01-12 09:29:46');
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184751775&', '0:0:0:0:0:0:0:1', '2017-01-12 09:32:36');
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184751777&', '0:0:0:0:0:0:0:1', '2017-01-12 09:32:51');
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184830254&', '0:0:0:0:0:0:0:1', '2017-01-12 09:33:56');
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184844352&', '0:0:0:0:0:0:0:1', '2017-01-12 09:34:22');
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184844354&', '0:0:0:0:0:0:0:1', '2017-01-12 09:36:09');
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484184844355&', '0:0:0:0:0:0:0:1', '2017-01-12 09:36:23');
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185235474&', '0:0:0:0:0:0:0:1', '2017-01-12 09:40:41');
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185451282&', '0:0:0:0:0:0:0:1', '2017-01-12 09:44:15');
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185470361&', '0:0:0:0:0:0:0:1', '2017-01-12 09:44:33');
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185498262&', '0:0:0:0:0:0:0:1', '2017-01-12 09:45:08');
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185646674&', '0:0:0:0:0:0:0:1', '2017-01-12 09:47:33');
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185646675&', '0:0:0:0:0:0:0:1', '2017-01-12 09:47:50');
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694914&', '0:0:0:0:0:0:0:1', '2017-01-12 09:48:20');
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694916&', '0:0:0:0:0:0:0:1', '2017-01-12 09:48:44');
INSERT INTO `sys_log` VALUES ('496', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694918&', '0:0:0:0:0:0:0:1', '2017-01-12 09:49:05');
INSERT INTO `sys_log` VALUES ('497', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694920&', '0:0:0:0:0:0:0:1', '2017-01-12 09:49:24');
INSERT INTO `sys_log` VALUES ('498', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694922&', '0:0:0:0:0:0:0:1', '2017-01-12 09:52:12');
INSERT INTO `sys_log` VALUES ('499', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484185694924&', '0:0:0:0:0:0:0:1', '2017-01-12 09:53:35');
INSERT INTO `sys_log` VALUES ('500', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186115237&', '0:0:0:0:0:0:0:1', '2017-01-12 09:55:21');
INSERT INTO `sys_log` VALUES ('501', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186143155&', '0:0:0:0:0:0:0:1', '2017-01-12 09:55:49');
INSERT INTO `sys_log` VALUES ('502', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186173016&', '0:0:0:0:0:0:0:1', '2017-01-12 09:56:18');
INSERT INTO `sys_log` VALUES ('503', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186192036&', '0:0:0:0:0:0:0:1', '2017-01-12 09:56:37');
INSERT INTO `sys_log` VALUES ('504', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213965&', '0:0:0:0:0:0:0:1', '2017-01-12 09:56:59');
INSERT INTO `sys_log` VALUES ('505', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213967&', '0:0:0:0:0:0:0:1', '2017-01-12 09:57:18');
INSERT INTO `sys_log` VALUES ('506', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213969&', '0:0:0:0:0:0:0:1', '2017-01-12 09:57:36');
INSERT INTO `sys_log` VALUES ('507', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213971&', '0:0:0:0:0:0:0:1', '2017-01-12 09:58:53');
INSERT INTO `sys_log` VALUES ('508', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213972&', '0:0:0:0:0:0:0:1', '2017-01-12 10:00:52');
INSERT INTO `sys_log` VALUES ('509', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213973&', '0:0:0:0:0:0:0:1', '2017-01-12 10:01:17');
INSERT INTO `sys_log` VALUES ('510', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484186213974&', '0:0:0:0:0:0:0:1', '2017-01-12 10:04:08');
INSERT INTO `sys_log` VALUES ('511', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:04:39');
INSERT INTO `sys_log` VALUES ('512', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484187050891&', '0:0:0:0:0:0:0:1', '2017-01-12 10:11:44');
INSERT INTO `sys_log` VALUES ('513', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:12:17');
INSERT INTO `sys_log` VALUES ('514', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:16:11');
INSERT INTO `sys_log` VALUES ('515', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=1&passwordLogin=1&passwordPay=2&area=1&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 10:16:20');
INSERT INTO `sys_log` VALUES ('516', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=2&passwordLogin=2&passwordPay=2&area=2&email=2&passwordEmail=2&operator=电信&level=铜牌会员&idCard=2&personName=2&phone=2&address=2&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 10:16:52');
INSERT INTO `sys_log` VALUES ('517', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-12 10:20:03');
INSERT INTO `sys_log` VALUES ('518', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:22:56');
INSERT INTO `sys_log` VALUES ('519', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=3&passwordLogin=3&passwordPay=3&area=3&email=3&passwordEmail=3&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 10:23:20');
INSERT INTO `sys_log` VALUES ('520', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:24:09');
INSERT INTO `sys_log` VALUES ('521', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484187769105&', '0:0:0:0:0:0:0:1', '2017-01-12 10:25:03');
INSERT INTO `sys_log` VALUES ('522', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:28:33');
INSERT INTO `sys_log` VALUES ('523', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:29:00');
INSERT INTO `sys_log` VALUES ('524', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=4&passwordLogin=4&passwordPay=4&area=4&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 10:29:11');
INSERT INTO `sys_log` VALUES ('525', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:38:00');
INSERT INTO `sys_log` VALUES ('526', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 10:45:30');
INSERT INTO `sys_log` VALUES ('527', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=5&passwordLogin=5&passwordPay=5&area=5&email=&passwordEmail=&operator=联通&level=注册会员&idCard=&personName=&phone=&address=&registerDate=2017-01-11 10:45:36&', '0:0:0:0:0:0:0:1', '2017-01-12 10:45:41');
INSERT INTO `sys_log` VALUES ('528', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189125746&', '0:0:0:0:0:0:0:1', '2017-01-12 10:47:11');
INSERT INTO `sys_log` VALUES ('529', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189125747&', '0:0:0:0:0:0:0:1', '2017-01-12 10:52:54');
INSERT INTO `sys_log` VALUES ('530', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189125749&', '0:0:0:0:0:0:0:1', '2017-01-12 10:54:12');
INSERT INTO `sys_log` VALUES ('531', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189125751&', '0:0:0:0:0:0:0:1', '2017-01-12 10:54:20');
INSERT INTO `sys_log` VALUES ('532', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189662924&', '0:0:0:0:0:0:0:1', '2017-01-12 10:54:26');
INSERT INTO `sys_log` VALUES ('533', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189691670&', '0:0:0:0:0:0:0:1', '2017-01-12 10:54:55');
INSERT INTO `sys_log` VALUES ('534', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189691671&', '0:0:0:0:0:0:0:1', '2017-01-12 10:56:57');
INSERT INTO `sys_log` VALUES ('535', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189691672&', '0:0:0:0:0:0:0:1', '2017-01-12 10:57:04');
INSERT INTO `sys_log` VALUES ('536', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484189882293&', '0:0:0:0:0:0:0:1', '2017-01-12 10:58:06');
INSERT INTO `sys_log` VALUES ('537', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190007406&', '0:0:0:0:0:0:0:1', '2017-01-12 11:00:11');
INSERT INTO `sys_log` VALUES ('538', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190054707&', '0:0:0:0:0:0:0:1', '2017-01-12 11:00:59');
INSERT INTO `sys_log` VALUES ('539', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190085579&', '0:0:0:0:0:0:0:1', '2017-01-12 11:01:29');
INSERT INTO `sys_log` VALUES ('540', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190202015&', '0:0:0:0:0:0:0:1', '2017-01-12 11:03:25');
INSERT INTO `sys_log` VALUES ('541', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190202017&', '0:0:0:0:0:0:0:1', '2017-01-12 11:03:39');
INSERT INTO `sys_log` VALUES ('542', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190259444&', '0:0:0:0:0:0:0:1', '2017-01-12 11:04:23');
INSERT INTO `sys_log` VALUES ('543', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190259445&', '0:0:0:0:0:0:0:1', '2017-01-12 11:05:04');
INSERT INTO `sys_log` VALUES ('544', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190323839&', '0:0:0:0:0:0:0:1', '2017-01-12 11:05:43');
INSERT INTO `sys_log` VALUES ('545', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403980&', '0:0:0:0:0:0:0:1', '2017-01-12 11:07:20');
INSERT INTO `sys_log` VALUES ('546', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403981&', '0:0:0:0:0:0:0:1', '2017-01-12 11:07:30');
INSERT INTO `sys_log` VALUES ('547', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403982&', '0:0:0:0:0:0:0:1', '2017-01-12 11:11:57');
INSERT INTO `sys_log` VALUES ('548', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403983&', '0:0:0:0:0:0:0:1', '2017-01-12 11:21:03');
INSERT INTO `sys_log` VALUES ('549', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403985&', '0:0:0:0:0:0:0:1', '2017-01-12 11:22:37');
INSERT INTO `sys_log` VALUES ('550', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484190403987&', '0:0:0:0:0:0:0:1', '2017-01-12 11:22:57');
INSERT INTO `sys_log` VALUES ('551', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484191696474&', '0:0:0:0:0:0:0:1', '2017-01-12 11:28:31');
INSERT INTO `sys_log` VALUES ('552', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484191696475&', '0:0:0:0:0:0:0:1', '2017-01-12 11:28:41');
INSERT INTO `sys_log` VALUES ('553', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484191696476&', '0:0:0:0:0:0:0:1', '2017-01-12 13:00:40');
INSERT INTO `sys_log` VALUES ('554', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484197936390&', '0:0:0:0:0:0:0:1', '2017-01-12 13:12:25');
INSERT INTO `sys_log` VALUES ('555', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484202905837&', '0:0:0:0:0:0:0:1', '2017-01-12 14:35:11');
INSERT INTO `sys_log` VALUES ('556', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484203247046&', '0:0:0:0:0:0:0:1', '2017-01-12 14:41:00');
INSERT INTO `sys_log` VALUES ('557', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=2&userName=zh_201701110002&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 14:41:05');
INSERT INTO `sys_log` VALUES ('558', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484203247047&', '0:0:0:0:0:0:0:1', '2017-01-12 14:41:16');
INSERT INTO `sys_log` VALUES ('559', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=2&userName=zh_201701110002&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 14:41:21');
INSERT INTO `sys_log` VALUES ('560', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=2&userName=zh_201701110002&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 14:41:32');
INSERT INTO `sys_log` VALUES ('561', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484203378981&', '0:0:0:0:0:0:0:1', '2017-01-12 14:43:02');
INSERT INTO `sys_log` VALUES ('562', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=2&userName=zh_201701110002&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 14:43:06');
INSERT INTO `sys_log` VALUES ('563', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=2&_=1484203378982&', '0:0:0:0:0:0:0:1', '2017-01-12 14:43:11');
INSERT INTO `sys_log` VALUES ('564', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=2&userName=zh_201701110002&passwordLogin=111111&passwordPay=111111&area=潍坊&email=zh_201701110002@126.com&passwordEmail=111111&operator=电信&level=铜牌会员&personId=11111&personName=李四&phone=11111&address=安丘&registerDate=2017-01-12 14:43:39&', '0:0:0:0:0:0:0:1', '2017-01-12 14:43:42');
INSERT INTO `sys_log` VALUES ('565', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=6&', '0:0:0:0:0:0:0:1', '2017-01-12 15:00:02');
INSERT INTO `sys_log` VALUES ('566', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=5&', '0:0:0:0:0:0:0:1', '2017-01-12 15:01:07');
INSERT INTO `sys_log` VALUES ('567', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=4&', '0:0:0:0:0:0:0:1', '2017-01-12 15:01:11');
INSERT INTO `sys_log` VALUES ('568', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=3&', '0:0:0:0:0:0:0:1', '2017-01-12 15:01:16');
INSERT INTO `sys_log` VALUES ('569', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484204394115&', '0:0:0:0:0:0:0:1', '2017-01-12 15:01:40');
INSERT INTO `sys_log` VALUES ('570', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 15:03:16');
INSERT INTO `sys_log` VALUES ('571', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=1&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 15:03:24');
INSERT INTO `sys_log` VALUES ('572', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=7&', '0:0:0:0:0:0:0:1', '2017-01-12 15:03:27');
INSERT INTO `sys_log` VALUES ('573', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 15:03:36');
INSERT INTO `sys_log` VALUES ('574', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=1&passwordLogin=1&passwordPay=1&area=1&email=&passwordEmail=&operator=联通&level=注册会员&personId=&personName=&phone=&address=&registerDate=&', '0:0:0:0:0:0:0:1', '2017-01-12 15:03:41');
INSERT INTO `sys_log` VALUES ('575', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=8&', '0:0:0:0:0:0:0:1', '2017-01-12 15:03:45');
INSERT INTO `sys_log` VALUES ('576', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 15:05:01');
INSERT INTO `sys_log` VALUES ('577', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=详细&resourceType=1&url=/account/detail&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-12 15:05:53');
INSERT INTO `sys_log` VALUES ('578', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=234&_=1484204611342&', '0:0:0:0:0:0:0:1', '2017-01-12 15:06:21');
INSERT INTO `sys_log` VALUES ('579', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=234&name=详细&resourceType=1&url=/account/detail&openMode=ajax&icon=fi-zoom-in&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-12 15:06:26');
INSERT INTO `sys_log` VALUES ('580', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484204611344&', '0:0:0:0:0:0:0:1', '2017-01-12 15:06:37');
INSERT INTO `sys_log` VALUES ('581', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,32,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 15:06:40');
INSERT INTO `sys_log` VALUES ('582', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-12 15:06:46');
INSERT INTO `sys_log` VALUES ('583', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484206219941&', '0:0:0:0:0:0:0:1', '2017-01-12 15:32:16');
INSERT INTO `sys_log` VALUES ('584', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 16:02:15');
INSERT INTO `sys_log` VALUES ('585', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=zh_201701120001&passwordLogin=222222&passwordPay=2222222&area=北京&email=zh_201701120001@163.com&passwordEmail=333333&operator=联通&level=铜牌会员&personId=11111&personName=王五&phone=2222&address=海淀&registerDate=2017-01-12 16:03:15&', '0:0:0:0:0:0:0:1', '2017-01-12 16:03:21');
INSERT INTO `sys_log` VALUES ('586', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:id=9&', '0:0:0:0:0:0:0:1', '2017-01-12 16:03:32');
INSERT INTO `sys_log` VALUES ('587', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 19:19:17');
INSERT INTO `sys_log` VALUES ('588', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=异常&resourceType=1&url=/account/excep&openMode=ajax&icon=fi-info&seq=0&status=0&pid=31&', '0:0:0:0:0:0:0:1', '2017-01-12 19:20:21');
INSERT INTO `sys_log` VALUES ('589', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484219614775&', '0:0:0:0:0:0:0:1', '2017-01-12 19:20:29');
INSERT INTO `sys_log` VALUES ('590', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 19:20:33');
INSERT INTO `sys_log` VALUES ('591', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-12 19:31:35');
INSERT INTO `sys_log` VALUES ('592', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-12 19:42:00');
INSERT INTO `sys_log` VALUES ('593', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:deleteReason=删除&id=2&', '0:0:0:0:0:0:0:1', '2017-01-12 20:06:17');
INSERT INTO `sys_log` VALUES ('594', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 20:33:32');
INSERT INTO `sys_log` VALUES ('595', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 20:34:00');
INSERT INTO `sys_log` VALUES ('596', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=恢复&resourceType=0&url=/account/recovery&openMode=ajax&icon=fi-info&seq=0&status=0&pid=32&', '0:0:0:0:0:0:0:1', '2017-01-12 20:35:49');
INSERT INTO `sys_log` VALUES ('597', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=236&_=1484224048596&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:05');
INSERT INTO `sys_log` VALUES ('598', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=236&name=恢复&resourceType=0&url=/account/recovery&openMode=ajax&icon=fi-info&seq=0&status=0&pid=32&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:11');
INSERT INTO `sys_log` VALUES ('599', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=236&_=1484224048597&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:26');
INSERT INTO `sys_log` VALUES ('600', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=236&name=恢复&resourceType=1&url=/account/recovery&openMode=ajax&icon=fi-info&seq=0&status=0&pid=32&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:33');
INSERT INTO `sys_log` VALUES ('601', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484224048599&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:45');
INSERT INTO `sys_log` VALUES ('602', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 20:36:50');
INSERT INTO `sys_log` VALUES ('603', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 20:51:58');
INSERT INTO `sys_log` VALUES ('604', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/account/dele&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=32&', '0:0:0:0:0:0:0:1', '2017-01-12 20:52:46');
INSERT INTO `sys_log` VALUES ('605', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484225443537&', '0:0:0:0:0:0:0:1', '2017-01-12 20:53:16');
INSERT INTO `sys_log` VALUES ('606', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 20:53:22');
INSERT INTO `sys_log` VALUES ('607', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-12 20:55:04');
INSERT INTO `sys_log` VALUES ('608', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484225707407&', '0:0:0:0:0:0:0:1', '2017-01-12 20:55:37');
INSERT INTO `sys_log` VALUES ('609', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 20:55:42');
INSERT INTO `sys_log` VALUES ('610', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=237&_=1484225909711&', '0:0:0:0:0:0:0:1', '2017-01-12 21:03:09');
INSERT INTO `sys_log` VALUES ('611', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=237&name=删除&resourceType=1&url=/account/deleab&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=32&', '0:0:0:0:0:0:0:1', '2017-01-12 21:03:25');
INSERT INTO `sys_log` VALUES ('612', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484225909713&', '0:0:0:0:0:0:0:1', '2017-01-12 21:03:33');
INSERT INTO `sys_log` VALUES ('613', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-12 21:03:37');
INSERT INTO `sys_log` VALUES ('614', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-12 21:03:53');
INSERT INTO `sys_log` VALUES ('615', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:delete,[参数]:deleteReason=asdf&id=9&', '0:0:0:0:0:0:0:1', '2017-01-12 21:10:23');
INSERT INTO `sys_log` VALUES ('616', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-12 21:17:17');
INSERT INTO `sys_log` VALUES ('617', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=异常&resourceType=1&url=/account/excepre&openMode=ajax&icon=fi-info&seq=0&status=0&pid=33&', '0:0:0:0:0:0:0:1', '2017-01-12 21:19:18');
INSERT INTO `sys_log` VALUES ('618', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484352824280&', '0:0:0:0:0:0:0:1', '2017-01-14 08:16:59');
INSERT INTO `sys_log` VALUES ('619', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-14 08:17:04');
INSERT INTO `sys_log` VALUES ('620', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484353736156&', '0:0:0:0:0:0:0:1', '2017-01-14 08:35:59');
INSERT INTO `sys_log` VALUES ('621', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484353736157&', '0:0:0:0:0:0:0:1', '2017-01-14 08:42:56');
INSERT INTO `sys_log` VALUES ('622', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=1&userName=zh_201701110001&passwordLogin=123456&passwordPay=666666&area=潍坊&email=zh_201701110001@163.com&passwordEmail=666666&operator=移动&level=银牌会员&personId=12312312313123123&personName=123&phone=15764348765&address=潍坊&registerDate=2017-01-14 08:43:34&', '0:0:0:0:0:0:0:1', '2017-01-14 08:43:40');
INSERT INTO `sys_log` VALUES ('623', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355033431&', '0:0:0:0:0:0:0:1', '2017-01-14 08:50:47');
INSERT INTO `sys_log` VALUES ('624', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355033433&', '0:0:0:0:0:0:0:1', '2017-01-14 08:54:06');
INSERT INTO `sys_log` VALUES ('625', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355547812&', '0:0:0:0:0:0:0:1', '2017-01-14 08:59:13');
INSERT INTO `sys_log` VALUES ('626', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355585956&', '0:0:0:0:0:0:0:1', '2017-01-14 08:59:51');
INSERT INTO `sys_log` VALUES ('627', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355585957&', '0:0:0:0:0:0:0:1', '2017-01-14 09:00:20');
INSERT INTO `sys_log` VALUES ('628', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355585958&', '0:0:0:0:0:0:0:1', '2017-01-14 09:00:52');
INSERT INTO `sys_log` VALUES ('629', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=1&_=1484355585959&', '0:0:0:0:0:0:0:1', '2017-01-14 09:01:44');
INSERT INTO `sys_log` VALUES ('630', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:edit,[参数]:id=1&userName=zh_201701110001&passwordLogin=123456&passwordPay=666666&area=潍坊&email=zh_201701110001@163.com&passwordEmail=666666&operator=移动&level=银牌会员&personId=12312312313123123&personName=123&phone=15764348765&address=潍坊&registerDate=2017-01-14 09:01:48&', '0:0:0:0:0:0:0:1', '2017-01-14 09:01:50');
INSERT INTO `sys_log` VALUES ('631', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:addPage,[参数]:', null, '2017-01-14 09:02:49');
INSERT INTO `sys_log` VALUES ('632', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:add,[参数]:userName=zh_201701140001&passwordLogin=222222&passwordPay=222222&area=青岛&email=zh_201701140001@qq.com&passwordEmail=222222&operator=移动&level=钻石会员&personId=3729273646382742737&personName=王九&phone=15434322323&address=高新区&registerDate=2017-01-14 09:04:06&', '0:0:0:0:0:0:0:1', '2017-01-14 09:04:11');
INSERT INTO `sys_log` VALUES ('633', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 10:23:33');
INSERT INTO `sys_log` VALUES ('634', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=参数设置&resourceType=0&url=&openMode=ajax&icon=fi-folder&seq=20&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-14 10:24:35');
INSERT INTO `sys_log` VALUES ('635', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=226&_=1484360601491&', '0:0:0:0:0:0:0:1', '2017-01-14 10:24:47');
INSERT INTO `sys_log` VALUES ('636', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=226&name=修改密码&resourceType=1&url=/user/editPwdPage&openMode=ajax&icon=fi-unlock&seq=30&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-14 10:25:03');
INSERT INTO `sys_log` VALUES ('637', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 10:25:17');
INSERT INTO `sys_log` VALUES ('638', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=参数设置&resourceType=0&url=/setting/setPage&openMode=ajax&icon=fi-folder&seq=0&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:26:43');
INSERT INTO `sys_log` VALUES ('639', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=240&_=1484360601495&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:06');
INSERT INTO `sys_log` VALUES ('640', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=240&name=参数设置&resourceType=0&url=/setting/setPage&openMode=&icon=fi-wrench&seq=0&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:12');
INSERT INTO `sys_log` VALUES ('641', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=239&_=1484360601496&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:16');
INSERT INTO `sys_log` VALUES ('642', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=239&name=业务设置&resourceType=0&url=&openMode=&icon=fi-folder&seq=20&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:23');
INSERT INTO `sys_log` VALUES ('643', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=240&_=1484360601497&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:38');
INSERT INTO `sys_log` VALUES ('644', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=240&name=参数设置&resourceType=0&url=/setting/setPage&openMode=ajax&icon=fi-wrench&seq=0&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:44');
INSERT INTO `sys_log` VALUES ('645', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=33&_=1484360601498&', '0:0:0:0:0:0:0:1', '2017-01-14 10:27:50');
INSERT INTO `sys_log` VALUES ('646', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=240&_=1484360601499&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:04');
INSERT INTO `sys_log` VALUES ('647', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=240&name=参数设置&resourceType=0&url=/setting/setPage&openMode=ajax&icon=fi-wrench&seq=1&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:08');
INSERT INTO `sys_log` VALUES ('648', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=31&_=1484360601500&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:24');
INSERT INTO `sys_log` VALUES ('649', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=31&name=正常账号&resourceType=0&url=/account/normal&openMode=ajax&icon=fi-database&seq=1&status=0&pid=3&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:40');
INSERT INTO `sys_log` VALUES ('650', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=240&_=1484360601501&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:51');
INSERT INTO `sys_log` VALUES ('651', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=240&name=参数设置&resourceType=0&url=/setting/setPage&openMode=ajax&icon=fi-wrench&seq=1&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:28:59');
INSERT INTO `sys_log` VALUES ('652', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484360601503&', '0:0:0:0:0:0:0:1', '2017-01-14 10:29:10');
INSERT INTO `sys_log` VALUES ('653', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,239,240,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-14 10:29:16');
INSERT INTO `sys_log` VALUES ('654', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-14 10:29:22');
INSERT INTO `sys_log` VALUES ('655', 'admin', 'admin', '[类名]:com.chq.business.setting.SettingController,[方法]:edit,[参数]:id=1&limitShop=1&limitGood=0&limitNumber=0&limitMoney=0&limitIp=0&limitType=0&limitReceiptDay=0&limitRegisterDay=0&', '0:0:0:0:0:0:0:1', '2017-01-14 10:53:09');
INSERT INTO `sys_log` VALUES ('656', 'admin', 'admin', '[类名]:com.chq.business.setting.SettingController,[方法]:edit,[参数]:id=1&limitShop=1&limitGood=2&limitNumber=3&limitMoney=4&limitIp=5&limitType=6&limitReceiptDay=7&limitRegisterDay=8&', '0:0:0:0:0:0:0:1', '2017-01-14 10:53:26');
INSERT INTO `sys_log` VALUES ('657', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 10:58:29');
INSERT INTO `sys_log` VALUES ('658', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=分类设置&resourceType=0&url=/setting/typeManager&openMode=ajax&icon=fi-folder&seq=2&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 10:59:47');
INSERT INTO `sys_log` VALUES ('659', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=241&_=1484362362918&', '0:0:0:0:0:0:0:1', '2017-01-14 11:01:26');
INSERT INTO `sys_log` VALUES ('660', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=241&name=分类设置&resourceType=0&url=/type/manager&openMode=ajax&icon=fi-folder&seq=2&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-14 11:02:03');
INSERT INTO `sys_log` VALUES ('661', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 11:02:18');
INSERT INTO `sys_log` VALUES ('662', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/type/treeGrid&openMode=ajax&icon=fi-list&seq=0&status=0&pid=241&', '0:0:0:0:0:0:0:1', '2017-01-14 11:03:10');
INSERT INTO `sys_log` VALUES ('663', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 11:03:15');
INSERT INTO `sys_log` VALUES ('664', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/type/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&pid=241&', '0:0:0:0:0:0:0:1', '2017-01-14 11:03:54');
INSERT INTO `sys_log` VALUES ('665', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 11:03:58');
INSERT INTO `sys_log` VALUES ('666', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/type/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=241&', '0:0:0:0:0:0:0:1', '2017-01-14 11:04:35');
INSERT INTO `sys_log` VALUES ('667', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-14 11:04:41');
INSERT INTO `sys_log` VALUES ('668', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/type/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=241&', '0:0:0:0:0:0:0:1', '2017-01-14 11:05:10');
INSERT INTO `sys_log` VALUES ('669', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484362362924&', '0:0:0:0:0:0:0:1', '2017-01-14 11:05:22');
INSERT INTO `sys_log` VALUES ('670', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,239,240,241,242,243,244,245,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-14 11:05:29');
INSERT INTO `sys_log` VALUES ('671', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-14 11:27:04');
INSERT INTO `sys_log` VALUES ('672', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:addPage,[参数]:', null, '2017-01-15 10:24:33');
INSERT INTO `sys_log` VALUES ('673', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:addPage,[参数]:', null, '2017-01-15 10:26:39');
INSERT INTO `sys_log` VALUES ('674', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:27:00');
INSERT INTO `sys_log` VALUES ('675', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:30:01');
INSERT INTO `sys_log` VALUES ('676', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:30:53');
INSERT INTO `sys_log` VALUES ('677', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:addPage,[参数]:', null, '2017-01-15 10:31:50');
INSERT INTO `sys_log` VALUES ('678', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:32:00');
INSERT INTO `sys_log` VALUES ('679', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:47:18');
INSERT INTO `sys_log` VALUES ('680', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=女装&passwordLogin=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 10:47:57');
INSERT INTO `sys_log` VALUES ('681', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:addPage,[参数]:', null, '2017-01-15 10:48:24');
INSERT INTO `sys_log` VALUES ('682', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=皮鞋&passwordLogin=皮鞋&', '0:0:0:0:0:0:0:1', '2017-01-15 10:48:35');
INSERT INTO `sys_log` VALUES ('683', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:addPage,[参数]:', null, '2017-01-15 10:50:11');
INSERT INTO `sys_log` VALUES ('684', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:add,[参数]:text=食品&mark=食品&', '0:0:0:0:0:0:0:1', '2017-01-15 10:50:23');
INSERT INTO `sys_log` VALUES ('685', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:editPage,[参数]:id=3&_=1484449156776&', '0:0:0:0:0:0:0:1', '2017-01-15 11:01:12');
INSERT INTO `sys_log` VALUES ('686', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:editPage,[参数]:id=3&_=1484449156778&', '0:0:0:0:0:0:0:1', '2017-01-15 11:01:58');
INSERT INTO `sys_log` VALUES ('687', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:edit,[参数]:id=3&text=皮鞋&mark=皮鞋&', '0:0:0:0:0:0:0:1', '2017-01-15 11:02:04');
INSERT INTO `sys_log` VALUES ('688', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:editPage,[参数]:id=2&_=1484449156779&', '0:0:0:0:0:0:0:1', '2017-01-15 11:02:07');
INSERT INTO `sys_log` VALUES ('689', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:edit,[参数]:id=2&text=女装&mark=女装&', '0:0:0:0:0:0:0:1', '2017-01-15 11:02:12');
INSERT INTO `sys_log` VALUES ('690', 'admin', 'admin', '[类名]:com.chq.business.type.TypeController,[方法]:delete,[参数]:id=4&', '0:0:0:0:0:0:0:1', '2017-01-15 11:07:16');
INSERT INTO `sys_log` VALUES ('691', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 13:01:41');
INSERT INTO `sys_log` VALUES ('692', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=银行卡管理&resourceType=0&url=/bankcard&openMode=ajax&icon=fi-info&seq=2&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-15 13:02:44');
INSERT INTO `sys_log` VALUES ('693', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1484451356713&', '0:0:0:0:0:0:0:1', '2017-01-15 13:03:24');
INSERT INTO `sys_log` VALUES ('694', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=246&name=银行卡管理&resourceType=0&url=/bankcard&openMode=&icon=fi-credit-card&seq=2&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-15 13:03:30');
INSERT INTO `sys_log` VALUES ('695', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 13:03:41');
INSERT INTO `sys_log` VALUES ('696', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/bankcard/treeGrid&openMode=ajax&icon=fi-list&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:04:45');
INSERT INTO `sys_log` VALUES ('697', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=247&_=1484451356715&', '0:0:0:0:0:0:0:1', '2017-01-15 13:04:59');
INSERT INTO `sys_log` VALUES ('698', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=247&name=列表&resourceType=1&url=/bankcard/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:05:05');
INSERT INTO `sys_log` VALUES ('699', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1484451356716&', '0:0:0:0:0:0:0:1', '2017-01-15 13:05:11');
INSERT INTO `sys_log` VALUES ('700', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=246&name=银行卡管理&resourceType=0&url=/bankcard/manager&openMode=&icon=fi-credit-card&seq=2&status=0&pid=239&', '0:0:0:0:0:0:0:1', '2017-01-15 13:05:27');
INSERT INTO `sys_log` VALUES ('701', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 13:05:34');
INSERT INTO `sys_log` VALUES ('702', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/bankcard/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:06:14');
INSERT INTO `sys_log` VALUES ('703', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 13:06:19');
INSERT INTO `sys_log` VALUES ('704', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=0&url=/bankcard/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:06:53');
INSERT INTO `sys_log` VALUES ('705', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=249&_=1484451356719&', '0:0:0:0:0:0:0:1', '2017-01-15 13:07:00');
INSERT INTO `sys_log` VALUES ('706', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=249&name=编辑&resourceType=1&url=/bankcard/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:07:06');
INSERT INTO `sys_log` VALUES ('707', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 13:07:12');
INSERT INTO `sys_log` VALUES ('708', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/bankcard/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=246&', '0:0:0:0:0:0:0:1', '2017-01-15 13:07:43');
INSERT INTO `sys_log` VALUES ('709', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484451356722&', '0:0:0:0:0:0:0:1', '2017-01-15 13:07:54');
INSERT INTO `sys_log` VALUES ('710', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-15 13:08:03');
INSERT INTO `sys_log` VALUES ('711', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-15 13:08:14');
INSERT INTO `sys_log` VALUES ('712', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:23:45');
INSERT INTO `sys_log` VALUES ('713', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:26:25');
INSERT INTO `sys_log` VALUES ('714', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:27:40');
INSERT INTO `sys_log` VALUES ('715', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:31:42');
INSERT INTO `sys_log` VALUES ('716', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:33:31');
INSERT INTO `sys_log` VALUES ('717', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:34:05');
INSERT INTO `sys_log` VALUES ('718', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:34:43');
INSERT INTO `sys_log` VALUES ('719', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:36:33');
INSERT INTO `sys_log` VALUES ('720', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:38:59');
INSERT INTO `sys_log` VALUES ('721', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:39:30');
INSERT INTO `sys_log` VALUES ('722', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:40:28');
INSERT INTO `sys_log` VALUES ('723', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:add,[参数]:bankName=1&bankNum=1&password=1&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-15 13:40:33');
INSERT INTO `sys_log` VALUES ('724', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:editPage,[参数]:id=1&_=1484458817185&', '0:0:0:0:0:0:0:1', '2017-01-15 13:40:42');
INSERT INTO `sys_log` VALUES ('725', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:editPage,[参数]:id=1&_=1484458990726&', '0:0:0:0:0:0:0:1', '2017-01-15 13:43:16');
INSERT INTO `sys_log` VALUES ('726', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:editPage,[参数]:id=1&_=1484459050606&', '0:0:0:0:0:0:0:1', '2017-01-15 13:44:16');
INSERT INTO `sys_log` VALUES ('727', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:edit,[参数]:bankName=建设银行&bankNum=22223534456976543&password=666666&mark=113123123&', '0:0:0:0:0:0:0:1', '2017-01-15 13:44:33');
INSERT INTO `sys_log` VALUES ('728', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:editPage,[参数]:id=1&_=1484459133914&', '0:0:0:0:0:0:0:1', '2017-01-15 13:45:41');
INSERT INTO `sys_log` VALUES ('729', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:edit,[参数]:id=&bankName=2&bankNum=2&password=2&mark=2&', '0:0:0:0:0:0:0:1', '2017-01-15 13:45:48');
INSERT INTO `sys_log` VALUES ('730', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:editPage,[参数]:id=1&_=1484459174953&', '0:0:0:0:0:0:0:1', '2017-01-15 13:46:29');
INSERT INTO `sys_log` VALUES ('731', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:edit,[参数]:id=1&bankName=建设银行&bankNum=22223534456976543&password=66666&mark=666666&', '0:0:0:0:0:0:0:1', '2017-01-15 13:46:43');
INSERT INTO `sys_log` VALUES ('732', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:addPage,[参数]:', null, '2017-01-15 13:47:16');
INSERT INTO `sys_log` VALUES ('733', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:add,[参数]:bankName=2&bankNum=2&password=2&mark=2&', '0:0:0:0:0:0:0:1', '2017-01-15 13:47:22');
INSERT INTO `sys_log` VALUES ('734', 'admin', 'admin', '[类名]:com.chq.business.bankcard.BankCardController,[方法]:delete,[参数]:id=2&', '0:0:0:0:0:0:0:1', '2017-01-15 13:47:26');
INSERT INTO `sys_log` VALUES ('735', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 15:01:39');
INSERT INTO `sys_log` VALUES ('736', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=商铺管理&resourceType=0&url=&openMode=ajax&icon=fi-folder&seq=2&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-15 15:02:16');
INSERT INTO `sys_log` VALUES ('737', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=251&_=1484463569843&', '0:0:0:0:0:0:0:1', '2017-01-15 15:02:30');
INSERT INTO `sys_log` VALUES ('738', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=251&name=店铺管理&resourceType=0&url=&openMode=&icon=fi-folder&seq=2&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-15 15:02:39');
INSERT INTO `sys_log` VALUES ('739', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=251&_=1484463569844&', '0:0:0:0:0:0:0:1', '2017-01-15 15:03:31');
INSERT INTO `sys_log` VALUES ('740', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=251&name=店铺管理&resourceType=0&url=/shop/manager&openMode=ajax&icon=fi-folder&seq=2&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-15 15:03:55');
INSERT INTO `sys_log` VALUES ('741', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-15 15:04:13');
INSERT INTO `sys_log` VALUES ('742', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=店铺管理&resourceType=0&url=/shop/manager&openMode=ajax&icon=fi-folder&seq=0&status=0&pid=251&', '0:0:0:0:0:0:0:1', '2017-01-15 15:04:42');
INSERT INTO `sys_log` VALUES ('743', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=251&_=1484463569846&', '0:0:0:0:0:0:0:1', '2017-01-15 15:04:46');
INSERT INTO `sys_log` VALUES ('744', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=251&name=店铺管理&resourceType=0&url=&openMode=&icon=fi-folder&seq=2&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-15 15:04:51');
INSERT INTO `sys_log` VALUES ('745', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=252&_=1484463569849&', '0:0:0:0:0:0:0:1', '2017-01-15 15:06:23');
INSERT INTO `sys_log` VALUES ('746', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=252&name=店铺管理&resourceType=0&url=/shop/manager&openMode=&icon=fi-shopping-cart&seq=0&status=0&pid=251&', '0:0:0:0:0:0:0:1', '2017-01-15 15:06:28');
INSERT INTO `sys_log` VALUES ('747', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484463569853&', '0:0:0:0:0:0:0:1', '2017-01-15 15:10:30');
INSERT INTO `sys_log` VALUES ('748', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-15 15:10:39');
INSERT INTO `sys_log` VALUES ('749', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-15 15:10:55');
INSERT INTO `sys_log` VALUES ('750', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:addPage,[参数]:', null, '2017-01-15 15:21:43');
INSERT INTO `sys_log` VALUES ('751', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:addPage,[参数]:', null, '2017-01-15 15:22:37');
INSERT INTO `sys_log` VALUES ('752', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:add,[参数]:shopName=旗舰店&cooperateDate=2017-01-15 15:24:12&commissionFarmingApp=&commissionFarmingPc=&commissionReceiptEvaluate=&commissionReceipt=&commissionEvaluate=&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 15:24:15');
INSERT INTO `sys_log` VALUES ('753', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:addPage,[参数]:', null, '2017-01-15 15:36:16');
INSERT INTO `sys_log` VALUES ('754', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:add,[参数]:shopName=专卖店&cooperateDate=&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 15:36:26');
INSERT INTO `sys_log` VALUES ('755', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=2&_=1484466121733&', '0:0:0:0:0:0:0:1', '2017-01-15 15:42:08');
INSERT INTO `sys_log` VALUES ('756', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=2&shopName=专卖店&cooperateDate=2017-01-15 15:42:13&commissionFarmingApp=1&commissionFarmingPc=2&commissionReceiptEvaluate=3&commissionReceipt=4&commissionEvaluate=5&receiptType=1&', '0:0:0:0:0:0:0:1', '2017-01-15 15:42:24');
INSERT INTO `sys_log` VALUES ('757', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=2&_=1484466121734&', '0:0:0:0:0:0:0:1', '2017-01-15 15:42:41');
INSERT INTO `sys_log` VALUES ('758', 'admin', 'admin', '[类名]:com.chq.business.account.AccountController,[方法]:editPage,[参数]:id=10&_=1484466121736&', '0:0:0:0:0:0:0:1', '2017-01-15 15:42:59');
INSERT INTO `sys_log` VALUES ('759', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=2&_=1484466121737&', '0:0:0:0:0:0:0:1', '2017-01-15 15:43:44');
INSERT INTO `sys_log` VALUES ('760', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:addPage,[参数]:', null, '2017-01-15 15:46:38');
INSERT INTO `sys_log` VALUES ('761', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:add,[参数]:shopName=专卖店&cooperateDate=&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 15:46:46');
INSERT INTO `sys_log` VALUES ('762', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=3&_=1484466121740&', '0:0:0:0:0:0:0:1', '2017-01-15 15:47:23');
INSERT INTO `sys_log` VALUES ('763', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店&cooperateDate=&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 15:47:33');
INSERT INTO `sys_log` VALUES ('764', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=3&_=1484467261561&', '0:0:0:0:0:0:0:1', '2017-01-15 16:01:18');
INSERT INTO `sys_log` VALUES ('765', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店&cooperateDate=2017-01-15 16:01:20&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:01:23');
INSERT INTO `sys_log` VALUES ('766', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店&cooperateDate=2017-01-15 16:01:20&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:03:17');
INSERT INTO `sys_log` VALUES ('767', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店&cooperateDate=2017-01-15 16:01:20&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:04:32');
INSERT INTO `sys_log` VALUES ('768', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=3&_=1484467888426&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:14');
INSERT INTO `sys_log` VALUES ('769', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店&cooperateDate=&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:16');
INSERT INTO `sys_log` VALUES ('770', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=3&shopName=旗舰店1&cooperateDate=2017-01-15 16:12:20&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:24');
INSERT INTO `sys_log` VALUES ('771', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:addPage,[参数]:', null, '2017-01-15 16:12:28');
INSERT INTO `sys_log` VALUES ('772', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:add,[参数]:shopName=专卖店&cooperateDate=2017-01-15 16:12:35&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:38');
INSERT INTO `sys_log` VALUES ('773', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:add,[参数]:shopName=专卖店1&cooperateDate=2017-01-15 16:12:35&commissionFarmingApp=0&commissionFarmingPc=0&commissionReceiptEvaluate=0&commissionReceipt=0&commissionEvaluate=0&receiptType=0&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:42');
INSERT INTO `sys_log` VALUES ('774', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:delete,[参数]:id=4&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:46');
INSERT INTO `sys_log` VALUES ('775', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:delete,[参数]:id=3&', '0:0:0:0:0:0:0:1', '2017-01-15 16:12:49');
INSERT INTO `sys_log` VALUES ('776', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:editPage,[参数]:id=2&_=1484467888428&', '0:0:0:0:0:0:0:1', '2017-01-15 16:15:42');
INSERT INTO `sys_log` VALUES ('777', 'admin', 'admin', '[类名]:com.chq.business.shop.ShopController,[方法]:edit,[参数]:id=2&shopName=专卖店&cooperateDate=2017-01-15 00:00:00&commissionFarmingApp=1&commissionFarmingPc=2&commissionReceiptEvaluate=3&commissionReceipt=4&commissionEvaluate=4&receiptType=1&', '0:0:0:0:0:0:0:1', '2017-01-15 16:15:44');
INSERT INTO `sys_log` VALUES ('778', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 10:29:00');
INSERT INTO `sys_log` VALUES ('779', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 10:32:45');
INSERT INTO `sys_log` VALUES ('780', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=2&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 10:38:33');
INSERT INTO `sys_log` VALUES ('781', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:edit,[参数]:id=1&goodsNum=1&goodsName=1&price=1&type=&typeLimit=&shopId=2&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 13:25:43');
INSERT INTO `sys_log` VALUES ('782', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:edit,[参数]:id=1&goodsNum=1&goodsName=2&price=1&type=&typeLimit=&shopId=2&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 13:26:12');
INSERT INTO `sys_log` VALUES ('783', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=2&isNewRecord=true&goodsNum=2&goodsName=2&price=2.00&type=1&typeLimit=0&mark=2&', '0:0:0:0:0:0:0:1', '2017-01-16 14:07:48');
INSERT INTO `sys_log` VALUES ('784', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:edit,[参数]:id=1&goodsNum=1&goodsName=2&price=1&type=1&typeLimit=1&shopId=2&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 14:08:07');
INSERT INTO `sys_log` VALUES ('785', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:edit,[参数]:id=1&goodsNum=1&goodsName=2&price=1&type=2&typeLimit=1&shopId=2&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 14:42:04');
INSERT INTO `sys_log` VALUES ('786', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=2&isNewRecord=true&goodsNum=3&goodsName=3&price=3.00&type=3&typeLimit=0&mark=3&', '0:0:0:0:0:0:0:1', '2017-01-16 14:55:49');
INSERT INTO `sys_log` VALUES ('787', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 14:56:13');
INSERT INTO `sys_log` VALUES ('788', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 14:58:29');
INSERT INTO `sys_log` VALUES ('789', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 15:05:16');
INSERT INTO `sys_log` VALUES ('790', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:07:12');
INSERT INTO `sys_log` VALUES ('791', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:11:03');
INSERT INTO `sys_log` VALUES ('792', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=2&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:11:24');
INSERT INTO `sys_log` VALUES ('793', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=2&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:12:16');
INSERT INTO `sys_log` VALUES ('794', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=2&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:12:19');
INSERT INTO `sys_log` VALUES ('795', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:13:15');
INSERT INTO `sys_log` VALUES ('796', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:13:53');
INSERT INTO `sys_log` VALUES ('797', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:14:42');
INSERT INTO `sys_log` VALUES ('798', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:15:51');
INSERT INTO `sys_log` VALUES ('799', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:10');
INSERT INTO `sys_log` VALUES ('800', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:12');
INSERT INTO `sys_log` VALUES ('801', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:16');
INSERT INTO `sys_log` VALUES ('802', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:16');
INSERT INTO `sys_log` VALUES ('803', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:17');
INSERT INTO `sys_log` VALUES ('804', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:18');
INSERT INTO `sys_log` VALUES ('805', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:19');
INSERT INTO `sys_log` VALUES ('806', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:47');
INSERT INTO `sys_log` VALUES ('807', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:48');
INSERT INTO `sys_log` VALUES ('808', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:50');
INSERT INTO `sys_log` VALUES ('809', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:51');
INSERT INTO `sys_log` VALUES ('810', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:16:53');
INSERT INTO `sys_log` VALUES ('811', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:17:01');
INSERT INTO `sys_log` VALUES ('812', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:18:17');
INSERT INTO `sys_log` VALUES ('813', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:19:14');
INSERT INTO `sys_log` VALUES ('814', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=3&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:19:29');
INSERT INTO `sys_log` VALUES ('815', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=4&goodsName=1&price=1.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:19:34');
INSERT INTO `sys_log` VALUES ('816', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=5&goodsName=5&price=5.00&type=1&typeLimit=1&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:21:11');
INSERT INTO `sys_log` VALUES ('817', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:23:27');
INSERT INTO `sys_log` VALUES ('818', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:23:31');
INSERT INTO `sys_log` VALUES ('819', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:24:08');
INSERT INTO `sys_log` VALUES ('820', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:24:14');
INSERT INTO `sys_log` VALUES ('821', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:24:22');
INSERT INTO `sys_log` VALUES ('822', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:24:24');
INSERT INTO `sys_log` VALUES ('823', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:add,[参数]:shopId=1&isNewRecord=true&goodsNum=1&goodsName=1&price=1.00&type=1&typeLimit=0&mark=&', '0:0:0:0:0:0:0:1', '2017-01-16 15:24:27');
INSERT INTO `sys_log` VALUES ('824', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:delete,[参数]:id=5&', '0:0:0:0:0:0:0:1', '2017-01-16 15:25:03');
INSERT INTO `sys_log` VALUES ('825', 'admin', 'admin', '[类名]:com.chq.business.goods.GoodsController,[方法]:edit,[参数]:id=4&goodsNum=4&goodsName=1&price=1&type=1&typeLimit=1&shopId=1&mark=1&', '0:0:0:0:0:0:0:1', '2017-01-16 15:26:04');
INSERT INTO `sys_log` VALUES ('826', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:44:32');
INSERT INTO `sys_log` VALUES ('827', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=任务管理&resourceType=0&url=&openMode=ajax&icon=fi-folder&seq=3&status=0&pid=&', '0:0:0:0:0:0:0:1', '2017-01-17 10:44:57');
INSERT INTO `sys_log` VALUES ('828', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:45:06');
INSERT INTO `sys_log` VALUES ('829', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=任务管理&resourceType=0&url=/task/manager&openMode=ajax&icon=fi-folder&seq=0&status=0&pid=257&', '0:0:0:0:0:0:0:1', '2017-01-17 10:46:09');
INSERT INTO `sys_log` VALUES ('830', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:46:57');
INSERT INTO `sys_log` VALUES ('831', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/task/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-17 10:48:33');
INSERT INTO `sys_log` VALUES ('832', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:48:55');
INSERT INTO `sys_log` VALUES ('833', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/task/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-17 10:49:29');
INSERT INTO `sys_log` VALUES ('834', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:49:36');
INSERT INTO `sys_log` VALUES ('835', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:49:43');
INSERT INTO `sys_log` VALUES ('836', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/task/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-17 10:53:08');
INSERT INTO `sys_log` VALUES ('837', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-17 10:53:17');
INSERT INTO `sys_log` VALUES ('838', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/task/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=252&', '0:0:0:0:0:0:0:1', '2017-01-17 10:54:01');
INSERT INTO `sys_log` VALUES ('839', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-17 10:54:15');
INSERT INTO `sys_log` VALUES ('840', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484622827171&', '0:0:0:0:0:0:0:1', '2017-01-17 13:18:10');
INSERT INTO `sys_log` VALUES ('841', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,257,258,259,260,261,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-17 13:18:20');
INSERT INTO `sys_log` VALUES ('842', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:', null, '2017-01-17 14:18:17');
INSERT INTO `sys_log` VALUES ('843', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:', null, '2017-01-17 14:32:44');
INSERT INTO `sys_log` VALUES ('844', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:', null, '2017-01-17 14:32:49');
INSERT INTO `sys_log` VALUES ('845', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:', null, '2017-01-17 14:34:49');
INSERT INTO `sys_log` VALUES ('846', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484634962046&', '0:0:0:0:0:0:0:1', '2017-01-17 14:36:16');
INSERT INTO `sys_log` VALUES ('847', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484634962048&', '0:0:0:0:0:0:0:1', '2017-01-17 14:47:22');
INSERT INTO `sys_log` VALUES ('848', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484634962049&', '0:0:0:0:0:0:0:1', '2017-01-17 14:47:34');
INSERT INTO `sys_log` VALUES ('849', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484637195457&', '0:0:0:0:0:0:0:1', '2017-01-17 15:13:22');
INSERT INTO `sys_log` VALUES ('850', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:goodsNum=1&farmingType=0&keyword=1&mark=1&type=0&', '0:0:0:0:0:0:0:1', '2017-01-17 15:13:34');
INSERT INTO `sys_log` VALUES ('851', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484637290397&', '0:0:0:0:0:0:0:1', '2017-01-17 15:14:58');
INSERT INTO `sys_log` VALUES ('852', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:goodsNum=1&farmingType=0&keyword=1&mark=1&type=0&', '0:0:0:0:0:0:0:1', '2017-01-17 15:15:03');
INSERT INTO `sys_log` VALUES ('853', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484637290400&', '0:0:0:0:0:0:0:1', '2017-01-17 15:18:47');
INSERT INTO `sys_log` VALUES ('854', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:goodsNum=2&farmingType=0&keyword=2&mark=2&type=0&', '0:0:0:0:0:0:0:1', '2017-01-17 15:18:54');
INSERT INTO `sys_log` VALUES ('855', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=2&_=1484637290402&', '0:0:0:0:0:0:0:1', '2017-01-17 15:22:15');
INSERT INTO `sys_log` VALUES ('856', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=2&_=1484637290403&', '0:0:0:0:0:0:0:1', '2017-01-17 15:22:42');
INSERT INTO `sys_log` VALUES ('857', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:orderNum=111&evaluateWorld=111&farmingType=0&mark=111&type=1&', '0:0:0:0:0:0:0:1', '2017-01-17 15:22:54');
INSERT INTO `sys_log` VALUES ('858', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=2&_=1484638006403&', '0:0:0:0:0:0:0:1', '2017-01-17 15:27:17');
INSERT INTO `sys_log` VALUES ('859', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=3&_=1484638006404&', '0:0:0:0:0:0:0:1', '2017-01-17 15:27:21');
INSERT INTO `sys_log` VALUES ('860', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:orderNum=111&type=1&', '0:0:0:0:0:0:0:1', '2017-01-17 15:27:37');
INSERT INTO `sys_log` VALUES ('861', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=3&_=1484638006406&', '0:0:0:0:0:0:0:1', '2017-01-17 15:28:28');
INSERT INTO `sys_log` VALUES ('862', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:orderNum=123&type=2&', '0:0:0:0:0:0:0:1', '2017-01-17 15:28:30');
INSERT INTO `sys_log` VALUES ('863', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=3&_=1484638006407&', '0:0:0:0:0:0:0:1', '2017-01-17 15:28:36');
INSERT INTO `sys_log` VALUES ('864', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=4&_=1484638006408&', '0:0:0:0:0:0:0:1', '2017-01-17 15:28:39');
INSERT INTO `sys_log` VALUES ('865', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:orderNum=123&evaluateWorld=123&farmingType=0&mark=123&type=3&', '0:0:0:0:0:0:0:1', '2017-01-17 15:28:44');
INSERT INTO `sys_log` VALUES ('866', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=6&_=1484638895690&', '0:0:0:0:0:0:0:1', '2017-01-17 15:42:58');
INSERT INTO `sys_log` VALUES ('867', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=1&_=1484638895691&', '0:0:0:0:0:0:0:1', '2017-01-17 15:43:01');
INSERT INTO `sys_log` VALUES ('868', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:goodsNum=1&farmingType=1&keyword=1&mark=1&id=1&', '0:0:0:0:0:0:0:1', '2017-01-17 15:43:13');
INSERT INTO `sys_log` VALUES ('869', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=1&_=1484638895692&', '0:0:0:0:0:0:0:1', '2017-01-17 15:43:15');
INSERT INTO `sys_log` VALUES ('870', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=1&_=1484638895693&', '0:0:0:0:0:0:0:1', '2017-01-17 15:44:19');
INSERT INTO `sys_log` VALUES ('871', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=2&_=1484638895694&', '0:0:0:0:0:0:0:1', '2017-01-17 15:44:23');
INSERT INTO `sys_log` VALUES ('872', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:goodsNum=2&farmingType=1&keyword=2&mark=2&id=2&', '0:0:0:0:0:0:0:1', '2017-01-17 15:44:27');
INSERT INTO `sys_log` VALUES ('873', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=2&_=1484638895695&', '0:0:0:0:0:0:0:1', '2017-01-17 15:44:29');
INSERT INTO `sys_log` VALUES ('874', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=3&_=1484638895697&', '0:0:0:0:0:0:0:1', '2017-01-17 15:48:27');
INSERT INTO `sys_log` VALUES ('875', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:orderNum=111&evaluateWorld=111&farmingType=0&picture=123&id=3&', '0:0:0:0:0:0:0:1', '2017-01-17 15:48:34');
INSERT INTO `sys_log` VALUES ('876', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=3&_=1484638895698&', '0:0:0:0:0:0:0:1', '2017-01-17 15:48:37');
INSERT INTO `sys_log` VALUES ('877', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=3&_=1484638895700&', '0:0:0:0:0:0:0:1', '2017-01-17 15:48:59');
INSERT INTO `sys_log` VALUES ('878', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:orderNum=111&evaluateWorld=111&showPicture=0&picture=123&id=3&', '0:0:0:0:0:0:0:1', '2017-01-17 15:49:02');
INSERT INTO `sys_log` VALUES ('879', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=3&_=1484638895701&', '0:0:0:0:0:0:0:1', '2017-01-17 15:49:03');
INSERT INTO `sys_log` VALUES ('880', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=6&_=1484638895703&', '0:0:0:0:0:0:0:1', '2017-01-17 16:07:49');
INSERT INTO `sys_log` VALUES ('881', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:orderNum=123&evaluateWorld=123&showPicture=0&picture=123&id=6&', '0:0:0:0:0:0:0:1', '2017-01-17 16:07:57');
INSERT INTO `sys_log` VALUES ('882', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=6&_=1484638895704&', '0:0:0:0:0:0:0:1', '2017-01-17 16:07:58');
INSERT INTO `sys_log` VALUES ('883', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=5&_=1484638895705&', '0:0:0:0:0:0:0:1', '2017-01-17 16:08:04');
INSERT INTO `sys_log` VALUES ('884', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:edit,[参数]:orderNum=1232&id=5&', '0:0:0:0:0:0:0:1', '2017-01-17 16:08:07');
INSERT INTO `sys_log` VALUES ('885', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:editPage,[参数]:id=5&_=1484638895706&', '0:0:0:0:0:0:0:1', '2017-01-17 16:08:09');
INSERT INTO `sys_log` VALUES ('886', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484638895708&', '0:0:0:0:0:0:0:1', '2017-01-17 16:10:03');
INSERT INTO `sys_log` VALUES ('887', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=262&_=1484638895711&', '0:0:0:0:0:0:0:1', '2017-01-17 16:10:27');
INSERT INTO `sys_log` VALUES ('888', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=262&name=删除&resourceType=1&url=/task/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-17 16:10:36');
INSERT INTO `sys_log` VALUES ('889', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484638895712&', '0:0:0:0:0:0:0:1', '2017-01-17 16:10:42');
INSERT INTO `sys_log` VALUES ('890', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,257,258,259,260,261,262,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-17 16:10:47');
INSERT INTO `sys_log` VALUES ('891', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:delete,[参数]:id=4&', '0:0:0:0:0:0:0:1', '2017-01-17 16:13:56');
INSERT INTO `sys_log` VALUES ('892', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:delete,[参数]:id=2&', '0:0:0:0:0:0:0:1', '2017-01-17 16:14:04');
INSERT INTO `sys_log` VALUES ('893', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:addPage,[参数]:type=1&_=1484641736593&', '0:0:0:0:0:0:0:1', '2017-01-17 16:29:14');
INSERT INTO `sys_log` VALUES ('894', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:goodsNum=1231231&farmingType=0&keyword=&mark=&type=0&', '0:0:0:0:0:0:0:1', '2017-01-17 16:29:19');
INSERT INTO `sys_log` VALUES ('895', 'admin', 'admin', '[类名]:com.chq.business.task.TaskController,[方法]:add,[参数]:goodsNum=1&farmingType=0&keyword=&mark=&type=0&', '0:0:0:0:0:0:0:1', '2017-01-17 16:29:25');
INSERT INTO `sys_log` VALUES ('896', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-17 16:34:19');
INSERT INTO `sys_log` VALUES ('897', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-18 10:13:49');
INSERT INTO `sys_log` VALUES ('898', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=分配&resourceType=1&url=/task/distribution&openMode=ajax&icon=fi-info&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-18 10:14:49');
INSERT INTO `sys_log` VALUES ('899', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=263&_=1484703710135&', '0:0:0:0:0:0:0:1', '2017-01-18 10:15:24');
INSERT INTO `sys_log` VALUES ('900', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=263&name=分配&resourceType=1&url=/task/distribution&openMode=ajax&icon=fi-torso&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-18 10:15:30');
INSERT INTO `sys_log` VALUES ('901', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484703710137&', '0:0:0:0:0:0:0:1', '2017-01-18 10:18:28');
INSERT INTO `sys_log` VALUES ('902', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,257,258,259,260,261,262,263,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-18 10:18:33');
INSERT INTO `sys_log` VALUES ('903', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-18 10:18:40');
INSERT INTO `sys_log` VALUES ('904', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-19 16:14:47');
INSERT INTO `sys_log` VALUES ('905', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=详细&resourceType=1&url=/task/detail&openMode=ajax&icon=fi-zoom-in&seq=0&status=0&pid=258&', '0:0:0:0:0:0:0:1', '2017-01-19 16:15:25');
INSERT INTO `sys_log` VALUES ('906', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484813127538&', '0:0:0:0:0:0:0:1', '2017-01-19 16:15:35');
INSERT INTO `sys_log` VALUES ('907', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,257,258,259,260,261,262,263,264,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-19 16:15:40');
INSERT INTO `sys_log` VALUES ('908', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-01-19 16:37:02');
INSERT INTO `sys_log` VALUES ('909', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=我的任务&resourceType=0&url=/task/myTask&openMode=ajax&icon=fi-folder&seq=0&status=0&pid=257&', '0:0:0:0:0:0:0:1', '2017-01-19 16:37:51');
INSERT INTO `sys_log` VALUES ('910', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=265&_=1484815371219&', '0:0:0:0:0:0:0:1', '2017-01-19 16:43:28');
INSERT INTO `sys_log` VALUES ('911', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=265&name=我的任务&resourceType=0&url=/task/myTask&openMode=&icon=fi-paperclip&seq=0&status=0&pid=257&', '0:0:0:0:0:0:0:1', '2017-01-19 16:43:34');
INSERT INTO `sys_log` VALUES ('912', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1484815371223&', '0:0:0:0:0:0:0:1', '2017-01-19 16:45:16');
INSERT INTO `sys_log` VALUES ('913', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=3,31,230,231,232,233,234,235,32,236,237,33,238,251,252,256,253,254,255,257,258,259,260,261,262,263,264,265,266,239,240,241,242,243,244,245,246,247,248,249,250,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228&', '0:0:0:0:0:0:0:1', '2017-01-19 16:45:21');

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
