/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : carrental

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2019-10-28 16:38:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bus_car`
-- ----------------------------
DROP TABLE IF EXISTS `bus_car`;
CREATE TABLE `bus_car` (
  `carnumber` varchar(255) NOT NULL,
  `cartype` varchar(255) default NULL,
  `color` varchar(255) default NULL,
  `price` double(10,2) default NULL,
  `rentprice` double(10,2) default NULL,
  `deposit` double default NULL,
  `isrenting` int(11) default NULL,
  `description` varchar(255) default NULL,
  `carimg` varchar(255) default NULL,
  `createtime` datetime default NULL,
  PRIMARY KEY  (`carnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_car
-- ----------------------------
INSERT INTO bus_car VALUES ('赣G1563R9', 'SUV', '白色', '350000.00', '3500.00', '35000', '0', '空间大', '2019-10-27/201910270931596284786.jpg', '2019-10-27 09:33:08');
INSERT INTO bus_car VALUES ('赣G361B4', '轿车', '白色', '900000.00', '9000.00', '90000', '0', '奥迪RS7', '2019-10-27/201910270930535788138.jpg', '2019-10-27 09:31:50');
INSERT INTO bus_car VALUES ('赣G5634E1', '轿车', '白色', '250000.00', '2500.00', '25000', '0', '省油', '2019-10-27/201910270933143194309.jpg', '2019-10-27 09:34:05');
INSERT INTO bus_car VALUES ('赣G563T2', '轿车', '银色', '600000.00', '6000.00', '60000', '0', '奔驰A级车', '2019-10-27/201910270927076533976.jpg', '2019-10-27 09:27:10');
INSERT INTO bus_car VALUES ('赣G6934C5', '轿车', '黑色', '1100000.00', '11000.00', '110000', '0', '动力强劲', '2019-10-27/201910270934101143360.jpg', '2019-10-27 09:35:28');
INSERT INTO bus_car VALUES ('赣G7D8965', 'SUV', '未知', '300000.00', '3000.00', '30000', '1', '动力强', 'images/defaultcarimage.jpg', '2019-10-15 20:19:19');
INSERT INTO bus_car VALUES ('赣G856F3', '轿车', '红色', '800000.00', '8000.00', '80000', '1', '法拉利', '2019-10-15/201910152025189633940.jpg', '2019-10-15 20:25:19');
INSERT INTO bus_car VALUES ('鄂A77777', 'SUV', '白色', '350000.00', '1500.00', '12000', '1', '宝马X3', 'images/002.jpg', '2019-05-07 14:52:15');
INSERT INTO bus_car VALUES ('鄂A88888', '轿车', '黑色', '880000.00', '1000.00', '10000', '1', '保时捷 卡宴', 'images/003.jpg', '2019-05-07 14:52:15');
INSERT INTO bus_car VALUES ('鄂A99999', '渣土车', '黄色', '500000.00', '3000.00', '20000', '1', '动力强劲', 'images/defaultcarimage.jpg', '2019-06-10 14:50:12');

-- ----------------------------
-- Table structure for `bus_check`
-- ----------------------------
DROP TABLE IF EXISTS `bus_check`;
CREATE TABLE `bus_check` (
  `checkid` varchar(255) NOT NULL,
  `checkdate` datetime default NULL,
  `checkdesc` varchar(255) default NULL,
  `problem` varchar(255) default NULL,
  `paymoney` double(255,0) default NULL,
  `opername` varchar(255) default NULL,
  `rentid` varchar(255) default NULL,
  `createtime` datetime default NULL,
  PRIMARY KEY  (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_check
-- ----------------------------
INSERT INTO bus_check VALUES ('JC_20180612_170407_0385_63960', '2018-06-12 00:00:00', '在G50高速超速', '超速', '500', '习大大', 'CZ_20180611_171304_0732_57330', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_20181024_170206_355_7589', '2018-10-24 17:02:06', '向左变道没打灯', '违规变道', '200', '超级管理员', 'CZ_20181024_102327_735_9111', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_20181201_105333_218_89516', '2018-12-02 00:00:00', '1231321', '111122', '200', '超级管理员', 'CZ_20180612_164808_0385_37625', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_20181201_111951_947_77152', '2018-12-03 00:00:00', '无', '无', '0', '超级管理员', 'CZ_20181201_111936_383_31565', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_2018_0901_175053_57325085', '2018-09-01 00:00:00', '在G50  1127-1130段超速20%未达50%', '有违章未处理', '500', '超级管理员', 'CZ_2018_0901_175000_97637709', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_20190322_142814_147_8624', '2019-03-22 14:28:14', '222', '11', '100', '超级管理员', 'CZ_20190320_141553_303_8141', '2019-05-07 14:55:30');
INSERT INTO bus_check VALUES ('JC_20190611_111021_41215259', '2019-06-11 11:10:21', '没有1', '无1', '0', '超级管理员', 'CZ_20190611_094617_32192683', '2019-06-11 11:10:32');
INSERT INTO bus_check VALUES ('JC_20191022_093748_536_20362', '2019-10-22 09:37:48', '闯红灯', '闯红灯', '500', '超级管理员', 'CZ_20191020_193117_163_87219', '2019-10-22 09:39:48');

-- ----------------------------
-- Table structure for `bus_customer`
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `identity` varchar(255) NOT NULL COMMENT '身份证',
  `custname` varchar(255) default NULL COMMENT '姓名',
  `sex` int(255) default NULL COMMENT '性别',
  `address` varchar(255) default NULL COMMENT '地址',
  `phone` varchar(255) default NULL COMMENT '电话',
  `career` varchar(255) default NULL COMMENT '职位',
  `createtime` datetime default NULL,
  PRIMARY KEY  (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO bus_customer VALUES ('360421199906212428', '叶夕水', '0', '上海', '15278450366', '程序员', '2019-10-24 08:27:57');
INSERT INTO bus_customer VALUES ('360421199906242316', '徐三石', '1', '深圳', '15279364588', '老师', '2019-10-24 08:30:12');
INSERT INTO bus_customer VALUES ('360421199908162526', '蓝橙', '0', '武昌', '15278654188', '部门经理', '2019-10-24 09:05:36');
INSERT INTO bus_customer VALUES ('362421199935265258', '特朗普', '1', '美国', '15247856988', '总统', '2019-10-14 20:05:42');
INSERT INTO bus_customer VALUES ('421087133414144412', '张小明', '1', '武昌', '13456788987', '程序员', '2019-05-07 14:52:24');
INSERT INTO bus_customer VALUES ('43131334113331131', '习大大', '1', '北京', '13888888888', '国家最高领导人', '2019-05-07 14:52:24');
INSERT INTO bus_customer VALUES ('431321199291331131', '张三', '1', '武昌', '13431334113', '程序员', '2019-05-07 14:52:24');
INSERT INTO bus_customer VALUES ('431321199291331132', '孙中山', '1', '汉口', '134131314131', '总统', '2019-05-07 14:52:24');
INSERT INTO bus_customer VALUES ('431341134191311311', '李四', '0', '汉阳', '13451313113', 'CEO', '2019-05-07 14:52:24');

-- ----------------------------
-- Table structure for `bus_rent`
-- ----------------------------
DROP TABLE IF EXISTS `bus_rent`;
CREATE TABLE `bus_rent` (
  `rentid` varchar(255) NOT NULL,
  `price` double(10,2) default NULL,
  `begindate` datetime default NULL,
  `returndate` datetime default NULL,
  `rentflag` int(11) default NULL,
  `identity` varchar(255) default NULL,
  `carnumber` varchar(255) default NULL,
  `opername` varchar(255) default NULL,
  `createtime` datetime default NULL,
  PRIMARY KEY  (`rentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_rent
-- ----------------------------
INSERT INTO bus_rent VALUES ('CZ_20180611_171304_0732_57330', '1600.00', '2017-01-01 00:00:00', '2017-06-18 00:00:00', '1', '421087133414144412', '鄂A77777', '李四', '2017-01-01 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_20180612_164747_0573_26177', '500.00', '2018-01-13 00:00:00', '2018-06-23 00:00:00', '1', '431321199291331131', '鄂A66666', '李四', '2018-01-13 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_20180612_164808_0385_37625', '1000.00', '2018-03-13 00:00:00', '2018-06-15 00:00:00', '1', '421087133414144412', '鄂A88888', '王五', '2018-03-13 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_20180718_091206_0365_62161', '500.00', '2018-05-18 00:00:00', '2018-07-21 00:00:00', '1', '421087133414144412', '鄂A66666', '张三', '2018-05-18 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_20181024_102327_735_9111', '500.00', '2018-07-23 10:23:27', '2018-10-31 10:23:29', '1', '421087133414144412', '鄂A66666', '李四', '2018-07-23 10:23:27');
INSERT INTO bus_rent VALUES ('CZ_20181201_111936_383_31565', '1500.00', '2018-09-01 00:00:00', '2018-12-29 00:00:00', '1', '43131334113331131', '鄂A77777', '王五', '2018-09-01 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_2018_0901_175000_97637709', '500.00', '2018-12-01 00:00:00', '2018-09-10 00:00:00', '1', '431321199291331131', '鄂A66666', '李四', '2018-12-01 00:00:00');
INSERT INTO bus_rent VALUES ('CZ_20190611_094617_32192683', '500.00', '2019-06-11 09:46:17', '2019-06-15 09:46:19', '1', '43131334113331131', '鄂A66666', '超级管理员', '2019-06-11 09:46:25');
INSERT INTO bus_rent VALUES ('CZ_20191020_193117_163_87219', '5000.00', '2019-10-20 11:31:17', '2019-10-31 00:00:00', '1', '362421199935265258', '赣G856F3', '超级管理员', '2019-10-20 19:31:28');
INSERT INTO bus_rent VALUES ('CZ_20191020_193245_774_68398', '1000.00', '2019-10-20 11:32:45', '2019-10-30 00:00:00', '1', '362421199935265258', '鄂A88888', '超级管理员', '2019-10-20 19:32:50');
INSERT INTO bus_rent VALUES ('CZ_20191023_085012_387_51288', '1000.00', '2019-10-23 00:50:12', '2019-10-30 00:00:00', '0', '431321199291331132', '鄂A88888', '落亦', '2019-10-23 08:50:24');
INSERT INTO bus_rent VALUES ('CZ_20191023_085058_492_41834', '8000.00', '2019-10-23 00:50:58', '2019-10-30 00:00:00', '0', '421087133414144412', '赣G856F3', '旧城', '2019-10-23 08:51:05');

-- ----------------------------
-- Table structure for `sys_log_login`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `id` int(11) NOT NULL auto_increment,
  `loginname` varchar(255) default NULL,
  `loginip` varchar(255) default NULL,
  `logintime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO sys_log_login VALUES ('123', '小明-xm', '0:0:0:0:0:0:0:1', '2019-10-10 19:55:35');
INSERT INTO sys_log_login VALUES ('124', '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-10 19:55:51');
INSERT INTO sys_log_login VALUES ('125', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-11 09:24:28');
INSERT INTO sys_log_login VALUES ('126', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-11 09:25:43');
INSERT INTO sys_log_login VALUES ('127', '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-11 20:26:00');
INSERT INTO sys_log_login VALUES ('128', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-12 08:55:40');
INSERT INTO sys_log_login VALUES ('257', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 10:14:44');
INSERT INTO sys_log_login VALUES ('258', '旦素一-dansuyi', '0:0:0:0:0:0:0:1', '2019-10-15 10:18:30');
INSERT INTO sys_log_login VALUES ('259', '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-15 10:19:05');
INSERT INTO sys_log_login VALUES ('260', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:08:18');
INSERT INTO sys_log_login VALUES ('261', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:29:01');
INSERT INTO sys_log_login VALUES ('262', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:30:54');
INSERT INTO sys_log_login VALUES ('263', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:31:38');
INSERT INTO sys_log_login VALUES ('264', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:34:08');
INSERT INTO sys_log_login VALUES ('265', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:35:40');
INSERT INTO sys_log_login VALUES ('266', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:36:29');
INSERT INTO sys_log_login VALUES ('267', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:39:55');
INSERT INTO sys_log_login VALUES ('268', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:40:48');
INSERT INTO sys_log_login VALUES ('269', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:42:12');
INSERT INTO sys_log_login VALUES ('270', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:44:14');
INSERT INTO sys_log_login VALUES ('271', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:44:49');
INSERT INTO sys_log_login VALUES ('272', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:45:08');
INSERT INTO sys_log_login VALUES ('273', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:46:51');
INSERT INTO sys_log_login VALUES ('274', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:47:33');
INSERT INTO sys_log_login VALUES ('275', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:47:41');
INSERT INTO sys_log_login VALUES ('276', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:49:13');
INSERT INTO sys_log_login VALUES ('277', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:50:10');
INSERT INTO sys_log_login VALUES ('278', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:50:42');
INSERT INTO sys_log_login VALUES ('279', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:57:14');
INSERT INTO sys_log_login VALUES ('280', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:59:34');
INSERT INTO sys_log_login VALUES ('281', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:00:37');
INSERT INTO sys_log_login VALUES ('282', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:01:48');
INSERT INTO sys_log_login VALUES ('283', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:03:37');
INSERT INTO sys_log_login VALUES ('284', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:04:23');
INSERT INTO sys_log_login VALUES ('285', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:04:45');
INSERT INTO sys_log_login VALUES ('286', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:05:42');
INSERT INTO sys_log_login VALUES ('287', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:06:11');
INSERT INTO sys_log_login VALUES ('288', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:06:33');
INSERT INTO sys_log_login VALUES ('289', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:08:30');
INSERT INTO sys_log_login VALUES ('290', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:09:07');
INSERT INTO sys_log_login VALUES ('291', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:11:48');
INSERT INTO sys_log_login VALUES ('292', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:11:57');
INSERT INTO sys_log_login VALUES ('293', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:12:07');
INSERT INTO sys_log_login VALUES ('294', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:14:55');
INSERT INTO sys_log_login VALUES ('295', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:17:10');
INSERT INTO sys_log_login VALUES ('296', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:02:44');
INSERT INTO sys_log_login VALUES ('297', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:17:10');
INSERT INTO sys_log_login VALUES ('298', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:18:24');
INSERT INTO sys_log_login VALUES ('299', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:25:28');
INSERT INTO sys_log_login VALUES ('300', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:33:26');
INSERT INTO sys_log_login VALUES ('301', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:35:47');
INSERT INTO sys_log_login VALUES ('302', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:14:56');
INSERT INTO sys_log_login VALUES ('303', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:15:31');
INSERT INTO sys_log_login VALUES ('304', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:15:58');
INSERT INTO sys_log_login VALUES ('305', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:16:42');
INSERT INTO sys_log_login VALUES ('306', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 11:21:31');
INSERT INTO sys_log_login VALUES ('307', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 11:26:11');
INSERT INTO sys_log_login VALUES ('308', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 16:59:47');
INSERT INTO sys_log_login VALUES ('309', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:46:27');
INSERT INTO sys_log_login VALUES ('310', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:46:52');
INSERT INTO sys_log_login VALUES ('311', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:54:29');
INSERT INTO sys_log_login VALUES ('312', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:56:04');
INSERT INTO sys_log_login VALUES ('313', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 18:02:05');
INSERT INTO sys_log_login VALUES ('314', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 18:03:16');
INSERT INTO sys_log_login VALUES ('315', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 21:33:50');
INSERT INTO sys_log_login VALUES ('316', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 21:37:18');
INSERT INTO sys_log_login VALUES ('317', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 22:11:25');
INSERT INTO sys_log_login VALUES ('318', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 22:17:45');
INSERT INTO sys_log_login VALUES ('358', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-23 08:46:49');
INSERT INTO sys_log_login VALUES ('359', '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-23 08:49:31');
INSERT INTO sys_log_login VALUES ('360', '旧城-jiucheng', '0:0:0:0:0:0:0:1', '2019-10-23 08:50:39');
INSERT INTO sys_log_login VALUES ('401', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-27 15:24:51');
INSERT INTO sys_log_login VALUES ('402', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-27 16:49:00');
INSERT INTO sys_log_login VALUES ('403', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 09:40:42');
INSERT INTO sys_log_login VALUES ('404', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 12:38:24');
INSERT INTO sys_log_login VALUES ('405', '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-28 13:08:47');
INSERT INTO sys_log_login VALUES ('406', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 14:10:17');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `title` varchar(255) default NULL,
  `href` varchar(255) default NULL,
  `spread` int(255) default NULL COMMENT '0不展开1展开',
  `target` varchar(255) default NULL,
  `icon` varchar(255) default NULL,
  `available` int(255) default NULL COMMENT '0不可用1可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO sys_menu VALUES ('1', '0', '汽车租赁系统', null, '1', null, '&#xe68e;', '1');
INSERT INTO sys_menu VALUES ('2', '1', '基础管理', '', '0', '', '&#xe621;', '1');
INSERT INTO sys_menu VALUES ('3', '1', '业务管理', '', '0', '', '&#xe663;', '1');
INSERT INTO sys_menu VALUES ('4', '1', '系统管理', '', '1', '', '&#xe716;', '1');
INSERT INTO sys_menu VALUES ('5', '1', '统计分析', null, '0', null, '&#xe629;', '1');
INSERT INTO sys_menu VALUES ('6', '2', '客户管理', '../bus/toCustomerManager.action', '0', '', '&#xe770;', '1');
INSERT INTO sys_menu VALUES ('7', '2', '车辆管理', '../bus/toCarManager.action', '0', '', '&#xe657;', '1');
INSERT INTO sys_menu VALUES ('8', '3', '汽车出租', '../bus/toRentCarManager.action', '0', '', '&#xe65b;', '1');
INSERT INTO sys_menu VALUES ('9', '3', '出租单管理', '../bus/toRentManager.action', '0', '', '&#xe6b2;', '1');
INSERT INTO sys_menu VALUES ('10', '3', '汽车入库', '../bus/toCheckCarManager.action', '0', '', '&#xe65a;', '1');
INSERT INTO sys_menu VALUES ('11', '3', '检查单管理', '../bus/toCheckManager.action', '0', '', '&#xe705', '1');
INSERT INTO sys_menu VALUES ('12', '4', '菜单管理', '../sys/toMenuManager.action', '1', null, '&#xe60f', '1');
INSERT INTO sys_menu VALUES ('13', '4', '角色管理', '../sys/toRoleManager.action', '1', '', '&#xe66f;', '1');
INSERT INTO sys_menu VALUES ('14', '4', '用户管理', '../sys/toUserManager.action', '0', '', '&#xe770;', '1');
INSERT INTO sys_menu VALUES ('15', '4', '日志管理', '../sys/toLogInfoManager.action', '0', '', '&#xe655;', '1');
INSERT INTO sys_menu VALUES ('16', '4', '系统公告', '../sys/toNewsManager.action', '0', '', '&#xe645;', '1');
INSERT INTO sys_menu VALUES ('17', '4', '数据源监控', '../druid/', '0', '', '&#xe857;', '1');
INSERT INTO sys_menu VALUES ('18', '5', '客户地区统计', '../stat/toCustomerAreaStat.action', '0', '', '&#xe63c;', '1');
INSERT INTO sys_menu VALUES ('19', '5', '客户地区性别统计', '../stat/toCustomerAreaSexStat.action', '0', null, '&#xe629;', '1');
INSERT INTO sys_menu VALUES ('20', '5', '业务员年度销售额', '../stat/toOpernameYearGradeStat.action', '0', '', '&#xe62d;', '1');
INSERT INTO sys_menu VALUES ('21', '5', '公司年度月份销售额', '../stat/toCompanyYearGradeStat.action', '0', '', '&#xe62c;', '1');

-- ----------------------------
-- Table structure for `sys_news`
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` varchar(4000) default NULL,
  `createtime` datetime default NULL,
  `opername` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO sys_news VALUES ('10', '哈哈哈哈哈', '哈哈哈哈哈哈', '2019-10-12 14:32:21', '超级管理员');
INSERT INTO sys_news VALUES ('11', '阿斯蒂芬', '阿斯顿发生', '2019-10-12 14:42:25', '超级管理员');
INSERT INTO sys_news VALUES ('12', '呃呃呃呃', '呃呃呃呃', '2019-10-12 14:56:14', '超级管理员');
INSERT INTO sys_news VALUES ('14', '银河之心', '银河之心<p><br></p>', '2019-10-14 10:45:45', '超级管理员');
INSERT INTO sys_news VALUES ('15', '心态要好', '学习是一场修行，戒骄戒躁，稳扎稳打', '2019-10-13 10:59:23', '超级管理员');
INSERT INTO sys_news VALUES ('16', '每个浏览器对layui的兼容性并不一样', 'layui的兼容性并不好', '2019-10-13 11:20:43', '超级管理员');
INSERT INTO sys_news VALUES ('17', '修复了表格的一个bug', '当其中一页只有一条数据时，删除这条数据应该要重新加载上一页的数据', '2019-10-14 20:33:45', '超级管理员');
INSERT INTO sys_news VALUES ('18', '再加一条', '再加一条<p><br></p>', '2019-10-14 20:34:12', '超级管理员');
INSERT INTO sys_news VALUES ('19', '还来一条', '还来一条<p><br></p>', '2019-10-14 20:34:25', '超级管理员');
INSERT INTO sys_news VALUES ('20', '在在来一条', '在在来一条<p><br></p>', '2019-10-14 20:34:37', '超级管理员');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `roleid` int(11) NOT NULL auto_increment,
  `rolename` varchar(255) default NULL,
  `roledesc` varchar(255) default NULL,
  `available` int(11) default NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO sys_role VALUES ('1', '超级管理员', '拥有所有菜单权限', '1');
INSERT INTO sys_role VALUES ('2', '业务管理员', '拥有所以业务菜单', '1');
INSERT INTO sys_role VALUES ('3', '系统管理员', '管理系统', '1');
INSERT INTO sys_role VALUES ('4', '数据统计管理员', '数据统计管理员', '1');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY  (`rid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO sys_role_menu VALUES ('1', '1');
INSERT INTO sys_role_menu VALUES ('1', '2');
INSERT INTO sys_role_menu VALUES ('1', '3');
INSERT INTO sys_role_menu VALUES ('1', '4');
INSERT INTO sys_role_menu VALUES ('1', '5');
INSERT INTO sys_role_menu VALUES ('1', '6');
INSERT INTO sys_role_menu VALUES ('1', '7');
INSERT INTO sys_role_menu VALUES ('1', '8');
INSERT INTO sys_role_menu VALUES ('1', '9');
INSERT INTO sys_role_menu VALUES ('1', '10');
INSERT INTO sys_role_menu VALUES ('1', '11');
INSERT INTO sys_role_menu VALUES ('1', '12');
INSERT INTO sys_role_menu VALUES ('1', '13');
INSERT INTO sys_role_menu VALUES ('1', '14');
INSERT INTO sys_role_menu VALUES ('1', '15');
INSERT INTO sys_role_menu VALUES ('1', '16');
INSERT INTO sys_role_menu VALUES ('1', '17');
INSERT INTO sys_role_menu VALUES ('1', '18');
INSERT INTO sys_role_menu VALUES ('1', '19');
INSERT INTO sys_role_menu VALUES ('1', '20');
INSERT INTO sys_role_menu VALUES ('2', '1');
INSERT INTO sys_role_menu VALUES ('2', '2');
INSERT INTO sys_role_menu VALUES ('2', '3');
INSERT INTO sys_role_menu VALUES ('2', '6');
INSERT INTO sys_role_menu VALUES ('2', '7');
INSERT INTO sys_role_menu VALUES ('2', '8');
INSERT INTO sys_role_menu VALUES ('2', '9');
INSERT INTO sys_role_menu VALUES ('2', '10');
INSERT INTO sys_role_menu VALUES ('2', '11');
INSERT INTO sys_role_menu VALUES ('3', '1');
INSERT INTO sys_role_menu VALUES ('3', '4');
INSERT INTO sys_role_menu VALUES ('3', '12');
INSERT INTO sys_role_menu VALUES ('3', '13');
INSERT INTO sys_role_menu VALUES ('3', '14');
INSERT INTO sys_role_menu VALUES ('3', '15');
INSERT INTO sys_role_menu VALUES ('3', '16');
INSERT INTO sys_role_menu VALUES ('3', '17');
INSERT INTO sys_role_menu VALUES ('4', '1');
INSERT INTO sys_role_menu VALUES ('4', '5');
INSERT INTO sys_role_menu VALUES ('4', '18');
INSERT INTO sys_role_menu VALUES ('4', '19');
INSERT INTO sys_role_menu VALUES ('4', '20');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY  (`uid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO sys_role_user VALUES ('3', '1');
INSERT INTO sys_role_user VALUES ('4', '2');
INSERT INTO sys_role_user VALUES ('5', '3');
INSERT INTO sys_role_user VALUES ('6', '4');
INSERT INTO sys_role_user VALUES ('7', '1');
INSERT INTO sys_role_user VALUES ('8', '1');
INSERT INTO sys_role_user VALUES ('12', '4');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `userid` int(11) NOT NULL auto_increment,
  `loginname` varchar(255) default NULL,
  `identity` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` int(255) default NULL COMMENT '0女1男',
  `address` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `pwd` varchar(255) default NULL,
  `position` varchar(255) default NULL,
  `type` int(255) default '2' COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO sys_user VALUES ('1', 'admin', '4313341334413', '超级管理员', '1', '武汉', '134441331311', 'e10adc3949ba59abbe56e057f20f883e', 'CEO', '1', '1');
INSERT INTO sys_user VALUES ('3', 'zhangsan', '3413334134131131', '张三', '1', '武汉', '134131313111', 'e10adc3949ba59abbe56e057f20f883e', 'BA', '2', '1');
INSERT INTO sys_user VALUES ('4', 'ls', '43311341311314341', '李四', '1', '武汉', '1341314113131', 'e10adc3949ba59abbe56e057f20f883e', '扫地的', '2', '1');
INSERT INTO sys_user VALUES ('5', 'ww', '4313133131331312', '王五', '1', '武汉', '13413131131', 'e10adc3949ba59abbe56e057f20f883e', '领导', '2', '1');
INSERT INTO sys_user VALUES ('6', 'xm', '45113141331131131', '小明', '1', '武昌', '13451333131', 'e10adc3949ba59abbe56e057f20f883e', '扫地地', '2', '1');
INSERT INTO sys_user VALUES ('7', 'luoyi', '360421199805241424', '落亦', '1', '九江', '15207895200', 'e10adc3949ba59abbe56e057f20f883e', '学生', '2', '1');
INSERT INTO sys_user VALUES ('8', 'jiucheng', '360421135820654875', '旧城', '1', '九江', '13614752569', 'e10adc3949ba59abbe56e057f20f883e', '', '2', '1');
INSERT INTO sys_user VALUES ('9', 'sanpao', '360421198805142414', '三炮', '1', '上海', '13064154936', 'e10adc3949ba59abbe56e057f20f883e', '主席', '2', '1');
INSERT INTO sys_user VALUES ('10', 'jiashang', '360421199805122014', '佳上', '1', '猎户座旋臂', '15247856322', 'e10adc3949ba59abbe56e057f20f883e', '舰长', '2', '1');
INSERT INTO sys_user VALUES ('11', 'liyuesu', '360421158902351452', '李约素', '1', '猎户座旋臂', '15219874522', 'e10adc3949ba59abbe56e057f20f883e', '舰长', '2', '1');
INSERT INTO sys_user VALUES ('12', 'dansuyi', '360421185475452562', '旦素一', '0', '猎户座旋臂', '15279362588', 'e10adc3949ba59abbe56e057f20f883e', '舰长', '2', '1');
INSERT INTO sys_user VALUES ('13', 'ww', '2131313131', '王五', '1', '武汉', '15279230588', 'e10adc3949ba59abbe56e057f20f883e', '程序员', '2', '1');
