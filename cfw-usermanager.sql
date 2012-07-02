/*
Navicat MySQL Data Transfer

Source Server         : Default
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : cfw-usermanager

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2012-07-02 14:52:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` enum('1','0') NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `passwordresettoken` varchar(255) DEFAULT NULL,
  `passwordresetat` datetime DEFAULT NULL,
  `confirmed` enum('1','0') NOT NULL DEFAULT '0',
  `emailconfirmationtoken` varchar(255) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Mohamad El-Husseini', 'admin@demo.com', '$2a$10$N8usJ.eUcZpeMHTDfHCi0.lxicICYTz4GROUcLb4pIFVtLRjx0JI2', '$2a$10$N8usJ.eUcZpeMHTDfHCi0.', null, null, '1', null, '2012-06-30 17:57:22', '2012-07-02 14:27:22', null);
INSERT INTO `users` VALUES ('2', '0', 'Bart Simpson', 'bart@demo.com', '$2a$10$iFKdRNNJwYBrDeIz4bVMR.dd7D.u9G7aj2FrkW5SNjzttfTQtCbaC', '$2a$10$iFKdRNNJwYBrDeIz4bVMR.', null, null, '1', null, '2012-06-30 17:57:55', '2012-06-30 17:57:55', null);
INSERT INTO `users` VALUES ('3', '0', 'Lisa Simpson', 'lisa@demo.com', '$2a$10$34ct8DzjNvbIhFEPWNFBZ.q.dGY2ZhQAPuWtZ2mM2edLay./LYAaa', '$2a$10$34ct8DzjNvbIhFEPWNFBZ.', null, null, '1', null, '2012-06-30 17:58:12', '2012-06-30 17:58:12', null);
INSERT INTO `users` VALUES ('4', '0', 'Jack Sparrow', 'jack@demo.com', '$2a$10$VR/7LU4oVGvEIFG3xkxwc.lLovW/CGWOCOp6g28AF6LoDisnO2khi', '$2a$10$VR/7LU4oVGvEIFG3xkxwc.', null, null, '0', '3380e3cd65a443b281ddda491588e842', '2012-07-02 14:36:55', '2012-07-02 14:36:55', null);
