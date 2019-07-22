/*
Navicat MySQL Data Transfer

Source Server         : xhkm
Source Server Version : 50562
Source Host           : 39.105.163.231:3306
Source Database       : xhkm

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-19 19:17:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL,
  `admin_status` int(2) DEFAULT NULL,
  `admin_mail` varchar(255) DEFAULT NULL,
  `admin_tel` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('27', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', null, null);
INSERT INTO `admin` VALUES ('28', 'teacher', '8d788385431273d11e8b43bb78f3aa41', '1', null, null);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('23', '10');
INSERT INTO `admin_role` VALUES ('1', '12');
INSERT INTO `admin_role` VALUES ('1', '1');
INSERT INTO `admin_role` VALUES ('1', '2');
INSERT INTO `admin_role` VALUES ('24', '13');
INSERT INTO `admin_role` VALUES ('25', '17');
INSERT INTO `admin_role` VALUES ('26', '18');
INSERT INTO `admin_role` VALUES ('27', '19');
INSERT INTO `admin_role` VALUES ('28', '20');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `class_img` varchar(255) DEFAULT NULL,
  `class_video` varchar(255) DEFAULT NULL,
  `class_describe` varchar(255) DEFAULT NULL,
  `class_status` int(11) DEFAULT NULL,
  `class_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('28', '《“七”的写法》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C360%E6%88%AA%E5%9B%BE16331126114141122.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC2%E8%AE%B2%E5%8E%8B%E7%BC%A9~1.mp4', null, '1', '2');
INSERT INTO `class` VALUES ('29', '\'一\'字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C21%402x.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C341067+(3).mp4', null, '1', '1');
INSERT INTO `class` VALUES ('32', '四字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5Cmianfeike%402x(1).png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E2%80%9C%E4%B8%80%E2%80%9D%E5%AD%97%E7%9A%84%E5%86%99%E6%B3%95.mp4', null, '1', '4');
INSERT INTO `class` VALUES ('27', '《“七”的写法》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C360%E6%88%AA%E5%9B%BE16331126114141122.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC2%E8%AE%B2%E5%8E%8B%E7%BC%A9~1.mp4', null, '1', '2');
INSERT INTO `class` VALUES ('31', '三字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C3.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5CC+-%E8%A6%81%E4%B8%8B%E9%9B%A8%E4%BA%86.mp4', null, '1', '3');
INSERT INTO `class` VALUES ('30', '“二”的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C5.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5CB-%E6%88%91%E7%9A%84%E7%94%9F%E6%97%A5.mp4', null, '1', '2');
INSERT INTO `class` VALUES ('26', '《“七”的写法》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C360%E6%88%AA%E5%9B%BE16331126114141122.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC2%E8%AE%B2%E5%8E%8B%E7%BC%A9~1.mp4', null, '1', '2');
INSERT INTO `class` VALUES ('24', '《正确的坐姿与握姿》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_15625876688175.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC1%E8%AE%B2~2.mp4', null, '1', '1');
INSERT INTO `class` VALUES ('34', '六字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5Cyinianke%402x(1).png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C341067+(3).mp4', null, '1', '6');
INSERT INTO `class` VALUES ('22', '《正确的坐姿与握姿》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_15625876688175.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC1%E8%AE%B2~2.mp4', null, '1', '1');
INSERT INTO `class` VALUES ('33', '五字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C2%402x(1).png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C341067+(3).mp4', null, '1', '5');
INSERT INTO `class` VALUES ('35', '七字的写法', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C6.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C341067+(2).mp4', null, '1', '7');
INSERT INTO `class` VALUES ('37', '《“正”字的写法》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_15625876688175.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC2%E8%AE%B2%E5%8E%8B%E7%BC%A9~1.mp4', null, '1', '2');
INSERT INTO `class` VALUES ('38', '《“开”字的写法》', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_15625876688175.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/video/C%3A%5Cfakepath%5C%E7%AC%AC2%E8%AE%B2%E5%8E%8B%E7%BC%A9~1.mp4', null, '1', '3');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL,
  `h_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('9', '暑期特训班', '3', '1563335013', '1');
INSERT INTO `classes` VALUES ('10', '半年班', '4', '1563335057', '1');
INSERT INTO `classes` VALUES ('11', '一年班', '5', '1563335075', '1');
INSERT INTO `classes` VALUES ('12', '789', '3', '1563345364', '1');
INSERT INTO `classes` VALUES ('13', '123', '4', '1563345375', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `com_describe` varchar(255) DEFAULT NULL,
  `com_sound` varchar(255) DEFAULT NULL,
  `com_time` int(11) DEFAULT NULL,
  `com_content` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `commend` int(11) DEFAULT NULL,
  PRIMARY KEY (`com_id`,`work_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('75', '2', '196', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/luying.wav', '1562314764', null, '1', '1', '10');
INSERT INTO `comment` VALUES ('76', '2', '195', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/luying.wav', '1562314774', null, '1', '1', '17');
INSERT INTO `comment` VALUES ('77', '2', '191', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/luying.wav', '1562314782', null, '1', '22', '23');
INSERT INTO `comment` VALUES ('78', '2', '197', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/file/1562640627687.mp3', '1562640629', null, '1', '1', '1');
INSERT INTO `comment` VALUES ('79', '2', '198', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/file/1562642396504.mp3', '1562642396', null, '1', '1', '1');
INSERT INTO `comment` VALUES ('80', '2', '213', null, 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/uploads/file/1563423830168.mp3', '1563423828', null, '1', '1', '1');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `plan_content` varchar(255) DEFAULT NULL,
  `com_content` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------

-- ----------------------------
-- Table structure for cour_class
-- ----------------------------
DROP TABLE IF EXISTS `cour_class`;
CREATE TABLE `cour_class` (
  `course_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cour_class
-- ----------------------------
INSERT INTO `cour_class` VALUES ('1', '3');
INSERT INTO `cour_class` VALUES ('2', '3');
INSERT INTO `cour_class` VALUES ('1', '4');
INSERT INTO `cour_class` VALUES ('1', '5');
INSERT INTO `cour_class` VALUES ('2', '5');
INSERT INTO `cour_class` VALUES ('1', '8');
INSERT INTO `cour_class` VALUES ('1', '9');
INSERT INTO `cour_class` VALUES ('1', '10');
INSERT INTO `cour_class` VALUES ('1', '11');
INSERT INTO `cour_class` VALUES ('2', '12');
INSERT INTO `cour_class` VALUES ('1', '13');
INSERT INTO `cour_class` VALUES ('1', '14');
INSERT INTO `cour_class` VALUES ('2', '15');
INSERT INTO `cour_class` VALUES ('3', '16');
INSERT INTO `cour_class` VALUES ('2', '17');
INSERT INTO `cour_class` VALUES ('3', '18');
INSERT INTO `cour_class` VALUES ('1', '19');
INSERT INTO `cour_class` VALUES ('2', '20');
INSERT INTO `cour_class` VALUES ('1', '21');
INSERT INTO `cour_class` VALUES ('1', '22');
INSERT INTO `cour_class` VALUES ('2', '23');
INSERT INTO `cour_class` VALUES ('3', '24');
INSERT INTO `cour_class` VALUES ('2', '25');
INSERT INTO `cour_class` VALUES ('1', '26');
INSERT INTO `cour_class` VALUES ('2', '27');
INSERT INTO `cour_class` VALUES ('3', '28');
INSERT INTO `cour_class` VALUES ('5', '29');
INSERT INTO `cour_class` VALUES ('5', '30');
INSERT INTO `cour_class` VALUES ('5', '31');
INSERT INTO `cour_class` VALUES ('5', '32');
INSERT INTO `cour_class` VALUES ('5', '33');
INSERT INTO `cour_class` VALUES ('5', '34');
INSERT INTO `cour_class` VALUES ('5', '35');
INSERT INTO `cour_class` VALUES ('2', '36');
INSERT INTO `cour_class` VALUES ('2', '37');
INSERT INTO `cour_class` VALUES ('2', '38');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `course_status` int(11) DEFAULT '0',
  `course_img` varchar(255) DEFAULT NULL,
  `course_describe` varchar(255) DEFAULT NULL,
  `price` double(16,2) DEFAULT '0.00',
  `type` int(11) DEFAULT NULL,
  `lastprice` double(16,2) DEFAULT '0.00',
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '体验课', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/mianfeike%402x%281%29.png', '超值VIP课程+名师辅导+专业耗材礼包', '1880.00', '1', '1680.00');
INSERT INTO `course` VALUES ('2', '半年课', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/bannianke%402x.png', '超值VIP课程+名师辅导+专业耗材礼包', '1880.00', '2', '1680.00');
INSERT INTO `course` VALUES ('3', '一年课', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/yinianke%402x%281%29.png', '超值VIP课程+名师辅导+专业耗材礼包', '3580.00', '2', '2880.00');
INSERT INTO `course` VALUES ('5', '月课', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/C%3A%5Cfakepath%5C21%402x.png', '超值VIP课程+名师辅导+专业耗材礼包', '1.00', '3', '0.01');

-- ----------------------------
-- Table structure for fabulous
-- ----------------------------
DROP TABLE IF EXISTS `fabulous`;
CREATE TABLE `fabulous` (
  `work_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fabulous
-- ----------------------------
INSERT INTO `fabulous` VALUES ('0', '92', '1561022150');
INSERT INTO `fabulous` VALUES ('148', '92', '1561022188');
INSERT INTO `fabulous` VALUES ('149', '92', '1561022197');
INSERT INTO `fabulous` VALUES ('159', '73', '1561022532');
INSERT INTO `fabulous` VALUES ('154', '67', '1561086398');
INSERT INTO `fabulous` VALUES ('157', '65', '1561086401');
INSERT INTO `fabulous` VALUES ('156', '65', '1561086406');
INSERT INTO `fabulous` VALUES ('155', '65', '1561086408');
INSERT INTO `fabulous` VALUES ('154', '65', '1561086409');
INSERT INTO `fabulous` VALUES ('153', '65', '1561086420');
INSERT INTO `fabulous` VALUES ('152', '65', '1561086421');
INSERT INTO `fabulous` VALUES ('148', '65', '1561086429');
INSERT INTO `fabulous` VALUES ('151', '65', '1561086431');
INSERT INTO `fabulous` VALUES ('150', '65', '1561086439');
INSERT INTO `fabulous` VALUES ('160', '73', '1561086501');
INSERT INTO `fabulous` VALUES ('165', '65', '1561127161');
INSERT INTO `fabulous` VALUES ('165', '73', '1561127224');
INSERT INTO `fabulous` VALUES ('164', '73', '1561127988');
INSERT INTO `fabulous` VALUES ('166', '65', '1561130247');
INSERT INTO `fabulous` VALUES ('164', '65', '1561130263');
INSERT INTO `fabulous` VALUES ('163', '65', '1561130267');
INSERT INTO `fabulous` VALUES ('162', '73', '1561130330');
INSERT INTO `fabulous` VALUES ('161', '73', '1561130331');
INSERT INTO `fabulous` VALUES ('162', '65', '1561130333');
INSERT INTO `fabulous` VALUES ('156', '73', '1561130333');
INSERT INTO `fabulous` VALUES ('167', '73', '1561130500');
INSERT INTO `fabulous` VALUES ('168', '73', '1561130628');
INSERT INTO `fabulous` VALUES ('169', '121', '1561349596');
INSERT INTO `fabulous` VALUES ('173', '121', '1561350330');
INSERT INTO `fabulous` VALUES ('167', '67', '1561364199');
INSERT INTO `fabulous` VALUES ('175', '67', '1561364210');
INSERT INTO `fabulous` VALUES ('179', '65', '1561446238');
INSERT INTO `fabulous` VALUES ('178', '65', '1561446242');
INSERT INTO `fabulous` VALUES ('171', '65', '1561446281');
INSERT INTO `fabulous` VALUES ('174', '65', '1561446306');
INSERT INTO `fabulous` VALUES ('149', '65', '1561446356');
INSERT INTO `fabulous` VALUES ('167', '124', '1561615847');
INSERT INTO `fabulous` VALUES ('173', '125', '1561688284');
INSERT INTO `fabulous` VALUES ('158', '125', '1561688286');
INSERT INTO `fabulous` VALUES ('186', '160', '1562125424');
INSERT INTO `fabulous` VALUES ('185', '160', '1562125429');
INSERT INTO `fabulous` VALUES ('193', '167', '1562314809');
INSERT INTO `fabulous` VALUES ('191', '168', '1562314835');
INSERT INTO `fabulous` VALUES ('193', '168', '1562314842');
INSERT INTO `fabulous` VALUES ('191', '167', '1562314861');
INSERT INTO `fabulous` VALUES ('194', '167', '1562314890');
INSERT INTO `fabulous` VALUES ('197', '201', '1562640646');
INSERT INTO `fabulous` VALUES ('197', '199', '1562641623');
INSERT INTO `fabulous` VALUES ('197', '87', '1562641669');
INSERT INTO `fabulous` VALUES ('197', '202', '1562641673');
INSERT INTO `fabulous` VALUES ('198', '199', '1562642416');
INSERT INTO `fabulous` VALUES ('198', '208', '1562728676');
INSERT INTO `fabulous` VALUES ('195', '216', '1562814001');
INSERT INTO `fabulous` VALUES ('191', '162', '1562817039');
INSERT INTO `fabulous` VALUES ('191', '199', '1563164096');
INSERT INTO `fabulous` VALUES ('198', '168', '1563296883');
INSERT INTO `fabulous` VALUES ('191', '237', '1563359799');
INSERT INTO `fabulous` VALUES ('203', '237', '1563361478');
INSERT INTO `fabulous` VALUES ('212', '237', '1563361483');
INSERT INTO `fabulous` VALUES ('213', '87', '1563424035');

-- ----------------------------
-- Table structure for headmaster
-- ----------------------------
DROP TABLE IF EXISTS `headmaster`;
CREATE TABLE `headmaster` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_name` varchar(255) DEFAULT NULL,
  `h_phone` varchar(11) DEFAULT NULL,
  `h_code` int(11) DEFAULT NULL,
  `h_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`h_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of headmaster
-- ----------------------------
INSERT INTO `headmaster` VALUES ('3', '花花老师', '18636447582', '131', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');
INSERT INTO `headmaster` VALUES ('4', '小月老师', '18636447582', '130', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');
INSERT INTO `headmaster` VALUES ('5', '海亮老师', '15926297974', '311', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');
INSERT INTO `headmaster` VALUES ('6', 'A老师', '15926297974', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');
INSERT INTO `headmaster` VALUES ('7', 'B老师', '18636447582', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');
INSERT INTO `headmaster` VALUES ('8', 'C老师', '18636447582', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/123.png', '1');

-- ----------------------------
-- Table structure for learners
-- ----------------------------
DROP TABLE IF EXISTS `learners`;
CREATE TABLE `learners` (
  `c_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of learners
-- ----------------------------
INSERT INTO `learners` VALUES ('9', '81', '1563335013');
INSERT INTO `learners` VALUES ('9', '79', '1563335013');
INSERT INTO `learners` VALUES ('9', '80', '1563335013');
INSERT INTO `learners` VALUES ('9', '68', '1563335013');
INSERT INTO `learners` VALUES ('9', '69', '1563335013');
INSERT INTO `learners` VALUES ('9', '70', '1563335013');
INSERT INTO `learners` VALUES ('9', '71', '1563335013');
INSERT INTO `learners` VALUES ('9', '72', '1563335013');
INSERT INTO `learners` VALUES ('9', '76', '1563335013');
INSERT INTO `learners` VALUES ('9', '82', '1563335013');
INSERT INTO `learners` VALUES ('9', '83', '1563335013');
INSERT INTO `learners` VALUES ('9', '85', '1563335013');
INSERT INTO `learners` VALUES ('9', '86', '1563335013');
INSERT INTO `learners` VALUES ('9', '87', '1563335013');
INSERT INTO `learners` VALUES ('9', '88', '1563335013');
INSERT INTO `learners` VALUES ('9', '90', '1563335013');
INSERT INTO `learners` VALUES ('9', '91', '1563335013');
INSERT INTO `learners` VALUES ('9', '93', '1563335013');
INSERT INTO `learners` VALUES ('9', '94', '1563335013');
INSERT INTO `learners` VALUES ('9', '95', '1563335013');
INSERT INTO `learners` VALUES ('9', '96', '1563335013');
INSERT INTO `learners` VALUES ('9', '97', '1563335013');
INSERT INTO `learners` VALUES ('9', '98', '1563335013');
INSERT INTO `learners` VALUES ('9', '99', '1563335013');
INSERT INTO `learners` VALUES ('9', '101', '1563335013');
INSERT INTO `learners` VALUES ('9', '102', '1563335013');
INSERT INTO `learners` VALUES ('9', '103', '1563335013');
INSERT INTO `learners` VALUES ('9', '104', '1563335013');
INSERT INTO `learners` VALUES ('9', '105', '1563335013');
INSERT INTO `learners` VALUES ('9', '106', '1563335014');
INSERT INTO `learners` VALUES ('9', '107', '1563335014');
INSERT INTO `learners` VALUES ('9', '108', '1563335014');
INSERT INTO `learners` VALUES ('9', '109', '1563335014');
INSERT INTO `learners` VALUES ('9', '110', '1563335014');
INSERT INTO `learners` VALUES ('9', '111', '1563335014');
INSERT INTO `learners` VALUES ('9', '112', '1563335014');
INSERT INTO `learners` VALUES ('9', '113', '1563335014');
INSERT INTO `learners` VALUES ('9', '114', '1563335014');
INSERT INTO `learners` VALUES ('9', '115', '1563335014');
INSERT INTO `learners` VALUES ('9', '116', '1563335014');
INSERT INTO `learners` VALUES ('9', '117', '1563335014');
INSERT INTO `learners` VALUES ('9', '118', '1563335014');
INSERT INTO `learners` VALUES ('9', '119', '1563335014');
INSERT INTO `learners` VALUES ('9', '120', '1563335014');
INSERT INTO `learners` VALUES ('9', '122', '1563335014');
INSERT INTO `learners` VALUES ('9', '126', '1563335014');
INSERT INTO `learners` VALUES ('9', '127', '1563335014');
INSERT INTO `learners` VALUES ('9', '130', '1563335014');
INSERT INTO `learners` VALUES ('9', '131', '1563335014');
INSERT INTO `learners` VALUES ('9', '132', '1563335014');
INSERT INTO `learners` VALUES ('9', '133', '1563335014');
INSERT INTO `learners` VALUES ('9', '134', '1563335014');
INSERT INTO `learners` VALUES ('9', '135', '1563335014');
INSERT INTO `learners` VALUES ('9', '136', '1563335014');
INSERT INTO `learners` VALUES ('9', '137', '1563335014');
INSERT INTO `learners` VALUES ('9', '138', '1563335014');
INSERT INTO `learners` VALUES ('9', '139', '1563335014');
INSERT INTO `learners` VALUES ('9', '140', '1563335014');
INSERT INTO `learners` VALUES ('9', '141', '1563335014');
INSERT INTO `learners` VALUES ('9', '142', '1563335014');
INSERT INTO `learners` VALUES ('9', '143', '1563335014');
INSERT INTO `learners` VALUES ('9', '144', '1563335014');
INSERT INTO `learners` VALUES ('9', '146', '1563335014');
INSERT INTO `learners` VALUES ('9', '147', '1563335014');
INSERT INTO `learners` VALUES ('9', '148', '1563335014');
INSERT INTO `learners` VALUES ('9', '149', '1563335014');
INSERT INTO `learners` VALUES ('9', '154', '1563335014');
INSERT INTO `learners` VALUES ('9', '156', '1563335014');
INSERT INTO `learners` VALUES ('9', '157', '1563335014');
INSERT INTO `learners` VALUES ('9', '158', '1563335014');
INSERT INTO `learners` VALUES ('9', '159', '1563335014');
INSERT INTO `learners` VALUES ('9', '161', '1563335014');
INSERT INTO `learners` VALUES ('9', '162', '1563335014');
INSERT INTO `learners` VALUES ('9', '163', '1563335014');
INSERT INTO `learners` VALUES ('9', '164', '1563335014');
INSERT INTO `learners` VALUES ('9', '165', '1563335014');
INSERT INTO `learners` VALUES ('9', '166', '1563335014');
INSERT INTO `learners` VALUES ('9', '168', '1563335014');
INSERT INTO `learners` VALUES ('9', '171', '1563335014');
INSERT INTO `learners` VALUES ('9', '172', '1563335014');
INSERT INTO `learners` VALUES ('9', '173', '1563335014');
INSERT INTO `learners` VALUES ('9', '174', '1563335014');
INSERT INTO `learners` VALUES ('9', '175', '1563335014');
INSERT INTO `learners` VALUES ('9', '176', '1563335014');
INSERT INTO `learners` VALUES ('9', '177', '1563335014');
INSERT INTO `learners` VALUES ('9', '179', '1563335014');
INSERT INTO `learners` VALUES ('9', '180', '1563335014');
INSERT INTO `learners` VALUES ('9', '195', '1563335014');
INSERT INTO `learners` VALUES ('9', '196', '1563335014');
INSERT INTO `learners` VALUES ('9', '199', '1563335014');
INSERT INTO `learners` VALUES ('9', '200', '1563335014');
INSERT INTO `learners` VALUES ('9', '201', '1563335014');
INSERT INTO `learners` VALUES ('9', '202', '1563335014');
INSERT INTO `learners` VALUES ('9', '203', '1563335014');
INSERT INTO `learners` VALUES ('9', '204', '1563335014');
INSERT INTO `learners` VALUES ('9', '205', '1563335014');
INSERT INTO `learners` VALUES ('9', '207', '1563335014');
INSERT INTO `learners` VALUES ('9', '208', '1563335014');
INSERT INTO `learners` VALUES ('9', '209', '1563335014');
INSERT INTO `learners` VALUES ('9', '210', '1563335014');
INSERT INTO `learners` VALUES ('9', '211', '1563335014');
INSERT INTO `learners` VALUES ('9', '212', '1563335014');
INSERT INTO `learners` VALUES ('9', '213', '1563335014');
INSERT INTO `learners` VALUES ('9', '214', '1563335014');
INSERT INTO `learners` VALUES ('9', '215', '1563335014');
INSERT INTO `learners` VALUES ('9', '216', '1563335014');
INSERT INTO `learners` VALUES ('9', '217', '1563335014');
INSERT INTO `learners` VALUES ('9', '218', '1563335014');
INSERT INTO `learners` VALUES ('9', '219', '1563335014');
INSERT INTO `learners` VALUES ('9', '220', '1563335014');
INSERT INTO `learners` VALUES ('9', '221', '1563335014');
INSERT INTO `learners` VALUES ('9', '222', '1563335014');
INSERT INTO `learners` VALUES ('9', '223', '1563335014');
INSERT INTO `learners` VALUES ('9', '224', '1563335014');
INSERT INTO `learners` VALUES ('9', '226', '1563335014');
INSERT INTO `learners` VALUES ('9', '227', '1563335014');
INSERT INTO `learners` VALUES ('9', '228', '1563335014');
INSERT INTO `learners` VALUES ('9', '229', '1563335014');
INSERT INTO `learners` VALUES ('9', '230', '1563335014');
INSERT INTO `learners` VALUES ('9', '231', '1563335014');
INSERT INTO `learners` VALUES ('9', '232', '1563335014');
INSERT INTO `learners` VALUES ('9', '233', '1563335014');
INSERT INTO `learners` VALUES ('9', '234', '1563335014');
INSERT INTO `learners` VALUES ('9', '235', '1563335014');
INSERT INTO `learners` VALUES ('9', '236', '1563335014');
INSERT INTO `learners` VALUES ('9', '237', '1563335014');
INSERT INTO `learners` VALUES ('9', '238', '1563335014');
INSERT INTO `learners` VALUES ('9', '239', '1563335014');
INSERT INTO `learners` VALUES ('9', '240', '1563335014');
INSERT INTO `learners` VALUES ('9', '241', '1563335014');
INSERT INTO `learners` VALUES ('9', '242', '1563335014');
INSERT INTO `learners` VALUES ('10', '237', '1563335057');
INSERT INTO `learners` VALUES ('11', '236', '1563335075');
INSERT INTO `learners` VALUES ('12', '81', '1563345364');
INSERT INTO `learners` VALUES ('12', '79', '1563345364');
INSERT INTO `learners` VALUES ('12', '80', '1563345364');
INSERT INTO `learners` VALUES ('12', '68', '1563345364');
INSERT INTO `learners` VALUES ('12', '69', '1563345364');
INSERT INTO `learners` VALUES ('12', '70', '1563345364');
INSERT INTO `learners` VALUES ('12', '71', '1563345364');
INSERT INTO `learners` VALUES ('12', '72', '1563345364');
INSERT INTO `learners` VALUES ('12', '76', '1563345364');
INSERT INTO `learners` VALUES ('12', '82', '1563345364');
INSERT INTO `learners` VALUES ('12', '83', '1563345364');
INSERT INTO `learners` VALUES ('12', '85', '1563345364');
INSERT INTO `learners` VALUES ('12', '86', '1563345364');
INSERT INTO `learners` VALUES ('12', '87', '1563345364');
INSERT INTO `learners` VALUES ('12', '88', '1563345364');
INSERT INTO `learners` VALUES ('12', '90', '1563345364');
INSERT INTO `learners` VALUES ('12', '91', '1563345364');
INSERT INTO `learners` VALUES ('12', '93', '1563345364');
INSERT INTO `learners` VALUES ('12', '94', '1563345364');
INSERT INTO `learners` VALUES ('12', '95', '1563345364');
INSERT INTO `learners` VALUES ('12', '96', '1563345364');
INSERT INTO `learners` VALUES ('12', '97', '1563345364');
INSERT INTO `learners` VALUES ('12', '98', '1563345364');
INSERT INTO `learners` VALUES ('12', '99', '1563345364');
INSERT INTO `learners` VALUES ('12', '101', '1563345364');
INSERT INTO `learners` VALUES ('12', '102', '1563345364');
INSERT INTO `learners` VALUES ('12', '103', '1563345364');
INSERT INTO `learners` VALUES ('12', '104', '1563345364');
INSERT INTO `learners` VALUES ('12', '105', '1563345364');
INSERT INTO `learners` VALUES ('12', '106', '1563345364');
INSERT INTO `learners` VALUES ('12', '107', '1563345364');
INSERT INTO `learners` VALUES ('12', '108', '1563345364');
INSERT INTO `learners` VALUES ('12', '109', '1563345364');
INSERT INTO `learners` VALUES ('12', '110', '1563345364');
INSERT INTO `learners` VALUES ('12', '111', '1563345364');
INSERT INTO `learners` VALUES ('12', '112', '1563345364');
INSERT INTO `learners` VALUES ('12', '113', '1563345364');
INSERT INTO `learners` VALUES ('12', '114', '1563345364');
INSERT INTO `learners` VALUES ('12', '115', '1563345364');
INSERT INTO `learners` VALUES ('12', '116', '1563345364');
INSERT INTO `learners` VALUES ('12', '117', '1563345364');
INSERT INTO `learners` VALUES ('12', '118', '1563345364');
INSERT INTO `learners` VALUES ('12', '119', '1563345364');
INSERT INTO `learners` VALUES ('12', '120', '1563345364');
INSERT INTO `learners` VALUES ('12', '122', '1563345364');
INSERT INTO `learners` VALUES ('12', '126', '1563345364');
INSERT INTO `learners` VALUES ('12', '127', '1563345364');
INSERT INTO `learners` VALUES ('12', '130', '1563345364');
INSERT INTO `learners` VALUES ('12', '131', '1563345364');
INSERT INTO `learners` VALUES ('12', '132', '1563345364');
INSERT INTO `learners` VALUES ('12', '133', '1563345364');
INSERT INTO `learners` VALUES ('12', '134', '1563345364');
INSERT INTO `learners` VALUES ('12', '135', '1563345364');
INSERT INTO `learners` VALUES ('12', '136', '1563345364');
INSERT INTO `learners` VALUES ('12', '137', '1563345364');
INSERT INTO `learners` VALUES ('12', '138', '1563345364');
INSERT INTO `learners` VALUES ('12', '139', '1563345364');
INSERT INTO `learners` VALUES ('12', '140', '1563345364');
INSERT INTO `learners` VALUES ('12', '141', '1563345364');
INSERT INTO `learners` VALUES ('12', '142', '1563345364');
INSERT INTO `learners` VALUES ('12', '143', '1563345364');
INSERT INTO `learners` VALUES ('12', '144', '1563345364');
INSERT INTO `learners` VALUES ('12', '146', '1563345364');
INSERT INTO `learners` VALUES ('12', '147', '1563345364');
INSERT INTO `learners` VALUES ('12', '148', '1563345364');
INSERT INTO `learners` VALUES ('12', '149', '1563345364');
INSERT INTO `learners` VALUES ('12', '154', '1563345364');
INSERT INTO `learners` VALUES ('12', '156', '1563345364');
INSERT INTO `learners` VALUES ('12', '157', '1563345364');
INSERT INTO `learners` VALUES ('12', '158', '1563345364');
INSERT INTO `learners` VALUES ('12', '159', '1563345364');
INSERT INTO `learners` VALUES ('12', '161', '1563345364');
INSERT INTO `learners` VALUES ('12', '162', '1563345364');
INSERT INTO `learners` VALUES ('12', '163', '1563345364');
INSERT INTO `learners` VALUES ('12', '164', '1563345364');
INSERT INTO `learners` VALUES ('12', '165', '1563345364');
INSERT INTO `learners` VALUES ('12', '166', '1563345364');
INSERT INTO `learners` VALUES ('12', '168', '1563345364');
INSERT INTO `learners` VALUES ('12', '171', '1563345364');
INSERT INTO `learners` VALUES ('12', '172', '1563345364');
INSERT INTO `learners` VALUES ('12', '173', '1563345364');
INSERT INTO `learners` VALUES ('12', '174', '1563345364');
INSERT INTO `learners` VALUES ('12', '175', '1563345364');
INSERT INTO `learners` VALUES ('12', '176', '1563345364');
INSERT INTO `learners` VALUES ('12', '177', '1563345364');
INSERT INTO `learners` VALUES ('12', '179', '1563345364');
INSERT INTO `learners` VALUES ('12', '180', '1563345364');
INSERT INTO `learners` VALUES ('12', '195', '1563345364');
INSERT INTO `learners` VALUES ('12', '196', '1563345364');
INSERT INTO `learners` VALUES ('12', '199', '1563345364');
INSERT INTO `learners` VALUES ('12', '200', '1563345364');
INSERT INTO `learners` VALUES ('12', '201', '1563345364');
INSERT INTO `learners` VALUES ('12', '202', '1563345364');
INSERT INTO `learners` VALUES ('12', '203', '1563345364');
INSERT INTO `learners` VALUES ('12', '204', '1563345364');
INSERT INTO `learners` VALUES ('12', '205', '1563345365');
INSERT INTO `learners` VALUES ('12', '207', '1563345365');
INSERT INTO `learners` VALUES ('12', '208', '1563345365');
INSERT INTO `learners` VALUES ('12', '209', '1563345365');
INSERT INTO `learners` VALUES ('12', '210', '1563345365');
INSERT INTO `learners` VALUES ('12', '211', '1563345365');
INSERT INTO `learners` VALUES ('12', '212', '1563345365');
INSERT INTO `learners` VALUES ('12', '213', '1563345365');
INSERT INTO `learners` VALUES ('12', '214', '1563345365');
INSERT INTO `learners` VALUES ('12', '215', '1563345365');
INSERT INTO `learners` VALUES ('12', '216', '1563345365');
INSERT INTO `learners` VALUES ('12', '217', '1563345365');
INSERT INTO `learners` VALUES ('12', '218', '1563345365');
INSERT INTO `learners` VALUES ('12', '219', '1563345365');
INSERT INTO `learners` VALUES ('12', '220', '1563345365');
INSERT INTO `learners` VALUES ('12', '221', '1563345365');
INSERT INTO `learners` VALUES ('12', '222', '1563345365');
INSERT INTO `learners` VALUES ('12', '223', '1563345365');
INSERT INTO `learners` VALUES ('12', '224', '1563345365');
INSERT INTO `learners` VALUES ('12', '226', '1563345365');
INSERT INTO `learners` VALUES ('12', '227', '1563345365');
INSERT INTO `learners` VALUES ('12', '228', '1563345365');
INSERT INTO `learners` VALUES ('12', '229', '1563345365');
INSERT INTO `learners` VALUES ('12', '230', '1563345365');
INSERT INTO `learners` VALUES ('12', '231', '1563345365');
INSERT INTO `learners` VALUES ('12', '232', '1563345365');
INSERT INTO `learners` VALUES ('12', '233', '1563345365');
INSERT INTO `learners` VALUES ('12', '234', '1563345365');
INSERT INTO `learners` VALUES ('12', '235', '1563345365');
INSERT INTO `learners` VALUES ('12', '236', '1563345365');
INSERT INTO `learners` VALUES ('12', '237', '1563345365');
INSERT INTO `learners` VALUES ('12', '238', '1563345365');
INSERT INTO `learners` VALUES ('12', '239', '1563345365');
INSERT INTO `learners` VALUES ('12', '240', '1563345365');
INSERT INTO `learners` VALUES ('12', '241', '1563345365');
INSERT INTO `learners` VALUES ('12', '242', '1563345365');
INSERT INTO `learners` VALUES ('13', '236', '1563345375');

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(255) DEFAULT NULL,
  `node_controller` varchar(255) DEFAULT NULL,
  `node_method` varchar(255) DEFAULT NULL,
  `node_pid` int(11) DEFAULT NULL,
  `node_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('1', '权限管理', 'Node', 'node', '0', '1');
INSERT INTO `node` VALUES ('28', '管理员展示', 'Admin', 'admin_list', '12', '1');
INSERT INTO `node` VALUES ('3', '权限展示', 'Node', 'node_list', '1', '1');
INSERT INTO `node` VALUES ('11', '权限删除', 'Node', 'node_delete', '1', '0');
INSERT INTO `node` VALUES ('29', '更改角色状态', 'Role', 'up_status', '7', '0');
INSERT INTO `node` VALUES ('7', '角色管理', 'Role', 'role', '0', '1');
INSERT INTO `node` VALUES ('8', '角色添加', 'Role', 'role_add', '7', '1');
INSERT INTO `node` VALUES ('9', '角色展示', 'Role', 'role_list', '7', '1');
INSERT INTO `node` VALUES ('12', '管理员管理', 'Admin', 'admin', '0', '1');
INSERT INTO `node` VALUES ('13', '管理员添加', 'Admin', 'admin_add', '12', '1');
INSERT INTO `node` VALUES ('36', '课节管理', 'Course', 'class', '0', '1');
INSERT INTO `node` VALUES ('17', '权限添加', 'Node', 'node_add', '1', '1');
INSERT INTO `node` VALUES ('35', '课程展示', 'Course', 'course_list', '33', '1');
INSERT INTO `node` VALUES ('34', '课程添加', 'Course', 'course_add', '33', '1');
INSERT INTO `node` VALUES ('33', '课程管理', 'Course', 'course', '0', '1');
INSERT INTO `node` VALUES ('32', '更改管理员状态', 'Admin', 'up_status', '12', '0');
INSERT INTO `node` VALUES ('31', '管理员删除', 'Admin', 'admin_delete', '12', '0');
INSERT INTO `node` VALUES ('30', '角色删除', 'Role', 'role_delete', '7', '0');
INSERT INTO `node` VALUES ('37', '课节添加', 'Course', 'class_add', '36', '1');
INSERT INTO `node` VALUES ('38', '课节展示', 'Course', 'class_list', '36', '1');
INSERT INTO `node` VALUES ('39', '内容管理', 'User', 'content', '0', '1');
INSERT INTO `node` VALUES ('40', '开通课程', 'User', 'content_list', '39', '1');
INSERT INTO `node` VALUES ('41', '课件删除', 'Course', 'class_delete', '36', '0');
INSERT INTO `node` VALUES ('42', '更改课件状态', 'Course', 'class_status', '36', '0');
INSERT INTO `node` VALUES ('43', '课程删除', 'Course', 'course_delete', '33', '0');
INSERT INTO `node` VALUES ('44', '更改课程状态', 'Course', 'up_status', '33', '0');
INSERT INTO `node` VALUES ('45', '课程确定', 'User', 'lesson', '39', '0');
INSERT INTO `node` VALUES ('46', '更改用户课程状态', 'User', 'updateuser', '39', '0');
INSERT INTO `node` VALUES ('47', '添加跟进记录', 'User', 'follow', '39', '0');
INSERT INTO `node` VALUES ('48', '展示跟进记录', 'User', 'followlist', '39', '0');
INSERT INTO `node` VALUES ('49', '老师管理', 'Teacher', 'teacher', '0', '1');
INSERT INTO `node` VALUES ('50', '老师添加', 'Teacher', 'teacher_add', '49', '1');
INSERT INTO `node` VALUES ('51', '老师展示', 'Teacher', 'teacher_list', '49', '1');
INSERT INTO `node` VALUES ('52', '老师删除', 'Teacher', 'teacher_delete', '49', '0');
INSERT INTO `node` VALUES ('53', '变更老师状态', 'Teacher', 'up_status', '49', '0');
INSERT INTO `node` VALUES ('54', '重置老师密码', 'Teacher', 'up_pwd', '49', '0');
INSERT INTO `node` VALUES ('55', '订单管理', 'Order', 'order', '0', '1');
INSERT INTO `node` VALUES ('56', '订单列表', 'Order', 'orderlist', '55', '1');
INSERT INTO `node` VALUES ('57', '班主任管理', 'Headmaster', 'headmaster', '0', '1');
INSERT INTO `node` VALUES ('58', '班主任添加', 'Headmaster', 'headmaster_add', '57', '1');
INSERT INTO `node` VALUES ('59', '班主任展示', 'Headmaster', 'headmaster_list', '57', '1');
INSERT INTO `node` VALUES ('60', '更改班主任老师状态', 'Headmaster', 'headmaster_status', '59', '0');
INSERT INTO `node` VALUES ('61', '班级管理', 'Classes', 'classes', '0', '1');
INSERT INTO `node` VALUES ('62', '添加班级', 'Classes', 'classes_add', '61', '1');
INSERT INTO `node` VALUES ('63', '查询符合条件的学员列表', 'Classes', 'userlist', '62', '0');
INSERT INTO `node` VALUES ('64', '班级展示', 'Classes', 'classes_list', '61', '1');
INSERT INTO `node` VALUES ('65', '更改班级状态', 'Classes', 'classes_status', '64', '0');
INSERT INTO `node` VALUES ('66', '学员列表', 'Classes', 'classes_user', '64', '0');
INSERT INTO `node` VALUES ('67', '移除班级学员', 'Classes', 'user_del', '64', '0');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `order_money` double(16,2) DEFAULT NULL COMMENT '商品价格',
  `order_sn` varchar(25) DEFAULT NULL COMMENT '订单号',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `pay_time` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `order_money_status` char(1) DEFAULT '0' COMMENT '订单支付状态 1.支付 0未支付',
  `money_pay` double(16,2) DEFAULT '0.00' COMMENT '支付金额',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('296', '半年课', '1680.00', '15633343242372', '1563334324', '20190717113204', '237', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('297', '一年课', '2880.00', '15633343262363', '1563334326', '20190717113206', '236', '3', '1', '2880.00');
INSERT INTO `order` VALUES ('298', '体验课', '1680.00', '15633520991681', '1563352099', '20190717162819', '168', '1', '1', '1680.00');
INSERT INTO `order` VALUES ('299', '半年课', '1680.00', '15633521031682', '1563352103', '20190717162823', '168', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('300', '一年课', '2880.00', '15633521061683', '1563352106', '20190717162826', '168', '3', '1', '2880.00');
INSERT INTO `order` VALUES ('301', '月课', '0.01', '15633521101685', '1563352110', '20190717162830', '168', '5', '1', '0.01');
INSERT INTO `order` VALUES ('302', '半年课', '1680.00', '15634181532442', '1563418153', '20190718104922', '244', '2', '0', '1680.00');
INSERT INTO `order` VALUES ('303', '半年课', '1680.00', '15634181812442', '1563418181', '20190718104941', '244', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('304', '半年课', '1680.00', '15634185172032', '1563418517', '20190718105517', '203', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('305', '半年课', '1680.00', '15634185741222', '1563418574', '20190718105614', '122', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('306', '半年课', '1680.00', '1563418584872', '1563418584', '20190718114942', '87', '2', '0', '1680.00');
INSERT INTO `order` VALUES ('307', '半年课', '1680.00', '15634217342022', '1563421734', '20190718114854', '202', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('308', '月课', '0.01', '1563421762875', '1563421762', '20190718114922', '87', '5', '1', '0.01');
INSERT INTO `order` VALUES ('309', '体验课', '1680.00', '15634234892031', '1563423489', '20190718121809', '203', '1', '1', '1680.00');
INSERT INTO `order` VALUES ('310', '半年课', '1680.00', '1563423988872', '1563423988', '20190718122628', '87', '2', '1', '1680.00');
INSERT INTO `order` VALUES ('311', '体验课', '1680.00', '15634367452461', '1563436745', '20190718155905', '246', '1', '1', '1680.00');
INSERT INTO `order` VALUES ('312', '月课', '0.01', '15634367492465', '1563436749', '20190718155909', '246', '5', '1', '0.01');
INSERT INTO `order` VALUES ('313', '半年课', '1680.00', '15634657662362', '1563465766', null, '236', '2', '0', '0.00');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `plan_time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `pur_id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_money` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pur_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`pur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase
-- ----------------------------

-- ----------------------------
-- Table structure for ranking
-- ----------------------------
DROP TABLE IF EXISTS `ranking`;
CREATE TABLE `ranking` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `fabulous` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `commend` int(11) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ranking
-- ----------------------------
INSERT INTO `ranking` VALUES ('42', '168', '2019-06', '305', '29', '32');
INSERT INTO `ranking` VALUES ('43', '194', '2019-06', '27', '3', '2');
INSERT INTO `ranking` VALUES ('44', '183', '2019-06', '19', '1', '1');
INSERT INTO `ranking` VALUES ('45', '147', '2019-06', '397', '30', '29');
INSERT INTO `ranking` VALUES ('46', '143', '2019-06', '16', '5', '2');
INSERT INTO `ranking` VALUES ('47', '139', '2019-06', '199', '25', '16');
INSERT INTO `ranking` VALUES ('48', '122', '2019-06', '155', '17', '14');
INSERT INTO `ranking` VALUES ('49', '82', '2019-06', '85', '9', '9');
INSERT INTO `ranking` VALUES ('50', '194', '2019-07', '1', '1', null);
INSERT INTO `ranking` VALUES ('51', '183', '2019-07', null, '1', null);
INSERT INTO `ranking` VALUES ('52', '87', '2019-06', '1', '1', '1');
INSERT INTO `ranking` VALUES ('53', '201', '2019-06', '1', '1', '1');
INSERT INTO `ranking` VALUES ('54', '201', '2019-07', '3', null, null);
INSERT INTO `ranking` VALUES ('55', '199', '2019-07', '3', '1', '1');
INSERT INTO `ranking` VALUES ('56', '122', '2019-07', null, '2', null);
INSERT INTO `ranking` VALUES ('57', '168', '2019-07', '3', null, null);
INSERT INTO `ranking` VALUES ('58', '237', '2019-07', '2', '2', null);
INSERT INTO `ranking` VALUES ('59', '236', '2019-07', null, '2', null);
INSERT INTO `ranking` VALUES ('60', '203', '2019-07', '1', '1', null);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_comment` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `record_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('20', '老师', '', '1');
INSERT INTO `role` VALUES ('19', '开发', '', '1');

-- ----------------------------
-- Table structure for role_node
-- ----------------------------
DROP TABLE IF EXISTS `role_node`;
CREATE TABLE `role_node` (
  `role_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_node
-- ----------------------------
INSERT INTO `role_node` VALUES ('1', '1');
INSERT INTO `role_node` VALUES ('2', '1');
INSERT INTO `role_node` VALUES ('10', '1');
INSERT INTO `role_node` VALUES ('10', '3');
INSERT INTO `role_node` VALUES ('10', '7');
INSERT INTO `role_node` VALUES ('10', '8');
INSERT INTO `role_node` VALUES ('12', '1');
INSERT INTO `role_node` VALUES ('12', '3');
INSERT INTO `role_node` VALUES ('12', '11');
INSERT INTO `role_node` VALUES ('12', '17');
INSERT INTO `role_node` VALUES ('12', '7');
INSERT INTO `role_node` VALUES ('12', '8');
INSERT INTO `role_node` VALUES ('12', '9');
INSERT INTO `role_node` VALUES ('12', '12');
INSERT INTO `role_node` VALUES ('12', '13');
INSERT INTO `role_node` VALUES ('1', '36');
INSERT INTO `role_node` VALUES ('1', '37');
INSERT INTO `role_node` VALUES ('1', '38');
INSERT INTO `role_node` VALUES ('1', '33');
INSERT INTO `role_node` VALUES ('1', '35');
INSERT INTO `role_node` VALUES ('1', '34');
INSERT INTO `role_node` VALUES ('1', '39');
INSERT INTO `role_node` VALUES ('1', '40');
INSERT INTO `role_node` VALUES ('1', '36');
INSERT INTO `role_node` VALUES ('1', '37');
INSERT INTO `role_node` VALUES ('1', '38');
INSERT INTO `role_node` VALUES ('1', '33');
INSERT INTO `role_node` VALUES ('1', '35');
INSERT INTO `role_node` VALUES ('1', '34');
INSERT INTO `role_node` VALUES ('1', '39');
INSERT INTO `role_node` VALUES ('1', '40');
INSERT INTO `role_node` VALUES ('17', '36');
INSERT INTO `role_node` VALUES ('17', '37');
INSERT INTO `role_node` VALUES ('17', '38');
INSERT INTO `role_node` VALUES ('17', '33');
INSERT INTO `role_node` VALUES ('17', '35');
INSERT INTO `role_node` VALUES ('17', '34');
INSERT INTO `role_node` VALUES ('17', '39');
INSERT INTO `role_node` VALUES ('17', '40');
INSERT INTO `role_node` VALUES ('18', '36');
INSERT INTO `role_node` VALUES ('18', '37');
INSERT INTO `role_node` VALUES ('18', '38');
INSERT INTO `role_node` VALUES ('18', '41');
INSERT INTO `role_node` VALUES ('18', '42');
INSERT INTO `role_node` VALUES ('18', '33');
INSERT INTO `role_node` VALUES ('18', '35');
INSERT INTO `role_node` VALUES ('18', '34');
INSERT INTO `role_node` VALUES ('18', '43');
INSERT INTO `role_node` VALUES ('18', '44');
INSERT INTO `role_node` VALUES ('18', '39');
INSERT INTO `role_node` VALUES ('18', '40');
INSERT INTO `role_node` VALUES ('18', '45');
INSERT INTO `role_node` VALUES ('18', '46');
INSERT INTO `role_node` VALUES ('18', '47');
INSERT INTO `role_node` VALUES ('18', '48');
INSERT INTO `role_node` VALUES ('19', '1');
INSERT INTO `role_node` VALUES ('19', '3');
INSERT INTO `role_node` VALUES ('19', '11');
INSERT INTO `role_node` VALUES ('19', '17');
INSERT INTO `role_node` VALUES ('19', '7');
INSERT INTO `role_node` VALUES ('19', '29');
INSERT INTO `role_node` VALUES ('19', '8');
INSERT INTO `role_node` VALUES ('19', '9');
INSERT INTO `role_node` VALUES ('19', '30');
INSERT INTO `role_node` VALUES ('19', '12');
INSERT INTO `role_node` VALUES ('19', '28');
INSERT INTO `role_node` VALUES ('19', '13');
INSERT INTO `role_node` VALUES ('19', '32');
INSERT INTO `role_node` VALUES ('19', '31');
INSERT INTO `role_node` VALUES ('19', '36');
INSERT INTO `role_node` VALUES ('19', '37');
INSERT INTO `role_node` VALUES ('19', '38');
INSERT INTO `role_node` VALUES ('19', '41');
INSERT INTO `role_node` VALUES ('19', '42');
INSERT INTO `role_node` VALUES ('19', '33');
INSERT INTO `role_node` VALUES ('19', '35');
INSERT INTO `role_node` VALUES ('19', '34');
INSERT INTO `role_node` VALUES ('19', '43');
INSERT INTO `role_node` VALUES ('19', '44');
INSERT INTO `role_node` VALUES ('19', '39');
INSERT INTO `role_node` VALUES ('19', '40');
INSERT INTO `role_node` VALUES ('19', '45');
INSERT INTO `role_node` VALUES ('19', '46');
INSERT INTO `role_node` VALUES ('19', '47');
INSERT INTO `role_node` VALUES ('19', '48');
INSERT INTO `role_node` VALUES ('20', '36');
INSERT INTO `role_node` VALUES ('20', '37');
INSERT INTO `role_node` VALUES ('20', '38');
INSERT INTO `role_node` VALUES ('20', '41');
INSERT INTO `role_node` VALUES ('20', '42');
INSERT INTO `role_node` VALUES ('20', '33');
INSERT INTO `role_node` VALUES ('20', '35');
INSERT INTO `role_node` VALUES ('20', '34');
INSERT INTO `role_node` VALUES ('20', '43');
INSERT INTO `role_node` VALUES ('20', '44');
INSERT INTO `role_node` VALUES ('20', '39');
INSERT INTO `role_node` VALUES ('20', '40');
INSERT INTO `role_node` VALUES ('20', '45');
INSERT INTO `role_node` VALUES ('20', '46');
INSERT INTO `role_node` VALUES ('20', '47');
INSERT INTO `role_node` VALUES ('20', '48');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) DEFAULT NULL,
  `teacher_account` varchar(255) DEFAULT NULL,
  `teacher_pwd` varchar(255) DEFAULT NULL,
  `teacher_img` varchar(255) DEFAULT NULL,
  `teacher_mail` varchar(255) DEFAULT NULL,
  `teacher_tel` char(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', '海狸', '123', '202cb962ac59075b964b07152d234b70', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/photo/C%3A%5Cfakepath%5Cyinianke%402x(1).png', '', null, '1');
INSERT INTO `teacher` VALUES ('3', '李老师', '123456', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_id` int(11) DEFAULT NULL,
  `user_phone` char(11) NOT NULL,
  `user_sex` int(11) DEFAULT '1',
  `user_name` varchar(255) DEFAULT NULL,
  `user_birthday` int(11) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `user_num` int(11) DEFAULT '3',
  `user_time` int(11) DEFAULT NULL,
  `user_nums` int(11) DEFAULT NULL,
  `course_time` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `days` int(11) DEFAULT '0',
  `commend` int(11) DEFAULT '0',
  `fabulous` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('65', '66', '15926297974', '0', null, '1262275200', null, '3', '1561012537', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '1', '2');
INSERT INTO `users` VALUES ('81', '82', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('67', '68', '18301176539', '1', null, '1425312000', null, '3', '1561364294', '6', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2', '11', '21');
INSERT INTO `users` VALUES ('89', '90', '18732431001', '1', null, null, null, '3', '1562314122', '2', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2', '0', '0');
INSERT INTO `users` VALUES ('79', '80', '18800170585', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('80', '81', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('68', '69', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('69', '70', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('70', '71', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('71', '72', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('72', '73', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('73', '74', '17600364807', '1', '小明', '1262275200', null, '3', '1561130573', '6', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2', '1', '7');
INSERT INTO `users` VALUES ('74', '75', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('75', '76', '15010817190', '1', null, null, null, '3', '1560751973', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('76', '77', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('77', '78', '17600596879', '0', null, null, null, '3', '1560751787', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('82', '83', '13382010246', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('83', '84', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('84', '85', '17600364807', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('85', '86', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('86', '87', '15176522669', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('87', '88', '15555568646', '1', null, null, null, '3', null, null, '0', '01010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('88', '89', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('90', '91', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('91', '92', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('92', '93', '15635456808', '1', null, null, null, '3', '1560998809', '2', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '2', '5');
INSERT INTO `users` VALUES ('93', '94', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('94', '95', '18678327105', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('95', '96', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('96', '97', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('97', '98', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('98', '99', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('99', '100', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('100', '101', '18610081419', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('101', '102', '15986604134', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('102', '103', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('103', '104', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('104', '105', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('105', '106', '17356735367', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('106', '107', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('107', '108', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('108', '109', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('109', '110', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('110', '111', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('111', '112', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('112', '113', '13889328062', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('113', '114', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('114', '115', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('115', '116', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('116', '117', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('117', '118', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('118', '119', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('119', '120', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('120', '121', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('121', '122', '17600364807', '1', null, null, null, '3', '1561350219', '4', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '3', '3');
INSERT INTO `users` VALUES ('167', '168', 'null', '1', null, null, null, '3', '1562314598', '1', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '1', '2');
INSERT INTO `users` VALUES ('122', '123', '15561811617', '0', null, null, null, '3', '1563424310', '2', '0', '01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '3', '0', '0');
INSERT INTO `users` VALUES ('123', '124', '18301176539', '1', null, null, null, '3', '1562136619', '2', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '0');
INSERT INTO `users` VALUES ('124', '125', '15635456808', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('125', '126', '17600364807', '1', null, null, null, '3', '1561616057', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '0');
INSERT INTO `users` VALUES ('126', '127', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('127', '128', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('128', '129', '17600364807', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('129', '130', '17600364807', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('130', '131', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('131', '132', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('132', '133', '17721211257', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('133', '134', '17621953590', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('134', '135', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('135', '136', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('136', '137', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('137', '138', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('138', '139', '18689822715', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('139', '140', '18015228543', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('140', '141', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('141', '142', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('142', '143', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('143', '144', '13313313613', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('144', '145', '18099623710', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('145', '146', '15635456808', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('146', '147', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('147', '148', '13997100885', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('148', '149', '18607109320', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('149', '150', '15611287820', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('150', '151', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('151', '152', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('152', '153', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('153', '154', '15635456808', '1', null, null, null, '3', '1562124586', '2', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '0');
INSERT INTO `users` VALUES ('154', '155', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('155', '156', '13691110179', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('156', '157', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('157', '158', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('158', '159', '13871272551', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('159', '160', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('160', '161', '13691110179', '1', null, '1293811200', null, '3', '1562125308', '2', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '2', '2');
INSERT INTO `users` VALUES ('161', '162', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('162', '163', '15960290061', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('163', '164', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('164', '165', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('165', '166', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('166', '167', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('168', '169', '15926297974', '1', null, '1230739200', null, '3', '1562314511', '1', '0', '11110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '1', '5');
INSERT INTO `users` VALUES ('169', '170', '15635456808', '1', null, null, null, '3', '1562314622', '1', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '1', '1');
INSERT INTO `users` VALUES ('170', '171', '15635456808', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('171', '172', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('172', '173', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('173', '174', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('174', '175', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('175', '176', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('176', '177', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('177', '178', '17318017591', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('178', '179', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('179', '180', '13770655126', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('180', '181', '15152782575', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('194', '185', '18301176539', '1', null, null, null, '3', '1562586936', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '1');
INSERT INTO `users` VALUES ('182', '183', '13691110179', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('183', '184', '17600364807', '1', null, null, null, '3', '1562587061', '1', '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '0');
INSERT INTO `users` VALUES ('195', '186', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('196', '187', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('197', '188', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('198', '189', '15635456808', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('201', '192', '17600364807', '1', null, null, null, '3', '1562640568', '1', null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '1', '4');
INSERT INTO `users` VALUES ('202', '193', '17600596879', '1', null, null, null, '3', null, null, '0', '01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('203', '194', '18610081419', '1', null, null, null, '3', '1563418734', null, '0', '11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '1', '0', '1');
INSERT INTO `users` VALUES ('204', '195', '15010817190', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('205', '196', '18611377366', '1', null, null, null, '3', null, null, '0', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('206', '197', '15635456808', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('207', '198', '13920539524', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('208', '199', '15815338245', '0', null, '1302019200', null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('209', '200', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('210', '201', '15079115531', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('211', '202', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('212', '203', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('213', '204', '18356875304', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('214', '205', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('215', '206', '13141302026', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('216', '207', '17611239063', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('217', '208', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('218', '209', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('219', '210', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('220', '211', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('221', '212', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('222', '213', '15273228021', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('223', '214', '18060278199', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('224', '215', '15765656220', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('225', '216', '18301176539', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('226', '217', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('227', '218', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('228', '219', '17701682608', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('229', '220', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('230', '221', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('231', '222', '15970975936', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('232', '223', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('233', '224', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('234', '225', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('235', '226', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('236', '227', '15635456808', '0', null, '1264953600', null, '3', '1563465811', null, null, '00100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2', '0', '0');
INSERT INTO `users` VALUES ('237', '228', '18301176539', '1', null, null, null, '3', '1563360102', null, null, '01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2', '0', '2');
INSERT INTO `users` VALUES ('238', '229', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('239', '230', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('240', '231', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('241', '232', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('242', '233', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('244', '235', '13691110179', '1', null, null, null, '3', null, null, null, '01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('245', '236', '18805927095', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('243', '234', '15501258719', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('246', '237', '18946136861', '1', null, null, null, '3', null, null, null, '10010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('247', '238', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('248', '239', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('249', '240', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');
INSERT INTO `users` VALUES ('250', '241', '', '1', null, null, null, '3', null, null, null, '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0');

-- ----------------------------
-- Table structure for weixin
-- ----------------------------
DROP TABLE IF EXISTS `weixin`;
CREATE TABLE `weixin` (
  `wx_id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_name` varchar(255) DEFAULT NULL,
  `wx_img` varchar(255) DEFAULT NULL,
  `wx_openid` varchar(255) NOT NULL,
  `wx_sex` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`wx_id`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin
-- ----------------------------
INSERT INTO `weixin` VALUES ('217', '彭君丰', 'https://wx.qlogo.cn/mmhead/9aajCPUNsPb2CWILmoCniabapJnzxg4rkWBJZ4icFg4ws/132', 'oop8g5bb0T6BF8AFDS4QNPMUnr-4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('218', '杨凯珠', 'https://wx.qlogo.cn/mmhead/ndiboYMXoszJ762tXW8ac8rsEM6KVM2r3AqmtWvGmjiaY/132', 'oop8g5QcjNC46t1iPQc5o2WyK5iQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('196', 'George', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxr7C1K4CsTYRXrYsplLntTSY0mCNzLCViaxC2RwA2VqiaRDwZwCvR38wF9icdEnHq62ialibL3Ug66TQ/132', 'oop8g5TuG66pys_xnRV59R7GVLsc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('172', '邹钰琪妈妈', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3icnblvGd6ZUT9K2s8Q0fKuXeW2wm9lvYsj41OnGxvbRUNeAxGbr2sKOLhic1VLHQY9QI8otjcEwg/132', 'oop8g5QYm-tE8cwvdRR4S7_lxeFs', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('69', 'Devil。', 'https://wx.qlogo.cn/mmopen/vi_32/8RZajOUWcZsicdOQbGiaHibWxaA2gX8jNn5QSjUp4J2SfSKib4J4e5ccuPP37RI0sQ1LE4wX6sXzKcAC4gIZk1vulA/132', 'oop8g5bJ7eTxP_iJ-jreMCrOlzN4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('70', '健健康康', 'https://wx.qlogo.cn/mmopen/vi_32/TwBD9N9z85qzGCjAzjCQhpnweBheIpTtkzb7gx5abY5giafp0Cibft7ngDexKL2KhGFrU7PLIiaRlfI9H2ic2ibxF8w/132', 'oop8g5YzF_ostp9JafeAS3GWlV-4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('71', 'L', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKcuSBUicAoT8L2elN4M5nwWARjMH3pJW2LpH7Be4gCuzHrRbqd8Iarelqqh3KBx1FK8fZViaOxeGicQ/132', 'oop8g5QG1jT1yIXPX-NzYkAMbPrk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('72', '成都街头的李白', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKUtVyWGvc5HOiawicVcM3Hf6VoGzahFltmbLvrdt9sCkmicEtBhY00a5GLO11U9lIgV4hxaeB4o7F4g/132', 'oop8g5SqPaJ0lVOX3D1cQxu_9ikk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('73', '我的世界', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIFDHaZSepzqhfSrw6Q1U2B9ibEN8SFyVVAr7Wr8uCIkHIbWmZM5XHL0bzZX9T5hS7VoxRibBCPg8rw/132', 'oop8g5UiYmlL6lW7GpKLnO_3eW7E', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('169', '李小月', 'https://wx.qlogo.cn/mmopen/vi_32/PMCianx5gdyGJXZmQbFOxIia4QjTGX20umxxmRNxbxQnqskJW2Jz0eqqvIXibKrSpAYmRVic9fJicwfKcQww50P5TvQ/132', 'oop8g5d0hS_g6RCI_bTzAdeCZFGM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('195', '郝继红 Gloria', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmY2fU2Eh8uM8DlmySKm8Tzo5j1f5Z9qRpc4SxIyOq155AA0HDe3y56f4FLFdjs8uKTGLcxnq4sg/132', 'oop8g5d2CV-0gv1ST2URHNoEeagY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('194', '༄྄ེིོུ猫三儿ཉ྄ིོུ༄', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLV1Gia3oAzDcHb8OgibpIUnRZRbHV2C36EficMsbFt76qoCgNfBGh3whHFjSTfvKicIaTlnfpGmksk7w/132', 'oop8g5flJBDgNaG5a3SjrZ9yZ6VA', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('77', '侍德秀', 'https://wx.qlogo.cn/mmopen/vi_32/KUwFGLsK1MFqhZSIyElSv1YtloLJmxLszE0xj1vMkUb9byWSVGtoWyBPvGBJoVauanF6viaAaWSUKU4iatpdAVhg/132', 'oop8g5QXHSsQAcPtXPaU0niwPZ4k', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('192', '老酒馆的猫', 'https://wx.qlogo.cn/mmopen/vi_32/efCKKhbGFqhrNdG6suv12JUMncV41dTDbiccnhnYXCEcXGfHtSbWqXXSFuBVktSBianzceZtmNPY3UCbYmchyibvA/132', 'oop8g5ZpNXSk0cFMcPYEwfelsXRk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('80', '|･ω･｀)起啥名', 'https://wx.qlogo.cn/mmopen/vi_32/QicibtX7HvDPww8YEJqGq6QlTrFqp0sue5LdCUC9YWx7OO23yGO8licF7RU1Tr4ENzkB3WNq2UurmcicaoKeESUElw/132', 'oop8g5VwFDZ2ipnLtjt7wYDrsy3c', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('81', '戴艳', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLpP23oJxIZ1fVL5XQ4Sm5PiaQtTV6DrBVmicicloQ59PWRnR5x65brs9CJ5PGzLx4icf1YLHWRYfRkrw/132', 'oop8g5d1wHzd3NKknjL7aPEaS6uk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('82', '三顺布艺18976716615', 'https://wx.qlogo.cn/mmopen/vi_32/lWbD2wvdPmYFOW0XJSfe1Z6FGbVWcsKHaR5jAPoWNG2qkstbYAIqBwm3IF0s59NSogqvIrSCicibngd4nBDTumOA/132', 'oop8g5WirOSqP441iM2dnr_Claws', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('83', '方雪东', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIznHBXemnMxgPGkUtsqsFiacnZMR6uFC0TCJybXGHyvvLN8MaBNCQYJo4icU4Ywrr2xqtadsh0ibjiaQ/132', 'oop8g5SNIC_Vl0zz_l7aEl4x9LoU', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('84', '钟美', 'https://wx.qlogo.cn/mmopen/vi_32/ZnlibrLMnxe1NIqE6mM4jgEbu0YEK6zGCXx5YJeX3gjv0k16Vq1JxsM2oVrkKvybVPKQLbTMh7mYk2OhxDvSIWw/132', 'oop8g5ZOU-3j418aGTeth8Dp6P_4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('193', 'Katherine', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqpYZPa02obhqWsmOqzatZlVY5EibPE98v1YC5nkrbbia6O2XB5MRA0Zx7f9Nxq70DjSm0JF3ZBfJ7A/132', 'oop8g5ZesVQ7HFIZUBtW0wdj7BV4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('86', ' 将。', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGoLMiaCqE1zktdV0Zq2hn1JztU2kGbNns5ReYEqW7kibEMpDYGxVzOSUgOUqlLc3p9YG1FlD1mnPQ/132', 'oop8g5TsUyd5EaNAAxpue5FfTfVw', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('87', '溜溜园', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImiabU72k4T2wvDnkKYDXRUcE5obxevu1Ru9k9hkDS61qK5uibZq8hKfCZic3Vq8oDEMKF4r7yLMdOw/132', 'oop8g5RZQrMHwD1DZdgSEBVPrqUE', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('88', '', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epwo2Y3uuLyDAiaPTFQLgT6QMibpcnep4icnAeLuVBcqD3aEtdaRmzupUwxLQFUlJbPiaMXPAOictVDHYg/132', 'oop8g5UP4VzndTkrwIEhyHFjs6_c', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('89', '丹青', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK8ss7ZQapIWxBLw81gtZiawibVOMJrXFHfCqBgyEzgVko6Ie9S1qJ6uXz8u9xQE9YB8cNOHUuUzUIA/132', 'oop8g5bZbgGEcT2Y4Kvqzpg9y63Y', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('91', '周兰玟', 'https://wx.qlogo.cn/mmhead/KFocpl6w6o7ibjiaHxchgZKxia2UE9FRRWwqhf6GxpmYicI/132', 'oop8g5QOMwi2Ejs9G5wU6aivvPZo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('92', '东京的樱花', 'https://wx.qlogo.cn/mmopen/vi_32/YOEqzBYMxWiaSAribZrey7NKufjFoWp0XzLf4nSowQYnpMUeKyOUJCu97aCwWkEJibpUsToicjGZ9CIlEUib4uEibrvQ/132', 'oop8g5djKpOQAK4H1fUB2etp3_O4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('186', '开心每刻', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epDnXVlibyv9r5lXcVvcD9Ld0hT0UicNnPuWHicf9WoQcRicz8HkLicsU5zG7gFnto7wtJspCl24JdXvjA/132', 'oop8g5dJpWEmoOdXwAdSZesRjoNI', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('94', '王茹蓁', 'https://wx.qlogo.cn/mmhead/dzOafuauZCicAia9HnyHcnrYvETkHR3vTypEFwD0kYBjo/132', 'oop8g5Vr-pNRrRBf_OvCRqi8CeUc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('95', '湖蓝色泪痕', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epibeJNAEHnZRcg8kNe590CI5o4BrwdyWsXnlpC7vlf1qUIaY8GurwOVPibWh4UJlB1gqInic2MzzQnQ/132', 'oop8g5TXQmI-gyabsfFMnE0HBh9Q', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('96', '岁月', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqYyL9nQ0SxPdrFcwdmP0EHFDmXAtSO5HcPmkRiaWfoYHCvnpm3HjbfZfTJapicxZnt9ibwibWNhDuWOA/132', 'oop8g5Qxlmu5hYy89Nmy2-9fag_E', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('97', '黄党青', 'https://wx.qlogo.cn/mmopen/vi_32/oLmMT86qKHJkNUUpPvlnux2qDSkVD29I7FvVQY6IEToQONYmUw680oiciclUbIbQw5SjKcg1gB2xE10xsjX6UpSA/132', 'oop8g5aPJH31xITONANHYqUrwD00', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('98', '袁同学', 'https://wx.qlogo.cn/mmopen/vi_32/aTkw1ClXrzoEiaFZ04wnUnHiakrdhwiaubGeQSNqclXIyzZCbqJwlzUZjicy1urXcrrlqnjWj2tg5QxWv5P4JYk4Pg/132', 'oop8g5VoJpZz1F4OhnL7He-urKz0', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('99', '叶子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLQUjicfibicic2yu6fh6F0tSvA4njyqvo4eia6AhxWGkEzjWezRzdQJWTYC4INnqF27sCI7GcSkYU8FEA/132', 'oop8g5SzId2xSnjao8tUbxraASPc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('100', '刘星宇', 'https://wx.qlogo.cn/mmopen/vi_32/XkCRS3y88VaWyn2lfia7v12AGN5766R1RypBtGpNsibthZrrFicO8l1kGqAx0rFft7C2Pq2unUicjqWxkZcpFuYhVg/132', 'oop8g5Y1mb-0bnIUp_AhBzyQHrvM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('102', '英子', 'https://wx.qlogo.cn/mmopen/vi_32/q1Y1TJCrkCIFcxV3OARmfoSg7xPwh2WVryBgtnxfwiaFTAg4TB1T0VIgs5cfEak4lvfVo8MAOkwmgeKIZGiajOOg/132', 'oop8g5e7yoea5XmcTnT3-O2U_3l0', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('103', '老白', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKh3PvqG3GvJMF0XXIOhYccuwSEflUUVRYEWZ2vOYYVm4xun3v1w6xiav1XXxycictQ9iaialHNLDwkw/132', 'oop8g5ZL_nmCmhqJGxUlsAUWWP6w', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('104', '寇诺晗', '', 'oop8g5WX-yUS3NLmXR0jqUGHrndA', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('105', '雪', 'https://wx.qlogo.cn/mmopen/vi_32/ajGibWl8a5cThxho1PsKNMVKsd6cia6c71GlNwxwnanV0cxsefj3B0fbibRobUiaibo1byM7YoKZMaFCqy9xMmibwXMg/132', 'oop8g5ViIPfd5grOoR0BvLKDiKaA', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('106', '李', 'https://wx.qlogo.cn/mmopen/vi_32/1H0WWwjt6X4e7AAghiaibmEI5ZenhvtI5CQUBdDaIyBicgP5picmEib85t69aJzh73oaMOBD4bvMt9ibzeicBfuClFZHg/132', 'oop8g5bmObWNgUQiyNcvtnoRGsVw', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('107', '海丰', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkqxY5Wm9DNaJn8KJwbbMn6jdzDHErLtNjChuRIx5vqWJEbICnjt7VT7jbLgibhA6SibScXXsEnlow/132', 'oop8g5YLQr7c1hmEUDQ1bMcv-lwQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('108', '沈怡萱', 'https://wx.qlogo.cn/mmopen/vi_32/NGagvQkWd8BJT0DdNHQVcXOeHjmzrIyibiaAdNPIyvfAVr8kfze9MRVEaicJDQKvywgzz3jWATUOWicDFTxbdxLGiag/132', 'oop8g5bgdi6-V-4luT6-torjr4EQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('109', '蓝天白云', 'https://wx.qlogo.cn/mmopen/vi_32/N4MbIlbibFF9gwSXEwDYFC6YIIWcRk8qbemu1RtiaEBxtuYI3HOLs6sVO97zQia5KLu7rbickCghZBibnZwq34MicyOw/132', 'oop8g5ZoS3mqeI44Yq6N64xeSBIY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('110', '高紫菡', 'https://wx.qlogo.cn/mmopen/vi_32/VVIENyKkD8ZOPpFIS4Ce1Dz3X3oacuOogbzt8N6Jgf7tNqjOQWOTM5EwFDXM06XRyiaWQng7lXKBmLFxBCSgrzg/132', 'oop8g5al2OKmqZXdEO1ArK2DXV5I', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('111', '倪品仲', 'https://wx.qlogo.cn/mmhead/pgxzmIhfg78Qbj5NHibUXbRf9RrPhsdPZtKh9EQZXWl8/132', 'oop8g5fethrTLB2DV8jHqVlgkdLM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('112', '杨琴', 'https://wx.qlogo.cn/mmopen/vi_32/zOrRcRw3QYz0hXVVYa5de2UaalMfqOhx9tsribqU8pV5t6KCX9P3qNHRolcBqKZL7NSbWBk3ktsU2Wz831pn3FQ/132', 'oop8g5UaTNufnpFhzCCwTPZFbTuM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('113', '刘刘', 'https://wx.qlogo.cn/mmopen/vi_32/k5E8BAEia03njSQwkwiaVibFZ7V7kMXm7TogpqVJCgiaSTGN12CKDTfFIfiboeY1xicoGml3iaRN7WjYwjKs8ZvEByNMw/132', 'oop8g5QUPwVaeGwWldhOyny0jUyQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('114', 'mei', 'https://wx.qlogo.cn/mmopen/vi_32/hkBfzo6cRvZOOzyJhv7WP6iczZH6RWsMdmZgU8ZxNxdfMic9ehbyBIQnY2Wib6xQKAq0CkQjXZj83PJBlnDhyT6NQ/132', 'oop8g5ZBQhEfQz_F2EODwhpSLUpM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('115', '酷兒', 'https://wx.qlogo.cn/mmopen/vi_32/YFuLpx6ibjvquqdmleSTpMjKBnDicLFtmwpRstqOSic5tyJU7JRZGKarR8s7LYYglgNye6C2iaxZSq8wsKW0licE5nQ/132', 'oop8g5RzfVmjcoTkke1l5F402kGk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('116', '桑叶', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKhZjDgUpia0IXEBaVpWcLzZYwdfkMVibOm2USDkWoKp1Qwm4R0icUVJUrvrzK1pBKoicWloUNI17Q6Fg/132', 'oop8g5WGQ02nWeMg0xuZjnR02YJU', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('117', '欧黎-薛超', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEInjic6j7HRd5IkU0Sia5YZeMEbkdHGjibrVFatOkJibjklJWksu9e6bgrkv9YAj09uwib0u06YiaxjSZGA/132', 'oop8g5e_6F7c5PBKCiKTR17Ev7fc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('118', '美好的回忆', 'https://wx.qlogo.cn/mmopen/vi_32/kmWUbtk6NM5EicLTUxoK6ib6BQkNmceefp3rbBGiaib4pIK9pAUzRwbnbX9PIJBb4Jama5XwyPicTCuyajp16seVTOw/132', 'oop8g5evJ2Dmv5N6r1KwNXxyGc0Y', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('119', '壮壮', '', 'oop8g5Rbtw5wBqKKdvuxbuFKmeRQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('120', '付艳辉', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB0YU09bBbHXXiaerSX9agYukI2sibvL0ZhUiaS5S94CYwTRCkFePauP5vw3AhYW0Z2vv4ibEQRny6Vg/132', 'oop8g5SM4x2qwm5YV1sJG1OL1JPo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('121', 'Ding', 'https://wx.qlogo.cn/mmopen/vi_32/TUGjuXuy7tRicl4YhBniaW5hPKz9RCPdSSbGib2oejJS1rcnibic16SQpRj7weJPFo5J8gicNia8pSZ5OkONcd5fH6YSg/132', 'oop8g5ejJ-ezU8MGfbz65XR-ej7k', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('157', '胡冠儒', 'https://wx.qlogo.cn/mmhead/JV0aysk7JZKddibEnNl7SG5VDsu5MvxxCG0373ic1BBZ4/132', 'oop8g5cJSuQyuvOIdTEvziGZwZao', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('158', '宋丽彦', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrptJd4DQulFd5L9zzkSfcGgP4fWTcSicVL7GF6DGuuEOrlI7lkJ1jp3L3cqXK9T66G6kICpTvU0Q/132', 'oop8g5e_Nx9sGzjbEd0WYSVcbiz0', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('123', '一口甜y', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erhMAS1sehHaH2ePXX427MibqyibXBgPZxo9kRsoTpCr57ls8ROjHsxuaG1kOBHeDm20wFRd1RoEUAg/132', 'oop8g5QoK-ISh60pW9ZbDESkBtGg', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('127', '王翰欣', 'https://wx.qlogo.cn/mmhead/yc7Lfic8q0I4sMibvyaK3j8ia4fmq0yvf1vDicxtD6G4fXs/132', 'oop8g5TeF4mDvU8N3UOiIVqkmaus', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('128', '', 'https://wx.qlogo.cn/mmopen/vi_32/EuTSzOwYB78k3uWeqWMIQLeTWrNdPnZRvYBS34pHOAb9m29syzHUgHTopXZYNrC9V6sDAn70P8VialheaPFqx2g/132', 'oop8g5cpgMa2geafYLESYSQNUhsg', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('131', '红红火火', 'https://wx.qlogo.cn/mmopen/vi_32/dAkTIgz3sFpA6B335TxnbFUiat11929C84SJBd2qy0l3YAMLic1Tiaz5fLfG9icTqviavBWXFSo3B4q8icWNjsOjpe8Q/132', 'oop8g5Qrm5pf4rhRgxRpUhhk-VFM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('132', '健康幸福', 'https://wx.qlogo.cn/mmopen/vi_32/DibSZlZfEHibdnesHic99VyXZZsSdmVedrtY8gZjBu9xAK58IhJ7VY3SrAtZNcvG6R1fyVyQBaC9HCTHYAUKvBxPQ/132', 'oop8g5WFiVdlTiJyhsTtPQWVtHFE', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('133', '雪糕', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBWpcnG3DkWWxa1YyyJ7peLrTABkwtJuLPEicLT1E8mkAYNZDlDVUoKzf2RMaibDiaSL2G8WSAUyFeA/132', 'oop8g5S0zzcnisAn0HDAKEvw7x-E', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('134', 'Leo', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJsek8LQh4r7WYEft5JEQcvuZmxb8JTbYMttFJPSoyZogrNSyKJJHicgRlxI9pd2tibnDsJShVh1Jvg/132', 'oop8g5QUK5ocDdeiRwUiLGZe1hTU', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('135', '曾雪钗', 'https://wx.qlogo.cn/mmopen/vi_32/ZJjl8bEt5ze4KT6ibsia8r8xozJmBmqlfh8Hpz0PxxFHoq0XbAZxGGBy3lZ6Waibh54v8caKhoc5icJRsgOQRfPhyw/132', 'oop8g5WmWDWTQ9dng_mZHqoxgIF4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('136', '三只乌龟', 'https://wx.qlogo.cn/mmopen/vi_32/R8dlZDVg1MqpBGpozjf0iaia0ePGiajeKhQRSAiaMSSQYDa8PJdiaAP3WIBDuiah6ynyYvFw9uwibCyWnwmGLYslJibc7A/132', 'oop8g5S3rpNudX6GWHiYhIjXDG94', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('137', '风扬通讯付冬梅', 'https://wx.qlogo.cn/mmopen/vi_32/IeSst98UknBzatZwX88OY0t7T9rP0l0vNkYtjBb84Zhc3p04WJ2ZxGqM9wZXjajTmKvyFL019XiaXwAnOFe510w/132', 'oop8g5dGWBmk2INHYHTrdyU4cnuw', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('138', '晨雪', 'https://wx.qlogo.cn/mmopen/vi_32/ia8xNOWVMgqicXhgXViabotPMl5qjFKf7fAo0lO0MEhiaHUOEJ27OunY5VSFCkiaSJLh3KCnMScxfVRB9fQ5a1fw3oQ/132', 'oop8g5Z80v3Ugy0qlBLdWA86JcVc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('139', '黄俊', 'https://wx.qlogo.cn/mmopen/vi_32/3s7Q2RogIqsddj6Q5HDID4HjsZdAehmqOmx9czpeK4969EgVc3fKJvTdpYxib3UfJCcRictSxfOAbKGEYezLTYxg/132', 'oop8g5RpH7w7O80vWk_vzgt8nA74', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('140', '月亮笑', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJbVpIbg4ibmglxCPxpdXCA3E08rG66aWS8PkibCKd7ibN999zZXuaq7ljt6BVXTibjNSl1icaoosSaGEA/132', 'oop8g5R3bkTQv-y0bibUwHMsicVo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('141', '臭臭', 'https://wx.qlogo.cn/mmopen/vi_32/RJW8JW0UWm5wfX9m4WPDcx2V6qde8Hichw7OmtXBm3tJe6eTibk1ZNEaP0MO19lw4xib8C0VUXIVSjFboIf4q3tMA/132', 'oop8g5VHZDgP9SU3lx8axtk-FlPM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('142', '王静静', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB0YU09bBbHTfPSW32icVJLFhHroib1cssE5BRlzpLibzuzMQkLjUbp8BjdePdggK9SLvic65Ft2wmOQ/132', 'oop8g5eR1SigKSHkhUsb3HkDNM-c', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('143', '自产自销洛川苹果', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLA430X8bQib2icUicPE6caz6YeJHic2or7qSUXdulXx1jROx1UFK9J599KNgictIzA5BGRWn7PnTiaEMLDw/132', 'oop8g5bzaC0XDxyQ9ElO-t9WXAPU', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('144', '孙晶晶', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqBfaz5xkxWJJYwHAOEosjw6L5k7hkpCYuCAbM0iaicp4R8ygfUUot4xICib2tAJDFCNmWxeBJDjmwdw/132', 'oop8g5WFWxj6zf7Osqhe7EzoGELo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('145', '', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eprCUrlTgJeNjYMwTCV67ZD294CgtBic24Zn2o1tncCSGR6akoZqrRHEIztSX0PE7bcWQRYXnfVAicg/132', 'oop8g5UIp7e3TkvJ-DsUKMphtaZk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('147', '浰浰', 'https://wx.qlogo.cn/mmopen/vi_32/AIJiayPMBjPt6cOuTgGqiatGZlOqfIZBkG9ib9WMuXic0QlzqPLbz1xJWS8TzTACxRLYABqfcgAuVNU0dHPdtGJ8ag/132', 'oop8g5Y4900ue2q3hLXuOAlBs-SY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('148', '谢美思', 'https://wx.qlogo.cn/mmopen/vi_32/XwtLNH83BWZ2V3EzRSVu7AEeicTKpiaaicUz6NBCl1iaqeLJOJ2ApL5OVYr59hMh0qCsOTsHClCYcGxVoqn8U7kwJA/132', 'oop8g5Xn4g0n0YMulmwqv-ctL2Rc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('149', '', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIDYqzfjEgiaI6ffVUKPAskJVVIibetRNq8qkax4dPCias2WNW3ONdcefo1tL8y01zeGJfnhQiaf7v5gA/132', 'oop8g5Q57jr29j5xFZPuPgZc3k5c', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('150', '高鸿雁', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLfEHn9tNgC9JYtX6xGOMtcIiahNRfx42dicen7hTvtGVf3k5xfvV8fh0b2mUIwia5HO8YNKcquYMbXQ/132', 'oop8g5by_q-7O1p6vrUP0pHMJgvI', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('155', '许春侠', 'https://wx.qlogo.cn/mmopen/vi_32/MKFCy99d0QmWX1y8CKh8CqsUEsOumibbg6ianAp1IPkicTLmnLMj5odbODohPrwZEaUBo7UBQu92oPG6ibWYSuUUTg/132', 'oop8g5S94J1p1Yabj_bvkS3a7O4I', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('159', 'Mr.Zhou', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmiaXFTaXFhoUbLxdtcadJeJE2Tib8ygkBkDWbPIT7WhP2mkloD66s1Ot09KPwg33YahW7GhPjTgWw/132', 'oop8g5X8ULbblInZKQlsD4gr8zfU', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('160', '胡永娟', 'https://wx.qlogo.cn/mmopen/vi_32/Pz0NPda7iacyCd336BMA0LaFksuia6YemNS38iaiaicalwTQxOsia6ZRibXlEbozU4szYqyavs4Mmc2icWNG6ufXkSicQWw/132', 'oop8g5fMDxr7ZJHXwnDUi6bmj-W4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('162', '张雅斌', 'https://wx.qlogo.cn/mmhead/BRRnVx6bgJR9r8ROyPEzfg5HljbmvL5myib3Ub5T6hLs/132', 'oop8g5dkHF8pmEpkkBamdDTABBXo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('163', '新建(NUTS)', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJtC15ibWsOeAWKPic5Kj3qoQ4U7XB20FfCFMIZgNf6Jc6BQz5VfYIURAVqsDdAY1deGN99UmcpbNPQ/132', 'oop8g5eCq9zsuDxp5ztJ_fU5cePE', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('164', '创 客', 'https://wx.qlogo.cn/mmopen/vi_32/8hJGrn9G6Fv0VFrzSsP0puP4CNwTFQ2EcMzUIh6GFmb1xJQLtjqyCA3ib19RFroXbkteOUTqgB1UG9Ess1xypicg/132', 'oop8g5WbeeyGQVg2NE7qjxEoGTs4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('165', '阿pong', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL53ib8spPz3y67PDpb2fUQmqfRiandM1aicjRJFz1UIVKyxYDWbJUwIBh0ccvM9KWhdg5sN6j2ZkkEA/132', 'oop8g5fZCHLTe431wHwGqJl7lHGM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('166', '荣茂梅', 'https://wx.qlogo.cn/mmopen/vi_32/OSicKMDUd9yy5PTMGMRgYZlYOqBMicCQ9NXsEG65hj0ia81EY4SibTFRicyynYibl97KeWn21AZlKfibewzuCicF15xaiaA/132', 'oop8g5aVS6y0kKP95kK90FEzbt6c', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('167', '妙山清风', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epvcxU9ecvBiaX9TIT8wguw92T1zHrwMXnSoB9UwZ7BmGmsOq6hNy9vmGZatNuuEJpfOnukxGRwm6A/132', 'oop8g5TNOPGtwqilwmxbyrAFAuEM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('173', '钟宣', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFTeJnEmTMcj41VmMSh2gHkeYCyfPdjsQBTNk7UHsWOJOh6jYx3BB03OWmQywj2d6BpjMXCvVqAg/132', 'oop8g5f-l2jDTWCmj0q7BJCJCAKA', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('174', '星', 'https://wx.qlogo.cn/mmopen/vi_32/8OPzdpDraQMSveEicjIUG3N0IlxnicuXNXxUqbbkE2ssXHHfxUXAJoeZWbickIwH7sxwkXsMMHhlYLI1W1nBdlC5Q/132', 'oop8g5cpD5ZgQRh4urvz3MZxVvEs', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('175', '陈英', 'https://wx.qlogo.cn/mmopen/vi_32/OkFdlgbIcS0U523J0uFRImM0J3y693DD6pzWfau6iaj6cFKqBGTic1dib4MdhibPItgMBhs8eiawLP9SIewGSEIkebA/132', 'oop8g5WSfXhLxk0PepMqqZ_AUieg', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('176', '叁个好事多', 'https://wx.qlogo.cn/mmopen/vi_32/ibo2BPicibiar12iapsBhxPSvh1DjVO0NEYJdvkxib1icZM71IVRfDIgaGcrIpL1VsfWrU2frib7ypmmdzhoKnY9iaV6SAg/132', 'oop8g5d0M0v4gHDCaky2ADiv7qc4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('177', '繁华如梦', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicx2wofzeViasJpUOd2HP4p3iaQMonuh0CCOgPCxd8D0qGNqibhiaC1dliaxXKmY4WuVS6EH4Vlkm6cNg/132', 'oop8g5ae7fCW4LYDzIFo-skvck_Q', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('178', '王建华', 'https://wx.qlogo.cn/mmopen/vi_32/lVH9BqH0cH7mvPJfYJKllicQv5AvYLhgOUqDPITvIE5uAlKiaeCF9Kxc0JopvXf9rVvyWYgubPsibev7ND5V1dWXQ/132', 'oop8g5aoaS3LtUH-IsfXOybnGU0Q', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('180', '颖子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIHVJWerjRqtY3qyFBibzL5Co3b6YvaicPHtuDkxmtGdyOMLShDvLXE5aDiaDyOv1AbbkRl1g91SI2pg/132', 'oop8g5RIaEw15lcUeezm1D5wwo2U', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('181', '李若愚', 'https://wx.qlogo.cn/mmopen/vi_32/73waRHFiaA0kmxHWia940VT9dBjZNvTujcaeNpQ5zLPyemGf4wTNwReKWQ6nuSBaJqfib1flbQ0fEk9S2xPQ3Ribibg/132', 'oop8g5es7hUwVv6roVRGDlYRpOZE', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('187', '陈致希', 'https://wx.qlogo.cn/mmhead/KGibZnZyTbMvia3vye6IMXy4QFhNp7xx0PtfzftmqsibvQ/132', 'oop8g5Z4sAWn4EhwKu68M21KM9dc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('228', '任祥祥', 'https://wx.qlogo.cn/mmopen/vi_32/QG0FScwUg4RzgpE6VKr7lModeeZgRgaMMkPAPViczIfnfg5Y7IXVKbntSoTxk7JHkAurqnIku8rAiasiaFUzsbgdw/132', 'oop8g5VUU8PmquuQwS600JexVWeQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('198', '微笑的果酱', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIEHj7ZgKu0JsAdFnYjd1dicKD8MqGybn2nZKOoiamXdIG6KAG7Hl7tZibNLWjjia0bibNHNlibT5OPpfBw/132', 'oop8g5bzD-BTw6M_9Rh0x7qVPpnk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('199', '新年快乐', 'https://wx.qlogo.cn/mmopen/vi_32/Sib1gG1ib8szog4SxS5UEVAxlFgeQ3n8lLyzs7sv8gcQBRSguZbpeyZts5oesePibiao4h7tZmojOzwOfjekWRjo3g/132', 'oop8g5V5FHAyk_9eIscJlLFrwotM', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('200', '小娟', 'https://wx.qlogo.cn/mmopen/vi_32/0LEgVDPlaicbcPiblia90zjoTTiaVAVHZFTsOrZj8E8pupN3qhUibNiaelNA5I1w9tzqVrqruucA00HSMP38w4yzJBCw/132', 'oop8g5US9SzSYErsMbY-5LMyn2YY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('201', '林中鸟', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTItCria0f0ic6r8CXKhNv9zhGjzEQFtBarKX4qSeYjia8qtWPibKqO9Yrnh5op6t5x8OPwmaq7iaKcTuhw/132', 'oop8g5caWAsFA066ahN1BZ8z4ZWw', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('202', '磨利玲', 'https://wx.qlogo.cn/mmopen/vi_32/c8gxVbbJtPNOq8cHEqouiaIDVSCUtzd0Am7CrZqbdOica0dxRMSAgqlqibR6ibicoTUOxl6BzKysiaicAACXuwzVWv5QA/132', 'oop8g5VGF7e6VxKjOcTSFjybr2MI', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('203', '孙懿明', 'https://wx.qlogo.cn/mmhead/hIpnakwuBP948DAY4f22Yaw93QRQzQa0JaTcZWBeJS8/132', 'oop8g5YDlum2oRu2COLVhTodsidw', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('204', 'Accommodation ', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicolSGjKOBcwCicwqNRCkJpr0Knl2xib6y3Q3oiaibnSBSM22zeMiccjJkygVsl7x98JDXYniaGCGhGAFw/132', 'oop8g5UYU--pBTPIDYo77Wj0ZYX0', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('205', '翟南香', 'https://wx.qlogo.cn/mmopen/vi_32/Uz4l56e0hbTTyyAXY9a7BaOBV5ZDPTbyOyOLZGhvVynfwk4R1zZHTbWR4ZcbDPcObDeEJogY6ZTPHdqticPibia7A/132', 'oop8g5euUgQmIMTdji22YhcRFjiQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('206', 'Amiula', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epz0g12Lh88AicuJxjqMDIXEKdcTo3C5mIrEWhic8VQbsPxeuLicwMqnv7PSN7GGbcOoobtZZ1SUWLIg/132', 'oop8g5WwBOePeoYFOnxi-wTYsd1k', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('207', '欧拉', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ186jN6G1nEBdIyCXrHhEwPv4Ab5NYFAB8gBahQjL94l7G7FMt0PdzpiaDuMDcwlUW9SRWfEDc8fg/132', 'oop8g5d5DqLHGQ_eVesg_xMEOLQs', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('208', '吴雅玲', 'https://wx.qlogo.cn/mmhead/0ib5HoSuFcTJynSBib3a71qnMLfThNQicRdJACkhbLLJjY/132', 'oop8g5WC503AqehAuOyR3J5r8-EQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('209', 'MU大有-桃哥御用厨师', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLS7QQuXIVTYm3trw0b5U95SMA3WgZU4Q8BubncQUr0WibbGGC6JbnQQlCmwrX7wBhfZmXIgBO5KJg/132', 'oop8g5aVLtwlxiqsqsWem9LStn3M', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('210', '舍', 'https://wx.qlogo.cn/mmopen/vi_32/Pzv1eCQgwPvsEbrIiawvLI3wXvicxzClhVRvfSqn29lwXTwhnKUoiaI1tElicKhiaOqKiakzsiaTcqKoS3TqLEvk0c8og/132', 'oop8g5ba-_-3sWq38f9zuqC8yWkQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('211', '微笑的鱼', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJV8b5F5w9TRoO8Blr8LPUQJqiaJUuibaicgvxg7AJSYcibIKvqjqVzrwgQeNK6M3ic194bzDxicwZKTCJw/132', 'oop8g5W0VTnQ4sz0btik22GxcZwg', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('212', '辰辰', 'https://wx.qlogo.cn/mmopen/vi_32/Yg8RuiaI73o9chQVKpPKYndxMVWUuCgFDcvrzHC2hTyAEDRoyJib5UrZDmn2JshA8c682WmMSyLNnVSXNiaKejRFw/132', 'oop8g5ZXHKE4GR4RP8gLjGhB4UTY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('213', '开心宝贝', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq3D9cibia4duiclKdK1icE7XFA594FG6OvO0Vn2giblscNMNfXa0Ncdl1XgjBRpeffcLvpx5UZlwE9QmQ/132', 'oop8g5XCjiBi6zoJSRvQMWUVR19A', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('214', '张翠红', 'https://wx.qlogo.cn/mmopen/vi_32/FflZ2nuJwJwxhYmvtMZibibibgNxpNqClyH7pZy4qlY4320iblA1zkia7ZgUuiaaT7t0WMaJjqIzMHFaVVLDAqtzFOtg/132', 'oop8g5aiy5qQcaBpDRdLK0Wh0DVo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('215', '郭雨诺宝贝', 'https://wx.qlogo.cn/mmopen/vi_32/ygEHUg70p4SHOFshghmGD3PxWqWYB1Lv5WRW90gEOkCSZGzGic2pohd36LPibjKZbovMfeUAFZF5O4YzmYRBM4Iw/132', 'oop8g5b0Hex_1IgI6qGv4pjZmfhI', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('219', '颖', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLCI6nrsia9EBA3SyCxicI9EOgFBiaOzbL3BIVb70RYDdx3ayE3icj3PINTbJKicgXY2rEFEemMicDiaFfEWg/132', 'oop8g5alRmW2m9pOZxRqC_-ZSt10', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('220', '鲸落', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLsqW2H92sh7IhsVot1SzqoTibxoKU1a2nF6qg5FmpTXI86cyspzSUwzHM0CeQuLHwCDD0APXx0QGQ/132', 'oop8g5foXIQO5FGb-rqWKeSPi1z4', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('221', '红叶', 'https://wx.qlogo.cn/mmopen/vi_32/J3LsuibCqACv9jffiaVZkNVeBcTiagXp2DJnOMMY7OH8fImLdcfqg0HJ2ksufzULw9pv3aNhLmaRvQO2wyGcO7Akw/132', 'oop8g5Y9639ubiSq7pXYASeZI7VE', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('222', '凤尾竹', 'https://wx.qlogo.cn/mmopen/vi_32/6tsEcLOlIk0eoj4WWicSPYE4GRLxbKZ43e9yBCXxTGa4uLh8OPibYngY39dQY21XVybeHGKIOafXTOQjMficayKkg/132', 'oop8g5XY8Mp1ydX9WBsYESRZoTSQ', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('223', '一粒玉米亿欧元', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epiaRyfNYY1iaWZUNCmiaApmXh145j33bLyF6XBNKbF2yiaHH8448lMGlT9nTAiasicENN5QPl2HLFO8Gzg/132', 'oop8g5fnyrBkiQABsuXMTrWqidXA', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('224', '陈惠群', 'https://wx.qlogo.cn/mmhead/99lQgDiaYrEYeQ7oZIH0aJT4WUDibjKmprFCr20Giao5nM/132', 'oop8g5bhArjjnyssToyAEh3LtDko', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('225', '美', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImcXdkJb1qy3y9gKwAKic36QGOu33xFBKmWovbVLXZ4wzU7Dic027ia9gM1xfWsUdibc81Fwnn1tkibyA/132', 'oop8g5bz07Q2gQrDatVhr4U8vRIY', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('226', '一生平安', 'https://wx.qlogo.cn/mmopen/vi_32/pBmbsoeTVxENRznjxHAPSzcNqWKEhZEyINuPsYGdWHIxjSlNr4hicibZicLmicibuDab9gydDwtic0jicQwt7DicZQPUsw/132', 'oop8g5eEsCWWKiwRETr99T7-aXV0', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('227', 'ζั͡ ั͡夜 ั͡✾', 'https://wx.qlogo.cn/mmopen/vi_32/pAYWTEE1hybos51QRZ3o7yDsC7OSJTnyCib8ciamcPian02UGicGQL3Kx1eASsibtiaEyybt9VwHtSKUof50AWZOAZvg/132', 'oop8g5Wi_20Pkz_vNrpp6DXV_dQo', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('229', '35205李德坤', 'https://wx.qlogo.cn/mmopen/vi_32/7rfcNJXUJGkqke9tOVvLYDAL8Ufib2601geOCmKFjtibkdOhHm6lWGI9HWQ35hUOiawNicYhojjslibaCWgvpmEUE0g/132', 'oop8g5eKrjxt9D9Vy9NOzD1lyxes', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('230', '小菲', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKHwS7n9u3oVg8ku0vDRMyLGvP82zU86FvGeqsrCrL4gP4qZeGqibMwNY7luSMUtWhiatnSGHjh0xibA/132', 'oop8g5cOWtKC6aYRTDynHyNVNH2k', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('231', '哥仔', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLl8Xd4ygBePKX5LGoHURJgjMia2V0zqVgn6rWDjsPrKCp8nXpR6fdu9w0FewiamnvQ7tfjs6ib4vKJw/132', 'oop8g5VVoFPF-Apml8AwstyTi4Gk', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('232', '周丹', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLF5ibPQLyWUeIm3etICibBRRhcWa7pibjuYrBGm1JDJ1fric5k2WnWQgvhdVA2tZcJNeyqkOZs8CweWg/132', 'oop8g5TFY70p7hB71xRLH-7Bf9Dc', null, null, '1560200206');
INSERT INTO `weixin` VALUES ('235', '心态', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJzerWVMvwVmHZZcAyEdAvHzuV6iawia9EBu2cYibyZulkgrNjafHwDt7gZXcmN4VRsPiaibxgbvlbbWmQ/132', 'oop8g5cvZMdT4yd6ldWsGs9QV29k', null, null, '1563417490');
INSERT INTO `weixin` VALUES ('236', '金娟', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eom3ZBvxbnhULclqGSsE0ABMyChmdibfm60bmywZELiawKn7tzuRupZz48IztKegsFbiafZwtuAYWhxg/132', 'oop8g5SCx0UNCm-ynnTq2A-2Couo', null, null, '1563435980');
INSERT INTO `weixin` VALUES ('233', '', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJIfUia7mFPkq7nibicn4HG2CDHtK2kdfN7W2wgAOeUqneqib1WXg5SFH5FR5HpIk4NVQibkNlOlT3ibCEQ/132', 'oop8g5ReRqBKlLNtNmJlB0yC216I', null, null, '1563324606');
INSERT INTO `weixin` VALUES ('234', '', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq7FzOnrkJ8nj4tb2wrFcrYBhicbEshZfPMzAOA0VptZibdiawOSJiaPdhBN0jsPrGRRycLzxue4HuF7w/132', 'oop8g5YnnVVz_m6ofisAnDDj9CL0', null, null, '1563416983');
INSERT INTO `weixin` VALUES ('237', '奇奇', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdJRI1tJBvFhZgxDyh9UebicWzWIaIsd9ibZFaiaNZicZ3KicBocbGicdeic9xVEgIAVdy6gzXO0KUiaRHdw/132', 'oop8g5esDsHSEAdn1KDaSov34OHQ', null, null, '1563436660');
INSERT INTO `weixin` VALUES ('238', '果果', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEI5xS5dECIBHgKRzgTcwEE7x3pT3Tu86tiaqn7CylUhNWSmnP4q7wFSwMncQSeNcOLFMQqOqoz06zw/132', 'oop8g5QadWj3_LfhGz03NyvHVWJs', null, null, '1563447434');
INSERT INTO `weixin` VALUES ('239', '玮玮姐', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOP1jrgYw1QMfq7icOvRMpjJ3ibcmY0JCibFFD3cMKIaFkUYNjBkyicpKia7qAo3TbsxAdXKFiaLnNGCmQ/132', 'oop8g5fEVITwHQQ6PGI0etBcjh4o', null, null, '1563460462');
INSERT INTO `weixin` VALUES ('240', '开心', 'https://wx.qlogo.cn/mmopen/vi_32/vAVuY5B2JkZSGAd91yMz9of0K3491D0W6AQ4rDlTw115Ew5OGVxwPQNeDA4upmFSqO2BicickZBLE2VpuxWhXMiaw/132', 'oop8g5TZV-A090bLgzGYKsLwC2_g', null, null, '1563500158');
INSERT INTO `weixin` VALUES ('241', '老酒馆的猫', 'https://wx.qlogo.cn/mmopen/vi_32/zSyIGkyic40COZCf3FeTXibWoTgRiaEYcQ1BITuBThDmZH9kZgSibvF9JBfnbWk22NbiajILwkMicbibFT9MlP8vibC2Fw/132', 'oop8g5Vuyj4UhVrsIU_ZotT0HVC8', null, null, '1563507517');

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `work_img` varchar(255) DEFAULT NULL,
  `work_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fromid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of works
-- ----------------------------
INSERT INTO `works` VALUES ('190', '89', '18', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg6464142620', '1562314122', '1', '8503af6bd23a4c21a839545e66ebd30b');
INSERT INTO `works` VALUES ('191', '168', '13', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg2802306484', '1562314511', '3', 'eea11a15ba7b4319a2c30058a28eaf58');
INSERT INTO `works` VALUES ('193', '167', '15', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg6703769119', '1562314597', '3', '137499d2740d48b19d397184a3571ee8');
INSERT INTO `works` VALUES ('194', '169', '15', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg2451193802', '1562314622', '3', '836503bd2f894d2982a516313788ce9a');
INSERT INTO `works` VALUES ('195', '194', '15', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg2077978386', '1562586936', '1', '43b713e2104d4decbb312ffe0f51dcbd');
INSERT INTO `works` VALUES ('196', '183', '15', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg2807854558', '1562587061', '1', 'f165425ac7624edd9c05dac1d1321abf');
INSERT INTO `works` VALUES ('197', '201', '25', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg46470053', '1562640568', '3', '28b9084e620b416595c96a2cdfc24132');
INSERT INTO `works` VALUES ('198', '199', '22', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg62838844', '1562642380', '3', '847c73ab29564ece9af39d7f18c16eeb');
INSERT INTO `works` VALUES ('199', '122', '14', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg9772369842', '1562649894', '1', '0733a6d51505489d91b93897fe0e3997');
INSERT INTO `works` VALUES ('200', '237', '29', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg190334718', '1563159678', '1', 'b7e924aa9d634646a1dcddaaa7fdac4a');
INSERT INTO `works` VALUES ('201', '236', '29', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg8462890053', '1563159829', '1', 'e1371e2df2194e51a6a99eed81619b86');
INSERT INTO `works` VALUES ('202', '237', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg3180292507', '1563160049', '1', '10b2b11c890b456f8725743f60adaf07');
INSERT INTO `works` VALUES ('203', '237', '31', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg6492348244', '1563160208', '1', 'acf2573fa3cc45d196ab8a5504c8007a');
INSERT INTO `works` VALUES ('204', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/png4812250508', '1563160473', '1', 'the formId is a mock one');
INSERT INTO `works` VALUES ('205', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/png4812250508', '1563160522', '2', 'the formId is a mock one');
INSERT INTO `works` VALUES ('206', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/png4812250508', '1563160536', '2', 'the formId is a mock one');
INSERT INTO `works` VALUES ('207', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg6937951708', '1563160611', '2', '8ef855e9b74240d9b2de680642324f3a');
INSERT INTO `works` VALUES ('208', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg1095459493', '1563160631', '2', 'ff57ec680de14168b1489ec6c1fd5fb2');
INSERT INTO `works` VALUES ('209', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg5621999595', '1563160652', '2', '40e47cd1dc53403080a9927337bf22ec');
INSERT INTO `works` VALUES ('210', '236', '30', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg840715418', '1563160679', '2', '7354c4aa96dc48df831005ea91d49b0c');
INSERT INTO `works` VALUES ('211', '236', '31', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg63345867', '1563160757', '1', '6416b739fbe04fe89da87cf12438b9a7');
INSERT INTO `works` VALUES ('212', '237', '25', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg1264117851', '1563360101', '1', '41eccb631185428c8c4b032d4f93d5e4');
INSERT INTO `works` VALUES ('213', '203', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg5067699619', '1563418734', '3', '1034cf6821584ca3a510f017a6c7c571');
INSERT INTO `works` VALUES ('214', '122', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg9876471785', '1563424310', '1', '2581628147744ba790331a86a00682ab');
INSERT INTO `works` VALUES ('215', '122', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg8081062491', '1563424331', '2', 'beb3180c89b5457fb2abdc9e20a3f2cb');
INSERT INTO `works` VALUES ('216', '122', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg7981421338', '1563424342', '2', '18a65117704d4f468dfbbaccc5504fb1');
INSERT INTO `works` VALUES ('217', '122', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg2563467292', '1563424371', '2', '9b3747a071af4fe5be6222092a0d9cd1');
INSERT INTO `works` VALUES ('218', '203', '27', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg873275889', '1563438569', '2', 'd957cf8339714158a083121196298655');
INSERT INTO `works` VALUES ('219', '236', '24', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/images/jpg9997906572', '1563465811', '1', 'bd60e14e4d6b48c4be32214f2a7ff312');
