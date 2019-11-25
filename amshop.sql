/*
Navicat MySQL Data Transfer

Source Server         : 1811b
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : amshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-25 07:41:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `act_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '精彩活动id',
  `act_title` varchar(50) NOT NULL COMMENT '精彩活动标题',
  `act_content` text NOT NULL COMMENT '精彩活动内容',
  `act_time` int(11) NOT NULL COMMENT '添加时间',
  `act_hot` int(11) NOT NULL COMMENT '浏览次数',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1不删除 2删除',
  PRIMARY KEY (`act_id`),
  KEY `act_title` (`act_title`) USING BTREE,
  KEY `act_hot` (`act_hot`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '132312', '123312', '1574319316', '33', '2');
INSERT INTO `activity` VALUES ('2', '321312312', '312132132', '1574319330', '33', '2');
INSERT INTO `activity` VALUES ('3', '123123', '123312', '1574319355', '33', '2');
INSERT INTO `activity` VALUES ('4', '123123', '123312', '1574319360', '33', '2');
INSERT INTO `activity` VALUES ('5', '123123', '123312', '1574319361', '33', '2');
INSERT INTO `activity` VALUES ('6', '何帅奇', '123', '1574319928', '33', '2');
INSERT INTO `activity` VALUES ('7', '213123123', '1231234664', '1574320063', '33', '1');
INSERT INTO `activity` VALUES ('8', '啊', '1', '1574320090', '33', '2');
INSERT INTO `activity` VALUES ('9', '23312132', '132312312', '1574320125', '33', '1');
INSERT INTO `activity` VALUES ('10', '2132213', '132132132', '1574320140', '33', '1');
INSERT INTO `activity` VALUES ('11', '123123123', '11123', '1574320180', '33', '2');
INSERT INTO `activity` VALUES ('12', '的地位群二1', '1232', '1574320228', '33', '2');
INSERT INTO `activity` VALUES ('13', '132132132', '132132132132', '1574320261', '33', '1');
INSERT INTO `activity` VALUES ('14', '2231221', '132132132', '1574320302', '33', '1');
INSERT INTO `activity` VALUES ('15', '12312132', '123213132', '1574320344', '33', '1');
INSERT INTO `activity` VALUES ('16', 'sddsd', 'awddqwqwd', '1574320601', '33', '1');
INSERT INTO `activity` VALUES ('17', '12313213213', '123132132', '1574320873', '33', '1');
INSERT INTO `activity` VALUES ('18', '2321132', '123132132132312123', '1574320909', '33', '1');
INSERT INTO `activity` VALUES ('19', '2121', '212', '1574320957', '33', '1');
INSERT INTO `activity` VALUES ('20', '121', '212', '1574320996', '33', '1');
INSERT INTO `activity` VALUES ('21', '23122323132', '132312312132', '1574323307', '33', '1');
INSERT INTO `activity` VALUES ('22', '啦啦啦啦', '啥都', '1574334104', '33', '1');

-- ----------------------------
-- Table structure for activity_course
-- ----------------------------
DROP TABLE IF EXISTS `activity_course`;
CREATE TABLE `activity_course` (
  `ag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ag_title` varchar(255) NOT NULL COMMENT '活动标题',
  `ag_content` varchar(255) NOT NULL COMMENT '活动内容',
  `course_id` varchar(255) NOT NULL COMMENT '课程id',
  `act_price` varchar(255) NOT NULL COMMENT '活动价钱',
  `act_startTime` varchar(255) NOT NULL COMMENT '开始时间',
  `act_endTime` varchar(255) NOT NULL COMMENT '结束时间',
  `create_time` varchar(255) NOT NULL COMMENT '创建时间',
  `is_del` int(11) NOT NULL DEFAULT '1' COMMENT '软删除',
  `token` varchar(255) NOT NULL COMMENT '相同活动下唯一标识',
  PRIMARY KEY (`ag_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of activity_course
-- ----------------------------
INSERT INTO `activity_course` VALUES ('14', '双12', '全场9折', '2', '3234234', '2019-11-12 00:00', '2019-11-28 00:00', '1574473340', '1', 'STQRgtNLOJLIRaJarCy65w9yU00ubrw3Q2YdubsV');
INSERT INTO `activity_course` VALUES ('15', '双12', '全场9折', '4', '3234234', '2019-11-12 00:00', '2019-11-28 00:00', '1574473340', '1', 'STQRgtNLOJLIRaJarCy65w9yU00ubrw3Q2YdubsV');
INSERT INTO `activity_course` VALUES ('13', '双12', '全场9折', '1', '199', '2019-11-12 00:00', '2019-11-28 00:00', '1574473340', '1', 'STQRgtNLOJLIRaJarCy65w9yU00ubrw3Q2YdubsV');
INSERT INTO `activity_course` VALUES ('17', '的发生改变', '热污染费', '2', '3434', '2019-11-21 00:00', '2019-11-28 00:00', '1574479692', '1', '2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY');
INSERT INTO `activity_course` VALUES ('22', '测试1', '111', '2', '115', '2019-11-24 00:00', '2019-11-26 00:00', '1574587201', '1', 'HyQPAHSBxzeFvyJj3D3ToUs9BTeRua9wH43WTJIs');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(30) NOT NULL COMMENT '管理员名字',
  `pwd` char(32) NOT NULL COMMENT '密码',
  `modile` int(1) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除 1不删除 2删除',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', null, null, null, '1');
INSERT INTO `admin` VALUES ('2', '123', '202cb962ac59075b964b07152d234b70', null, null, null, '1');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catelog_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `catelog_name` varchar(50) NOT NULL COMMENT '章节名称',
  `catalog_head` varchar(30) NOT NULL COMMENT '章节标题',
  `catelog_describe` varchar(255) NOT NULL COMMENT '描述',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1不删除 2删除',
  `is_free` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否免费',
  `cate_page` varchar(255) NOT NULL,
  PRIMARY KEY (`catelog_id`),
  KEY `course_id` (`course_id`),
  KEY `catelog_name` (`catelog_name`),
  KEY `catalog_head` (`catalog_head`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '5', '大大大', '撒大声地', '撒大声地', '1', '0', 'img/2019-11-21/4e9011aadf697ce307259ca066f3ee70.mp4');
INSERT INTO `catalog` VALUES ('2', '4', '333', '333333', '333333', '1', '1', 'img/2019-11-21/4e9011aadf697ce307259ca066f3ee70.mp4');
INSERT INTO `catalog` VALUES ('3', '4', '332', '141', '12441421', '1', '0', 'img/2019-11-22/0fd3d7afcce7513a6c952b2f421d6de9.mp4');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `cate_name` varchar(100) NOT NULL COMMENT '分类的名称',
  `cate_describe` varchar(100) NOT NULL COMMENT '分类描述',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1不删除 2 删除',
  `leavel` tinyint(4) NOT NULL COMMENT '层级',
  `pid` int(11) NOT NULL COMMENT '父级ID',
  PRIMARY KEY (`cate_id`),
  KEY `leavel` (`leavel`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '讷讷', 'en11', '1', '1', '30');
INSERT INTO `category` VALUES ('3', 'en', '1', '2', '2', '2');
INSERT INTO `category` VALUES ('4', '你在哪', '在这', '2', '1', '30');
INSERT INTO `category` VALUES ('30', '哦哦', '还行吧', '1', '0', '0');
INSERT INTO `category` VALUES ('31', '121', '121212', '1', '1', '30');
INSERT INTO `category` VALUES ('32', 'dwdw', 'dwdw', '2', '1', '30');
INSERT INTO `category` VALUES ('33', 'asfasfas', 'czascsa', '1', '1', '30');
INSERT INTO `category` VALUES ('34', 'asadsa', 'sadadad', '1', '2', '2');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `f_id` int(11) NOT NULL COMMENT '收藏夹ID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1不删除 2删除',
  PRIMARY KEY (`collect_id`),
  KEY `course_id` (`course_id`),
  KEY `u_id` (`u_id`),
  KEY `f_id` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '4', '5', '1', '1574165329', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lect_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `catelog_id` int(11) NOT NULL,
  `course_page` varchar(255) NOT NULL,
  `introduce` text NOT NULL,
  `is_free` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `close` tinyint(4) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1', '怎么样', '1', '1574072646', '1', '1', 'img/2019-11-18/446bba77ae152c723b6bfac3b91de06f.jpg', 'sdsd21', '1', '1212', '0', '2');
INSERT INTO `course` VALUES ('2', '1', '雪中', '1', '1573886420', '1', '1', 'img/2019-11-16/2cece3163812a0f2068dfe5b9a1faad8.jpg', '一般', '1', '11', '0', '2');
INSERT INTO `course` VALUES ('4', '1', '威威', '1', '1574076906', '1', '1', 'img/2019-11-18/c8bc973ecf2cdbc5b97b00767eb40e89.mp4', '1212', '1', '100', '0', '2');
INSERT INTO `course` VALUES ('5', '1', '撒大大', '1', '1574152533', '1', '1', 'img/2019-11-19/d334fd0868163fce9a804cce01dc8155.jpg', '阿萨达', '1', '150', '0', '2');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `detail_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '详情ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `lect_id` int(11) NOT NULL COMMENT '讲师ID',
  `video` varchar(100) NOT NULL COMMENT '上传内容',
  `is_free` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1收费2不收费',
  `price` int(11) NOT NULL COMMENT '收费价格',
  `d_create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1不删除2删除',
  PRIMARY KEY (`detail_id`),
  KEY `course_id` (`course_id`),
  KEY `lect_id` (`lect_id`),
  KEY `is_free` (`is_free`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('1', '1', '1', '20/d0322fc2017b5a97e1517cb0d7c6a22d.png', '2', '1212', '1574241647', '1');
INSERT INTO `detail` VALUES ('2', '4', '1', '20/d0322fc2017b5a97e1517cb0d7c6a22d.png', '2', '1212', '1574241647', '1');
INSERT INTO `detail` VALUES ('3', '4', '1', '20/d0322fc2017b5a97e1517cb0d7c6a22d.png', '2', '1212', '1574241647', '1');
INSERT INTO `detail` VALUES ('4', '4', '1', '20/d0322fc2017b5a97e1517cb0d7c6a22d.png', '2', '1212', '1574241647', '1');
INSERT INTO `detail` VALUES ('5', '3', '1', '20/d0322fc2017b5a97e1517cb0d7c6a22d.png', '2', '1212', '1574241647', '1');

-- ----------------------------
-- Table structure for exaluate
-- ----------------------------
DROP TABLE IF EXISTS `exaluate`;
CREATE TABLE `exaluate` (
  `e_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `e_content` varchar(100) DEFAULT NULL COMMENT '评价内容',
  `e_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞个数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1 不删除 2 删除',
  PRIMARY KEY (`e_id`),
  KEY `course_id` (`course_id`),
  KEY `u_id` (`u_id`),
  KEY `e_num` (`e_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exaluate
-- ----------------------------
INSERT INTO `exaluate` VALUES ('1', '1', '1', '独生子v', '1', '1574163106', '1');
INSERT INTO `exaluate` VALUES ('2', '1', '1', '是大V', '1', '1574163143', '2');
INSERT INTO `exaluate` VALUES ('3', '4', '1', '的深V', '1', '1574163185', '1');
INSERT INTO `exaluate` VALUES ('4', '4', '1', '的深V', '1', '1574163207', '1');
INSERT INTO `exaluate` VALUES ('5', '4', '1', '房子大V', '1', '1574163237', '1');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '考试指导ID',
  `exam_title` varchar(50) NOT NULL COMMENT '考试指导标题',
  `exam_content` varchar(200) NOT NULL COMMENT '考试指导内容',
  `exam_time` int(11) NOT NULL COMMENT '添加考试时间',
  `exam_num` int(11) NOT NULL COMMENT '浏览次数',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 ： 1不删除 2删除',
  PRIMARY KEY (`exam_id`),
  KEY `exam_title` (`exam_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `f_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏夹ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `f_name` varchar(30) NOT NULL COMMENT '收藏夹名',
  `f_num` int(11) NOT NULL COMMENT '收藏夹数量',
  PRIMARY KEY (`f_id`),
  KEY `u_id` (`u_id`),
  KEY `f_name` (`f_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `infor_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资讯id',
  `infor_title` varchar(50) NOT NULL COMMENT '资讯标题',
  `infor_content` text COMMENT '咨询内容',
  `infor_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `infor_hot` int(11) DEFAULT NULL COMMENT '浏览次数',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除',
  PRIMARY KEY (`infor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('5', '今日新闻', '<p>习近平主席的金秋外交之旅</p>', '1574236988', null, '1');
INSERT INTO `information` VALUES ('2', '今日头条', '<p>大野猪疯狂乱撞 路人神躲避 “反杀“</p>', '1574152195', null, '1');
INSERT INTO `information` VALUES ('3', '热点新闻', '<p>汪峰 章子怡离婚，原因：汪峰竟称孩子不是自己亲生的！</p>', '1574152408', null, '1');
INSERT INTO `information` VALUES ('18', '请问', '&lt;p&gt;请问&lt;img src=&quot;/images/20191121/1574307093870707.jpg&quot; title=&quot;1574307093870707.jpg&quot; alt=&quot;4-1Z301150I7.jpg&quot;/&gt;&lt;/p&gt;', '1574307095', null, '1');
INSERT INTO `information` VALUES ('17', '阿萨德111', '<p><img src=\"/images/20191122/1574384779725863.jpg\" title=\"1574384779725863.jpg\" alt=\"4-1Z301150I5.jpg\"/></p>', '1574306699', null, '1');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '作业ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `catelog_id` int(11) NOT NULL COMMENT '章节ID',
  `job_name` varchar(50) NOT NULL COMMENT '作业名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除  1不删除2 删除',
  `job_content` varchar(50) NOT NULL COMMENT '作业内容',
  PRIMARY KEY (`job_id`),
  KEY `course_id` (`course_id`),
  KEY `catalog_id` (`catelog_id`),
  KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '1', '1', '啦啦啦', '1574315560', '1', '阿达萨达');
INSERT INTO `job` VALUES ('2', '4', '2', '撒发福', '1574325908', '1', '撒发福');
INSERT INTO `job` VALUES ('3', '5', '1', 'asad', '1574384630', '1', 'asad');

-- ----------------------------
-- Table structure for lect
-- ----------------------------
DROP TABLE IF EXISTS `lect`;
CREATE TABLE `lect` (
  `lect_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '讲师ID',
  `lect_name` varchar(50) NOT NULL COMMENT '讲师名字',
  `lect_resume` varchar(50) DEFAULT NULL COMMENT '讲师个人简历',
  `lect_style` varchar(100) DEFAULT NULL COMMENT '讲师授课风格',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除',
  `lect_image` varchar(255) NOT NULL COMMENT '讲师图片',
  PRIMARY KEY (`lect_id`),
  KEY `lect_name` (`lect_name`),
  KEY `is_del` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lect
-- ----------------------------
INSERT INTO `lect` VALUES ('1', '刘丹凤', '北大', '搞笑', '1', '2019-11-16/3Pcq8TBgK9TkZah1EWnG3vRiO38HhRX8GYJeNtYq.jpeg');
INSERT INTO `lect` VALUES ('2', '闫瑞祥', '家里蹲', '无厘头', '1', '2019-11-16/b4Gel7FML0hZvIlsGc9d5g2Z6Pe555XbQZukycxC.jpeg');
INSERT INTO `lect` VALUES ('3', '阿达', '大赛啊', '大大', '1', '2019-11-16/ZnKMYfRBvgtTVSWKzzooonV9kd01RtJbCuRoM8lX.jpeg');
INSERT INTO `lect` VALUES ('4', '闫瑞祥', '撒大大', '搞笑', '1', '2019-11-18/l880tjysq8lnSv45OQ22d6uwwpEzKTZfKWHyad94.jpeg');
INSERT INTO `lect` VALUES ('14', 'sad', null, null, '1', '2019-11-23/8df5b76eaa149e2ef31d9737c95084dc.jpg');

-- ----------------------------
-- Table structure for ltdes
-- ----------------------------
DROP TABLE IF EXISTS `ltdes`;
CREATE TABLE `ltdes` (
  `ltdes_id` int(11) NOT NULL,
  `lt_desc` varchar(70) DEFAULT NULL,
  `ltem_id` int(11) DEFAULT NULL,
  `is_yes` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ltdes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ltdes
-- ----------------------------

-- ----------------------------
-- Table structure for ltem
-- ----------------------------
DROP TABLE IF EXISTS `ltem`;
CREATE TABLE `ltem` (
  `ltem_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `catelog_id` int(11) NOT NULL,
  `ltem_name` varchar(50) NOT NULL,
  `ltem_type` tinyint(1) NOT NULL,
  `is_yes` tinyint(1) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`ltem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ltem
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `route` varchar(50) DEFAULT NULL COMMENT '路由',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限管理', '0', null, '2019-06-08 03:35:44', '2019-06-08 03:35:44');
INSERT INTO `menu` VALUES ('2', '用户管理', '1', 'admin.user.index', '2019-06-08 03:36:00', '2019-06-08 03:36:00');
INSERT INTO `menu` VALUES ('3', '角色管理', '1', 'admin.roles.index', '2019-06-08 03:36:20', '2019-06-08 03:36:20');
INSERT INTO `menu` VALUES ('4', '权限组管理', '1', 'admin.permission.index', '2019-06-08 03:36:37', '2019-06-08 03:36:37');
INSERT INTO `menu` VALUES ('5', '菜单管理', '1', 'admin.menu.index', '2019-06-08 03:37:12', '2019-06-08 03:37:12');
INSERT INTO `menu` VALUES ('6', '讲师管理', '0', null, '2019-11-15 08:36:27', '2019-11-15 08:36:27');
INSERT INTO `menu` VALUES ('7', '讲师添加', '6', 'admin.lect.create.index', '2019-11-15 08:47:40', '2019-11-16 00:59:27');
INSERT INTO `menu` VALUES ('8', '系统日志', '0', null, '2019-11-18 10:51:19', '2019-11-18 10:51:19');
INSERT INTO `menu` VALUES ('9', '日志列表', '8', 'admin.operationLog.index', '2019-11-18 10:52:24', '2019-11-19 03:33:42');
INSERT INTO `menu` VALUES ('10', '课程模块', '0', null, '2019-11-19 15:40:33', '2019-11-19 15:40:33');
INSERT INTO `menu` VALUES ('11', '课程添加', '10', 'admin.course.course_add.index', '2019-11-19 15:41:12', '2019-11-19 15:41:12');
INSERT INTO `menu` VALUES ('12', '课程列表', '10', 'admin.course.list.index', '2019-11-19 15:41:58', '2019-11-19 15:41:58');
INSERT INTO `menu` VALUES ('14', '讲师列表', '6', 'admin.lect.list.index', '2019-11-19 15:43:19', '2019-11-19 15:43:19');
INSERT INTO `menu` VALUES ('18', '分类', '0', null, '2019-11-19 18:09:50', '2019-11-19 18:09:50');
INSERT INTO `menu` VALUES ('19', '分类添加', '18', 'admin.course.cate.index', '2019-11-19 18:10:21', '2019-11-19 18:10:21');
INSERT INTO `menu` VALUES ('35', '用户中心', '0', null, '2019-11-20 19:53:48', '2019-11-22 11:33:42');
INSERT INTO `menu` VALUES ('37', '用户中心添加', '35', 'admin.user_desc.index', '2019-11-20 20:06:22', '2019-11-20 20:06:22');
INSERT INTO `menu` VALUES ('38', '用户中心列表', '35', 'admin.user_desc_list.index', '2019-11-20 20:19:01', '2019-11-22 11:33:56');
INSERT INTO `menu` VALUES ('43', '资讯', '0', null, '2019-11-21 10:52:19', '2019-11-21 10:52:19');
INSERT INTO `menu` VALUES ('44', '资讯列表', '43', 'admin.Information_index.index', '2019-11-21 10:54:28', '2019-11-21 11:19:15');
INSERT INTO `menu` VALUES ('45', '题库', '0', null, '2019-11-21 17:00:22', '2019-11-21 17:00:22');
INSERT INTO `menu` VALUES ('46', '添加题目', '45', 'admin.ltem.index_add.index', '2019-11-21 17:56:24', '2019-11-21 17:59:37');
INSERT INTO `menu` VALUES ('47', '列表', '45', 'admin.ltem.ltem_list.index', '2019-11-21 17:57:18', '2019-11-21 17:57:18');
INSERT INTO `menu` VALUES ('48', '导航栏', '0', null, '2019-11-21 18:13:34', '2019-11-21 18:13:34');
INSERT INTO `menu` VALUES ('49', '导航栏添加', '48', 'admin.navigation.add.index', '2019-11-21 18:14:16', '2019-11-21 18:14:16');
INSERT INTO `menu` VALUES ('50', '导航列表', '48', 'admin.navigation.list.index', '2019-11-21 18:16:58', '2019-11-21 18:16:58');
INSERT INTO `menu` VALUES ('53', '笔记', '0', null, '2019-11-21 19:47:34', '2019-11-21 19:47:34');
INSERT INTO `menu` VALUES ('54', '笔记列表', '53', 'admin.note.note_list.index', '2019-11-21 19:48:10', '2019-11-21 19:48:10');
INSERT INTO `menu` VALUES ('55', '笔记添加', '53', 'admin.note.note_add.index', '2019-11-21 19:50:48', '2019-11-21 19:50:48');
INSERT INTO `menu` VALUES ('56', '试卷', '0', null, '2019-11-22 08:09:19', '2019-11-22 08:09:19');
INSERT INTO `menu` VALUES ('57', '添加试卷', '56', 'admin.paper.index_add.index', '2019-11-22 08:10:02', '2019-11-22 08:10:02');
INSERT INTO `menu` VALUES ('58', '试卷列表', '56', 'admin.paper.pa_list.index', '2019-11-22 08:11:49', '2019-11-22 08:11:49');
INSERT INTO `menu` VALUES ('59', '活动中心', '0', null, '2019-11-23 11:03:17', '2019-11-23 11:03:17');
INSERT INTO `menu` VALUES ('60', '添加活动', '59', 'admin.activity_addgoods.index', '2019-11-23 11:03:53', '2019-11-23 11:03:53');
INSERT INTO `menu` VALUES ('61', '活动中心列表', '59', 'admin.activity_courseList.index', '2019-11-23 11:34:22', '2019-11-23 11:34:22');
INSERT INTO `menu` VALUES ('62', '轮播图管理', '0', null, '2019-11-24 17:11:29', '2019-11-24 17:11:29');
INSERT INTO `menu` VALUES ('63', '添加轮播图', '62', 'admin.slide.index', '2019-11-24 17:13:18', '2019-11-24 17:13:18');
INSERT INTO `menu` VALUES ('64', '订单', '0', null, '2019-11-24 18:51:44', '2019-11-24 18:51:44');
INSERT INTO `menu` VALUES ('65', '订单列表', '64', 'admin.order.blanket_order.index', '2019-11-24 18:52:47', '2019-11-24 18:52:47');

-- ----------------------------
-- Table structure for menu_roles
-- ----------------------------
DROP TABLE IF EXISTS `menu_roles`;
CREATE TABLE `menu_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COMMENT='菜单-角色关系表';

-- ----------------------------
-- Records of menu_roles
-- ----------------------------
INSERT INTO `menu_roles` VALUES ('11', '10', '2', '2019-11-19 15:40:33', '2019-11-19 15:40:33');
INSERT INTO `menu_roles` VALUES ('12', '11', '2', '2019-11-19 15:41:12', '2019-11-19 15:41:12');
INSERT INTO `menu_roles` VALUES ('13', '12', '2', '2019-11-19 15:41:58', '2019-11-19 15:41:58');
INSERT INTO `menu_roles` VALUES ('51', '8', '4', '2019-11-21 09:54:29', '2019-11-21 09:54:29');
INSERT INTO `menu_roles` VALUES ('52', '8', '3', '2019-11-21 09:54:29', '2019-11-21 09:54:29');
INSERT INTO `menu_roles` VALUES ('53', '6', '4', '2019-11-21 09:54:38', '2019-11-21 09:54:38');
INSERT INTO `menu_roles` VALUES ('54', '6', '3', '2019-11-21 09:54:38', '2019-11-21 09:54:38');
INSERT INTO `menu_roles` VALUES ('55', '18', '4', '2019-11-21 09:54:56', '2019-11-21 09:54:56');
INSERT INTO `menu_roles` VALUES ('56', '18', '3', '2019-11-21 09:54:56', '2019-11-21 09:54:56');
INSERT INTO `menu_roles` VALUES ('66', '7', '3', '2019-11-21 09:59:36', '2019-11-21 09:59:36');
INSERT INTO `menu_roles` VALUES ('67', '7', '4', '2019-11-21 09:59:36', '2019-11-21 09:59:36');
INSERT INTO `menu_roles` VALUES ('68', '14', '3', '2019-11-21 09:59:45', '2019-11-21 09:59:45');
INSERT INTO `menu_roles` VALUES ('69', '14', '4', '2019-11-21 09:59:45', '2019-11-21 09:59:45');
INSERT INTO `menu_roles` VALUES ('70', '9', '3', '2019-11-21 09:59:59', '2019-11-21 09:59:59');
INSERT INTO `menu_roles` VALUES ('71', '9', '4', '2019-11-21 09:59:59', '2019-11-21 09:59:59');
INSERT INTO `menu_roles` VALUES ('72', '19', '3', '2019-11-21 10:00:16', '2019-11-21 10:00:16');
INSERT INTO `menu_roles` VALUES ('73', '19', '4', '2019-11-21 10:00:16', '2019-11-21 10:00:16');
INSERT INTO `menu_roles` VALUES ('74', '37', '3', '2019-11-21 10:00:26', '2019-11-21 10:00:26');
INSERT INTO `menu_roles` VALUES ('75', '37', '4', '2019-11-21 10:00:26', '2019-11-21 10:00:26');
INSERT INTO `menu_roles` VALUES ('76', '37', '5', '2019-11-21 10:00:26', '2019-11-21 10:00:26');
INSERT INTO `menu_roles` VALUES ('90', '43', '3', '2019-11-21 10:52:19', '2019-11-21 10:52:19');
INSERT INTO `menu_roles` VALUES ('91', '43', '4', '2019-11-21 10:52:19', '2019-11-21 10:52:19');
INSERT INTO `menu_roles` VALUES ('98', '44', '3', '2019-11-21 11:19:15', '2019-11-21 11:19:15');
INSERT INTO `menu_roles` VALUES ('99', '44', '4', '2019-11-21 11:19:15', '2019-11-21 11:19:15');
INSERT INTO `menu_roles` VALUES ('100', '45', '2', '2019-11-21 17:00:22', '2019-11-21 17:00:22');
INSERT INTO `menu_roles` VALUES ('101', '45', '3', '2019-11-21 17:00:22', '2019-11-21 17:00:22');
INSERT INTO `menu_roles` VALUES ('102', '45', '4', '2019-11-21 17:00:22', '2019-11-21 17:00:22');
INSERT INTO `menu_roles` VALUES ('106', '47', '2', '2019-11-21 17:57:18', '2019-11-21 17:57:18');
INSERT INTO `menu_roles` VALUES ('107', '47', '3', '2019-11-21 17:57:18', '2019-11-21 17:57:18');
INSERT INTO `menu_roles` VALUES ('108', '47', '4', '2019-11-21 17:57:18', '2019-11-21 17:57:18');
INSERT INTO `menu_roles` VALUES ('109', '46', '2', '2019-11-21 17:59:37', '2019-11-21 17:59:37');
INSERT INTO `menu_roles` VALUES ('110', '46', '3', '2019-11-21 17:59:37', '2019-11-21 17:59:37');
INSERT INTO `menu_roles` VALUES ('111', '46', '4', '2019-11-21 17:59:37', '2019-11-21 17:59:37');
INSERT INTO `menu_roles` VALUES ('112', '48', '3', '2019-11-21 18:13:34', '2019-11-21 18:13:34');
INSERT INTO `menu_roles` VALUES ('113', '48', '4', '2019-11-21 18:13:34', '2019-11-21 18:13:34');
INSERT INTO `menu_roles` VALUES ('114', '49', '3', '2019-11-21 18:14:16', '2019-11-21 18:14:16');
INSERT INTO `menu_roles` VALUES ('115', '49', '4', '2019-11-21 18:14:16', '2019-11-21 18:14:16');
INSERT INTO `menu_roles` VALUES ('116', '50', '3', '2019-11-21 18:16:58', '2019-11-21 18:16:58');
INSERT INTO `menu_roles` VALUES ('117', '50', '4', '2019-11-21 18:16:58', '2019-11-21 18:16:58');
INSERT INTO `menu_roles` VALUES ('122', '53', '2', '2019-11-21 19:47:34', '2019-11-21 19:47:34');
INSERT INTO `menu_roles` VALUES ('123', '53', '3', '2019-11-21 19:47:34', '2019-11-21 19:47:34');
INSERT INTO `menu_roles` VALUES ('124', '53', '4', '2019-11-21 19:47:34', '2019-11-21 19:47:34');
INSERT INTO `menu_roles` VALUES ('125', '53', '5', '2019-11-21 19:47:34', '2019-11-21 19:47:34');
INSERT INTO `menu_roles` VALUES ('126', '54', '2', '2019-11-21 19:48:10', '2019-11-21 19:48:10');
INSERT INTO `menu_roles` VALUES ('127', '54', '3', '2019-11-21 19:48:10', '2019-11-21 19:48:10');
INSERT INTO `menu_roles` VALUES ('128', '54', '4', '2019-11-21 19:48:10', '2019-11-21 19:48:10');
INSERT INTO `menu_roles` VALUES ('129', '54', '5', '2019-11-21 19:48:10', '2019-11-21 19:48:10');
INSERT INTO `menu_roles` VALUES ('130', '55', '2', '2019-11-21 19:50:48', '2019-11-21 19:50:48');
INSERT INTO `menu_roles` VALUES ('131', '55', '3', '2019-11-21 19:50:48', '2019-11-21 19:50:48');
INSERT INTO `menu_roles` VALUES ('132', '55', '4', '2019-11-21 19:50:48', '2019-11-21 19:50:48');
INSERT INTO `menu_roles` VALUES ('133', '55', '5', '2019-11-21 19:50:48', '2019-11-21 19:50:48');
INSERT INTO `menu_roles` VALUES ('138', '56', '4', '2019-11-22 08:09:38', '2019-11-22 08:09:38');
INSERT INTO `menu_roles` VALUES ('139', '56', '2', '2019-11-22 08:09:38', '2019-11-22 08:09:38');
INSERT INTO `menu_roles` VALUES ('140', '56', '3', '2019-11-22 08:09:38', '2019-11-22 08:09:38');
INSERT INTO `menu_roles` VALUES ('141', '57', '2', '2019-11-22 08:10:02', '2019-11-22 08:10:02');
INSERT INTO `menu_roles` VALUES ('142', '57', '3', '2019-11-22 08:10:02', '2019-11-22 08:10:02');
INSERT INTO `menu_roles` VALUES ('143', '57', '4', '2019-11-22 08:10:02', '2019-11-22 08:10:02');
INSERT INTO `menu_roles` VALUES ('144', '58', '2', '2019-11-22 08:11:49', '2019-11-22 08:11:49');
INSERT INTO `menu_roles` VALUES ('145', '58', '3', '2019-11-22 08:11:49', '2019-11-22 08:11:49');
INSERT INTO `menu_roles` VALUES ('146', '58', '4', '2019-11-22 08:11:49', '2019-11-22 08:11:49');
INSERT INTO `menu_roles` VALUES ('147', '35', '5', '2019-11-22 11:33:42', '2019-11-22 11:33:42');
INSERT INTO `menu_roles` VALUES ('148', '35', '4', '2019-11-22 11:33:42', '2019-11-22 11:33:42');
INSERT INTO `menu_roles` VALUES ('149', '35', '3', '2019-11-22 11:33:42', '2019-11-22 11:33:42');
INSERT INTO `menu_roles` VALUES ('150', '38', '3', '2019-11-22 11:33:56', '2019-11-22 11:33:56');
INSERT INTO `menu_roles` VALUES ('151', '38', '4', '2019-11-22 11:33:56', '2019-11-22 11:33:56');
INSERT INTO `menu_roles` VALUES ('152', '38', '5', '2019-11-22 11:33:56', '2019-11-22 11:33:56');
INSERT INTO `menu_roles` VALUES ('153', '59', '4', '2019-11-23 11:03:17', '2019-11-23 11:03:17');
INSERT INTO `menu_roles` VALUES ('154', '60', '4', '2019-11-23 11:03:53', '2019-11-23 11:03:53');
INSERT INTO `menu_roles` VALUES ('155', '61', '4', '2019-11-23 11:34:22', '2019-11-23 11:34:22');
INSERT INTO `menu_roles` VALUES ('156', '62', '2', '2019-11-24 17:11:29', '2019-11-24 17:11:29');
INSERT INTO `menu_roles` VALUES ('157', '62', '3', '2019-11-24 17:11:29', '2019-11-24 17:11:29');
INSERT INTO `menu_roles` VALUES ('158', '62', '4', '2019-11-24 17:11:29', '2019-11-24 17:11:29');
INSERT INTO `menu_roles` VALUES ('159', '62', '5', '2019-11-24 17:11:29', '2019-11-24 17:11:29');
INSERT INTO `menu_roles` VALUES ('160', '63', '2', '2019-11-24 17:13:18', '2019-11-24 17:13:18');
INSERT INTO `menu_roles` VALUES ('161', '63', '3', '2019-11-24 17:13:18', '2019-11-24 17:13:18');
INSERT INTO `menu_roles` VALUES ('162', '63', '4', '2019-11-24 17:13:18', '2019-11-24 17:13:18');
INSERT INTO `menu_roles` VALUES ('163', '63', '5', '2019-11-24 17:13:18', '2019-11-24 17:13:18');
INSERT INTO `menu_roles` VALUES ('164', '64', '2', '2019-11-24 18:51:44', '2019-11-24 18:51:44');
INSERT INTO `menu_roles` VALUES ('165', '64', '3', '2019-11-24 18:51:44', '2019-11-24 18:51:44');
INSERT INTO `menu_roles` VALUES ('166', '64', '4', '2019-11-24 18:51:44', '2019-11-24 18:51:44');
INSERT INTO `menu_roles` VALUES ('167', '64', '5', '2019-11-24 18:51:44', '2019-11-24 18:51:44');
INSERT INTO `menu_roles` VALUES ('168', '65', '2', '2019-11-24 18:52:47', '2019-11-24 18:52:47');
INSERT INTO `menu_roles` VALUES ('169', '65', '3', '2019-11-24 18:52:47', '2019-11-24 18:52:47');
INSERT INTO `menu_roles` VALUES ('170', '65', '4', '2019-11-24 18:52:47', '2019-11-24 18:52:47');
INSERT INTO `menu_roles` VALUES ('171', '65', '5', '2019-11-24 18:52:47', '2019-11-24 18:52:47');

-- ----------------------------
-- Table structure for native
-- ----------------------------
DROP TABLE IF EXISTS `native`;
CREATE TABLE `native` (
  `n_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航id',
  `n_name` varchar(50) NOT NULL COMMENT '导航名称',
  `n_url` varchar(100) NOT NULL COMMENT '链接地址',
  `is_show` int(3) NOT NULL COMMENT '是否显示',
  `details` int(11) NOT NULL COMMENT '排序',
  `n_time` int(11) NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of native
-- ----------------------------
INSERT INTO `native` VALUES ('1', 'ITeye首页', 'https://www.baidu.com/', '1', '1', '1567753228');
INSERT INTO `native` VALUES ('2', '资讯', 'https://www.baidu.com/', '1', '2', '1567753228');
INSERT INTO `native` VALUES ('3', '讲师', 'https://www.baidu.com/', '1', '3', '1567753228');
INSERT INTO `native` VALUES ('4', '论坛', 'https://www.baidu.com/', '1', '4', '1567753228');
INSERT INTO `native` VALUES ('5', '问答', 'https://www.baidu.com/', '2', '5', '1567753228');
INSERT INTO `native` VALUES ('6', '博客', 'https://www.baidu.com/', '1', '6', '1567753228');
INSERT INTO `native` VALUES ('7', '专栏', 'https://www.baidu.com/', '1', '7', '1567753228');
INSERT INTO `native` VALUES ('8', '群组', 'https://www.baidu.com/', '1', '8', '1567753228');
INSERT INTO `native` VALUES ('9', '下载', 'https://www.baidu.com/', '1', '9', '1567753228');
INSERT INTO `native` VALUES ('10', '翻译', 'https://www.baidu.com/', '1', '10', '1567753228');
INSERT INTO `native` VALUES ('11', 'ad飒飒', 'www.baidu.com', '1', '2', '1574332732');
INSERT INTO `native` VALUES ('12', 'sada d', 'www.baidu.com', '1', '1', '1574333172');
INSERT INTO `native` VALUES ('13', 'dfsdfsdf', 'www.baidu.com', '1', '1', '1574385003');

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `nav_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID ',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名',
  `nav_url` varchar(100) NOT NULL COMMENT '导航跳转路径',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav
-- ----------------------------

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '笔记id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `cou_id` int(11) NOT NULL COMMENT '课程id',
  `note_desc` varchar(100) NOT NULL COMMENT '笔记的内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `note_del` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1否 2是',
  PRIMARY KEY (`note_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '1', '1', '1111', '1574251365', '2');
INSERT INTO `note` VALUES ('2', '1', '1', '111', '1574253149', '1');
INSERT INTO `note` VALUES ('3', '1', '1', '111222', '1574253154', '1');
INSERT INTO `note` VALUES ('4', '1', '1', '大是大非', '1574253159', '1');
INSERT INTO `note` VALUES ('5', '1', '1', '撒大声地', '1574337056', '1');

-- ----------------------------
-- Table structure for operationlog
-- ----------------------------
DROP TABLE IF EXISTS `operationlog`;
CREATE TABLE `operationlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `sql` varchar(50) DEFAULT NULL,
  `input` text,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operationlog
-- ----------------------------
INSERT INTO `operationlog` VALUES ('1', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"20\"}', '1574234617');
INSERT INTO `operationlog` VALUES ('2', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"34\"}', '1574234622');
INSERT INTO `operationlog` VALUES ('3', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"24\"}', '1574234628');
INSERT INTO `operationlog` VALUES ('4', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"20\"}', '1574234632');
INSERT INTO `operationlog` VALUES ('5', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"33\"}', '1574234637');
INSERT INTO `operationlog` VALUES ('6', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"31\"}', '1574234642');
INSERT INTO `operationlog` VALUES ('7', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"29\"}', '1574234646');
INSERT INTO `operationlog` VALUES ('8', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"saddsada\",\"course_id\":\"5\",\"catelog_name\":\"sadsadas\",\"catelog_describe\":\"asddasdsad\",\"is_free\":\"0\",\"cate_page\":{}}', '1574236601');
INSERT INTO `operationlog` VALUES ('9', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"saddsada\",\"course_id\":\"5\",\"catelog_name\":\"sadsadas\",\"catelog_describe\":\"asddasdsad\",\"is_free\":\"0\",\"cate_page\":{}}', '1574236602');
INSERT INTO `operationlog` VALUES ('10', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"saddsada\",\"course_id\":\"5\",\"catelog_name\":\"sadsadas\",\"catelog_describe\":\"asddasdsad\",\"is_free\":\"0\",\"cate_page\":{}}', '1574236606');
INSERT INTO `operationlog` VALUES ('11', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"lala\",\"course_id\":\"4\",\"catelog_name\":\"lala\",\"catelog_describe\":\"sdsd\",\"is_free\":\"0\",\"cate_page\":{}}', '1574236787');
INSERT INTO `operationlog` VALUES ('12', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"24\"}', '1574249117');
INSERT INTO `operationlog` VALUES ('13', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户管理\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\"]}', '1574250802');
INSERT INTO `operationlog` VALUES ('14', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\"]}', '1574250828');
INSERT INTO `operationlog` VALUES ('15', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户详情添加\",\"pid\":\"35\",\"route\":\"admin.user_desc_add.index\",\"role\":{\"6\":\"2\"}}', '1574251175');
INSERT INTO `operationlog` VALUES ('16', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"36\"}', '1574251556');
INSERT INTO `operationlog` VALUES ('17', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户中心添加\",\"pid\":\"35\",\"route\":\"admin.user_desc.index\",\"role\":{\"6\":\"2\"}}', '1574251582');
INSERT INTO `operationlog` VALUES ('18', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心列表\",\"pid\":\"35\",\"route\":\"admin.user_desc_list.index\",\"role\":{\"6\":\"2\"}}', '1574252341');
INSERT INTO `operationlog` VALUES ('19', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"阿萨德\",\"u_age\":\"2019-11-13\",\"u_sex\":\"男\",\"u_head\":{}}', '1574253155');
INSERT INTO `operationlog` VALUES ('20', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"阿萨德\",\"u_age\":\"2019-11-13\",\"u_sex\":\"男\",\"u_head\":{}}', '1574253194');
INSERT INTO `operationlog` VALUES ('21', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"的撒女\",\"u_age\":\"2019-01-31\",\"u_sex\":\"男\",\"u_head\":{}}', '1574257885');
INSERT INTO `operationlog` VALUES ('22', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":null,\"u_age\":null,\"u_sex\":\"男\",\"u_head\":{}}', '1574258003');
INSERT INTO `operationlog` VALUES ('23', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"吃不\",\"u_age\":null,\"u_sex\":\"男\"}', '1574258127');
INSERT INTO `operationlog` VALUES ('24', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"发的\",\"u_age\":null,\"u_sex\":\"男\"}', '1574258209');
INSERT INTO `operationlog` VALUES ('25', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"发的\",\"u_age\":null,\"u_sex\":\"男\"}', '1574258864');
INSERT INTO `operationlog` VALUES ('26', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"不知道\",\"u_age\":null,\"u_sex\":\"男\"}', '1574258970');
INSERT INTO `operationlog` VALUES ('27', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"吃不\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259016');
INSERT INTO `operationlog` VALUES ('28', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"下班\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259131');
INSERT INTO `operationlog` VALUES ('29', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"女\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259160');
INSERT INTO `operationlog` VALUES ('30', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"采购部\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259192');
INSERT INTO `operationlog` VALUES ('31', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"小反光背心\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259216');
INSERT INTO `operationlog` VALUES ('32', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"分高性能\",\"u_age\":null,\"u_sex\":\"男\",\"u_head\":{}}', '1574259334');
INSERT INTO `operationlog` VALUES ('33', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"先保存v\",\"u_age\":null,\"u_sex\":\"男\"}', '1574259440');
INSERT INTO `operationlog` VALUES ('34', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"云\",\"u_age\":\"2019-01-01\",\"u_sex\":\"男\",\"u_head\":{}}', '1574259561');
INSERT INTO `operationlog` VALUES ('35', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"人图书馆\",\"u_age\":\"2019-01-01\",\"u_sex\":\"男\",\"u_head\":{}}', '1574259650');
INSERT INTO `operationlog` VALUES ('36', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"阿尔巴\",\"u_age\":\"2019-11-14\",\"u_sex\":\"男\",\"u_head\":{}}', '1574259811');
INSERT INTO `operationlog` VALUES ('37', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"nc给你\",\"u_age\":\"2019-11-20\",\"u_sex\":\"男\",\"u_head\":{}}', '1574259893');
INSERT INTO `operationlog` VALUES ('38', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"的关电脑\",\"u_age\":\"2019-11-13\",\"u_sex\":\"男\",\"u_head\":{}}', '1574260008');
INSERT INTO `operationlog` VALUES ('39', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"沙发v\",\"u_age\":\"2019-11-21\",\"u_sex\":\"男\",\"u_head\":{}}', '1574260086');
INSERT INTO `operationlog` VALUES ('40', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"发的\",\"u_age\":\"2019-11-06\",\"u_sex\":\"男\",\"u_head\":{}}', '1574260166');
INSERT INTO `operationlog` VALUES ('41', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心删除\",\"pid\":\"35\",\"route\":\"admmin.destroy.index\",\"role\":{\"6\":\"2\"}}', '1574260360');
INSERT INTO `operationlog` VALUES ('42', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_desc_id\":\"1\"}', '1574260516');
INSERT INTO `operationlog` VALUES ('43', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_desc_id\":\"5\"}', '1574260553');
INSERT INTO `operationlog` VALUES ('44', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"22\"}', '1574295768');
INSERT INTO `operationlog` VALUES ('45', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"撒大大\",\"u_age\":\"2019-11-22\",\"u_sex\":\"男\",\"u_head\":{}}', '1574295792');
INSERT INTO `operationlog` VALUES ('46', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\"]}', '1574297799');
INSERT INTO `operationlog` VALUES ('47', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏列表\",\"pid\":\"40\",\"route\":\"admin.collect.collect_list.index\",\"role\":{\"7\":\"2\"}}', '1574297828');
INSERT INTO `operationlog` VALUES ('48', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏添加\",\"pid\":\"40\",\"route\":\"admin.collect.collect_add.index\",\"role\":{\"7\":\"2\"}}', '1574297885');
INSERT INTO `operationlog` VALUES ('49', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"42\"}', '1574297979');
INSERT INTO `operationlog` VALUES ('50', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298684');
INSERT INTO `operationlog` VALUES ('51', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298690');
INSERT INTO `operationlog` VALUES ('52', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298691');
INSERT INTO `operationlog` VALUES ('53', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298693');
INSERT INTO `operationlog` VALUES ('54', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298740');
INSERT INTO `operationlog` VALUES ('55', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298741');
INSERT INTO `operationlog` VALUES ('56', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298784');
INSERT INTO `operationlog` VALUES ('57', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298818');
INSERT INTO `operationlog` VALUES ('58', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574298862');
INSERT INTO `operationlog` VALUES ('59', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299053');
INSERT INTO `operationlog` VALUES ('60', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299054');
INSERT INTO `operationlog` VALUES ('61', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299055');
INSERT INTO `operationlog` VALUES ('62', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299055');
INSERT INTO `operationlog` VALUES ('63', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299055');
INSERT INTO `operationlog` VALUES ('64', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299904');
INSERT INTO `operationlog` VALUES ('65', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574299954');
INSERT INTO `operationlog` VALUES ('66', '超级管理员', '127.0.0.1', 'POST', '', '{\"collect_id\":\"1\"}', '1574300142');
INSERT INTO `operationlog` VALUES ('67', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"阿萨德\",\"course_id\":\"4\",\"catelog_name\":\"三大差\",\"catelog_describe\":\"萨达是\",\"is_free\":\"0\",\"cate_page\":{}}', '1574300266');
INSERT INTO `operationlog` VALUES ('68', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"撒大声地\",\"course_id\":\"5\",\"catelog_name\":\"大大大\",\"catelog_describe\":\"撒大声地\",\"is_free\":\"0\",\"cate_page\":{}}', '1574300382');
INSERT INTO `operationlog` VALUES ('69', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师\",\"id\":\"2\",\"route\":{\"0\":\"admin.user.index\",\"46\":\"admin.course.course_add.index\",\"47\":\"admin.course.course_add_do.index\",\"48\":\"admin.course.list.index\",\"59\":\"admin.question_add.index\",\"60\":\"admin.question_doadd.index\",\"62\":\"admin.question_list.index\",\"63\":\"admin.resposen_add.index\",\"67\":\"admin.exalute_index.index\",\"70\":\"admin.collect.collect_list.index\"}}', '1574300949');
INSERT INTO `operationlog` VALUES ('70', null, '127.0.0.1', 'POST', '', '{\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"captcha\":\"30\"}', '1574300971');
INSERT INTO `operationlog` VALUES ('71', '闫瑞祥', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301018');
INSERT INTO `operationlog` VALUES ('72', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"28\"}', '1574301027');
INSERT INTO `operationlog` VALUES ('73', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师\",\"id\":\"2\",\"route\":{\"0\":\"admin.user.index\",\"39\":\"admin.catelog.index.index\",\"40\":\"admin.catelog.list.index\",\"41\":\"admin.catelog.add.index\",\"42\":\"admin.catelog.catelog_list.index\",\"46\":\"admin.course.course_add.index\",\"47\":\"admin.course.course_add_do.index\",\"48\":\"admin.course.list.index\",\"59\":\"admin.question_add.index\",\"60\":\"admin.question_doadd.index\",\"62\":\"admin.question_list.index\",\"63\":\"admin.resposen_add.index\",\"67\":\"admin.exalute_index.index\",\"70\":\"admin.collect.collect_list.index\"}}', '1574301108');
INSERT INTO `operationlog` VALUES ('74', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"系统日志\",\"id\":\"8\",\"pid\":\"0\",\"route\":null}', '1574301148');
INSERT INTO `operationlog` VALUES ('75', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"系统日志\",\"id\":\"8\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\"]}', '1574301150');
INSERT INTO `operationlog` VALUES ('76', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"黄贤佩\",\"permission\":[\"3\"]}', '1574301187');
INSERT INTO `operationlog` VALUES ('77', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"刘丹凤\",\"permission\":[\"3\"]}', '1574301207');
INSERT INTO `operationlog` VALUES ('78', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师管理\",\"id\":\"6\",\"pid\":\"0\",\"route\":null,\"role\":[\"4\",\"2\",\"3\"]}', '1574301237');
INSERT INTO `operationlog` VALUES ('79', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"系统日志\",\"id\":\"8\",\"pid\":\"0\",\"route\":null,\"role\":[\"4\",\"2\",\"3\"]}', '1574301244');
INSERT INTO `operationlog` VALUES ('80', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"系统日志\",\"id\":\"8\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"4\",\"2\":\"3\"}}', '1574301269');
INSERT INTO `operationlog` VALUES ('81', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师管理\",\"id\":\"6\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"4\",\"2\":\"3\"}}', '1574301278');
INSERT INTO `operationlog` VALUES ('82', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"分类\",\"id\":\"18\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"4\",\"2\":\"3\"}}', '1574301296');
INSERT INTO `operationlog` VALUES ('83', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心\",\"id\":\"35\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"4\",\"2\":\"3\"}}', '1574301304');
INSERT INTO `operationlog` VALUES ('84', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户\",\"route\":{\"0\":\"admin.user.index\",\"70\":\"admin.collect.collect_list.index\",\"72\":\"admin.user_desc.index\",\"74\":\"admin.user_desc_list.index\"}}', '1574301405');
INSERT INTO `operationlog` VALUES ('85', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"会员\",\"permission\":[\"4\"]}', '1574301478');
INSERT INTO `operationlog` VALUES ('86', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心\",\"id\":\"35\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"5\",\"1\":\"4\",\"3\":\"3\"}}', '1574301488');
INSERT INTO `operationlog` VALUES ('87', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏\",\"id\":\"40\",\"pid\":\"0\",\"route\":null,\"role\":[\"5\",\"4\",\"2\",\"3\"]}', '1574301496');
INSERT INTO `operationlog` VALUES ('88', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301511');
INSERT INTO `operationlog` VALUES ('89', null, '127.0.0.1', 'POST', '', '{\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"captcha\":\"15\"}', '1574301520');
INSERT INTO `operationlog` VALUES ('90', '闫瑞祥', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301538');
INSERT INTO `operationlog` VALUES ('91', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"32\"}', '1574301546');
INSERT INTO `operationlog` VALUES ('92', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师添加\",\"id\":\"7\",\"pid\":\"6\",\"route\":\"admin.lect.create.index\",\"role\":{\"4\":\"3\",\"5\":\"4\"}}', '1574301576');
INSERT INTO `operationlog` VALUES ('93', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"讲师列表\",\"id\":\"14\",\"pid\":\"6\",\"route\":\"admin.lect.list.index\",\"role\":{\"4\":\"3\",\"5\":\"4\"}}', '1574301585');
INSERT INTO `operationlog` VALUES ('94', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"日志列表\",\"id\":\"9\",\"pid\":\"8\",\"route\":\"admin.operationLog.index\",\"role\":{\"6\":\"3\",\"7\":\"4\"}}', '1574301599');
INSERT INTO `operationlog` VALUES ('95', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"分类添加\",\"id\":\"19\",\"pid\":\"18\",\"route\":\"admin.course.cate.index\",\"role\":{\"10\":\"3\",\"11\":\"4\"}}', '1574301616');
INSERT INTO `operationlog` VALUES ('96', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户中心添加\",\"id\":\"37\",\"pid\":\"35\",\"route\":\"admin.user_desc.index\",\"role\":{\"12\":\"3\",\"13\":\"4\",\"14\":\"5\"}}', '1574301626');
INSERT INTO `operationlog` VALUES ('97', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心列表\",\"id\":\"38\",\"pid\":\"35\",\"route\":\"admin.user_desc_list.index\",\"role\":{\"12\":\"3\",\"13\":\"4\",\"14\":\"5\"}}', '1574301634');
INSERT INTO `operationlog` VALUES ('98', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"个人中心删除\",\"id\":\"39\",\"pid\":\"35\",\"route\":\"admmin.destroy.index\",\"role\":{\"12\":\"3\",\"13\":\"4\",\"14\":\"5\"}}', '1574301642');
INSERT INTO `operationlog` VALUES ('99', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏列表\",\"id\":\"41\",\"pid\":\"40\",\"route\":\"admin.collect.collect_list.index\",\"role\":{\"16\":\"3\",\"17\":\"4\",\"18\":\"5\"}}', '1574301659');
INSERT INTO `operationlog` VALUES ('100', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301668');
INSERT INTO `operationlog` VALUES ('101', null, '127.0.0.1', 'POST', '', '{\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"captcha\":\"29\"}', '1574301681');
INSERT INTO `operationlog` VALUES ('102', '闫瑞祥', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301902');
INSERT INTO `operationlog` VALUES ('103', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"28\"}', '1574301910');
INSERT INTO `operationlog` VALUES ('104', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"收藏列表\",\"id\":\"41\",\"pid\":\"40\",\"route\":\"admin.collect.collect_list.index\",\"role\":{\"15\":\"2\",\"16\":\"3\",\"17\":\"4\",\"18\":\"5\"}}', '1574301922');
INSERT INTO `operationlog` VALUES ('105', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"刘丹凤\",\"email\":\"12345@qq.com\",\"password\":\"liu123\",\"password_repeat\":\"liu123\",\"status\":\"1\",\"administrator\":\"1\"}', '1574301961');
INSERT INTO `operationlog` VALUES ('106', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574301972');
INSERT INTO `operationlog` VALUES ('107', null, '127.0.0.1', 'POST', '', '{\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"captcha\":\"24\"}', '1574301981');
INSERT INTO `operationlog` VALUES ('108', '闫瑞祥', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574302003');
INSERT INTO `operationlog` VALUES ('109', null, '127.0.0.1', 'POST', '', '{\"email\":\"12345@qq.com\",\"password\":\"liu123\",\"captcha\":\"14\"}', '1574302018');
INSERT INTO `operationlog` VALUES ('110', '刘丹凤', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574302064');
INSERT INTO `operationlog` VALUES ('111', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"30\"}', '1574302083');
INSERT INTO `operationlog` VALUES ('112', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574303367');
INSERT INTO `operationlog` VALUES ('113', null, '127.0.0.1', 'POST', '', '{\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"captcha\":\"24\"}', '1574303382');
INSERT INTO `operationlog` VALUES ('114', '闫瑞祥', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574303395');
INSERT INTO `operationlog` VALUES ('115', null, '127.0.0.1', 'POST', '', '{\"email\":\"12345@qq.com\",\"password\":\"liu123\",\"captcha\":\"25\"}', '1574303403');
INSERT INTO `operationlog` VALUES ('116', '刘丹凤', '127.0.0.1', 'POST', '', '{\"u_name\":\"dsadsad\",\"u_age\":\"2019-11-20\",\"u_sex\":\"男\",\"u_head\":{}}', '1574303606');
INSERT INTO `operationlog` VALUES ('117', '刘丹凤', '127.0.0.1', 'POST', '', '{\"user_desc_id\":\"1\"}', '1574303616');
INSERT INTO `operationlog` VALUES ('118', '刘丹凤', '127.0.0.1', 'POST', '', '{\"u_name\":\"adsad\",\"u_age\":\"2019-11-19\",\"u_sex\":\"男\",\"u_head\":{}}', '1574303776');
INSERT INTO `operationlog` VALUES ('119', '刘丹凤', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\"}', '1574304701');
INSERT INTO `operationlog` VALUES ('120', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"29\"}', '1574304714');
INSERT INTO `operationlog` VALUES ('121', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"资讯\",\"pid\":\"0\",\"route\":null,\"role\":{\"1\":\"3\",\"2\":\"4\"}}', '1574304739');
INSERT INTO `operationlog` VALUES ('122', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"资讯添加\",\"pid\":\"43\",\"route\":\"admin.Information_create.index\",\"role\":{\"19\":\"3\",\"20\":\"4\"}}', '1574304868');
INSERT INTO `operationlog` VALUES ('123', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"资讯添加\",\"id\":\"44\",\"pid\":\"43\",\"route\":\"admin.Information_create.index\",\"role\":{\"19\":\"3\",\"20\":\"4\"}}', '1574305013');
INSERT INTO `operationlog` VALUES ('124', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"资讯添加\",\"id\":\"44\",\"pid\":\"43\",\"route\":\"admin.Information_create.index\",\"role\":{\"19\":\"3\",\"20\":\"4\"}}', '1574305129');
INSERT INTO `operationlog` VALUES ('125', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"资讯列表\",\"id\":\"44\",\"pid\":\"43\",\"route\":\"admin.Information_index.index\",\"role\":{\"19\":\"3\",\"20\":\"4\"}}', '1574306355');
INSERT INTO `operationlog` VALUES ('126', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_title\":\"阿萨德\",\"infor_content\":\"<p>啊啊啊<\\/p>\"}', '1574306699');
INSERT INTO `operationlog` VALUES ('127', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"17\",\"infor_title\":\"阿萨德111\",\"infor_content\":\"<p>啊啊啊<\\/p>\"}', '1574306818');
INSERT INTO `operationlog` VALUES ('128', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"17\",\"infor_title\":\"阿萨德111\",\"infor_content\":\"<p>啊啊啊<img src=\\\"\\/images\\/20191121\\/1574306829860009.jpg\\\" title=\\\"1574306829860009.jpg\\\" alt=\\\"4-1Z111151143.jpg\\\"\\/><\\/p>\"}', '1574306831');
INSERT INTO `operationlog` VALUES ('129', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"17\",\"infor_title\":\"阿萨德111\",\"infor_content\":\"<p>啊啊啊<img src=\\\"\\/images\\/20191121\\/1574306829860009.jpg\\\" title=\\\"1574306829860009.jpg\\\" alt=\\\"4-1Z111151143.jpg\\\"\\/><\\/p>\"}', '1574306844');
INSERT INTO `operationlog` VALUES ('130', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"15\"}', '1574307059');
INSERT INTO `operationlog` VALUES ('131', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"13\"}', '1574307064');
INSERT INTO `operationlog` VALUES ('132', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"16\"}', '1574307077');
INSERT INTO `operationlog` VALUES ('133', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_title\":\"请问\",\"infor_content\":\"<p>请问<img src=\\\"\\/images\\/20191121\\/1574307093870707.jpg\\\" title=\\\"1574307093870707.jpg\\\" alt=\\\"4-1Z301150I7.jpg\\\"\\/><\\/p>\"}', '1574307095');
INSERT INTO `operationlog` VALUES ('134', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"16\"}', '1574307827');
INSERT INTO `operationlog` VALUES ('135', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"17\"}', '1574307834');
INSERT INTO `operationlog` VALUES ('136', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"15\"}', '1574307839');
INSERT INTO `operationlog` VALUES ('137', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_desc_id\":\"2\"}', '1574314839');
INSERT INTO `operationlog` VALUES ('138', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_desc_id\":\"3\"}', '1574314847');
INSERT INTO `operationlog` VALUES ('139', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"啊实打实打\",\"u_age\":\"2019-11-05\",\"u_sex\":\"男\",\"u_head\":{}}', '1574314898');
INSERT INTO `operationlog` VALUES ('140', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315255');
INSERT INTO `operationlog` VALUES ('141', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315257');
INSERT INTO `operationlog` VALUES ('142', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315282');
INSERT INTO `operationlog` VALUES ('143', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315284');
INSERT INTO `operationlog` VALUES ('144', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315285');
INSERT INTO `operationlog` VALUES ('145', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315286');
INSERT INTO `operationlog` VALUES ('146', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315287');
INSERT INTO `operationlog` VALUES ('147', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315287');
INSERT INTO `operationlog` VALUES ('148', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315288');
INSERT INTO `operationlog` VALUES ('149', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315322');
INSERT INTO `operationlog` VALUES ('150', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315344');
INSERT INTO `operationlog` VALUES ('151', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315347');
INSERT INTO `operationlog` VALUES ('152', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_info_id\":\"4\"}', '1574315347');
INSERT INTO `operationlog` VALUES ('153', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"撒大声地\",\"u_age\":\"2019-11-01\",\"u_sex\":\"男\",\"u_head\":{}}', '1574315560');
INSERT INTO `operationlog` VALUES ('154', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"管理员\",\"id\":\"3\",\"route\":[\"admin.user.index\",\"admin.user.create\",\"admin.user.store\",\"admin.user.status\",\"admin.user.edit\",\"admin.user.update\",\"admin.user.reset\",\"admin.permission.index\",\"admin.permission.create\",\"admin.permission.store\",\"admin.permission.edit\",\"admin.permission.update\",\"admin.permission.delete\",\"admin.roles.index\",\"admin.roles.create\",\"admin.roles.store\",\"admin.roles.edit\",\"admin.roles.update\",\"admin.roles.delete\",\"admin.menu.index\",\"admin.menu.create\",\"admin.menu.store\",\"admin.menu.edit\",\"admin.menu.update\",\"admin.menu.delete\",\"admin.test1.index\",\"admin.test2.index\",\"admin.test3.index\",\"admin.test4.index\",\"admin.test5.index\",\"admin.test6.index\",\"admin.lect.create.index\",\"admin.lect.index\",\"admin.lect.list.index\",\"admin.lect.edit.index\",\"admin.lect.update.index\",\"admin.lect.index_list.index\",\"admin.lect.destroy.index\",\"admin.operationLog.index\",\"admin.catelog.index.index\",\"admin.catelog.list.index\",\"admin.catelog.add.index\",\"admin.catelog.catelog_list.index\",\"admin.catelog.del.index\",\"admin.catelog.catelog_upd.index\",\"admin.catelog.catelog_upd_do.index\",\"admin.course.course_add.index\",\"admin.course.course_add_do.index\",\"admin.course.list.index\",\"admin.course.del.index\",\"admin.course.update.index\",\"admin.course.update_do.index\",\"admin.course.give_or_take.index\",\"admin.course.cate.index\",\"admin.course.cate_do.index\",\"admin.course.cate_list.index\",\"admin.course.cate_del.index\",\"admin.course.cate_update.index\",\"admin.course.cate_update_do.index\",\"admin.question_add.index\",\"admin.question_doadd.index\",\"admin.question_nameOnly.index\",\"admin.question_list.index\",\"admin.resposen_add.index\",\"admin.questions_del.index\",\"admin.exalute_add.index\",\"admin.exaluate_doadd.index\",\"admin.exalute_index.index\",\"admin.exalute_del.index\",\"admin.collect.collect_add.index\",\"admin.collect.collect_list.index\",\"admin.collect.destroy.index\",\"admin.user_desc.index\",\"admin.user_desc_add.index\",\"admin.user_desc_list.index\",\"admin.edit.index\",\"admmin.destroy.index\",\"admin.jin.index\",\"admin.qi.index\",\"admin.Information_index.index\",\"admin.Information_create.create\",\"admin.Information_create_do\",\"admin.Information_delete.delete\",\"admin.Information_edit.edit\",\"admin.Information_update\"]}', '1574316025');
INSERT INTO `operationlog` VALUES ('155', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"39\"}', '1574316054');
INSERT INTO `operationlog` VALUES ('156', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"13\"}', '1574316530');
INSERT INTO `operationlog` VALUES ('157', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"是大的撒\",\"job_content\":\"撒大声地\",\"catelog_id\":\"1\"}', '1574321364');
INSERT INTO `operationlog` VALUES ('158', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"是大的撒\",\"job_content\":\"撒大声地\",\"catelog_id\":\"1\"}', '1574321420');
INSERT INTO `operationlog` VALUES ('159', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"撒大声地\",\"catelog_id\":\"1\"}', '1574321855');
INSERT INTO `operationlog` VALUES ('160', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"撒大声地\",\"catelog_id\":\"1\"}', '1574321873');
INSERT INTO `operationlog` VALUES ('161', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒爱的\",\"job_content\":\"大大大\",\"catelog_id\":\"1\"}', '1574321882');
INSERT INTO `operationlog` VALUES ('162', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒爱的\",\"job_content\":\"大大大\",\"catelog_id\":\"1\"}', '1574321894');
INSERT INTO `operationlog` VALUES ('163', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒爱的\",\"job_content\":\"大大大\",\"catelog_id\":\"1\"}', '1574321973');
INSERT INTO `operationlog` VALUES ('164', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒爱的\",\"job_content\":\"大大大\",\"catelog_id\":\"1\"}', '1574322031');
INSERT INTO `operationlog` VALUES ('165', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322038');
INSERT INTO `operationlog` VALUES ('166', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322067');
INSERT INTO `operationlog` VALUES ('167', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322134');
INSERT INTO `operationlog` VALUES ('168', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322155');
INSERT INTO `operationlog` VALUES ('169', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322172');
INSERT INTO `operationlog` VALUES ('170', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322186');
INSERT INTO `operationlog` VALUES ('171', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322196');
INSERT INTO `operationlog` VALUES ('172', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322265');
INSERT INTO `operationlog` VALUES ('173', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322739');
INSERT INTO `operationlog` VALUES ('174', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574322842');
INSERT INTO `operationlog` VALUES ('175', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323018');
INSERT INTO `operationlog` VALUES ('176', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323066');
INSERT INTO `operationlog` VALUES ('177', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323080');
INSERT INTO `operationlog` VALUES ('178', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323173');
INSERT INTO `operationlog` VALUES ('179', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323366');
INSERT INTO `operationlog` VALUES ('180', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323400');
INSERT INTO `operationlog` VALUES ('181', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒大大\",\"job_content\":\"阿达\",\"catelog_id\":\"1\"}', '1574323688');
INSERT INTO `operationlog` VALUES ('182', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"dsv\",\"job_content\":\"dsv\",\"catelog_id\":\"1\"}', '1574324004');
INSERT INTO `operationlog` VALUES ('183', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"dsv\",\"job_content\":\"dsv\",\"catelog_id\":\"1\"}', '1574324037');
INSERT INTO `operationlog` VALUES ('184', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"dsv\",\"job_content\":\"dsv\",\"catelog_id\":\"1\"}', '1574324411');
INSERT INTO `operationlog` VALUES ('185', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"sad d\",\"job_content\":\"adasd\",\"catelog_id\":\"1\"}', '1574324465');
INSERT INTO `operationlog` VALUES ('186', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"sad d\",\"job_content\":\"adasd\",\"catelog_id\":\"1\"}', '1574324518');
INSERT INTO `operationlog` VALUES ('187', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"sad d\",\"job_content\":\"adasd\",\"catelog_id\":\"1\"}', '1574324674');
INSERT INTO `operationlog` VALUES ('188', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574324877');
INSERT INTO `operationlog` VALUES ('189', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574324994');
INSERT INTO `operationlog` VALUES ('190', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325063');
INSERT INTO `operationlog` VALUES ('191', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325165');
INSERT INTO `operationlog` VALUES ('192', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325174');
INSERT INTO `operationlog` VALUES ('193', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325201');
INSERT INTO `operationlog` VALUES ('194', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325339');
INSERT INTO `operationlog` VALUES ('195', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325374');
INSERT INTO `operationlog` VALUES ('196', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325611');
INSERT INTO `operationlog` VALUES ('197', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325670');
INSERT INTO `operationlog` VALUES ('198', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325790');
INSERT INTO `operationlog` VALUES ('199', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325812');
INSERT INTO `operationlog` VALUES ('200', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325869');
INSERT INTO `operationlog` VALUES ('201', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325873');
INSERT INTO `operationlog` VALUES ('202', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325894');
INSERT INTO `operationlog` VALUES ('203', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"yHqhguwbnqe5jCqjVVDYVjJ3E3JGBmBIpTrrDxLW\",\"job_name\":\"撒发福\",\"job_content\":\"烤馍片，类\",\"catelog_id\":\"2\"}', '1574325908');
INSERT INTO `operationlog` VALUES ('204', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"题库\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\",\"3\",\"4\"]}', '1574326822');
INSERT INTO `operationlog` VALUES ('205', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"列表展示\",\"pid\":\"45\",\"route\":null}', '1574330170');
INSERT INTO `operationlog` VALUES ('206', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"列表展示\",\"pid\":\"45\",\"route\":\"admin.ltem.index_add.index\"}', '1574330179');
INSERT INTO `operationlog` VALUES ('207', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"列表展示\",\"pid\":\"45\",\"route\":\"admin.ltem.index_add.index\",\"role\":{\"20\":\"2\",\"21\":\"3\",\"22\":\"4\"}}', '1574330184');
INSERT INTO `operationlog` VALUES ('208', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"列表\",\"pid\":\"45\",\"route\":\"admin.ltem.ltem_list.index\",\"role\":{\"20\":\"2\",\"21\":\"3\",\"22\":\"4\"}}', '1574330237');
INSERT INTO `operationlog` VALUES ('209', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"33+33=\",\"single_answer\":\"1\",\"single_a\":null,\"sub\":\"提交\"}', '1574330251');
INSERT INTO `operationlog` VALUES ('210', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"33+33=\",\"single_answer\":\"1\",\"single_a\":null,\"sub\":\"提交\"}', '1574330260');
INSERT INTO `operationlog` VALUES ('211', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"33+33=\",\"single_answer\":\"1\",\"single_a\":null,\"sub\":\"提交\"}', '1574330268');
INSERT INTO `operationlog` VALUES ('212', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"添加题目\",\"id\":\"46\",\"pid\":\"45\",\"route\":\"admin.ltem.index_add.index\",\"role\":{\"20\":\"2\",\"21\":\"3\",\"22\":\"4\"}}', '1574330376');
INSERT INTO `operationlog` VALUES ('213', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"problem\":\"第三代\",\"single_answer\":[\"1\"],\"single_a\":null,\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574330388');
INSERT INTO `operationlog` VALUES ('214', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"problem\":\"第三代\",\"single_answer\":[\"1\",\"2\"],\"single_a\":null,\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574330412');
INSERT INTO `operationlog` VALUES ('215', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"problem\":\"第三代1\",\"single_answer\":[\"1\",\"2\",\"3\"],\"single_a\":null,\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574330422');
INSERT INTO `operationlog` VALUES ('216', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":\"方法撒\",\"judge_answer\":\"1\",\"sub\":\"提交\"}', '1574330721');
INSERT INTO `operationlog` VALUES ('217', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"problem\":\"撒大大说\",\"single_answer\":[\"1\",\"2\",\"3\"],\"single_a\":null,\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574330760');
INSERT INTO `operationlog` VALUES ('218', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"导航栏\",\"pid\":\"0\",\"route\":null,\"role\":{\"1\":\"3\",\"2\":\"4\"}}', '1574331214');
INSERT INTO `operationlog` VALUES ('219', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"导航栏添加\",\"pid\":\"48\",\"route\":\"admin.navigation.add.index\",\"role\":{\"23\":\"3\",\"24\":\"4\"}}', '1574331255');
INSERT INTO `operationlog` VALUES ('220', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"列表\",\"pid\":\"48\",\"route\":\"admin.navigation.list.index\",\"role\":{\"23\":\"3\",\"24\":\"4\"}}', '1574331409');
INSERT INTO `operationlog` VALUES ('221', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"导航列表\",\"pid\":\"48\",\"route\":\"admin.navigation.list.index\",\"role\":{\"23\":\"3\",\"24\":\"4\"}}', '1574331417');
INSERT INTO `operationlog` VALUES ('222', '超级管理员', '127.0.0.1', 'POST', '', '{\"n_id\":\"11\",\"n_name\":\"ad飒飒\",\"n_url\":\"www.baidu.com\",\"details\":\"2\",\"is_show\":\"1\"}', '1574332776');
INSERT INTO `operationlog` VALUES ('223', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"活动\",\"pid\":\"0\",\"route\":null,\"role\":{\"1\":\"3\",\"2\":\"4\"}}', '1574333994');
INSERT INTO `operationlog` VALUES ('224', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"活动列表\",\"pid\":\"51\",\"route\":\"admin.activity.activity_list.index\",\"role\":{\"25\":\"3\",\"26\":\"4\"}}', '1574334023');
INSERT INTO `operationlog` VALUES ('225', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":\"方法撒是飞洒\",\"judge_answer\":\"1\",\"sub\":\"提交\"}', '1574336021');
INSERT INTO `operationlog` VALUES ('226', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"33+33=\",\"single_a_id\":\"61\",\"single_a\":null,\"single_answer\":\"2\",\"single_b_id\":\"62\",\"single_b\":null,\"single_c_id\":\"63\",\"single_c\":null,\"single_d_id\":\"64\",\"single_d\":null,\"sub\":\"提交\",\"id\":\"18\"}', '1574336629');
INSERT INTO `operationlog` VALUES ('227', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"single_a_id\":\"74\",\"problem\":\"第三代\",\"single_answer\":[\"1\",\"2\"],\"single_a\":null,\"single_b_id\":\"73\",\"single_b\":null,\"single_c_id\":\"75\",\"single_c\":null,\"single_d_id\":\"76\",\"single_d\":null,\"sub\":\"提交\",\"id\":\"22\"}', '1574336643');
INSERT INTO `operationlog` VALUES ('228', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"single_a_id\":\"74\",\"problem\":\"第三代撒大声地\",\"single_answer\":[\"1\",\"2\"],\"single_a\":null,\"single_b_id\":\"73\",\"single_b\":null,\"single_c_id\":\"75\",\"single_c\":null,\"single_d_id\":\"76\",\"single_d\":null,\"sub\":\"提交\",\"id\":\"22\"}', '1574336650');
INSERT INTO `operationlog` VALUES ('229', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"2\",\"single_a_id\":\"74\",\"problem\":\"第三代撒大声地\",\"single_answer\":[\"1\",\"2\"],\"single_a\":\"电风扇\",\"single_b_id\":\"73\",\"single_b\":\"发的是\",\"single_c_id\":\"75\",\"single_c\":null,\"single_d_id\":\"76\",\"single_d\":null,\"sub\":\"提交\",\"id\":\"22\"}', '1574336661');
INSERT INTO `operationlog` VALUES ('230', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"撒大大\",\"single_answer\":\"1\",\"single_a\":\"打撒\",\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574336739');
INSERT INTO `operationlog` VALUES ('231', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"笔记\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\",\"3\",\"4\",\"5\"]}', '1574336854');
INSERT INTO `operationlog` VALUES ('232', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"笔记列表\",\"pid\":\"53\",\"route\":\"admin.note.note_list.index\",\"role\":{\"27\":\"2\",\"28\":\"3\",\"29\":\"4\",\"30\":\"5\"}}', '1574336890');
INSERT INTO `operationlog` VALUES ('233', '超级管理员', '127.0.0.1', 'POST', '', '{\"note_id\":\"4\",\"note_desc\":\"大是大非\"}', '1574337016');
INSERT INTO `operationlog` VALUES ('234', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"笔记添加\",\"pid\":\"53\",\"route\":\"admin.note.note_add.index\",\"role\":{\"27\":\"2\",\"28\":\"3\",\"29\":\"4\",\"30\":\"5\"}}', '1574337048');
INSERT INTO `operationlog` VALUES ('235', '超级管理员', '127.0.0.1', 'POST', '', '{\"note_desc\":\"撒大声地\"}', '1574337056');
INSERT INTO `operationlog` VALUES ('236', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":null,\"sub\":\"提交\"}', '1574338441');
INSERT INTO `operationlog` VALUES ('237', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":null,\"sub\":\"提交\"}', '1574338455');
INSERT INTO `operationlog` VALUES ('238', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":null,\"sub\":\"提交\"}', '1574338460');
INSERT INTO `operationlog` VALUES ('239', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"21\"}', '1574381313');
INSERT INTO `operationlog` VALUES ('240', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"试卷\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\",\"3\",\"4\",\"5\"]}', '1574381359');
INSERT INTO `operationlog` VALUES ('241', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"试卷\",\"id\":\"56\",\"pid\":\"0\",\"route\":null,\"role\":{\"1\":\"4\",\"2\":\"2\",\"3\":\"3\"}}', '1574381378');
INSERT INTO `operationlog` VALUES ('242', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"添加试卷\",\"pid\":\"56\",\"route\":\"admin.paper.index_add.index\",\"role\":{\"31\":\"2\",\"32\":\"3\",\"33\":\"4\"}}', '1574381402');
INSERT INTO `operationlog` VALUES ('243', '超级管理员', '127.0.0.1', 'POST', '', '{\"paper_name\":\"萨达\",\"cate_id\":\"2\",\"single\":[\"28\"]}', '1574381446');
INSERT INTO `operationlog` VALUES ('244', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"试卷列表\",\"pid\":\"56\",\"route\":\"admin.paper.pa_list.index\",\"role\":{\"31\":\"2\",\"32\":\"3\",\"33\":\"4\"}}', '1574381509');
INSERT INTO `operationlog` VALUES ('245', '超级管理员', '127.0.0.1', 'POST', '', '{\"paper_name\":\"胜多负少的发送到\",\"cate_id\":\"32\",\"single\":[\"28\"]}', '1574381642');
INSERT INTO `operationlog` VALUES ('246', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"PKkAF8qVcjYDALR7TFtmchV3AKt1CNIN9bMhcg9n\"}', '1574381674');
INSERT INTO `operationlog` VALUES ('247', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"19\"}', '1574381701');
INSERT INTO `operationlog` VALUES ('248', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"PKkAF8qVcjYDALR7TFtmchV3AKt1CNIN9bMhcg9n\"}', '1574383971');
INSERT INTO `operationlog` VALUES ('249', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"30\"}', '1574383984');
INSERT INTO `operationlog` VALUES ('250', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_id\":\"2\"}', '1574384006');
INSERT INTO `operationlog` VALUES ('251', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_id\":\"2\"}', '1574384012');
INSERT INTO `operationlog` VALUES ('252', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_id\":\"2\"}', '1574384208');
INSERT INTO `operationlog` VALUES ('253', '超级管理员', '127.0.0.1', 'POST', '', '{\"user_id\":\"2\"}', '1574384214');
INSERT INTO `operationlog` VALUES ('254', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"sdasdas\",\"course_id\":null,\"catelog_name\":\"dasad as\",\"catelog_describe\":\"dssdasd\",\"is_free\":\"1\",\"cate_page\":{}}', '1574384589');
INSERT INTO `operationlog` VALUES ('255', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"sdasdas\",\"course_id\":null,\"catelog_name\":\"dasad as\",\"catelog_describe\":\"dssdasd\",\"is_free\":\"1\",\"cate_page\":{}}', '1574384591');
INSERT INTO `operationlog` VALUES ('256', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"sdasdas\",\"course_id\":null,\"catelog_name\":\"dasad as\",\"catelog_describe\":\"dssdasd\",\"is_free\":\"1\",\"cate_page\":{}}', '1574384592');
INSERT INTO `operationlog` VALUES ('257', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"sdasdas\",\"course_id\":null,\"catelog_name\":\"dasad as\",\"catelog_describe\":\"dssdasd\",\"is_free\":\"1\",\"cate_page\":{}}', '1574384592');
INSERT INTO `operationlog` VALUES ('258', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"sdasdas\",\"course_id\":null,\"catelog_name\":\"dasad as\",\"catelog_describe\":\"dssdasd\",\"is_free\":\"1\",\"cate_page\":{}}', '1574384598');
INSERT INTO `operationlog` VALUES ('259', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"PKkAF8qVcjYDALR7TFtmchV3AKt1CNIN9bMhcg9n\",\"job_name\":\"asad\",\"job_content\":\"dadads\",\"catelog_id\":\"1\"}', '1574384630');
INSERT INTO `operationlog` VALUES ('260', '超级管理员', '127.0.0.1', 'POST', '', '{\"cate_name\":\"asadsa\",\"cate_describe\":\"sadadad\",\"cate_id\":\"2\"}', '1574384650');
INSERT INTO `operationlog` VALUES ('261', '超级管理员', '127.0.0.1', 'POST', '', '{\"infor_id\":\"17\",\"infor_title\":\"阿萨德111\",\"infor_content\":\"<p><img src=\\\"\\/images\\/20191122\\/1574384779725863.jpg\\\" title=\\\"1574384779725863.jpg\\\" alt=\\\"4-1Z301150I5.jpg\\\"\\/><\\/p>\"}', '1574384781');
INSERT INTO `operationlog` VALUES ('262', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"3\",\"judge\":\"DSASDAS\",\"judge_answer\":\"1\",\"sub\":\"提交\"}', '1574384803');
INSERT INTO `operationlog` VALUES ('263', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"DSFSFSDF\",\"single_answer\":\"1\",\"single_a\":\"DDFF\",\"single_b\":null,\"single_c\":null,\"single_d\":null,\"sub\":\"提交\"}', '1574384817');
INSERT INTO `operationlog` VALUES ('264', '超级管理员', '127.0.0.1', 'POST', '', '{\"type_id\":\"1\",\"problem\":\"第三代\",\"single_answer\":\"1\",\"single_a\":\"fddfgdfg\",\"single_b\":\"dssdfd\",\"single_c\":\"dsfsdf\",\"single_d\":\"dfsdfsd\",\"sub\":\"提交\"}', '1574384878');
INSERT INTO `operationlog` VALUES ('265', '超级管理员', '127.0.0.1', 'POST', '', '{\"paper_name\":\"fdsfsdfsdf\",\"cate_id\":\"32\",\"single\":[\"31\"]}', '1574384934');
INSERT INTO `operationlog` VALUES ('266', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"闫瑞祥\",\"id\":\"2\",\"email\":\"2233682947@qq.com\",\"password\":\"admin000\",\"password_repeat\":\"admin000\",\"administrator\":\"1\",\"roles\":{\"2\":\"2\"}}', '1574385441');
INSERT INTO `operationlog` VALUES ('267', '超级管理员', '127.0.0.1', 'POST', '', '{\"catelog_head\":\"141\",\"course_id\":\"4\",\"catelog_name\":\"332\",\"catelog_describe\":\"12441421\",\"is_free\":\"0\",\"cate_page\":{}}', '1574385503');
INSERT INTO `operationlog` VALUES ('268', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户中心\",\"id\":\"35\",\"pid\":\"0\",\"route\":null,\"role\":{\"0\":\"5\",\"1\":\"4\",\"3\":\"3\"}}', '1574393622');
INSERT INTO `operationlog` VALUES ('269', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"用户中心列表\",\"id\":\"38\",\"pid\":\"35\",\"route\":\"admin.user_desc_list.index\",\"role\":{\"11\":\"3\",\"12\":\"4\",\"13\":\"5\"}}', '1574393636');
INSERT INTO `operationlog` VALUES ('270', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"41\"}', '1574394459');
INSERT INTO `operationlog` VALUES ('271', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"40\"}', '1574394463');
INSERT INTO `operationlog` VALUES ('272', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"范德萨发放 的冯绍峰\",\"u_age\":\"2019-11-07\",\"u_sex\":\"男\",\"u_head\":{}}', '1574399184');
INSERT INTO `operationlog` VALUES ('273', '超级管理员', '127.0.0.1', 'POST', '', '{\"order_id\":\"1\"}', '1574406340');
INSERT INTO `operationlog` VALUES ('274', '超级管理员', '127.0.0.1', 'POST', '', '{\"order_id\":\"1\"}', '1574406346');
INSERT INTO `operationlog` VALUES ('275', '超级管理员', '127.0.0.1', 'POST', '', '{\"order_id\":\"1\"}', '1574406585');
INSERT INTO `operationlog` VALUES ('276', '超级管理员', '127.0.0.1', 'POST', '', '{\"order_id\":\"2\"}', '1574406700');
INSERT INTO `operationlog` VALUES ('277', '超级管理员', '127.0.0.1', 'POST', '', '{\"order_id\":\"2\"}', '1574408091');
INSERT INTO `operationlog` VALUES ('278', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"34\"}', '1574469192');
INSERT INTO `operationlog` VALUES ('279', '超级管理员', '127.0.0.1', 'POST', '', '{\"lect_name\":\"sadasd\",\"lect_resume\":\"sdad\",\"lect_style\":\"adasd\",\"file\":{}}', '1574473761');
INSERT INTO `operationlog` VALUES ('280', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"asdsada\",\"u_age\":\"2019-11-01\",\"u_sex\":\"男\",\"u_head\":{}}', '1574474103');
INSERT INTO `operationlog` VALUES ('281', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"sad\",\"u_age\":\"2019-11-06\",\"u_sex\":\"男\",\"u_head\":{}}', '1574474331');
INSERT INTO `operationlog` VALUES ('282', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"sad\",\"u_age\":\"2019-11-06\",\"u_sex\":\"男\",\"u_head\":{}}', '1574474333');
INSERT INTO `operationlog` VALUES ('283', '超级管理员', '127.0.0.1', 'POST', '', '{\"u_name\":\"sad\",\"u_age\":\"2019-11-06\",\"u_sex\":\"男\",\"u_head\":{}}', '1574474403');
INSERT INTO `operationlog` VALUES ('284', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"51\"}', '1574477958');
INSERT INTO `operationlog` VALUES ('285', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"52\"}', '1574477964');
INSERT INTO `operationlog` VALUES ('286', '超级管理员', '127.0.0.1', 'POST', '', '{\"id\":\"51\"}', '1574477972');
INSERT INTO `operationlog` VALUES ('287', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"活动中心\",\"pid\":\"0\",\"route\":null,\"role\":{\"2\":\"4\"}}', '1574478197');
INSERT INTO `operationlog` VALUES ('288', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"添加活动\",\"pid\":\"59\",\"route\":\"admin.activity_addgoods.index\",\"role\":{\"28\":\"4\"}}', '1574478233');
INSERT INTO `operationlog` VALUES ('289', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":null,\"ag_content\":null,\"act_price\":null,\"act_startTime\":null,\"act_endTime\":null}', '1574479533');
INSERT INTO `operationlog` VALUES ('290', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":null,\"ag_content\":null,\"act_price\":null,\"act_startTime\":null,\"act_endTime\":null}', '1574479545');
INSERT INTO `operationlog` VALUES ('291', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":\"的发生改变\",\"ag_content\":\"热污染费\",\"course_id\":[\"1\",\"2\",\"4\"],\"act_price\":\"3434\",\"act_startTime\":\"2019-11-21T00:00\",\"act_endTime\":\"2019-11-28T00:00\"}', '1574479602');
INSERT INTO `operationlog` VALUES ('292', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":\"的发生改变\",\"ag_content\":\"热污染费\",\"course_id\":[\"1\",\"2\",\"4\"],\"act_price\":\"3434\",\"act_startTime\":\"2019-11-21T00:00\",\"act_endTime\":\"2019-11-28T00:00\"}', '1574479639');
INSERT INTO `operationlog` VALUES ('293', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":\"的发生改变\",\"ag_content\":\"热污染费\",\"course_id\":[\"1\",\"2\",\"4\"],\"act_price\":\"3434\",\"act_startTime\":\"2019-11-21T00:00\",\"act_endTime\":\"2019-11-28T00:00\"}', '1574479692');
INSERT INTO `operationlog` VALUES ('294', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"2hUpiUtHz2nKQ5krDD0UY9Jf0D6Jv64R672rFFLY\",\"ag_title\":\"发到你\",\"ag_content\":\"如果您\",\"course_id\":[\"1\",\"2\"],\"act_price\":\"435\",\"act_startTime\":\"2019-11-21T00:00\",\"act_endTime\":\"2019-11-28T00:00\"}', '1574479757');
INSERT INTO `operationlog` VALUES ('295', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"活动中心列表\",\"pid\":\"59\",\"route\":\"admin.activity_courseList.index\",\"role\":{\"28\":\"4\"}}', '1574480062');
INSERT INTO `operationlog` VALUES ('296', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"afmin\",\"captcha\":\"24\"}', '1574487733');
INSERT INTO `operationlog` VALUES ('297', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"afmin123\",\"captcha\":\"24\"}', '1574487739');
INSERT INTO `operationlog` VALUES ('298', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"afmin123\",\"captcha\":\"19\"}', '1574487744');
INSERT INTO `operationlog` VALUES ('299', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"22\"}', '1574487754');
INSERT INTO `operationlog` VALUES ('300', null, '127.0.0.1', 'POST', '', '{\"email\":\"admin@admin.com\",\"password\":\"admin123\",\"captcha\":\"21\"}', '1574586601');
INSERT INTO `operationlog` VALUES ('301', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"轮播图管理\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\",\"3\",\"4\",\"5\"]}', '1574586689');
INSERT INTO `operationlog` VALUES ('302', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"添加轮播图\",\"pid\":\"62\",\"route\":\"admin.slide.index\",\"role\":{\"29\":\"2\",\"30\":\"3\",\"31\":\"4\",\"32\":\"5\"}}', '1574586798');
INSERT INTO `operationlog` VALUES ('303', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586815');
INSERT INTO `operationlog` VALUES ('304', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586818');
INSERT INTO `operationlog` VALUES ('305', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586821');
INSERT INTO `operationlog` VALUES ('306', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586831');
INSERT INTO `operationlog` VALUES ('307', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586913');
INSERT INTO `operationlog` VALUES ('308', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_weight\":\"10\",\"slide_url\":{}}', '1574586980');
INSERT INTO `operationlog` VALUES ('309', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_id\":\"13\"}', '1574586990');
INSERT INTO `operationlog` VALUES ('310', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_id\":\"10\"}', '1574586995');
INSERT INTO `operationlog` VALUES ('311', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_id\":\"11\"}', '1574586999');
INSERT INTO `operationlog` VALUES ('312', '超级管理员', '127.0.0.1', 'POST', '', '{\"slide_id\":\"12\"}', '1574587004');
INSERT INTO `operationlog` VALUES ('313', '超级管理员', '127.0.0.1', 'POST', '', '{\"_token\":\"HyQPAHSBxzeFvyJj3D3ToUs9BTeRua9wH43WTJIs\",\"ag_title\":\"测试1\",\"ag_content\":\"111\",\"course_id\":[\"1\",\"2\"],\"act_price\":\"115\",\"act_startTime\":\"2019-11-24T00:00\",\"act_endTime\":\"2019-11-26T00:00\"}', '1574587201');
INSERT INTO `operationlog` VALUES ('314', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"订单\",\"pid\":\"0\",\"route\":null,\"role\":[\"2\",\"3\",\"4\",\"5\"]}', '1574592704');
INSERT INTO `operationlog` VALUES ('315', '超级管理员', '127.0.0.1', 'POST', '', '{\"name\":\"订单列表\",\"pid\":\"64\",\"route\":\"admin.order.blanket_order.index\",\"role\":{\"33\":\"2\",\"34\":\"3\",\"35\":\"4\",\"36\":\"5\"}}', '1574592767');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_mark` varchar(30) NOT NULL COMMENT '订单号',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `pay_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1支付宝 2微信 3 银行卡',
  `pay_price` int(11) NOT NULL COMMENT '支付价格',
  `pay_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1已支付2已到货3待评价4终止交易5退款',
  `is_del` int(11) DEFAULT '1',
  PRIMARY KEY (`order_id`),
  KEY `order_mark` (`order_mark`),
  KEY `course_id` (`course_id`),
  KEY `u_id` (`u_id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '44545', '3', '5', '1', '1212', '1', '1');
INSERT INTO `order` VALUES ('2', '0324', '1', '5', '1', '1212', '1', '1');
INSERT INTO `order` VALUES ('3', '0324', '1', '6', '1', '1212', '1', '1');
INSERT INTO `order` VALUES ('4', '0324', '1', '8', '1', '1212', '1', '1');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paper_name` varchar(50) DEFAULT NULL,
  `problem_id` varchar(20) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`paper_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('6', '胜多负少的发送到', '28', '1574381642', '32', '1');
INSERT INTO `paper` VALUES ('5', '萨达', '28', '1574381446', '2', '1');
INSERT INTO `paper` VALUES ('7', 'fdsfsdfsdf', '31', '1574384935', '32', '1');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `pay_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(30) NOT NULL COMMENT '支付名称',
  PRIMARY KEY (`pay_id`),
  KEY `pay_name` (`pay_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `routes` text COMMENT '路由别名，逗号分隔',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='permission权限组';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('2', 'admin.user.index,admin.catelog.index.index,admin.catelog.list.index,admin.catelog.add.index,admin.catelog.catelog_list.index,admin.course.course_add.index,admin.course.course_add_do.index,admin.course.list.index,admin.question_add.index,admin.question_doadd.index,admin.question_list.index,admin.resposen_add.index,admin.exalute_index.index,admin.collect.collect_list.index', '讲师', '2019-11-15 08:21:35', '2019-11-21 09:51:48');
INSERT INTO `permission` VALUES ('3', 'admin.user.index,admin.user.create,admin.user.store,admin.user.status,admin.user.edit,admin.user.update,admin.user.reset,admin.permission.index,admin.permission.create,admin.permission.store,admin.permission.edit,admin.permission.update,admin.permission.delete,admin.roles.index,admin.roles.create,admin.roles.store,admin.roles.edit,admin.roles.update,admin.roles.delete,admin.menu.index,admin.menu.create,admin.menu.store,admin.menu.edit,admin.menu.update,admin.menu.delete,admin.test1.index,admin.test2.index,admin.test3.index,admin.test4.index,admin.test5.index,admin.test6.index,admin.lect.create.index,admin.lect.index,admin.lect.list.index,admin.lect.edit.index,admin.lect.update.index,admin.lect.index_list.index,admin.lect.destroy.index,admin.operationLog.index,admin.catelog.index.index,admin.catelog.list.index,admin.catelog.add.index,admin.catelog.catelog_list.index,admin.catelog.del.index,admin.catelog.catelog_upd.index,admin.catelog.catelog_upd_do.index,admin.course.course_add.index,admin.course.course_add_do.index,admin.course.list.index,admin.course.del.index,admin.course.update.index,admin.course.update_do.index,admin.course.give_or_take.index,admin.course.cate.index,admin.course.cate_do.index,admin.course.cate_list.index,admin.course.cate_del.index,admin.course.cate_update.index,admin.course.cate_update_do.index,admin.question_add.index,admin.question_doadd.index,admin.question_nameOnly.index,admin.question_list.index,admin.resposen_add.index,admin.questions_del.index,admin.exalute_add.index,admin.exaluate_doadd.index,admin.exalute_index.index,admin.exalute_del.index,admin.collect.collect_add.index,admin.collect.collect_list.index,admin.collect.destroy.index,admin.user_desc.index,admin.user_desc_add.index,admin.user_desc_list.index,admin.edit.index,admmin.destroy.index,admin.jin.index,admin.qi.index,admin.Information_index.index,admin.Information_create.create,admin.Information_create_do,admin.Information_delete.delete,admin.Information_edit.edit,admin.Information_update', '管理员', '2019-11-18 08:45:30', '2019-11-21 14:00:25');
INSERT INTO `permission` VALUES ('4', 'admin.user.index,admin.collect.collect_list.index,admin.user_desc.index,admin.user_desc_list.index', '用户', '2019-11-21 09:56:45', '2019-11-21 09:56:45');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `issue_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `title` varchar(50) NOT NULL COMMENT '问题标题',
  `content` varchar(255) DEFAULT NULL COMMENT '问题正文',
  `browse` int(11) NOT NULL COMMENT '浏览量',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否软删除',
  `time` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`issue_id`),
  KEY `u_id` (`u_id`),
  KEY `course_id` (`course_id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '1', '4', '刘丹凤', null, '1', '1', '1574160686');
INSERT INTO `questions` VALUES ('2', '1', '1', '大大', null, '1', '1', '1574160825');
INSERT INTO `questions` VALUES ('3', '1', '4', '文章马伊琍分手', null, '1', '1', '1574161328');
INSERT INTO `questions` VALUES ('4', '1', '4', '单选题', null, '1', '1', '1574164570');
INSERT INTO `questions` VALUES ('5', '1', '4', '复选题', null, '1', '1', '1574165315');
INSERT INTO `questions` VALUES ('6', '1', '4', 'leavel 框架', null, '1', '1', '1574165329');

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `is_answer` varchar(255) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_answer
-- ----------------------------
INSERT INTO `question_answer` VALUES ('102', '30', null, '1', '1574384817');
INSERT INTO `question_answer` VALUES ('101', '30', null, '1', '1574384817');
INSERT INTO `question_answer` VALUES ('100', '30', null, '1', '1574384817');
INSERT INTO `question_answer` VALUES ('99', '30', 'DDFF', '1', '1574384817');
INSERT INTO `question_answer` VALUES ('103', '31', 'fddfgdfg', '1', '1574384878');
INSERT INTO `question_answer` VALUES ('98', '29', '2', '1', '1574384803');
INSERT INTO `question_answer` VALUES ('105', '31', 'dsfsdf', '1', '1574384878');
INSERT INTO `question_answer` VALUES ('104', '31', 'dssdfd', '1', '1574384878');
INSERT INTO `question_answer` VALUES ('96', '28', null, '1', '1574336739');
INSERT INTO `question_answer` VALUES ('94', '28', null, '1', '1574336739');
INSERT INTO `question_answer` VALUES ('106', '31', 'dfsdfsd', '1', '1574384878');
INSERT INTO `question_answer` VALUES ('95', '28', null, '1', '1574336739');
INSERT INTO `question_answer` VALUES ('93', '28', '打撒', '1', '1574336739');
INSERT INTO `question_answer` VALUES ('97', '29', '1', '1', '1574384803');

-- ----------------------------
-- Table structure for question_problem
-- ----------------------------
DROP TABLE IF EXISTS `question_problem`;
CREATE TABLE `question_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_problem
-- ----------------------------
INSERT INTO `question_problem` VALUES ('29', '3', 'DSASDAS', '1574384803');
INSERT INTO `question_problem` VALUES ('30', '1', 'DSFSFSDF', '1574384817');
INSERT INTO `question_problem` VALUES ('31', '1', '第三代', '1574384878');
INSERT INTO `question_problem` VALUES ('28', '1', '撒大大', '1574336739');

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES ('1', '单选');
INSERT INTO `question_type` VALUES ('2', '多选');
INSERT INTO `question_type` VALUES ('3', '判断');

-- ----------------------------
-- Table structure for response
-- ----------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `r_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '问答ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `issue_id` int(11) NOT NULL COMMENT '问题ID',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否软删除',
  `time` int(11) NOT NULL COMMENT '回答时间',
  PRIMARY KEY (`r_id`),
  KEY `u_id` (`u_id`),
  KEY `course_id` (`course_id`),
  KEY `issue_id` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of response
-- ----------------------------
INSERT INTO `response` VALUES ('1', '1', '4', '1', '萨达', '1', '1574161246');
INSERT INTO `response` VALUES ('2', '1', '4', '1', '撒大大', '1', '1574161378');
INSERT INTO `response` VALUES ('3', '1', '4', '1', 'saadasd', '1', '1574236349');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('2', '闫瑞祥', '2019-11-15 08:22:01', '2019-11-15 08:22:01');
INSERT INTO `roles` VALUES ('3', '黄贤佩', '2019-11-21 09:53:07', '2019-11-21 09:53:07');
INSERT INTO `roles` VALUES ('4', '刘丹凤', '2019-11-21 09:53:27', '2019-11-21 09:53:27');
INSERT INTO `roles` VALUES ('5', '会员', '2019-11-21 09:57:58', '2019-11-21 09:57:58');

-- ----------------------------
-- Table structure for roles_permission
-- ----------------------------
DROP TABLE IF EXISTS `roles_permission`;
CREATE TABLE `roles_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roles_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限组id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='角色-权限关系表';

-- ----------------------------
-- Records of roles_permission
-- ----------------------------
INSERT INTO `roles_permission` VALUES ('2', '2', '2', '2019-11-15 08:22:01', '2019-11-15 08:22:01');
INSERT INTO `roles_permission` VALUES ('3', '3', '3', '2019-11-21 09:53:07', '2019-11-21 09:53:07');
INSERT INTO `roles_permission` VALUES ('4', '4', '3', '2019-11-21 09:53:27', '2019-11-21 09:53:27');
INSERT INTO `roles_permission` VALUES ('5', '5', '4', '2019-11-21 09:57:58', '2019-11-21 09:57:58');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `slide_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `slide_weight` int(11) DEFAULT NULL COMMENT '轮播图权重',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '轮播图地址',
  `slide_status` char(11) DEFAULT '1' COMMENT '1启用,2禁用',
  `slide_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('14', '10', 'img/2019-11-24/2426b2b8ae3ac915ec079bb9dddad361.jpg', '1', '1574586980');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `u_email` varchar(30) NOT NULL COMMENT '邮箱',
  `u_pwd` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_email` (`u_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', '2233682947@qq.com', '123456');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(188) NOT NULL COMMENT '密码',
  `administrator` tinyint(3) DEFAULT '2' COMMENT '是否超管，1是，2否',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，2禁用',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin@admin.com', '超级管理员', '$2y$10$QOtlXJ5mTdOJtOh9VVXGIekS2k2OzNdiMcq.F5Cnlr8CnWdq980ha', '1', '1', '1', '2019-05-05 19:57:01', '2019-06-10 03:29:56');
INSERT INTO `users` VALUES ('2', '2233682947@qq.com', '闫瑞祥', '$2y$10$rmlCJ9uCXsKrcBHQOU3RSuIV.pDecduDSx.YZZa0o./FTx/YyjVBO', '1', '1', '1', '2019-11-15 08:23:45', '2019-11-22 09:17:21');
INSERT INTO `users` VALUES ('3', '12345@qq.com', '刘丹凤', '$2y$10$r0zgYBzwdCXncEye31AawejcJtiIGqTkHAPi4ufftne0HZQJxa7dS', '1', '1', '1', '2019-11-21 10:06:02', '2019-11-21 10:06:02');

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `roles_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户-角色关系表';

-- ----------------------------
-- Records of users_roles
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `u_name` varchar(10) NOT NULL COMMENT '用户姓名',
  `u_head` varchar(100) NOT NULL DEFAULT '0' COMMENT '头像',
  `u_age` varchar(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `u_sex` varchar(5) NOT NULL DEFAULT '1' COMMENT '性别',
  `u_time` int(11) NOT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常 2 禁用',
  PRIMARY KEY (`user_info_id`),
  KEY `u_name` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('5', '5', '撒大声地', 'img/2019-11-21/55f5051308d311d0fafde63aed224d27.jpg', '1', '男', '1574315560', '1');
INSERT INTO `user_info` VALUES ('6', '1', '范德萨发放 的冯绍峰', 'img/2019-11-22/1ed72a8c74b1ef8086e52b73fab0abb3.jpg', '1', '男', '1574399184', '1');
INSERT INTO `user_info` VALUES ('8', '1', 'sad', 'uploads/2019-11-23/8df5b76eaa149e2ef31d9737c95084dc.jpg', '1', '男', '1574474403', '2');
