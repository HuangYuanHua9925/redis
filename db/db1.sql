/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : db1

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-29 09:47:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for date
-- ----------------------------
DROP TABLE IF EXISTS `date`;
CREATE TABLE `date` (
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of date
-- ----------------------------
INSERT INTO `date` VALUES ('2017-10-27 14:24:16');
INSERT INTO `date` VALUES ('2016-06-22 14:24:24');
INSERT INTO `date` VALUES ('2017-09-17 14:24:36');
INSERT INTO `date` VALUES ('2017-09-22 14:24:51');
INSERT INTO `date` VALUES ('2017-10-18 13:31:42');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) DEFAULT NULL,
  `text` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', null);
INSERT INTO `message` VALUES ('5', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `name` varchar(255) DEFAULT NULL,
  `kecheng` varchar(255) DEFAULT NULL,
  `feushu` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('张三', 'java', '90');
INSERT INTO `student` VALUES ('张三', 'c', '70');
INSERT INTO `student` VALUES ('李四', 'c++', '92');
INSERT INTO `student` VALUES ('李四', '数学', '78');
INSERT INTO `student` VALUES ('王五', '语文', '90');
INSERT INTO `student` VALUES ('王五', '数学', '91');

-- ----------------------------
-- Table structure for student1
-- ----------------------------
DROP TABLE IF EXISTS `student1`;
CREATE TABLE `student1` (
  `自动编号` int(11) NOT NULL AUTO_INCREMENT,
  `学号` varchar(255) DEFAULT NULL,
  `姓名` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`自动编号`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student1
-- ----------------------------
INSERT INTO `student1` VALUES ('1', 'a', '张三');
INSERT INTO `student1` VALUES ('2', 'b', '张三');
INSERT INTO `student1` VALUES ('3', 'c', '李四');
INSERT INTO `student1` VALUES ('4', 'd', '李四');

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_permissions_permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_roles_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users
-- ----------------------------

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1');
