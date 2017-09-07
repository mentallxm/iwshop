/*
Navicat MySQL Data Transfer

Source Server         : MA
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : iwshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-07 09:56:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_account` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_last_login` datetime DEFAULT NULL,
  `admin_ip_address` varchar(255) DEFAULT NULL,
  `admin_auth` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`admin_account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '超级管理员', 'admin', '4a0894d6e8f3b5c6ee0c519bcb98b6b7fd0affcb343ace3a093f29da4b2535604b61f0aebd60c0f0e49cc53adba3fffb', '2017-09-07 00:18:36', '127.0.0.1', 'stat,orde,prod,gmes,user,comp,sett', '0');
INSERT INTO `admin` VALUES ('2', 'ceshi', 'ceshi', 'b19045d2eef611cd2b8ee385224dd38419748d664ae2721efe66e3b09278c2d2be39b9a96f2bc1ac0a753367335f8c65', '2017-09-07 00:55:54', '127.0.0.1', 'orde,prod', '2');

-- ----------------------------
-- Table structure for `admin_login_records`
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_records`;
CREATE TABLE `admin_login_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ldate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台管理员登录记录';

-- ----------------------------
-- Records of admin_login_records
-- ----------------------------
INSERT INTO `admin_login_records` VALUES ('1', 'admin', '127.0.0.1', '2017-08-26 21:12:21');
INSERT INTO `admin_login_records` VALUES ('2', 'admin', '127.0.0.1', '2017-09-01 21:40:05');
INSERT INTO `admin_login_records` VALUES ('3', 'admin', '127.0.0.1', '2017-09-05 15:17:44');
INSERT INTO `admin_login_records` VALUES ('4', 'admin', '127.0.0.1', '2017-09-06 00:03:04');
INSERT INTO `admin_login_records` VALUES ('5', 'admin', '127.0.0.1', '2017-09-06 15:25:07');
INSERT INTO `admin_login_records` VALUES ('6', 'admin', '127.0.0.1', '2017-09-06 23:28:43');
INSERT INTO `admin_login_records` VALUES ('7', 'admin', '127.0.0.1', '2017-09-07 00:18:35');
INSERT INTO `admin_login_records` VALUES ('8', 'ceshi', '127.0.0.1', '2017-09-07 00:55:54');

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumb_media_id` varchar(255) DEFAULT NULL COMMENT '图文消息缩略图的media_id，可以在基础支持-上传多媒体文件接口中获得',
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_source_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `show_cover_pic` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文消息';

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则code，多个规则 , 隔开',
  `update_time` int(10) unsigned NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '规则所属module',
  `pid` int(8) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;0-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  `is_menu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是按钮',
  `code` varchar(12) NOT NULL DEFAULT '',
  `is_btn` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是按钮',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `module` (`status`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `client_id` int(25) NOT NULL AUTO_INCREMENT COMMENT '会员卡号',
  `client_nickname` varchar(512) NOT NULL,
  `client_name` varchar(512) NOT NULL COMMENT '会员姓名',
  `client_sex` varchar(1) DEFAULT NULL COMMENT '会员性别',
  `client_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '会员电话',
  `client_email` varchar(255) DEFAULT NULL,
  `client_head` varchar(255) DEFAULT NULL,
  `client_head_lastmod` datetime DEFAULT NULL,
  `client_password` varchar(255) DEFAULT '' COMMENT '会员密码',
  `client_level` tinyint(3) DEFAULT '0' COMMENT '会员种类\\r\\n1为普通会员\\r\\n0为合作商',
  `client_wechat_openid` varchar(50) NOT NULL DEFAULT '' COMMENT '会员微信openid',
  `client_joindate` date NOT NULL,
  `client_province` varchar(60) DEFAULT NULL,
  `client_city` varchar(60) DEFAULT NULL,
  `client_address` varchar(60) DEFAULT '' COMMENT '会员住址',
  `client_money` float(15,2) NOT NULL DEFAULT '0.00' COMMENT '会员存款',
  `client_credit` int(15) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `client_remark` varchar(255) DEFAULT '' COMMENT '会员备注',
  `client_groupid` int(11) DEFAULT '0',
  `client_storeid` int(10) DEFAULT '0' COMMENT '会员所属店号',
  `client_personid` varchar(255) DEFAULT NULL,
  `client_comid` int(11) DEFAULT '0' COMMENT '代理编号',
  `client_autoenvrec` tinyint(4) DEFAULT '0',
  `client_overdraft_amount` float(11,2) DEFAULT '0.00' COMMENT '用户信用总额',
  `is_com` tinyint(4) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `index_openid` (`client_wechat_openid`) USING BTREE,
  KEY `index_comid` (`client_comid`)
) ENGINE=InnoDB AUTO_INCREMENT=1412 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('1411', '', '', null, '', null, null, null, '', '0', 'oRky_wrPrmkknLl-3J30F-kQ2GJE', '0000-00-00', null, null, '', '0.00', '0', '', '0', '0', null, '0', '0', '0.00', '0', '0');

-- ----------------------------
-- Table structure for `client_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `client_addresses`;
CREATE TABLE `client_addresses` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dist` varchar(255) DEFAULT NULL,
  `addrs` varchar(255) DEFAULT NULL,
  `poscode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址信息';

-- ----------------------------
-- Records of client_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for `client_autoenvs`
-- ----------------------------
DROP TABLE IF EXISTS `client_autoenvs`;
CREATE TABLE `client_autoenvs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `envid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注自动红包';

-- ----------------------------
-- Records of client_autoenvs
-- ----------------------------

-- ----------------------------
-- Table structure for `client_balance_records`
-- ----------------------------
DROP TABLE IF EXISTS `client_balance_records`;
CREATE TABLE `client_balance_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `rtype` enum('default','rebate','deposit','withdrawal') DEFAULT 'default',
  `rtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额记录';

-- ----------------------------
-- Records of client_balance_records
-- ----------------------------

-- ----------------------------
-- Table structure for `client_bank_card`
-- ----------------------------
DROP TABLE IF EXISTS `client_bank_card`;
CREATE TABLE `client_bank_card` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dist` varchar(255) DEFAULT NULL,
  `cardno` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户银行卡数据表';

-- ----------------------------
-- Records of client_bank_card
-- ----------------------------

-- ----------------------------
-- Table structure for `client_cart`
-- ----------------------------
DROP TABLE IF EXISTS `client_cart`;
CREATE TABLE `client_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL COMMENT '用户编号',
  `product_id` int(11) NOT NULL COMMENT '商品编号',
  `spec_id` int(11) DEFAULT '0' COMMENT '商品规格',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`id`),
  KEY `index_openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户购物车';

-- ----------------------------
-- Records of client_cart
-- ----------------------------
INSERT INTO `client_cart` VALUES ('2', 'oRky_wrPrmkknLl-3J30F-kQ2GJE', '8165', '0', '1');

-- ----------------------------
-- Table structure for `client_envelopes`
-- ----------------------------
DROP TABLE IF EXISTS `client_envelopes`;
CREATE TABLE `client_envelopes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `envid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `exp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户红包表';

-- ----------------------------
-- Records of client_envelopes
-- ----------------------------

-- ----------------------------
-- Table structure for `client_envelopes_type`
-- ----------------------------
DROP TABLE IF EXISTS `client_envelopes_type`;
CREATE TABLE `client_envelopes_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `req_amount` float DEFAULT NULL,
  `dis_amount` float DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户红包类型表';

-- ----------------------------
-- Records of client_envelopes_type
-- ----------------------------

-- ----------------------------
-- Table structure for `client_feedbacks`
-- ----------------------------
DROP TABLE IF EXISTS `client_feedbacks`;
CREATE TABLE `client_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `feedback` text,
  `ftime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户反馈信息';

-- ----------------------------
-- Records of client_feedbacks
-- ----------------------------

-- ----------------------------
-- Table structure for `client_level`
-- ----------------------------
DROP TABLE IF EXISTS `client_level`;
CREATE TABLE `client_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) NOT NULL DEFAULT '',
  `level_credit` int(11) NOT NULL,
  `level_discount` float DEFAULT NULL,
  `level_credit_feed` float DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `upable` tinyint(1) DEFAULT '1',
  `isdefault` tinyint(1) DEFAULT '0' COMMENT '是否默认分组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户分组';

-- ----------------------------
-- Records of client_level
-- ----------------------------
INSERT INTO `client_level` VALUES ('2', '高级会员', '999', '100', '100', '高级会员', '1', '0');
INSERT INTO `client_level` VALUES ('3', '普通会员', '0', '100', '100', null, '1', '0');
INSERT INTO `client_level` VALUES ('6', '一级会员', '0', '75', '100', '销售价标价为零售价，分享名片且有五人以上关注，会员购物将长久按7.5折优惠结算。', '1', '0');
INSERT INTO `client_level` VALUES ('7', '二级会员', '0', '75', '1', null, '1', '0');
INSERT INTO `client_level` VALUES ('8', '三级会员', '0', '95', '1', '', '1', '0');

-- ----------------------------
-- Table structure for `client_messages`
-- ----------------------------
DROP TABLE IF EXISTS `client_messages`;
CREATE TABLE `client_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `msgtype` tinyint(2) DEFAULT '0',
  `msgcont` text,
  `msgdirect` tinyint(4) DEFAULT '0',
  `autoreped` tinyint(4) DEFAULT '0',
  `send_time` datetime DEFAULT NULL,
  `sreaded` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `client_message_session`
-- ----------------------------
DROP TABLE IF EXISTS `client_message_session`;
CREATE TABLE `client_message_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `unread` int(11) DEFAULT '0',
  `undesc` varchar(255) DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniopenid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_message_session
-- ----------------------------

-- ----------------------------
-- Table structure for `client_order_address`
-- ----------------------------
DROP TABLE IF EXISTS `client_order_address`;
CREATE TABLE `client_order_address` (
  `addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单地址信息表';

-- ----------------------------
-- Records of client_order_address
-- ----------------------------

-- ----------------------------
-- Table structure for `client_sign_record`
-- ----------------------------
DROP TABLE IF EXISTS `client_sign_record`;
CREATE TABLE `client_sign_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `openid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dt` (`dt`,`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户签到记录';

-- ----------------------------
-- Records of client_sign_record
-- ----------------------------

-- ----------------------------
-- Table structure for `client_urecord`
-- ----------------------------
DROP TABLE IF EXISTS `client_urecord`;
CREATE TABLE `client_urecord` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `amount` float(11,2) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_urecord
-- ----------------------------

-- ----------------------------
-- Table structure for `company_bills`
-- ----------------------------
DROP TABLE IF EXISTS `company_bills`;
CREATE TABLE `company_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comid` int(11) DEFAULT NULL,
  `bill_amount` float(10,2) DEFAULT NULL,
  `bill_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理账单信息, 废弃';

-- ----------------------------
-- Records of company_bills
-- ----------------------------

-- ----------------------------
-- Table structure for `company_income_record`
-- ----------------------------
DROP TABLE IF EXISTS `company_income_record`;
CREATE TABLE `company_income_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float(11,2) NOT NULL DEFAULT '0.00',
  `date` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `com_id` varchar(255) NOT NULL,
  `pcount` int(11) NOT NULL,
  `is_seted` tinyint(4) DEFAULT '0',
  `is_reqed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理收入记录, 废弃';

-- ----------------------------
-- Records of company_income_record
-- ----------------------------

-- ----------------------------
-- Table structure for `company_users`
-- ----------------------------
DROP TABLE IF EXISTS `company_users`;
CREATE TABLE `company_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `comid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniopenid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理和用户关联信息';

-- ----------------------------
-- Records of company_users
-- ----------------------------

-- ----------------------------
-- Table structure for `envs_robblist`
-- ----------------------------
DROP TABLE IF EXISTS `envs_robblist`;
CREATE TABLE `envs_robblist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `on` int(11) DEFAULT NULL,
  `remains` int(11) DEFAULT NULL,
  `envsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of envs_robblist
-- ----------------------------

-- ----------------------------
-- Table structure for `envs_robrecord`
-- ----------------------------
DROP TABLE IF EXISTS `envs_robrecord`;
CREATE TABLE `envs_robrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `envsid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of envs_robrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `express_record`
-- ----------------------------
DROP TABLE IF EXISTS `express_record`;
CREATE TABLE `express_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `confirm_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `costs` varchar(255) DEFAULT '0' COMMENT '配送时效',
  `openid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express_record
-- ----------------------------

-- ----------------------------
-- Table structure for `gmess_category`
-- ----------------------------
DROP TABLE IF EXISTS `gmess_category`;
CREATE TABLE `gmess_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT '0',
  `sort` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmess_category
-- ----------------------------

-- ----------------------------
-- Table structure for `gmess_page`
-- ----------------------------
DROP TABLE IF EXISTS `gmess_page`;
CREATE TABLE `gmess_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '内容',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `catimg` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `thumb_media_id` varchar(255) NOT NULL DEFAULT '',
  `content_source_url` varchar(255) NOT NULL DEFAULT '' COMMENT '原文链接',
  `media_id` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `category` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '素材分类',
  `deleted` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数目',
  `wechat_id` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `wei_url` varchar(255) NOT NULL DEFAULT '' COMMENT '微信url',
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否审核',
  `client_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `ad_product` varchar(32) NOT NULL DEFAULT '' COMMENT '推广产品的IDs',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmess_page
-- ----------------------------

-- ----------------------------
-- Table structure for `gmess_send_stat`
-- ----------------------------
DROP TABLE IF EXISTS `gmess_send_stat`;
CREATE TABLE `gmess_send_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `send_date` datetime DEFAULT NULL,
  `send_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT '0',
  `share_count` int(11) DEFAULT '0',
  `receive_count` int(11) DEFAULT NULL,
  `send_type` tinyint(4) DEFAULT '0',
  `msg_type` enum('text','images') DEFAULT 'images',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmess_send_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `gmess_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `gmess_tasks`;
CREATE TABLE `gmess_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gmess_id` int(11) NOT NULL,
  `task_time` int(11) DEFAULT '0',
  `task_exec_time` int(11) DEFAULT '0',
  `task_finish_time` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmess_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for `group_buy`
-- ----------------------------
DROP TABLE IF EXISTS `group_buy`;
CREATE TABLE `group_buy` (
  `tuan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `tuan_title` varchar(255) NOT NULL COMMENT '团购标题',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `tuan_picture` varchar(100) NOT NULL COMMENT '团购图片',
  `tuan_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `tuan_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `tuan_deposit_price` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '定金',
  `tuan_per_number` int(10) NOT NULL DEFAULT '0' COMMENT '每人限购数量',
  `tuan_send_point` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分数',
  `tuan_number` int(10) NOT NULL DEFAULT '0' COMMENT '限购数量',
  `tuan_pre_number` int(10) NOT NULL DEFAULT '0' COMMENT '虚拟购买数量',
  `tuan_desc` text NOT NULL COMMENT '团购介绍',
  `tuan_goodshow_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示商品详情',
  `tuan_now_number` int(10) NOT NULL DEFAULT '0' COMMENT '已团购数量',
  `tuan_order` int(10) NOT NULL DEFAULT '0' COMMENT '显示次序',
  `tuan_create_time` datetime NOT NULL COMMENT '团购创建时间',
  `tuan_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '团购更新时间',
  `tuan_price` decimal(10,3) DEFAULT '0.000' COMMENT '团购价',
  `tuan_bid` int(11) NOT NULL DEFAULT '0' COMMENT '团购所属品牌类目',
  `tuan_cid` int(11) NOT NULL DEFAULT '0' COMMENT '团购所属分类',
  `tuan_baoyou` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否包邮：0：不包邮；1:包邮',
  `tuan_remark` varchar(255) DEFAULT NULL COMMENT '团购简介',
  `tuan_start_code` tinyint(1) DEFAULT '0' COMMENT '是否启用验证码',
  `overdue_start_time` datetime NOT NULL COMMENT '补交余款开始时间',
  `overdue_end_time` datetime NOT NULL COMMENT '补交余款结束时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_deposit` tinyint(1) DEFAULT '0' COMMENT '是否启用担保金',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`tuan_id`),
  KEY `is_active` (`is_active`) USING BTREE,
  KEY `sort_order` (`tuan_order`) USING BTREE,
  KEY `tuan_start_time` (`tuan_start_time`) USING BTREE,
  KEY `tuan_end_time` (`tuan_end_time`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `tuan_goodshow_status` (`tuan_goodshow_status`) USING BTREE,
  KEY `overdue_start_time` (`overdue_start_time`) USING BTREE,
  KEY `overdue_end_time` (`overdue_end_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of group_buy
-- ----------------------------

-- ----------------------------
-- Table structure for `group_buy_log`
-- ----------------------------
DROP TABLE IF EXISTS `group_buy_log`;
CREATE TABLE `group_buy_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `tuan_id` int(10) NOT NULL DEFAULT '0' COMMENT '团购ID',
  `client_id` int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `product_id` int(10) NOT NULL COMMENT '商品ID',
  `num` int(4) NOT NULL DEFAULT '0' COMMENT '购买数量。取值范围:大于零的整数',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of group_buy_log
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `client_id` int(11) DEFAULT NULL COMMENT '客户编号',
  `serial_number` varchar(30) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL COMMENT '订单交易时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `order_balance` float(10,2) DEFAULT '0.00' COMMENT '余额抵现',
  `order_expfee` float(10,2) DEFAULT '0.00' COMMENT '订单运费',
  `order_amount` float(10,2) DEFAULT '0.00' COMMENT '总价',
  `order_refund_amount` float(10,2) DEFAULT '0.00',
  `order_discounted` float(11,2) DEFAULT '1.00' COMMENT '订单折扣比例',
  `supply_price_amount` float(10,2) DEFAULT '0.00',
  `original_amount` float(10,2) DEFAULT '0.00',
  `company_id` int(11) DEFAULT '0',
  `product_count` int(11) DEFAULT '0',
  `wepay_serial` varchar(50) DEFAULT NULL,
  `wepay_openid` varchar(255) DEFAULT '',
  `wepay_unionid` varchar(255) DEFAULT NULL,
  `wepayed` tinyint(1) DEFAULT '0' COMMENT '订单是否已支付',
  `leword` text,
  `status` enum('unpay','payed','received','canceled','closed','refunded','delivering','reqing') NOT NULL DEFAULT 'unpay' COMMENT '订单状态',
  `express_openid` varchar(255) DEFAULT NULL,
  `express_code` varchar(255) DEFAULT NULL,
  `express_com` varchar(255) DEFAULT NULL,
  `exptime` varchar(255) DEFAULT NULL,
  `envs_id` int(11) DEFAULT '0',
  `is_commented` tinyint(1) DEFAULT '0',
  `address_hash` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT '0',
  `rebated` tinyint(1) DEFAULT '0' COMMENT '返佣是否已经处理',
  `rebated_amount` float(11,2) DEFAULT '0.00' COMMENT '已经返佣的金额',
  PRIMARY KEY (`order_id`),
  KEY `openid` (`wepay_openid`) USING BTREE,
  KEY `serial_number` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_address`
-- ----------------------------
DROP TABLE IF EXISTS `orders_address`;
CREATE TABLE `orders_address` (
  `addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL,
  `tel_number` varchar(255) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_address
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_comment`
-- ----------------------------
DROP TABLE IF EXISTS `orders_comment`;
CREATE TABLE `orders_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `starts` tinyint(4) DEFAULT NULL,
  `content` text,
  `mtime` datetime DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_detail`
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(20) NOT NULL COMMENT '订单编号',
  `product_id` int(20) NOT NULL COMMENT '商品编号',
  `product_count` int(10) NOT NULL COMMENT '商品数量',
  `product_discount_price` float(11,2) NOT NULL DEFAULT '0.00',
  `original_amount` float(11,2) DEFAULT NULL,
  `product_price_hash_id` int(11) NOT NULL DEFAULT '0',
  `refunded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`detail_id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `order_credit_available`
-- ----------------------------
DROP TABLE IF EXISTS `order_credit_available`;
CREATE TABLE `order_credit_available` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cfrom` float(5,2) DEFAULT NULL,
  `cto` float(5,2) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_credit_available
-- ----------------------------

-- ----------------------------
-- Table structure for `order_refundment`
-- ----------------------------
DROP TABLE IF EXISTS `order_refundment`;
CREATE TABLE `order_refundment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `refund_amount` float(10,2) DEFAULT '0.00',
  `refund_time` datetime DEFAULT NULL,
  `refund_type` tinyint(4) DEFAULT '0',
  `refund_serial` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `payment_type` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_refundment
-- ----------------------------

-- ----------------------------
-- Table structure for `products_info`
-- ----------------------------
DROP TABLE IF EXISTS `products_info`;
CREATE TABLE `products_info` (
  `product_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `product_code` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '商品条码',
  `product_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `product_subname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品颜色',
  `product_size` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品大小',
  `product_cat` int(11) NOT NULL DEFAULT '1',
  `product_brand` int(11) DEFAULT '0',
  `product_readi` int(11) NOT NULL DEFAULT '0',
  `product_desc` longtext CHARACTER SET utf8,
  `product_subtitle` text CHARACTER SET utf8,
  `product_serial` int(11) DEFAULT '0',
  `product_weight` varchar(11) CHARACTER SET utf8 DEFAULT '0.00',
  `product_online` tinyint(4) DEFAULT '1',
  `product_credit` int(11) DEFAULT '0',
  `product_prom` int(11) DEFAULT '0',
  `product_prom_limit` int(11) DEFAULT '0',
  `product_prom_limitdate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_prom_limitdays` int(11) DEFAULT '0',
  `product_prom_discount` int(11) DEFAULT '0',
  `product_expfee` float(5,2) DEFAULT '0.00' COMMENT '商品快递费用',
  `product_supplier` int(11) DEFAULT '0',
  `product_storage` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '存储条件',
  `product_origin` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '商品产地',
  `product_unit` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '商品单位',
  `product_instocks` int(11) DEFAULT '0' COMMENT '商品库存，在没有规格的时候此字段可用',
  `product_indexes` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '商品分类搜索索引',
  `supply_price` float(11,2) DEFAULT '0.00',
  `sell_price` float(11,2) DEFAULT '0.00',
  `market_price` float(11,2) DEFAULT '0.00',
  `catimg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `product_name` (`product_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8174 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品信息表';

-- ----------------------------
-- Records of products_info
-- ----------------------------
INSERT INTO `products_info` VALUES ('8147', '001', '2016秋装新款 欧美女装V领七分袖不规则白色雪纺连衣裙 中长款', '白色雪纺连衣裙', null, '3', '9', '65', '<p><img src=\"http://cdn.iwshop.org/iwshop/e45f/c1df5/e45fd1cf904bf85c44fe0dcdb16f8100.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e45f/c1df5/e45fd1cf904bf85c44fe0dcdb16f8100.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/7122/37022/7122073cb67639cd5fcb222a1f25378b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/7122/37022/7122073cb67639cd5fcb222a1f25378b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/719e/bb5e9/719e5bb081f61d8cfe6f7b5a56d5d19b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/719e/bb5e9/719e5bb081f61d8cfe6f7b5a56d5d19b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8ac6/a2d6c/8ac6d2a676a1518e3d88c751da52cab1.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8ac6/a2d6c/8ac6d2a676a1518e3d88c751da52cab1.jpg\" style=\"\"/></p><p><br/></p>', '源自欧美顶级设计大师之作', '0', '50', '1', '200', '0', '0', '', '0', '0', '10.00', '0', '干燥避光', '美国', '件', '200', '', '100.00', '129.00', '256.00', '//cdn.iwshop.org/iwshop/5c49/58894/5c498858c8b3140278257b864d80ccee.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8148', '002', '夏季新款大码宽松雪纺背心女V领双层打底衫吊带无袖上衣外穿短款', '女V领双层打底衫', null, '3', '9', '69', '<p><img src=\"http://cdn.iwshop.org/iwshop/e202/32f20/e202f23f4a0823c79d9ce921cd08a8ca.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e202/32f20/e202f23f4a0823c79d9ce921cd08a8ca.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8020/46702/802076443c88970b7ef04f828d95efba.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8020/46702/802076443c88970b7ef04f828d95efba.jpg\" style=\"\"/></p>', '宽松显瘦 双层雪纺 前后性感V领', '0', '50', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '件', '200', '', '90.00', '123.00', '458.00', '//opencdn2.iwshop.cn/iwshop/1406/16460/1406461a23b7aab24617163109e30a4e.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8149', '003', '海青蓝2016夏季新款纯色露肩时尚个性A字裙收腰显瘦连衣裙', '收腰显瘦连衣裙', null, '3', '9', '74', '<p><img src=\"http://cdn.iwshop.org/iwshop/2b0c/ec5c0/2b0c5cef3822eedea3b0cb173bf89dc9.jpg\" _src=\"http://cdn.iwshop.org/iwshop/2b0c/ec5c0/2b0c5cef3822eedea3b0cb173bf89dc9.jpg\" style=\"line-height: 1.42857;\"/></p><p><br/></p>', '时尚个性设计 收腰显瘦版型 气质优雅 欧美潮流', '0', '50', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '美国', '件', '200', '', '100.00', '263.00', '798.00', '//cdn.iwshop.org/iwshop/eac8/a998c/eac899aa25bf5354e27cf4f24a9ba587.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8150', '004', '2016夏装新款女装潮无袖中裙子夏季小香风不规则裙显瘦棉麻连衣裙', '棉麻连衣裙', null, '3', '9', '47', '<p><img src=\"http://cdn.iwshop.org/iwshop/7168/b9986/716899b1c0f84a1d409bccef334530dd.jpg\" _src=\"http://cdn.iwshop.org/iwshop/7168/b9986/716899b1c0f84a1d409bccef334530dd.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/cf3e/ba5e3/cf3e5ab15d02a79982ffb092a5e431a0.jpg\" _src=\"http://cdn.iwshop.org/iwshop/cf3e/ba5e3/cf3e5ab15d02a79982ffb092a5e431a0.jpg\" style=\"\"/></p><p><br/></p>', '棉麻连衣裙', '0', '50', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '件', '200', '', '10.00', '45.00', '100.00', '//cdn.iwshop.org/iwshop/491d/fa2d1/491d2af52b8e5464dfaafd40a622159b.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8151', '005', '夏季青年韩版纯色短袖白衬衫男职业工装修身白色衬衣商务休闲正装', '白色衬衣', null, '5', '9', '36', '<p><img src=\"http://cdn.iwshop.org/iwshop/4dc2/7132c/4dc2317f4cacc483dccf643dedd94cdb.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4dc2/7132c/4dc2317f4cacc483dccf643dedd94cdb.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/1787/16678/178766104b24d09106a6b13b9fec7bff.jpg\" _src=\"http://cdn.iwshop.org/iwshop/1787/16678/178766104b24d09106a6b13b9fec7bff.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/2110/f8c01/2110c8f64ded285cbd900d7b6909a45b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/2110/f8c01/2110c8f64ded285cbd900d7b6909a45b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/fa3a/812a3/fa3a218cefa1761e16b8638669ff8f33.jpg\" _src=\"http://cdn.iwshop.org/iwshop/fa3a/812a3/fa3a218cefa1761e16b8638669ff8f33.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e2fe/379ef/e2fe973a45c6d33bd7705f2eef80363c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e2fe/379ef/e2fe973a45c6d33bd7705f2eef80363c.jpg\" style=\"\"/></p><p><br/></p>', '免烫处理 休闲修身 挺拔有型 时尚青年 商务正装', '0', '100', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥', '中国', '件', '200', '', '50.00', '59.00', '100.00', '//cdn.iwshop.org/iwshop/72cc/c89cc/72cc98c4f2a20bbe418cc02bd56e5881.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8152', '006', '真维斯男士t恤短袖2016夏装新款男装圆领修身纯棉衣服男针织上衣', '真维斯', null, '5', '9', '13', '<p><img src=\"http://cdn.iwshop.org/iwshop/969e/4b2e9/969e2b41204d4a048f46b8c8cbc3222c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/969e/4b2e9/969e2b41204d4a048f46b8c8cbc3222c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8c48/fc984/8c489cf562da746abfbeda2e078f0f25.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8c48/fc984/8c489cf562da746abfbeda2e078f0f25.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/c356/77565/c356577921e380100a4b85ddcf527f1b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/c356/77565/c356577921e380100a4b85ddcf527f1b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/70d1/3851d/70d1583539c9aa756afdb7523623f697.jpg\" _src=\"http://cdn.iwshop.org/iwshop/70d1/3851d/70d1583539c9aa756afdb7523623f697.jpg\" style=\"\"/></p><p><br/></p>', '真维斯男士t恤短袖', '0', '100', '1', '100', '1', '1', '2016-09-09-12：00：00', '0', '70', '0.00', '0', '干燥避光', '中国', '件', '200', '', '88.00', '100.00', '200.00', '//cdn.iwshop.org/iwshop/841f/547f1/841f745d448055088967f3f0a68fe4c6.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8153', '007', 'Kappa 男运动T恤 休闲半袖 男士夏季透气圆领短袖|K0412TD51', 'kappa 运动T恤', null, '5', '0', '21', '<p><img src=\"http://cdn.iwshop.org/iwshop/5b28/75382/5b28357c1d08033c24bbd1ee230aebf7.jpg\" _src=\"http://cdn.iwshop.org/iwshop/5b28/75382/5b28357c1d08033c24bbd1ee230aebf7.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/4578/2d387/45783d2defb986c6c0242726fd366345.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4578/2d387/45783d2defb986c6c0242726fd366345.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/c5a4/8f54a/c5a45f858a2c011f38edc15e8c6a30a9.jpg\" _src=\"http://cdn.iwshop.org/iwshop/c5a4/8f54a/c5a45f858a2c011f38edc15e8c6a30a9.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/0ff0/4aa0f/0ff0aa4e5328c6fb6f8c3f77492f68e5.jpg\" _src=\"http://cdn.iwshop.org/iwshop/0ff0/4aa0f/0ff0aa4e5328c6fb6f8c3f77492f68e5.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/ac1c/bc0c1/ac1c0cbd4bd0a00f0ae0269dbbfd1fb5.jpg\" _src=\"http://cdn.iwshop.org/iwshop/ac1c/bc0c1/ac1c0cbd4bd0a00f0ae0269dbbfd1fb5.jpg\" style=\"\"/></p><p><br/></p>', '国家系列 基础圆领衫 龟裂胶印效果', '0', '100', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '件', '200', '', '50.00', '100.00', '200.00', '//cdn.iwshop.org/iwshop/451d/655d1/451d556088cde5904ee0a5de9840ea43.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8154', '008', 'Kappa男卫衣运动服休闲外套男子上衣开身帽衫 |K0512MK05', '男卫衣', null, '5', '9', '11', '<p><img src=\"http://cdn.iwshop.org/iwshop/ae2d/57ad2/ae2da75e60478639e48735ce1f3b2d2f.jpg\" _src=\"http://cdn.iwshop.org/iwshop/ae2d/57ad2/ae2da75e60478639e48735ce1f3b2d2f.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/12bc/e90cb/12bc09ebf6982bb87c71069a243e77ad.jpg\" _src=\"http://cdn.iwshop.org/iwshop/12bc/e90cb/12bc09ebf6982bb87c71069a243e77ad.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/59e6/1046e/59e6401362079c7e253567bb2dbf52f4.jpg\" _src=\"http://cdn.iwshop.org/iwshop/59e6/1046e/59e6401362079c7e253567bb2dbf52f4.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/bae1/e6c1e/bae1c6ee46c905e08b1be996c71f8440.jpg\" _src=\"http://cdn.iwshop.org/iwshop/bae1/e6c1e/bae1c6ee46c905e08b1be996c71f8440.jpg\" style=\"\"/></p><p><br/></p>', '加高连帽领口 防风拉链 简约线条装饰 纯正颜色', '0', '100', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '件', '200', '', '20.00', '100.00', '200.00', '//cdn.iwshop.org/iwshop/8aaa/8a7aa/8aaa7a8451edf04d5062fbd3f5d8edc0.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8155', '009', '米川夏季白衬衫女短袖职业工作半袖正装宽松工装衬衣韩范女装', '女装', null, '3', '0', '98', '<p>1231\r\n\r\n123123</p>', '职业女工装 白色正装长袖 夏季 宽松', '0', '50', '1', '100', '0', '0', '', '0', '0', '0.00', '2', '干燥避光', '中国', '件', '204', '', '19.00', '15.00', '13.00', '//image.offask.com/jiaguohuzhu/5ef5/e065f/5ef560ea835a6039a1a9b16ade814e54.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8156', '010', 'Xiaomi/小米 红米Note3', '小米', null, '4', '9', '103', '<p><img src=\"http://cdn.iwshop.org/iwshop/a48c/926c8/a48c6295b6bb021f973fdcc282cc5be7.jpg\" _src=\"http://cdn.iwshop.org/iwshop/a48c/926c8/a48c6295b6bb021f973fdcc282cc5be7.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/c5c5/b995c/c5c599b46d03a12302481cdf9e486f1a.jpg\" _src=\"http://cdn.iwshop.org/iwshop/c5c5/b995c/c5c599b46d03a12302481cdf9e486f1a.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/75c8/5f28c/75c82f53c8af361e96bbbdc0bb95d8e2.jpg\" _src=\"http://cdn.iwshop.org/iwshop/75c8/5f28c/75c82f53c8af361e96bbbdc0bb95d8e2.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9999/c5c99/9999c5cb200c0488b8cd519d69bda93f.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9999/c5c99/9999c5cb200c0488b8cd519d69bda93f.jpg\" style=\"\"/></p><p><br/></p>', '全网通高配版 双卡双待金属指纹解锁手机', '0', '200', '1', '1000', '0', '0', '', '0', '0', '5.00', '0', '避光', '中国', '台', '2000', '', '888.00', '1000.00', '1200.00', '//cdn.iwshop.org/iwshop/3dc8/5788c/3dc8875803ac8f0345224b2d2b5018b9.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8157', '011', 'AKG/爱科技 y50 耳机头戴式 音乐线控麦克风耳麦AKGSNH48', '耳机', null, '4', '9', '87', '<p><img src=\"http://cdn.iwshop.org/iwshop/a2e7/8977e/a2e7798f3418979bebbc518910612c4d.jpg\" _src=\"http://cdn.iwshop.org/iwshop/a2e7/8977e/a2e7798f3418979bebbc518910612c4d.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/55b9/dea9b/55b9aed5d8195ae60749a77654dac690.jpg\" _src=\"http://cdn.iwshop.org/iwshop/55b9/dea9b/55b9aed5d8195ae60749a77654dac690.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/19bb/24cbb/19bbc429496233eda54c411802a83602.jpg\" _src=\"http://cdn.iwshop.org/iwshop/19bb/24cbb/19bbc429496233eda54c411802a83602.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8cfa/8c3af/8cfa3c811e521b5d652a0928888bbb76.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8cfa/8c3af/8cfa3c811e521b5d652a0928888bbb76.jpg\" style=\"\"/></p><p><br/></p>', '四色可选 出街利器', '0', '100', '1', '500', '0', '0', '', '0', '0', '10.00', '0', '避光', '中国', '个', '2000', '', '500.00', '698.00', '1000.00', '//cdn.iwshop.org/iwshop/8f94/81749/8f9471876536de76e1b539528d40b534.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8158', '012', '周大福浪漫心形白金PT950铂金吊坠PT 148874七夕礼物', '铂金吊坠', null, '2', '9', '28', '<p><img src=\"http://cdn.iwshop.org/iwshop/6a59/55f95/6a59f55179cedd57678a6c569c4b718b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/6a59/55f95/6a59f55179cedd57678a6c569c4b718b.jpg\"/></p>', '纯净铂金之美 寓意着 爱情的珍贵 与纯净', '0', '50', '1', '100', '0', '0', null, '0', '0', '0.00', '0', '干燥避光', '中国', '个', '20', '', '500.00', '544.00', '888.00', '//cdn.iwshop.org/iwshop/d754/a6945/d75496acfe3e11e862922d9602617acf.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8159', '013', '感恩同行白18K单钻圆形钻石吊坠锁骨钻石项链30分铂金钻石吊坠女', '吊坠', null, '2', '9', '19', '<p><img src=\"http://cdn.iwshop.org/iwshop/6b5f/6caf5/6b5fac6e1c47b5854d069939f9a24a5e.jpg\" _src=\"http://cdn.iwshop.org/iwshop/6b5f/6caf5/6b5fac6e1c47b5854d069939f9a24a5e.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/ae7c/b49c7/ae7c94b483b1dc2cfabbca309902518b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/ae7c/b49c7/ae7c94b483b1dc2cfabbca309902518b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/4571/6fe17/4571ef689973426708e7be06bbd66858.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4571/6fe17/4571ef689973426708e7be06bbd66858.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/89b9/4c89b/89b98c4ec65da6ec54328dc27ea7ba21.jpg\" _src=\"http://cdn.iwshop.org/iwshop/89b9/4c89b/89b98c4ec65da6ec54328dc27ea7ba21.jpg\" style=\"\"/></p><p><br/></p>', '时尚锁骨链 经典性感 百搭不过时', '0', '20', '1', '1000', '0', '0', '', '0', '0', '0.00', '0', '避光', '美国', '个', '20', '', '1000.00', '1190.00', '1500.00', '//cdn.iwshop.org/iwshop/3443/1cd34/3443dc117a1f9d11da7ebea1d9ff61ba.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8160', '014', '维尼熊公仔毛绒玩具', '玩具', null, '18', '9', '28', '<p><img src=\"http://cdn.iwshop.org/iwshop/d301/14510/d301541617e0aa905125fdcaaabdd36b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/d301/14510/d301541617e0aa905125fdcaaabdd36b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/b8d0/66b0d/b8d0b6693aea0b20e497c3c6d969192a.jpg\" _src=\"http://cdn.iwshop.org/iwshop/b8d0/66b0d/b8d0b6693aea0b20e497c3c6d969192a.jpg\" style=\"\"/></p><p><br/></p>', '畅销经典款 pooh小熊 时尚礼品 店长热荐', '0', '10', '1', '68', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '个', '200', '', '50.00', '68.00', '68.00', '//cdn.iwshop.org/iwshop/95e0/3db0e/95e0bd3f08bb02d1c2465c174ebaf45e.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8161', '015', '印尼进口皇冠丹麦曲奇饼干200g原味/罐 零食饼干', '饼干', null, '22', '0', '16', '<p><img src=\"http://cdn.iwshop.org/iwshop/12f2/6242f/12f24262ebedb71009b73a85f9784e0c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/12f2/6242f/12f24262ebedb71009b73a85f9784e0c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/f6fa/417af/f6fa714e7fe37f22c2009486cb99b22f.jpg\" _src=\"http://cdn.iwshop.org/iwshop/f6fa/417af/f6fa714e7fe37f22c2009486cb99b22f.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9bb8/f118b/9bb811f21726dd72adccd5be4ebfb007.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9bb8/f118b/9bb811f21726dd72adccd5be4ebfb007.jpg\" style=\"\"/></p><p><br/></p>', '年货分享装 进口黄油制作 原装进口', '0', '500', '1', '100', '0', '0', '', '0', '0', '0.00', '0', '避光', '丹麦', '罐', '20', '', '10.00', '12.00', '15.00', '//cdn.iwshop.org/iwshop/bc8a/209a8/bc8a9023628afc3aedc01868e85fb67a.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8162', '016', '蔓越莓曲奇饼干200g/袋饼干糕点制作休闲零食', '饼干', null, '20', '0', '66', '<p><img src=\"http://cdn.iwshop.org/iwshop/361f/f89f1/361f98f9214183aac9f3d30ad07b61ce.jpg\" _src=\"http://cdn.iwshop.org/iwshop/361f/f89f1/361f98f9214183aac9f3d30ad07b61ce.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/cd3e/02de3/cd3ed2030454f0ffb80fbf99ede61e4b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/cd3e/02de3/cd3ed2030454f0ffb80fbf99ede61e4b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/3734/ac843/37348cabf362b4e1346efb28fce7570c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/3734/ac843/37348cabf362b4e1346efb28fce7570c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/42b0/8260b/42b0628502fce5545154c56a7d1ec4cc.jpg\" _src=\"http://cdn.iwshop.org/iwshop/42b0/8260b/42b0628502fce5545154c56a7d1ec4cc.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/eb85/38558/eb8558301c97591fee8a33670dcf10e0.jpg\" _src=\"http://cdn.iwshop.org/iwshop/eb85/38558/eb8558301c97591fee8a33670dcf10e0.jpg\" style=\"\"/></p><p><br/></p>', '蔓越莓曲奇饼干', '0', '100', '1', '100', '0', '0', null, '0', '0', '0.00', '0', '避光', '中国', '袋', '45', '', '10.00', '15.00', '20.00', '//cdn.iwshop.org/iwshop/fdc9/69d9c/fdc9d96490a9c4d9f65ea5d189ccac4b.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8163', '017', '百草味熟食 白芝麻猪肉脯180g 靖江零食小吃肉干食品', '肉干', null, '20', '0', '24', '<p><img src=\"http://cdn.iwshop.org/iwshop/46a1/4291a/46a19245eb3f16008f551056a69d1f98.jpg\" _src=\"http://cdn.iwshop.org/iwshop/46a1/4291a/46a19245eb3f16008f551056a69d1f98.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/f1d3/fc63d/f1d36cf1cf4ce77bbc578855ebf98e62.jpg\" _src=\"http://cdn.iwshop.org/iwshop/f1d3/fc63d/f1d36cf1cf4ce77bbc578855ebf98e62.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/383b/1b7b3/383b7b132ce8c8a8f779b57aa6cd6e4d.jpg\" _src=\"http://cdn.iwshop.org/iwshop/383b/1b7b3/383b7b132ce8c8a8f779b57aa6cd6e4d.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9dc5/3895c/9dc5983b6e48eb4e6632471d4b5d9c2c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9dc5/3895c/9dc5983b6e48eb4e6632471d4b5d9c2c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/cd2e/0c0e2/cd2e0c0f0a246b57c630aab649712e7d.jpg\" _src=\"http://cdn.iwshop.org/iwshop/cd2e/0c0e2/cd2e0c0f0a246b57c630aab649712e7d.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/ce26/b8a62/ce26a8b3d74c69fcbd63a8d6dffc448c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/ce26/b8a62/ce26a8b3d74c69fcbd63a8d6dffc448c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/829e/cf7e9/829e7fc35aeb5711bf3cd1dd072ce549.jpg\" _src=\"http://cdn.iwshop.org/iwshop/829e/cf7e9/829e7fc35aeb5711bf3cd1dd072ce549.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/844f/13af4/844fa3165122b7209767879a6db67d43.jpg\" _src=\"http://cdn.iwshop.org/iwshop/844f/13af4/844fa3165122b7209767879a6db67d43.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/df20/f3d02/df20d3f5119698de6a856974a0c3582a.jpg\" _src=\"http://cdn.iwshop.org/iwshop/df20/f3d02/df20d3f5119698de6a856974a0c3582a.jpg\" style=\"\"/></p><p><br/></p>', '肉味浓郁 嚼劲十足 回味无穷 吃货必备', '0', '100', '1', '50', '0', '0', '', '0', '0', '0.00', '0', '干燥', '中国', '袋', '23', '', '10.00', '16.00', '20.00', '//cdn.iwshop.org/iwshop/ee5d/820d5/ee5d028e35933a567e75b6d5752fb6b7.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8164', '018', '百草味 奶香碧根果218g 坚果炒货 山核桃 长寿果干果', '干果', null, '20', '0', '21', '<p><img src=\"http://cdn.iwshop.org/iwshop/7a2a/4fba2/7a2abf4d58a281bb050f8e3f73ecf2d1.jpg\" _src=\"http://cdn.iwshop.org/iwshop/7a2a/4fba2/7a2abf4d58a281bb050f8e3f73ecf2d1.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/6e04/58140/6e041851c48fe69787b873f699e8421a.jpg\" _src=\"http://cdn.iwshop.org/iwshop/6e04/58140/6e041851c48fe69787b873f699e8421a.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/2989/4ad98/2989da460391517eb29b608b42d56eed.jpg\" _src=\"http://cdn.iwshop.org/iwshop/2989/4ad98/2989da460391517eb29b608b42d56eed.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/631a/fd0a1/631a0dfd1565d190d17f87824728bd60.jpg\" _src=\"http://cdn.iwshop.org/iwshop/631a/fd0a1/631a0dfd1565d190d17f87824728bd60.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/cb29/50692/cb29605b5d1c5ffd17c0da9187b48b8f.jpg\" _src=\"http://cdn.iwshop.org/iwshop/cb29/50692/cb29605b5d1c5ffd17c0da9187b48b8f.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9592/ce629/95926ec9a09ed0c5aa9bf5a36316d7c7.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9592/ce629/95926ec9a09ed0c5aa9bf5a36316d7c7.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/0900/2aa00/0900aa246dca9b7838ea9da5973be43d.jpg\" _src=\"http://cdn.iwshop.org/iwshop/0900/2aa00/0900aa246dca9b7838ea9da5973be43d.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/5049/a0c94/5049c0aad1e5f58449b7a503de80e14a.jpg\" _src=\"http://cdn.iwshop.org/iwshop/5049/a0c94/5049c0aad1e5f58449b7a503de80e14a.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e305/4de50/e305ed4c2802256f708a6704a5b95eef.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e305/4de50/e305ed4c2802256f708a6704a5b95eef.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/50de/6e1ed/50de1e6427519df067d090ea19473d29.jpg\" _src=\"http://cdn.iwshop.org/iwshop/50de/6e1ed/50de1e6427519df067d090ea19473d29.jpg\" style=\"\"/></p><p><br/></p>', '酥脆爽口 精挑细选 新老包装 随机发货', '0', '218', '1', '88', '0', '0', '', '0', '0', '0.00', '0', '干燥避光', '中国', '袋', '963', '', '25.00', '36.00', '50.00', '//cdn.iwshop.org/iwshop/578a/7bba8/578abb70e5b79bb1484dba14080d6c7c.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8165', '019', '百草味开心果200g 零食 坚果炒货 干果', '干果', null, '20', '0', '43', '<p><img src=\"http://cdn.iwshop.org/iwshop/a543/3a334/a5433a3590616f58a4dd0afef5d8c7f7.jpg\" _src=\"http://cdn.iwshop.org/iwshop/a543/3a334/a5433a3590616f58a4dd0afef5d8c7f7.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/f03b/e62b3/f03b26e4e719258ee980157e941d2b60.jpg\" _src=\"http://cdn.iwshop.org/iwshop/f03b/e62b3/f03b26e4e719258ee980157e941d2b60.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9b53/fad35/9b53daf467a9fd2877a9175dae33a4ed.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9b53/fad35/9b53daf467a9fd2877a9175dae33a4ed.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e07a/7d0a7/e07a0d71b8218ca303cdc86aae5c5dd0.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e07a/7d0a7/e07a0d71b8218ca303cdc86aae5c5dd0.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/6e62/73426/6e624376d977304fe11397597e528712.jpg\" _src=\"http://cdn.iwshop.org/iwshop/6e62/73426/6e624376d977304fe11397597e528712.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8e11/fee11/8e11eefd9bedbfb758f913e161681095.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8e11/fee11/8e11eefd9bedbfb758f913e161681095.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e337/24973/e3379423db49a4a9c815b98d26935602.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e337/24973/e3379423db49a4a9c815b98d26935602.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e159/fc695/e1596cf4abd5e1754c8d2fd791837b9b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e159/fc695/e1596cf4abd5e1754c8d2fd791837b9b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/ed1f/22bf1/ed1fb2244d999e30d5f001741241c2e1.jpg\" _src=\"http://cdn.iwshop.org/iwshop/ed1f/22bf1/ed1fb2244d999e30d5f001741241c2e1.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9a45/1c054/9a450c1b05b4c45c10020aa033587ddf.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9a45/1c054/9a450c1b05b4c45c10020aa033587ddf.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e80d/fc7d0/e80d7cf3a614eff61e39bec907df5538.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e80d/fc7d0/e80d7cf3a614eff61e39bec907df5538.jpg\" style=\"\"/></p><p><br/></p>', '自然开口 好剥易嗑 饱满香脆 自然奶白', '0', '200', '1', '25', '0', '0', '', '0', '0', '0.00', '0', '干燥', '中国', '袋', '789', '', '20.00', '25.00', '30.00', '//cdn.iwshop.org/iwshop/e574/03a47/e574a30e82790255c2e6df2506052934.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8166', '020', '百草味 抹茶味夹心麻薯210g 台式点心糕点零食特产', '糕点', null, '20', '0', '42', '<p><img src=\"http://cdn.iwshop.org/iwshop/7539/46b93/7539b64906d69ad87f51d3c6cee51435.jpg\" _src=\"http://cdn.iwshop.org/iwshop/7539/46b93/7539b64906d69ad87f51d3c6cee51435.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/caab/555ba/caab5557ac50253a6fa3bd62abab7542.jpg\" _src=\"http://cdn.iwshop.org/iwshop/caab/555ba/caab5557ac50253a6fa3bd62abab7542.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/b76d/e6bd6/b76db6ee85d432420c4905d4dea40757.jpg\" _src=\"http://cdn.iwshop.org/iwshop/b76d/e6bd6/b76db6ee85d432420c4905d4dea40757.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/8040/14804/80408413e85b743173302640dc208798.jpg\" _src=\"http://cdn.iwshop.org/iwshop/8040/14804/80408413e85b743173302640dc208798.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/2b23/77332/2b233771e0ad5924f51eec2b59576ea0.jpg\" _src=\"http://cdn.iwshop.org/iwshop/2b23/77332/2b233771e0ad5924f51eec2b59576ea0.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/9c6d/994d6/9c6d4992ebc899719348d7d7882454b8.jpg\" _src=\"http://cdn.iwshop.org/iwshop/9c6d/994d6/9c6d4992ebc899719348d7d7882454b8.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/630e/c3ee0/630ee3c9ae3a80e75b47ab5516f440bf.jpg\" _src=\"http://cdn.iwshop.org/iwshop/630e/c3ee0/630ee3c9ae3a80e75b47ab5516f440bf.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/1298/16a89/1298a61b98a36d118f5b76d5542d938c.jpg\" _src=\"http://cdn.iwshop.org/iwshop/1298/16a89/1298a61b98a36d118f5b76d5542d938c.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/4883/b3d38/4883d3b058da647861acbfbed461b26b.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4883/b3d38/4883d3b058da647861acbfbed461b26b.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/5517/37b71/5517b73332204769eaf100c2f0518cd6.jpg\" _src=\"http://cdn.iwshop.org/iwshop/5517/37b71/5517b73332204769eaf100c2f0518cd6.jpg\" style=\"\"/></p><p><br/></p>', '超Q口感 细腻香甜 清爽软糯 独特风味', '0', '210', '1', '50', '0', '0', '', '0', '0', '0.00', '0', '干燥', '中国', '袋', '456', '', '10.00', '17.00', '20.00', '//cdn.iwshop.org/iwshop/6f8c/b35c8/6f8c53bb343342ad370b3152d92d2a65.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8167', '021', 'Kappa男士小翻领短袖T恤 翻领运动POLO衫 2016春夏新品|K0612PD31', 'T恤', null, '5', '0', '18', '<p><img src=\"http://cdn.iwshop.org/iwshop/4349/b9d94/4349d9b070044dd2c4e6fffe98e5c2b0.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4349/b9d94/4349d9b070044dd2c4e6fffe98e5c2b0.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/4ee5/a7a5e/4ee5a7a13b48270cc1ee3752ea2e4720.jpg\" _src=\"http://cdn.iwshop.org/iwshop/4ee5/a7a5e/4ee5a7a13b48270cc1ee3752ea2e4720.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/e3b9/78c9b/e3b9c87d2792250fde5f47041ff161ed.jpg\" _src=\"http://cdn.iwshop.org/iwshop/e3b9/78c9b/e3b9c87d2792250fde5f47041ff161ed.jpg\" style=\"\"/></p><p><br/></p>', 'kappa新款', '0', '50', '1', '200', '1', '8', '2017-07-30 00:00', '0', '50', '5.00', '2', '干燥避光', '中国', '件', '123', '', '200.00', '111.00', '300.00', '//cdn.iwshop.org/iwshop/9408/60380/940830635dc685512a83a46e12b7edc2.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8168', '022', '熊本熊公仔毛绒玩具日本熊本县布娃娃泰迪熊玩偶', '熊本熊', null, '18', '0', '62', '<p><img src=\"http://cdn.iwshop.org/iwshop/fefa/1f8af/fefa8f12a080b51cdbbf465aac47d5b9.jpg\" _src=\"http://cdn.iwshop.org/iwshop/fefa/1f8af/fefa8f12a080b51cdbbf465aac47d5b9.jpg\" style=\"\"/></p><p><img src=\"http://cdn.iwshop.org/iwshop/c704/fa240/c7042af4348364be5473b6cf33e9ba07.jpg\" _src=\"http://cdn.iwshop.org/iwshop/c704/fa240/c7042af4348364be5473b6cf33e9ba07.jpg\" style=\"\"/></p><p></p><p><img src=\"http://cdn.iwshop.org/iwshop/7700/49700/7700794710f3a0af9958e33aa5178c01.jpg\" _src=\"http://cdn.iwshop.org/iwshop/7700/49700/7700794710f3a0af9958e33aa5178c01.jpg\" style=\"\"/></p><p><br/></p>', '熊本熊公仔毛绒玩具', '0', '40', '1', '300', '1', '1', '2018-07-30 00:00', '0', '50', '0.00', '0', '避光', '日本', '个', '56', '', '30.00', '56.00', '100.00', '//cdn.iwshop.org/iwshop/9d5e/257e5/9d5e75222f6a6b30ca7dd34f2faafd18.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8170', '0', '测试', null, null, '3', '0', '0', '<p>阿萨德</p>', null, '0', '0', '1', '0', '0', '0', null, '0', '0', '0.00', '0', '', '', '', '0', '', '0.00', '12.00', '10.00', '//image.offask.com/jiaguohuzhu/406b/0f3b6/406b3f0c7bbb050dd57eaf4cc2e63b4e.jpg', '0', '0');
INSERT INTO `products_info` VALUES ('8171', '0', '123', null, null, '3', '0', '0', '<p>123</p>', null, '0', '0', '1', '0', '0', '0', null, '0', '0', '0.00', '0', '', '', '', '0', '', '0.00', '123.00', '120.00', null, '0', '0');
INSERT INTO `products_info` VALUES ('8172', '0', '123123', null, null, '3', '0', '0', null, null, '0', '0', '1', '0', '0', '0', null, '0', '0', '0.00', '0', '', '', '', '0', '', '0.00', '12.00', '12.00', null, '0', '0');
INSERT INTO `products_info` VALUES ('8173', '0', '123123', '', null, '3', '0', '0', null, '', '0', '0', '1', '0', '0', '0', '', '0', '0', '0.00', '2', '', '', '', '0', '', '0.00', '12.00', '10.00', '//image.offask.com/jiaguohuzhu/9e0f/08bf0/9e0fb807703729ed33fc19229d7c19f5.jpg', '0', '0');

-- ----------------------------
-- Table structure for `product_brand`
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_img1` varchar(255) DEFAULT NULL,
  `brand_img2` varchar(255) DEFAULT NULL,
  `brand_cat` int(11) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniname` (`brand_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
INSERT INTO `product_brand` VALUES ('1', '测试', null, null, '3', '0', '0');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_descs` text,
  `cat_image` varchar(255) NOT NULL DEFAULT '',
  `cat_parent` int(11) NOT NULL DEFAULT '0',
  `cat_level` int(11) DEFAULT '0',
  `cat_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('2', '珠宝', '', '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '1', '1');
INSERT INTO `product_category` VALUES ('3', '女装', '', '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '4', '1');
INSERT INTO `product_category` VALUES ('4', '数码', '', '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '2', '1');
INSERT INTO `product_category` VALUES ('5', '男装', '', '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '3', '1');
INSERT INTO `product_category` VALUES ('18', '玩具', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '0', '1');
INSERT INTO `product_category` VALUES ('20', '零食', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '0', '1');
INSERT INTO `product_category` VALUES ('21', '测试分类', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '0', '0', '0', '1');
INSERT INTO `product_category` VALUES ('22', '测试分类1', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '21', '0', '0', '1');
INSERT INTO `product_category` VALUES ('23', '测试分类2', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '21', '0', '0', '1');
INSERT INTO `product_category` VALUES ('25', '我是二级分类', null, '//opencdn.iwshop.cn/iwshop/35f4/a524f/35f425a2414804929d21a2717719184b.jpg', '18', '0', '0', '1');

-- ----------------------------
-- Table structure for `product_credit_exanges`
-- ----------------------------
DROP TABLE IF EXISTS `product_credit_exanges`;
CREATE TABLE `product_credit_exanges` (
  `product_id` int(11) NOT NULL,
  `product_credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_credit_exanges
-- ----------------------------

-- ----------------------------
-- Table structure for `product_images`
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(512) NOT NULL,
  `image_sort` tinyint(4) DEFAULT '0',
  `image_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `index_product` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES ('8167', '21', '', '0', '0');
INSERT INTO `product_images` VALUES ('8167', '22', '', '1', '0');
INSERT INTO `product_images` VALUES ('8167', '23', '', '2', '0');
INSERT INTO `product_images` VALUES ('8167', '24', '', '3', '0');
INSERT INTO `product_images` VALUES ('8167', '25', '', '4', '0');
INSERT INTO `product_images` VALUES ('8170', '46', '', '0', '0');
INSERT INTO `product_images` VALUES ('8170', '47', '', '1', '0');
INSERT INTO `product_images` VALUES ('8170', '48', '', '2', '0');
INSERT INTO `product_images` VALUES ('8170', '49', '', '3', '0');
INSERT INTO `product_images` VALUES ('8170', '50', '', '4', '0');
INSERT INTO `product_images` VALUES ('8171', '56', '', '0', '0');
INSERT INTO `product_images` VALUES ('8171', '57', '', '1', '0');
INSERT INTO `product_images` VALUES ('8171', '58', '', '2', '0');
INSERT INTO `product_images` VALUES ('8171', '59', '', '3', '0');
INSERT INTO `product_images` VALUES ('8171', '60', '', '4', '0');
INSERT INTO `product_images` VALUES ('8172', '61', '', '0', '0');
INSERT INTO `product_images` VALUES ('8172', '62', '', '1', '0');
INSERT INTO `product_images` VALUES ('8172', '63', '', '2', '0');
INSERT INTO `product_images` VALUES ('8172', '64', '', '3', '0');
INSERT INTO `product_images` VALUES ('8172', '65', '', '4', '0');
INSERT INTO `product_images` VALUES ('8173', '71', '', '0', '0');
INSERT INTO `product_images` VALUES ('8173', '72', '', '1', '0');
INSERT INTO `product_images` VALUES ('8173', '73', '', '2', '0');
INSERT INTO `product_images` VALUES ('8173', '74', '', '3', '0');
INSERT INTO `product_images` VALUES ('8173', '75', '', '4', '0');
INSERT INTO `product_images` VALUES ('8155', '76', '', '0', '0');
INSERT INTO `product_images` VALUES ('8155', '77', '', '1', '0');
INSERT INTO `product_images` VALUES ('8155', '78', '', '2', '0');
INSERT INTO `product_images` VALUES ('8155', '79', '', '3', '0');
INSERT INTO `product_images` VALUES ('8155', '80', '', '4', '0');

-- ----------------------------
-- Table structure for `product_onsale`
-- ----------------------------
DROP TABLE IF EXISTS `product_onsale`;
CREATE TABLE `product_onsale` (
  `product_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `sale_prices` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `store_id` int(8) NOT NULL DEFAULT '0' COMMENT '商店编号',
  `discount` int(3) NOT NULL DEFAULT '100' COMMENT '折扣',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_onsale
-- ----------------------------
INSERT INTO `product_onsale` VALUES ('8155', '15.00', '0', '1');
INSERT INTO `product_onsale` VALUES ('8167', '111.00', '0', '1');
INSERT INTO `product_onsale` VALUES ('8170', '12.00', '0', '1');
INSERT INTO `product_onsale` VALUES ('8171', '123.00', '0', '1');
INSERT INTO `product_onsale` VALUES ('8172', '12.00', '0', '1');
INSERT INTO `product_onsale` VALUES ('8173', '12.00', '0', '1');

-- ----------------------------
-- Table structure for `product_serials`
-- ----------------------------
DROP TABLE IF EXISTS `product_serials`;
CREATE TABLE `product_serials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_name` varchar(255) DEFAULT NULL COMMENT '序列名称',
  `serial_image` varchar(255) DEFAULT NULL,
  `serial_desc` varchar(255) DEFAULT NULL,
  `relcat` tinyint(4) DEFAULT NULL,
  `relevel` tinyint(4) DEFAULT NULL,
  `sort` varchar(255) DEFAULT '0' COMMENT '排序',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_serials
-- ----------------------------
INSERT INTO `product_serials` VALUES ('0', '默认', null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `product_spec`
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `spec_det_id1` int(11) DEFAULT NULL,
  `spec_det_id2` int(11) DEFAULT NULL,
  `sale_price` float(11,2) DEFAULT NULL,
  `market_price` float(11,2) DEFAULT '0.00',
  `instock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- ----------------------------
-- Records of product_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `wechats`
-- ----------------------------
DROP TABLE IF EXISTS `wechats`;
CREATE TABLE `wechats` (
  `wechat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wechat_name` varchar(32) NOT NULL COMMENT '公众号名称',
  `account` varchar(32) NOT NULL COMMENT '帐号',
  `original_account` varchar(32) NOT NULL COMMENT '原始帐号',
  `app_id` varchar(64) NOT NULL,
  `app_secret` varchar(64) NOT NULL,
  `encodingaeskey` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(64) NOT NULL COMMENT '验证token',
  `entry_hash` varchar(64) NOT NULL COMMENT '入口hash用于区别所属公众号',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器地址',
  `access_token` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`wechat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of wechats
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_autoresponse`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_autoresponse`;
CREATE TABLE `wechat_autoresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `message` text,
  `rel` int(11) DEFAULT '0',
  `reltype` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_autoresponse
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_banners`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_banners`;
CREATE TABLE `wshop_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(255) DEFAULT NULL,
  `banner_href` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_position` tinyint(4) DEFAULT '0',
  `reltype` tinyint(4) DEFAULT NULL,
  `relid` varchar(255) DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `exp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_banners
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_board_messages`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_board_messages`;
CREATE TABLE `wshop_board_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `mtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_board_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_expresstaff`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_expresstaff`;
CREATE TABLE `wshop_expresstaff` (
  `id` int(11) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `isnotify` tinyint(1) DEFAULT '0',
  `isexpress` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_expresstaff
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_logs`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_logs`;
CREATE TABLE `wshop_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_level` tinyint(2) DEFAULT '0' COMMENT '错误级别',
  `log_info` text COMMENT '错误信息',
  `log_url` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of wshop_logs
-- ----------------------------
INSERT INTO `wshop_logs` VALUES ('1', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-08-26 21:12:21', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('2', '0', '访问错误：控制器 Admin 不存在', 'http://iw.com/?/Admin', '2017-09-01 21:40:00', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('3', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-01 21:40:05', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('4', '0', '访问错误：控制器 Admin 不存在', 'http://iw.com/?/Admin', '2017-09-02 00:58:08', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('5', '0', '访问错误：控制器 Admin 不存在', 'http://iw.com/?/Admin', '2017-09-05 15:17:33', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('6', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-05 15:17:44', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('7', '0', '访问错误：控制器 Admin 不存在', 'http://iw.com/?/Admin', '2017-09-05 16:18:42', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('8', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-06 00:03:04', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('9', '0', '无效的微信消息请求', 'http://iw.com/wechat/', '2017-09-06 00:49:34', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('10', '0', '无效的微信消息请求', 'http://iw.com/wechat/', '2017-09-06 00:51:38', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('11', '0', '无效的微信消息请求', 'http://iw.com/wechat/', '2017-09-06 00:51:41', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('12', '0', '无效的微信消息请求', 'http://iw.com/wechat/', '2017-09-06 00:51:48', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('13', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-06 15:25:07', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('14', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-06 23:28:43', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('15', '0', '登录成功 admin', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-07 00:18:36', '127.0.0.1');
INSERT INTO `wshop_logs` VALUES ('16', '0', '登录成功 ceshi', 'http://iw.com/?/Wdmin/checkLogin/', '2017-09-07 00:55:54', '127.0.0.1');

-- ----------------------------
-- Table structure for `wshop_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_menu`;
CREATE TABLE `wshop_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) DEFAULT NULL,
  `reltype` tinyint(4) DEFAULT NULL,
  `relcontent` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_menu
-- ----------------------------
INSERT INTO `wshop_menu` VALUES ('1', '0', '0', '');

-- ----------------------------
-- Table structure for `wshop_recomment_company`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_recomment_company`;
CREATE TABLE `wshop_recomment_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` enum('unfix','fixed','close') DEFAULT 'unfix',
  `content` text,
  `comid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_recomment_company
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_search_record`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_search_record`;
CREATE TABLE `wshop_search_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_search_record
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_settings`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_settings`;
CREATE TABLE `wshop_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(512) DEFAULT NULL,
  `last_mod` datetime NOT NULL,
  `remark` varchar(255) DEFAULT '无',
  PRIMARY KEY (`key`),
  KEY `index_key` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of wshop_settings
-- ----------------------------
INSERT INTO `wshop_settings` VALUES ('admin_setting_icon', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('admin_setting_qrcode', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('auto_envs', '0', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('company_on', '0', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('copyright', '© 2014-2015 微信商城demo All rights reserved.', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('credit_ex', '0.1', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('credit_order_amount', '100', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('expcompany', 'ems,guotong,shentong,shunfeng,tiantian,yousu,yuantong,yunda,zhongtong', '2015-11-15 00:08:36', '');
INSERT INTO `wshop_settings` VALUES ('exp_weight1', '1000', '2015-07-23 23:24:06', '');
INSERT INTO `wshop_settings` VALUES ('exp_weight2', '1000', '2015-07-23 23:24:06', '');
INSERT INTO `wshop_settings` VALUES ('order_cancel_day', '30', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('order_confirm_day', '30', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('reci_cont', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('reci_exp_open', '0', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('reci_open', '0', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('reci_perc', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('reg_credit_default', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('shopname', '微信商城demo', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('sign_credit', '0', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('sign_daylim', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('statcode', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('ucenter_background_image', '', '2017-09-01 21:40:33', '无');
INSERT INTO `wshop_settings` VALUES ('welcomegmess', '', '2017-09-01 21:40:33', '无');

-- ----------------------------
-- Table structure for `wshop_settings_expfee`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_settings_expfee`;
CREATE TABLE `wshop_settings_expfee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT '',
  `citys` varchar(255) DEFAULT NULL,
  `ffee` float DEFAULT NULL,
  `ffeeadd` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置-运费模板';

-- ----------------------------
-- Records of wshop_settings_expfee
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_settings_nav`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_settings_nav`;
CREATE TABLE `wshop_settings_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `nav_ico` varchar(255) NOT NULL COMMENT '显示ICO图片',
  `nav_type` int(11) NOT NULL COMMENT '菜单类型（0.超链接，1.产品分类）',
  `nav_content` text,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='系统设置-导航';

-- ----------------------------
-- Records of wshop_settings_nav
-- ----------------------------
INSERT INTO `wshop_settings_nav` VALUES ('22', '数码', '//cdn.iwshop.org/iwshop/3fb9/0e19b/3fb91e0193b08f744b31a1b8bba89785.jpg', '1', '4', '6465');
INSERT INTO `wshop_settings_nav` VALUES ('23', '女装', '//cdn.iwshop.org/iwshop/bffd/b8adf/bffda8b495f4fb4bc1456b4771bb46ea.png', '1', '3', '654');
INSERT INTO `wshop_settings_nav` VALUES ('24', '男装', '//cdn.iwshop.org/iwshop/3077/35877/30778538af8ef2c1ef7456e9b91bbe64.png', '1', '5', '43245');
INSERT INTO `wshop_settings_nav` VALUES ('25', '玩具', '//cdn.iwshop.org/iwshop/c343/8fe34/c343ef830da5111f853d51b1de86387e.jpg', '0', '18', '76');

-- ----------------------------
-- Table structure for `wshop_settings_section`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_settings_section`;
CREATE TABLE `wshop_settings_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `reltype` varchar(1) DEFAULT '0' COMMENT '首页版块类型0：产品分类 展示版块 1：产品列表 展示版块 2:图文消息 展示版块 3:超链接 展示版块 4:广告列表 展示版块',
  `relid` int(5) DEFAULT NULL,
  `bsort` tinyint(5) DEFAULT '0',
  `ftime` datetime DEFAULT NULL,
  `ttime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_settings_section
-- ----------------------------
INSERT INTO `wshop_settings_section` VALUES ('15', '数码', '4', '//cdn.iwshop.org/iwshop/cd61/78916/cd61987ade4f62bcb6ed2f68dbf399f3.jpg', '0', '4', '0', null, null);
INSERT INTO `wshop_settings_section` VALUES ('16', '七夕活动', '8155,8150,8149,8148', '//cdn.iwshop.org/iwshop/e91f/8e2f1/e91f2e8e068363cf8023a6f55751495c.jpg', '1', '3', '23', null, null);
INSERT INTO `wshop_settings_section` VALUES ('17', '零食', '8166,8165,8164,8163,8162,8161', '//cdn.iwshop.org/iwshop/c88a/283a8/c88a382e9a312206d90e00ad4797bfe9.jpg', '1', '3', '12', null, null);

-- ----------------------------
-- Table structure for `wshop_spec`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_spec`;
CREATE TABLE `wshop_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(255) NOT NULL,
  `spec_remark` varchar(255) DEFAULT NULL,
  `spec_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_spec_det`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_spec_det`;
CREATE TABLE `wshop_spec_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL,
  `det_name` varchar(255) NOT NULL,
  `det_sort` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_spec_det
-- ----------------------------

-- ----------------------------
-- Table structure for `wshop_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_suppliers`;
CREATE TABLE `wshop_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(120) DEFAULT NULL,
  `supp_phone` varchar(255) DEFAULT NULL,
  `supp_stime` varchar(255) DEFAULT NULL,
  `supp_sprice` varchar(255) DEFAULT NULL,
  `supp_sarea` varchar(255) DEFAULT NULL,
  `supp_desc` text,
  `supp_pass` varchar(255) DEFAULT NULL,
  `supp_lastlogin` datetime DEFAULT NULL,
  `is_verified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniname` (`supp_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wshop_suppliers
-- ----------------------------
INSERT INTO `wshop_suppliers` VALUES ('2', 'sdf', 'sdfsdf', 'sdf', 'sdf', 'sdf', 'sdf', null, null, '0');
INSERT INTO `wshop_suppliers` VALUES ('3', '侧事故', '123123', '123123', '123123', '123', '123', null, null, '0');

-- ----------------------------
-- Table structure for `wshop_user_cumulate`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_user_cumulate`;
CREATE TABLE `wshop_user_cumulate` (
  `ref_date` date NOT NULL,
  `user_source` tinyint(2) NOT NULL DEFAULT '0',
  `cumulate_user` int(11) DEFAULT '0',
  PRIMARY KEY (`ref_date`,`user_source`),
  UNIQUE KEY `ref_date` (`ref_date`,`user_source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝统计数据';

-- ----------------------------
-- Records of wshop_user_cumulate
-- ----------------------------
INSERT INTO `wshop_user_cumulate` VALUES ('2017-09-01', '0', '0');
INSERT INTO `wshop_user_cumulate` VALUES ('2017-09-02', '0', '0');
INSERT INTO `wshop_user_cumulate` VALUES ('2017-09-03', '0', '0');
INSERT INTO `wshop_user_cumulate` VALUES ('2017-09-04', '0', '0');
INSERT INTO `wshop_user_cumulate` VALUES ('2017-09-05', '0', '1');

-- ----------------------------
-- Table structure for `wshop_user_summary`
-- ----------------------------
DROP TABLE IF EXISTS `wshop_user_summary`;
CREATE TABLE `wshop_user_summary` (
  `ref_date` date NOT NULL,
  `user_source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0代表其他（包括带参数二维码） 3代表扫二维码 17代表名片分享 35代表搜号码（即微信添加朋友页的搜索） 39代表查询微信公众帐号 43代表图文页右上角菜单',
  `new_user` int(11) DEFAULT NULL,
  `cancel_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref_date`,`user_source`),
  UNIQUE KEY `ref_date` (`ref_date`,`user_source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝统计数据';

-- ----------------------------
-- Records of wshop_user_summary
-- ----------------------------
INSERT INTO `wshop_user_summary` VALUES ('2017-09-05', '0', '1', '0');
