/*
Navicat MySQL Data Transfer

Source Server         : Default
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : cfw-user-manager-2

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-11-29 15:00:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Customer');
INSERT INTO `roles` VALUES ('2', 'Admin');

-- ----------------------------
-- Table structure for `tokens`
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(2) NOT NULL,
  `userid` int(11) NOT NULL,
  `value` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `pendingvalue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES ('1', '1', '2', '136C7BB9098D41068D515F1CF2AA3E5F', '2011-12-01 13:29:44', 'bart@cfwdemo.com');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(2) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(36) NOT NULL,
  `isconfirmed` enum('1','0') NOT NULL DEFAULT '0',
  `createdat` datetime DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2', 'Mohamad El-Husseini', 'admin@cfwdemo.com', 'C04733806BD39DEAD2129A54733C5F43304F98242353594F25EC51B4C9CEF74FD5BE98BDD6A6E8EED4ADA717A35A1405F40D8110183DE5621E803337C58FC82D', '58B1D811-BC80-49B7-9EDCF2F75370DB34', '1', '2011-11-25 15:09:35', '2011-11-29 13:05:48', null);
INSERT INTO `users` VALUES ('2', '1', 'Bart', 'bart@cfwdemo.com', '86BC5461048B8EB6E2775AC6DC0242151F12C51F4BC392DDD502B6B1A1B064457BCC9E6066EBC5F404C2C0D405A2C6FEC24DB10CF386CB3E916114D174C1BC7A', '3E7E77D0-A10C-4771-A68F5BA704C0BCA7', '0', '2011-11-28 17:36:27', '2011-11-29 13:11:45', null);
INSERT INTO `users` VALUES ('3', '1', 'Lisa', 'lisa@cfwdemo.com', '04B244F8FF51AAF30188F4DFB8E4553313B496BDD265DD029D76445256044B4ACA7F327501101C9E5D27E3C232DEC4375A2E95090C045501820845DEDD66DEFC', '3D0C0203-D6A0-418D-95FD671223F7A1A2', '1', '2011-11-28 17:36:58', '2011-11-29 13:11:22', null);
INSERT INTO `users` VALUES ('4', '1', 'Barney', 'barney@thesimpsons.com', 'E52FE824F34B869793534AAA601814F3A0DAC99EA8B914434AA0A6710A40BFF00B6C6632E0C436D5960A81051AE1C021AFE0FCC597EBBA10591CE5031313E948', '18491609-C903-4E73-ABD3A373F13B6E0E', '1', '2011-11-29 12:23:13', '2011-11-29 12:31:08', '2011-11-29 12:31:48');
