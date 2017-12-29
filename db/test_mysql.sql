/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : test_mysql

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-29 09:47:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `authors` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `pubdate` year(4) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `C` varchar(10) DEFAULT NULL,
  `Cname` varchar(10) DEFAULT NULL,
  `T` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('01', '语文', '02');
INSERT INTO `course` VALUES ('02', '数学', '01');
INSERT INTO `course` VALUES ('03', '英语', '03');

-- ----------------------------
-- Table structure for fruits
-- ----------------------------
DROP TABLE IF EXISTS `fruits`;
CREATE TABLE `fruits` (
  `f_id` char(10) NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  `f_name` char(255) DEFAULT NULL,
  `f_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruits
-- ----------------------------
INSERT INTO `fruits` VALUES ('10', '1', null, '12.00');
INSERT INTO `fruits` VALUES ('a2', '103', 'apricot', '2.20');
INSERT INTO `fruits` VALUES ('b1', '101', 'blackberry', '10.20');
INSERT INTO `fruits` VALUES ('b2', '106', 'berry', '7.60');
INSERT INTO `fruits` VALUES ('b5', '107', 'xxxx', '3.60');
INSERT INTO `fruits` VALUES ('bs1', '105', 'orange', '11.20');
INSERT INTO `fruits` VALUES ('bs2', '105', 'melon', '8.20');
INSERT INTO `fruits` VALUES ('c0', '101', 'cherry', '3.20');
INSERT INTO `fruits` VALUES ('l2', '1', null, '12.00');
INSERT INTO `fruits` VALUES ('m1', '106', 'mango', '15.70');
INSERT INTO `fruits` VALUES ('m2', '105', 'xbabay', '2.60');
INSERT INTO `fruits` VALUES ('m3', '105', 'xxtt', '11.60');
INSERT INTO `fruits` VALUES ('o2', '103', 'coconut', '9.20');
INSERT INTO `fruits` VALUES ('t1', '102', 'banana', '10.30');
INSERT INTO `fruits` VALUES ('t2', '102', 'grape', '5.30');
INSERT INTO `fruits` VALUES ('t4', '107', 'xbababa', '3.60');

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems` (
  `o_num` int(11) NOT NULL,
  `o_item` int(11) NOT NULL,
  `f_id` char(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`o_num`,`o_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('30001', '1', 'a1', '10', '5.20');
INSERT INTO `orderitems` VALUES ('30001', '2', 'b2', '3', '7.60');
INSERT INTO `orderitems` VALUES ('30001', '3', 'bs1', '5', '7.60');
INSERT INTO `orderitems` VALUES ('30001', '4', 'bs2', '15', '9.20');
INSERT INTO `orderitems` VALUES ('30002', '1', 'b3', '2', '20.00');
INSERT INTO `orderitems` VALUES ('30003', '1', 'c0', '100', '10.00');
INSERT INTO `orderitems` VALUES ('30004', '1', 'o2', '50', '2.50');
INSERT INTO `orderitems` VALUES ('30005', '1', 'c0', '5', '10.00');
INSERT INTO `orderitems` VALUES ('30005', '2', 'b1', '10', '8.99');
INSERT INTO `orderitems` VALUES ('30005', '3', 'a2', '10', '2.20');
INSERT INTO `orderitems` VALUES ('30005', '4', 'm1', '4', '14.99');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL DEFAULT '0',
  `info` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'Green', '25', 'Lawyer');
INSERT INTO `person` VALUES ('2', 'Suse', '22', 'dancer');
INSERT INTO `person` VALUES ('3', '123', '10', '123465');
INSERT INTO `person` VALUES ('4', '123', '10', '123465');
INSERT INTO `person` VALUES ('5', '123', '10', '123465');
INSERT INTO `person` VALUES ('6', '123', '10', '123465');
INSERT INTO `person` VALUES ('7', 'yxh', '1', null);

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet` (
  `name` varchar(20) NOT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) NOT NULL,
  `sex` char(1) NOT NULL,
  `birth` year(4) NOT NULL,
  `death` year(4) DEFAULT NULL,
  KEY `name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES ('Fluffy', 'HaroId', 'cat', 'f', '2003', '2010');
INSERT INTO `pet` VALUES ('Claws', 'Gwen', 'cat', 'm', '2004', null);
INSERT INTO `pet` VALUES ('1', null, '2', '3', '2017', null);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `S` varchar(10) DEFAULT NULL,
  `C` varchar(10) DEFAULT NULL,
  `score` decimal(18,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('', '01', '80.0');
INSERT INTO `sc` VALUES ('01', '02', '90.0');
INSERT INTO `sc` VALUES ('01', '03', '99.0');
INSERT INTO `sc` VALUES ('02', '01', '70.0');
INSERT INTO `sc` VALUES ('02', '02', '60.0');
INSERT INTO `sc` VALUES ('02', '03', '80.0');
INSERT INTO `sc` VALUES ('03', '01', '80.0');
INSERT INTO `sc` VALUES ('03', '02', '80.0');
INSERT INTO `sc` VALUES ('03', '03', '80.0');
INSERT INTO `sc` VALUES ('04', '01', '50.0');
INSERT INTO `sc` VALUES ('04', '02', '30.0');
INSERT INTO `sc` VALUES ('04', '03', '20.0');
INSERT INTO `sc` VALUES ('05', '01', '76.0');
INSERT INTO `sc` VALUES ('05', '02', '87.0');
INSERT INTO `sc` VALUES ('06', '01', '31.0');
INSERT INTO `sc` VALUES ('06', '03', '34.0');
INSERT INTO `sc` VALUES ('07', '02', '89.0');
INSERT INTO `sc` VALUES ('07', '03', '98.0');

-- ----------------------------
-- Table structure for sch
-- ----------------------------
DROP TABLE IF EXISTS `sch`;
CREATE TABLE `sch` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `glass` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sch
-- ----------------------------
INSERT INTO `sch` VALUES ('1', 'xiaoming', 'glass 1');
INSERT INTO `sch` VALUES ('2', 'xiaojun', 'glass 2');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `name` varchar(20) DEFAULT NULL,
  `kemu` varchar(20) DEFAULT NULL,
  `fenshu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('zhangsan', 'yuwen', '81');
INSERT INTO `score` VALUES ('zhangsan', 'shuxue', '72');
INSERT INTO `score` VALUES ('lisi', 'yuwen', '76');
INSERT INTO `score` VALUES ('lisi', 'shuxue', '90');
INSERT INTO `score` VALUES ('wangwu', 'yuwen', '81');
INSERT INTO `score` VALUES ('wangwu', 'shuxue', '85');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `S` varchar(10) DEFAULT NULL,
  `Sname` varchar(10) DEFAULT NULL,
  `Sage` datetime DEFAULT NULL,
  `Ssex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('08', '王菊', '1990-01-20 00:00:00', '女');
INSERT INTO `student` VALUES ('07', '郑竹', '1989-07-01 00:00:00', '女');
INSERT INTO `student` VALUES ('05', '周梅', '1991-12-01 00:00:00', '女');
INSERT INTO `student` VALUES ('04', '李云', '1990-08-06 00:00:00', '男');
INSERT INTO `student` VALUES ('03', '孙风', '1990-05-20 00:00:00', '男');
INSERT INTO `student` VALUES ('02', '钱电', '1990-12-21 00:00:00', '男');
INSERT INTO `student` VALUES ('01', '赵雷', '1990-01-01 00:00:00', '男');
INSERT INTO `student` VALUES ('06', '吴兰', '1992-03-01 00:00:00', '女');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` char(50) NOT NULL,
  `s_city` char(50) DEFAULT NULL,
  `s_zip` char(10) DEFAULT NULL,
  `s_call` char(50) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES ('101', 'FastFruit Inc.', 'Tianjin', '300000', '48075');
INSERT INTO `suppliers` VALUES ('102', 'LT Supplies', 'Chongqing', '400000', '44333');
INSERT INTO `suppliers` VALUES ('103', 'ACME', 'Shanghai', '200000', '90046');
INSERT INTO `suppliers` VALUES ('104', 'FNK Inc.', 'Zhongshan', '528437', '11111');
INSERT INTO `suppliers` VALUES ('105', 'Good Set', 'Taiyuang', '030000', '22222');
INSERT INTO `suppliers` VALUES ('106', 'Just Eat Ours', 'Beijing', '010', '45678');
INSERT INTO `suppliers` VALUES ('107', 'DK Inc.', 'Zhengzhou', '450000', '33332');

-- ----------------------------
-- Table structure for tbl1
-- ----------------------------
DROP TABLE IF EXISTS `tbl1`;
CREATE TABLE `tbl1` (
  `num1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl1
-- ----------------------------
INSERT INTO `tbl1` VALUES ('1');
INSERT INTO `tbl1` VALUES ('5');
INSERT INTO `tbl1` VALUES ('13');
INSERT INTO `tbl1` VALUES ('27');

-- ----------------------------
-- Table structure for tbl2
-- ----------------------------
DROP TABLE IF EXISTS `tbl2`;
CREATE TABLE `tbl2` (
  `num2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl2
-- ----------------------------
INSERT INTO `tbl2` VALUES ('6');
INSERT INTO `tbl2` VALUES ('14');
INSERT INTO `tbl2` VALUES ('11');
INSERT INTO `tbl2` VALUES ('20');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `T` varchar(10) DEFAULT NULL,
  `Tname` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('01', '张三');
INSERT INTO `teacher` VALUES ('02', '李四');
INSERT INTO `teacher` VALUES ('03', '王五');

-- ----------------------------
-- Table structure for temp15
-- ----------------------------
DROP TABLE IF EXISTS `temp15`;
CREATE TABLE `temp15` (
  `note` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp15
-- ----------------------------
INSERT INTO `temp15` VALUES ('thisgood', '50');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '2017-11-06 15:04:04');
INSERT INTO `test` VALUES ('2', '2017-11-06 15:04:29');

-- ----------------------------
-- Procedure structure for add_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_id`()
begin
select count_sch() as num,sum(id) from sch;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for AvgFruitPrice
-- ----------------------------
DROP PROCEDURE IF EXISTS `AvgFruitPrice`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AvgFruitPrice`()
begin
select avg(f_price) from fruits;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc`()
begin
select * from fruits;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for abc
-- ----------------------------
DROP FUNCTION IF EXISTS `abc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `abc`() RETURNS char(10) CHARSET utf8
return 'helloword'
;
;;
DELIMITER ;

-- ----------------------------
-- Function structure for count_sch
-- ----------------------------
DROP FUNCTION IF EXISTS `count_sch`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_sch`() RETURNS int(11)
return (select count(*) from sch)
;
;;
DELIMITER ;

-- ----------------------------
-- Function structure for NameByZip
-- ----------------------------
DROP FUNCTION IF EXISTS `NameByZip`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NameByZip`() RETURNS char(50) CHARSET utf8
return (select s_name from suppliers where s_call ='48075')
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `test_insert_trigger`;
DELIMITER ;;
CREATE TRIGGER `test_insert_trigger` BEFORE INSERT ON `test` FOR EACH ROW set new.time=now()
;;
DELIMITER ;
