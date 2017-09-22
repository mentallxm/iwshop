/*
Navicat MySQL Data Transfer

Source Server         : MA
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : iwshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-23 04:01:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `client_product_likes`
-- ----------------------------
DROP TABLE IF EXISTS `client_product_likes`;
CREATE TABLE `client_product_likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of client_product_likes
-- ----------------------------
INSERT INTO `client_product_likes` VALUES ('2', 'oRky_wrPrmkknLl-3J30F-kQ2GJE', '8154');
INSERT INTO `client_product_likes` VALUES ('3', 'oRky_wrPrmkknLl-3J30F-kQ2GJE', '8167');
INSERT INTO `client_product_likes` VALUES ('4', 'oRky_wrPrmkknLl-3J30F-kQ2GJE', '8168');
