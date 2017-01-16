
---------------------------------------------------------------------------------------------------------------------
----------业务相关
---------------------------------------------------------------------------------------------------------------------
-- ----------------------------
-- Table structure for business_account  账号信息表
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for business_setting  业务设置信息表
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
-- Records of business_setting  默认数据
-- ----------------------------
INSERT INTO `business_setting` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for business_bankcard  银行卡管理表
-- ----------------------------
DROP TABLE IF EXISTS `business_bankcard`;
CREATE TABLE `business_bankcard` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_num` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;