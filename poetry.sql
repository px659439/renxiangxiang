/*
Navicat MySQL Data Transfer

Source Server         : poetry
Source Server Version : 50562
Source Host           : 39.105.163.231:3306
Source Database       : poetry

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-19 19:17:45
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
INSERT INTO `admin_role` VALUES ('27', '19');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `class_author` varchar(255) DEFAULT NULL,
  `class_url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '九月九日忆山东兄弟', '李白', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/video/C%3A%5Cfakepath%5CC+-%E8%A6%81%E4%B8%8B%E9%9B%A8%E4%BA%86.mp4', '1');
INSERT INTO `class` VALUES ('2', '静夜诗', '李白', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/video/C%3A%5Cfakepath%5CB-%E6%88%91%E7%9A%84%E7%94%9F%E6%97%A5.mp4', '1');
INSERT INTO `class` VALUES ('3', '咏鹅', '骆冰王', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/video/C%3A%5Cfakepath%5CC+-%E8%A6%81%E4%B8%8B%E9%9B%A8%E4%BA%86.mp4', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cour_id` int(11) NOT NULL AUTO_INCREMENT,
  `cour_name` varchar(255) DEFAULT NULL,
  `cour_type` int(11) DEFAULT NULL,
  `cour_desc` int(11) DEFAULT NULL,
  `cour_img` varchar(255) DEFAULT NULL,
  `introduceimg` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `price` int(11) DEFAULT '0',
  PRIMARY KEY (`cour_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '《古诗30首》', '1', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190625150151.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190625153248.png', '《古诗30首》《古诗30首》《古诗30首》《古诗30首》《古诗30首》《古诗30首》', '1', '30');
INSERT INTO `course` VALUES ('2', '《诗歌》', '2', '1', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190522165044.jpg', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C21%402x.png', '《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》《诗歌》', '1', '50');
INSERT INTO `course` VALUES ('3', '《儿歌300首》', '2', '3', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C5.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190522165044.jpg', '儿歌三百首,唤醒人间真善美.', '1', '20');
INSERT INTO `course` VALUES ('4', '《唐诗300首》', '3', '3', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C9.png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C2%402x(1).png', '《唐诗300首》《唐诗300首》《唐诗300首》《唐诗300首》', '1', '100');
INSERT INTO `course` VALUES ('5', '《宋词》', '2', '4', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5Cyinianke%402x(1).png', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/img/C%3A%5Cfakepath%5C%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190625150151.png', '《宋词》《宋词》《宋词》《宋词》《宋词》《宋词》《宋词》《宋词》《宋词》', '1', '60');

-- ----------------------------
-- Table structure for course_class
-- ----------------------------
DROP TABLE IF EXISTS `course_class`;
CREATE TABLE `course_class` (
  `class_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `desc` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_class
-- ----------------------------
INSERT INTO `course_class` VALUES ('2', '1', '2');
INSERT INTO `course_class` VALUES ('3', '1', '3');
INSERT INTO `course_class` VALUES ('2', '2', '2');
INSERT INTO `course_class` VALUES ('1', '2', '1');
INSERT INTO `course_class` VALUES ('1', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

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
INSERT INTO `node` VALUES ('57', '课程管理', 'Course', 'course', '0', '1');
INSERT INTO `node` VALUES ('17', '权限添加', 'Node', 'node_add', '1', '1');
INSERT INTO `node` VALUES ('58', '课程添加', 'Course', 'Course_add', '57', '1');
INSERT INTO `node` VALUES ('59', '课程展示', 'Course', 'course_list', '57', '1');
INSERT INTO `node` VALUES ('32', '更改管理员状态', 'Admin', 'up_status', '12', '0');
INSERT INTO `node` VALUES ('31', '管理员删除', 'Admin', 'admin_delete', '12', '0');
INSERT INTO `node` VALUES ('30', '角色删除', 'Role', 'role_delete', '7', '0');
INSERT INTO `node` VALUES ('60', '课件管理', 'Course', 'course', '0', '1');
INSERT INTO `node` VALUES ('61', '课件添加', 'Course', 'class_add', '60', '1');
INSERT INTO `node` VALUES ('62', '课节展示', 'Course', 'class_list', '60', '1');
INSERT INTO `node` VALUES ('63', '编辑课节', 'Course', 'editclass', '57', '0');
INSERT INTO `node` VALUES ('67', '课程删除', 'Course', 'course_delete', '57', '0');
INSERT INTO `node` VALUES ('65', '内容管理', 'User', 'content_list', '0', '1');
INSERT INTO `node` VALUES ('66', '开通课程', 'User', 'content_list', '65', '1');
INSERT INTO `node` VALUES ('68', '课程课件删除', 'Course', 'editclassdel', '57', '0');
INSERT INTO `node` VALUES ('69', '课程添加课节', 'Course', 'editadd', '57', '0');
INSERT INTO `node` VALUES ('70', '课件删除', 'Course', 'class_delete', '60', '0');
INSERT INTO `node` VALUES ('71', '课件题目编辑', 'Course', 'classedit', '60', '0');
INSERT INTO `node` VALUES ('72', '选择题', 'Course', 'class_choice', '60', '0');
INSERT INTO `node` VALUES ('73', '填空题', 'Course', 'class_blanks', '60', '0');
INSERT INTO `node` VALUES ('74', '朗读题', 'Course', 'class_read', '60', '0');
INSERT INTO `node` VALUES ('75', '课件题删除', 'Course', 'topicdel', '60', '0');
INSERT INTO `node` VALUES ('76', '开通课程页面', 'User', 'courseall', '65', '0');
INSERT INTO `node` VALUES ('77', '开通课程', 'User', 'opencourse', '65', '0');

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `option_if` int(11) DEFAULT '0',
  `option_type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `blanks` int(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES ('26', '10', '1', '0', '3', null, '1');
INSERT INTO `option` VALUES ('27', '10', '2', '1', '3', null, '1');
INSERT INTO `option` VALUES ('28', '10', '3', '0', '3', null, '1');
INSERT INTO `option` VALUES ('29', '10', '4', '0', '3', null, '1');
INSERT INTO `option` VALUES ('30', '10', 'a', '1', '3', null, '2');
INSERT INTO `option` VALUES ('31', '10', 'b', '0', '3', null, '2');
INSERT INTO `option` VALUES ('32', '10', 'a1', '0', '3', null, '3');
INSERT INTO `option` VALUES ('33', '10', 'b2', '0', '3', null, '3');
INSERT INTO `option` VALUES ('34', '10', 'c3', '1', '3', null, '3');
INSERT INTO `option` VALUES ('35', '11', 'A1', '0', '1', null, null);
INSERT INTO `option` VALUES ('36', '11', 'A2', '0', '1', null, null);
INSERT INTO `option` VALUES ('37', '11', 'A3', '1', '1', null, null);
INSERT INTO `option` VALUES ('38', '11', 'A4', '0', '1', null, null);
INSERT INTO `option` VALUES ('39', '12', '1', '0', '2', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/sound/C%3A%5Cfakepath%5C11705.mp3', null);
INSERT INTO `option` VALUES ('40', '12', '2', '0', '2', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/sound/C%3A%5Cfakepath%5C11705.mp3', null);
INSERT INTO `option` VALUES ('41', '12', '3', '0', '2', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/sound/C%3A%5Cfakepath%5C11705.mp3', null);
INSERT INTO `option` VALUES ('42', '12', '4', '0', '2', 'https://kkmandarin.oss-cn-beijing.aliyuncs.com/poetry/sound/C%3A%5Cfakepath%5C11705.mp3', null);
INSERT INTO `option` VALUES ('43', '13', '41654866', '0', '1', null, null);
INSERT INTO `option` VALUES ('44', '13', '24564684', '0', '1', null, null);
INSERT INTO `option` VALUES ('45', '13', '345548', '1', '1', null, null);
INSERT INTO `option` VALUES ('46', '13', '478765', '0', '1', null, null);
INSERT INTO `option` VALUES ('47', '14', 'A1', '0', '3', null, '1');
INSERT INTO `option` VALUES ('48', '14', 'A2', '1', '3', null, '1');
INSERT INTO `option` VALUES ('49', '14', 'A3', '0', '3', null, '1');
INSERT INTO `option` VALUES ('50', '14', 'A4', '0', '3', null, '1');
INSERT INTO `option` VALUES ('51', '14', 'B1', '1', '3', null, '2');
INSERT INTO `option` VALUES ('52', '14', 'B2', '0', '3', null, '2');
INSERT INTO `option` VALUES ('53', '14', 'B3', '0', '3', null, '2');
INSERT INTO `option` VALUES ('54', '14', 'B4', '0', '3', null, '2');
INSERT INTO `option` VALUES ('55', '14', 'C1', '0', '3', null, '3');
INSERT INTO `option` VALUES ('56', '14', 'C2', '0', '3', null, '3');
INSERT INTO `option` VALUES ('57', '14', 'C3', '1', '3', null, '3');
INSERT INTO `option` VALUES ('58', '14', 'C4', '0', '3', null, '3');
INSERT INTO `option` VALUES ('59', '14', 'D1', '0', '3', null, '4');
INSERT INTO `option` VALUES ('60', '14', 'D2', '0', '3', null, '4');
INSERT INTO `option` VALUES ('61', '14', 'D3', '0', '3', null, '4');
INSERT INTO `option` VALUES ('62', '14', 'D4', '1', '3', null, '4');
INSERT INTO `option` VALUES ('63', '15', 'A1', '0', '1', null, null);
INSERT INTO `option` VALUES ('64', '15', 'A12', '0', '1', null, null);
INSERT INTO `option` VALUES ('65', '15', 'A13', '1', '1', null, null);
INSERT INTO `option` VALUES ('66', '15', 'A14', '0', '1', null, null);
INSERT INTO `option` VALUES ('67', '16', 'B1', '0', '1', null, null);
INSERT INTO `option` VALUES ('68', '16', 'B2', '0', '1', null, null);
INSERT INTO `option` VALUES ('69', '16', 'B3', '1', '1', null, null);
INSERT INTO `option` VALUES ('70', '16', 'B4', '0', '1', null, null);
INSERT INTO `option` VALUES ('71', '17', 'C1', '0', '1', null, null);
INSERT INTO `option` VALUES ('72', '17', 'C2', '0', '1', null, null);
INSERT INTO `option` VALUES ('73', '17', 'C3', '0', '1', null, null);
INSERT INTO `option` VALUES ('74', '17', 'C4', '1', '1', null, null);
INSERT INTO `option` VALUES ('75', '18', 'D1', '0', '1', null, null);
INSERT INTO `option` VALUES ('76', '18', 'D2', '0', '1', null, null);
INSERT INTO `option` VALUES ('77', '18', 'D3', '1', '1', null, null);
INSERT INTO `option` VALUES ('78', '18', 'D4', '0', '1', null, null);

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

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `topic_name` varchar(255) DEFAULT NULL,
  `topic_type` int(11) DEFAULT NULL,
  `topic_desc` int(11) DEFAULT NULL,
  `hurdles` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('10', '1', '填空题______一', '3', '1', '0', '0');
INSERT INTO `topic` VALUES ('11', '1', '选出下列正确选项', '1', '3', '1', '1');
INSERT INTO `topic` VALUES ('12', '1', null, '2', '2', '0', '1');
INSERT INTO `topic` VALUES ('13', '1', '选这题', '1', '1', '2', '1');
INSERT INTO `topic` VALUES ('14', '1', '填_____下_____列______选_____出', '3', '4', '0', '1');
INSERT INTO `topic` VALUES ('15', '2', 'A1 水电费水电费水电费', '1', '1', '1', '1');
INSERT INTO `topic` VALUES ('16', '2', 'B2 法芙娜大姐夫年少多金', '1', '2', '2', '1');
INSERT INTO `topic` VALUES ('17', '2', 'C3 ', '1', '3', '2', '1');
INSERT INTO `topic` VALUES ('18', '2', 'D4 发生的开发商的看法', '1', '4', '1', '1');

-- ----------------------------
-- Table structure for user_topic
-- ----------------------------
DROP TABLE IF EXISTS `user_topic`;
CREATE TABLE `user_topic` (
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_topic
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_id` int(11) DEFAULT NULL,
  `user_moblic` varchar(255) DEFAULT NULL,
  `user_sex` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_birthday` int(11) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `user_nums` int(11) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `user_time` int(11) DEFAULT NULL,
  `user_unlock` int(11) DEFAULT '3',
  `unlock` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', '18301176539', '1', null, null, null, null, null, '010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, '3', null);
INSERT INTO `users` VALUES ('3', '113', null, null, null, null, null, null, null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, '3', null);
INSERT INTO `users` VALUES ('4', '114', null, null, null, null, null, null, null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, '3', null);
INSERT INTO `users` VALUES ('5', '115', null, null, null, null, null, null, null, '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, '3', null);

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
  PRIMARY KEY (`wx_id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin
-- ----------------------------
INSERT INTO `weixin` VALUES ('1', '任祥祥', 'https://wx.qlogo.cn/mmopen/vi_32/QG0FScwUg4RzgpE6VKr7lModeeZgRgaMMkPAPViczIfnfg5Y7IXVKbntSoTxk7JHkAurqnIku8rAiasiaFUzsbgdw/132', 'oop8g5VUU8PmquuQwS600JexVWeQ', null, '');
INSERT INTO `weixin` VALUES ('113', 'ζั͡ ั͡夜 ั͡✾', 'https://wx.qlogo.cn/mmopen/vi_32/hGmS0KCD5dsswUoY6w82DSqp0YxThr4GtMeZW8zb5B8508rlSibRRBRdwC60IpkPlefVRzHloz9tVdxlCv5Z3KQ/132', 'oi6rc4qfihVERmpvVw0hnGaDW_bQ', null, null);
INSERT INTO `weixin` VALUES ('114', '李小月', 'https://wx.qlogo.cn/mmopen/vi_32/bsDw1kk92zdEI57gD2E4ibrRCU40DgHtMTDkKibLP51UjvgxMrlWqSbWD87uGEdBgwuVicLwQkkF4nNhf3fbfNuJg/132', 'oi6rc4l2_i-ZmAXM-Ndp69eXguiw', null, null);
INSERT INTO `weixin` VALUES ('115', '心态', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkJWMMMKD9BuIHG2vcIOxQDiaGvg9kAs1FcpibmfuDZ9yUlU3kTJibiaXF2GvBmydN2jt2lCtPaDUgtw/132', 'oi6rc4hDuMzv7fwwMBZiVPeSdE64', null, null);
