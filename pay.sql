/*
Navicat MySQL Data Transfer

Source Server         : pay
Source Server Version : 50505
Source Host           : 192.168.0.108:3306
Source Database       : pay

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-13 15:59:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for tp_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES ('1', '系统管理', '&#xe61d;', '2', '1', '', '0', '1450752856', '1481180175');
INSERT INTO `tp_admin_group` VALUES ('2', '工具', '&#xe616;', '3', '1', '', '0', '1476016712', '1481180175');

-- ----------------------------
-- Table structure for tp_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `isdelete` (`isdelete`),
  KEY `sort` (`sort`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES ('1', '0', '1', 'Admin', '后台管理', '后台管理，不可更改', '1', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('2', '1', '1', 'AdminGroup', '分组管理', ' ', '2', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('3', '1', '1', 'AdminNode', '节点管理', ' ', '2', '1', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('4', '1', '1', 'AdminRole', '角色管理', ' ', '2', '1', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('5', '1', '1', 'AdminUser', '用户管理', '', '2', '1', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('6', '1', '0', 'Index', '首页', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('7', '6', '0', 'welcome', '欢迎页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('8', '6', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('9', '1', '2', 'Generate', '代码自动生成', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('10', '1', '2', 'Demo/excel', 'Excel一键导出', '', '2', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('11', '1', '2', 'Demo/download', '下载', '', '2', '0', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('12', '1', '2', 'Demo/downloadImage', '远程图片下载', '', '2', '0', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('13', '1', '2', 'Demo/mail', '邮件发送', '', '2', '0', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('14', '1', '2', 'Demo/qiniu', '七牛上传', '', '2', '0', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('15', '1', '2', 'Demo/hashids', 'ID加密', '', '2', '0', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('16', '1', '2', 'Demo/layer', '丰富弹层', '', '2', '0', '8', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('17', '1', '2', 'Demo/tableFixed', '表格溢出', '', '2', '0', '9', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('18', '1', '2', 'Demo/ueditor', '百度编辑器', '', '2', '0', '10', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('19', '1', '2', 'Demo/imageUpload', '图片上传', '', '2', '0', '11', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('20', '1', '2', 'Demo/qrcode', '二维码生成', '', '2', '0', '12', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('21', '1', '1', 'NodeMap', '节点图', '', '2', '1', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('22', '1', '1', 'WebLog', '操作日志', '', '2', '1', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('23', '1', '1', 'LoginLog', '登录日志', '', '2', '1', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('59', '1', '2', 'one.two.three.Four/index', '多级节点', '', '2', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('24', '23', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('25', '22', '0', 'index', '列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('26', '22', '0', 'detail', '详情', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('27', '21', '0', 'load', '自动导入', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('28', '21', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('29', '5', '0', 'add', '添加', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('30', '21', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('31', '21', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('32', '9', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('33', '9', '0', 'generate', '生成方法', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('34', '5', '0', 'password', '修改密码', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('35', '5', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('36', '5', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('37', '5', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('38', '4', '0', 'user', '用户列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('39', '4', '0', 'access', '授权', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('40', '4', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('41', '4', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('42', '4', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('43', '4', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('44', '4', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('45', '3', '0', 'load', '节点快速导入测试', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('46', '3', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('47', '3', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('48', '3', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('49', '3', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('50', '3', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('51', '2', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('52', '2', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('53', '2', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('54', '2', '0', 'forbid', '默认禁用操作', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('55', '2', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('56', '1', '2', 'one', '一级菜单', '', '2', '1', '13', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('60', '56', '2', 'two', '二级', '', '3', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('61', '60', '2', 'three', '三级菜单', '', '4', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('62', '61', '2', 'Four', '四级菜单', '', '5', '1', '50', '1', '0');

-- ----------------------------
-- Table structure for tp_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='节点快速导入';

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES ('4', '编辑', 'edit', '1');
INSERT INTO `tp_admin_node_load` VALUES ('5', '添加', 'add', '1');
INSERT INTO `tp_admin_node_load` VALUES ('6', '首页', 'index', '1');
INSERT INTO `tp_admin_node_load` VALUES ('7', '删除', 'delete', '1');

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '0', '商户', ' ', '1', '0', '1208784792', '1497340103');
INSERT INTO `tp_admin_role` VALUES ('2', '0', '代理商', ' ', '1', '0', '1215496283', '1497340097');
INSERT INTO `tp_admin_role` VALUES ('3', '0', '业务员', '', '1', '0', '1497340110', '1497340110');
INSERT INTO `tp_admin_role` VALUES ('4', '0', '客服', '', '1', '0', '1497340117', '1497340117');

-- ----------------------------
-- Table structure for tp_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of tp_admin_role_user
-- ----------------------------
INSERT INTO `tp_admin_role_user` VALUES ('4', '2');

-- ----------------------------
-- Table structure for tp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(32) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(15) NOT NULL DEFAULT '',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `accountpassword` (`account`,`password`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1497339461', '0.0.0.0', '389', 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', '1', '0', '1222907803', '1451033528');
INSERT INTO `tp_admin_user` VALUES ('2', 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', '1481206367', '127.0.0.1', '5', '', '', '', '1', '0', '1476777133', '1477399793');

-- ----------------------------
-- Table structure for tp_agent
-- ----------------------------
DROP TABLE IF EXISTS `tp_agent`;
CREATE TABLE `tp_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL COMMENT '预留联系方式',
  `email` varchar(80) DEFAULT NULL COMMENT '预留联系方式',
  `password` varchar(80) DEFAULT NULL,
  `stauts` tinyint(2) DEFAULT NULL COMMENT '-1 审核未通过 0未审核 1审核通过 2 禁用',
  `create_time` int(11) DEFAULT NULL,
  `verify_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_agent
-- ----------------------------

-- ----------------------------
-- Table structure for tp_authentication
-- ----------------------------
DROP TABLE IF EXISTS `tp_authentication`;
CREATE TABLE `tp_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(80) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `verify_time` int(11) DEFAULT NULL,
  `expiration_time` int(11) DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 个人认证 2 企业认证',
  `identity_card` varchar(20) DEFAULT NULL,
  `user_card_1` varchar(128) DEFAULT NULL,
  `user_card_2` varchar(128) DEFAULT NULL,
  `user_card_3` varchar(128) DEFAULT NULL,
  `Legal_representative` varchar(30) DEFAULT NULL,
  `business_license_code` varchar(128) DEFAULT NULL,
  `tax_code` varchar(128) DEFAULT NULL,
  `business_license_img` varchar(128) DEFAULT NULL,
  `opening_permit` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_file
-- ----------------------------

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_location` varchar(255) NOT NULL DEFAULT '',
  `login_browser` varchar(255) NOT NULL DEFAULT '',
  `login_os` varchar(255) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES ('1', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-13 14:15:42');
INSERT INTO `tp_login_log` VALUES ('2', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-13 14:34:10');
INSERT INTO `tp_login_log` VALUES ('3', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-13 15:22:45');
INSERT INTO `tp_login_log` VALUES ('4', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(57.0.2987.110)', 'Windows 98', '2017-06-13 15:37:08');

-- ----------------------------
-- Table structure for tp_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tp_merchant`;
CREATE TABLE `tp_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL COMMENT '预留联系方式',
  `email` varchar(80) DEFAULT NULL COMMENT '预留联系方式',
  `agent_id` int(11) DEFAULT '0' COMMENT '所属代理id',
  `status` tinyint(2) DEFAULT '0' COMMENT '-1 审核未通过 0未审核 1审核通过 2 禁用',
  `create_time` int(11) DEFAULT NULL,
  `verify_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_merchant
-- ----------------------------

-- ----------------------------
-- Table structure for tp_node_map
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`),
  KEY `map` (`method`,`module`,`controller`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点图';

-- ----------------------------
-- Records of tp_node_map
-- ----------------------------

-- ----------------------------
-- Table structure for tp_notice
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice`;
CREATE TABLE `tp_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0 正常 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_notice
-- ----------------------------

-- ----------------------------
-- Table structure for tp_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) DEFAULT NULL COMMENT '选填',
  `select` varchar(255) DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='四级控制器';

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES ('1', 'yuan1994', 'tpadmin', '2', '1', null, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', '50', '1', '0', '1481947278', '1481947353');

-- ----------------------------
-- Table structure for tp_users
-- ----------------------------
DROP TABLE IF EXISTS `tp_users`;
CREATE TABLE `tp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT '1 业务员 2 客服管理',
  `status` tinyint(2) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_users
-- ----------------------------

-- ----------------------------
-- Table structure for tp_user_record
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_record`;
CREATE TABLE `tp_user_record` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `msg` varchar(128) DEFAULT NULL COMMENT '可供申请商户查询',
  `create_time` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1 审核代理商 2 审核商户 3 审核认证信息 4 发布信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user_record
-- ----------------------------

-- ----------------------------
-- Table structure for tp_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------
INSERT INTO `tp_web_log_001` VALUES ('1', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334482');
INSERT INTO `tp_web_log_001` VALUES ('2', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497334482');
INSERT INTO `tp_web_log_001` VALUES ('3', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:8:\"admin888\";s:7:\"captcha\";s:4:\"2ber\";}', '1497334493');
INSERT INTO `tp_web_log_001` VALUES ('4', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rjjr\";}', '1497334542');
INSERT INTO `tp_web_log_001` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334542');
INSERT INTO `tp_web_log_001` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497334542');
INSERT INTO `tp_web_log_001` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334626');
INSERT INTO `tp_web_log_001` VALUES ('8', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497334627');
INSERT INTO `tp_web_log_001` VALUES ('9', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497335506');
INSERT INTO `tp_web_log_001` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497335507');
INSERT INTO `tp_web_log_001` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497335507');
INSERT INTO `tp_web_log_001` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497335507');
INSERT INTO `tp_web_log_001` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497335508');
INSERT INTO `tp_web_log_001` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', '1497335509');
INSERT INTO `tp_web_log_001` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497335510');
INSERT INTO `tp_web_log_001` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335571');
INSERT INTO `tp_web_log_001` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497335571');
INSERT INTO `tp_web_log_001` VALUES ('18', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335631');
INSERT INTO `tp_web_log_001` VALUES ('19', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497335631');
INSERT INTO `tp_web_log_001` VALUES ('20', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"stwb\";}', '1497335641');
INSERT INTO `tp_web_log_001` VALUES ('21', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"hsph\";}', '1497335650');
INSERT INTO `tp_web_log_001` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335650');
INSERT INTO `tp_web_log_001` VALUES ('23', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497335650');
INSERT INTO `tp_web_log_001` VALUES ('24', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497338553');
INSERT INTO `tp_web_log_001` VALUES ('25', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497338553');
INSERT INTO `tp_web_log_001` VALUES ('26', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"vxtn\";}', '1497338565');
INSERT INTO `tp_web_log_001` VALUES ('27', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497338565');
INSERT INTO `tp_web_log_001` VALUES ('28', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497338565');
INSERT INTO `tp_web_log_001` VALUES ('29', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497339445');
INSERT INTO `tp_web_log_001` VALUES ('30', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497339446');
INSERT INTO `tp_web_log_001` VALUES ('31', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"38nd\";}', '1497339460');
INSERT INTO `tp_web_log_001` VALUES ('32', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497339462');
INSERT INTO `tp_web_log_001` VALUES ('33', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497339463');
INSERT INTO `tp_web_log_001` VALUES ('34', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497339520');
INSERT INTO `tp_web_log_001` VALUES ('35', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340010');
INSERT INTO `tp_web_log_001` VALUES ('36', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340010');
INSERT INTO `tp_web_log_001` VALUES ('37', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340010');
INSERT INTO `tp_web_log_001` VALUES ('38', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340011');
INSERT INTO `tp_web_log_001` VALUES ('39', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340012');
INSERT INTO `tp_web_log_001` VALUES ('40', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1497340031');
INSERT INTO `tp_web_log_001` VALUES ('41', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/demo/excel.html', 'admin', 'Demo', 'excel', 'GET', 'a:0:{}', '1497340032');
INSERT INTO `tp_web_log_001` VALUES ('42', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/demo/downloadimage.html', 'admin', 'Demo', 'downloadimage', 'GET', 'a:0:{}', '1497340033');
INSERT INTO `tp_web_log_001` VALUES ('43', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1497340040');
INSERT INTO `tp_web_log_001` VALUES ('44', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1497340043');
INSERT INTO `tp_web_log_001` VALUES ('45', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340052');
INSERT INTO `tp_web_log_001` VALUES ('46', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340076');
INSERT INTO `tp_web_log_001` VALUES ('47', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340078');
INSERT INTO `tp_web_log_001` VALUES ('48', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340080');
INSERT INTO `tp_web_log_001` VALUES ('49', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340082');
INSERT INTO `tp_web_log_001` VALUES ('50', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/2.html', 'admin', 'AdminRole', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', '1497340090');
INSERT INTO `tp_web_log_001` VALUES ('51', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/2.html', 'admin', 'AdminRole', 'edit', 'POST', 'a:4:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:9:\"代理商\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:1:\" \";}', '1497340097');
INSERT INTO `tp_web_log_001` VALUES ('52', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340097');
INSERT INTO `tp_web_log_001` VALUES ('53', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/1.html', 'admin', 'AdminRole', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1497340099');
INSERT INTO `tp_web_log_001` VALUES ('54', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/1.html', 'admin', 'AdminRole', 'edit', 'POST', 'a:4:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"商户\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:1:\" \";}', '1497340103');
INSERT INTO `tp_web_log_001` VALUES ('55', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340104');
INSERT INTO `tp_web_log_001` VALUES ('56', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', '1497340105');
INSERT INTO `tp_web_log_001` VALUES ('57', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"业务员\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1497340110');
INSERT INTO `tp_web_log_001` VALUES ('58', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340110');
INSERT INTO `tp_web_log_001` VALUES ('59', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', '1497340111');
INSERT INTO `tp_web_log_001` VALUES ('60', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"客服\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1497340117');
INSERT INTO `tp_web_log_001` VALUES ('61', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340117');
INSERT INTO `tp_web_log_001` VALUES ('62', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340119');
INSERT INTO `tp_web_log_001` VALUES ('63', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/add.html', 'admin', 'AdminUser', 'add', 'GET', 'a:0:{}', '1497340121');
INSERT INTO `tp_web_log_001` VALUES ('64', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340132');
INSERT INTO `tp_web_log_001` VALUES ('65', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/user/id/4.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1497340136');
INSERT INTO `tp_web_log_001` VALUES ('66', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/user/id/4.html', 'admin', 'AdminRole', 'user', 'POST', 'a:2:{s:2:\"id\";s:1:\"4\";s:7:\"user_id\";a:1:{i:0;s:1:\"2\";}}', '1497340139');
INSERT INTO `tp_web_log_001` VALUES ('67', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340148');
INSERT INTO `tp_web_log_001` VALUES ('68', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340149');
INSERT INTO `tp_web_log_001` VALUES ('69', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/access/id/4.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1497340155');
INSERT INTO `tp_web_log_001` VALUES ('70', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340179');
INSERT INTO `tp_web_log_001` VALUES ('71', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340192');
INSERT INTO `tp_web_log_001` VALUES ('72', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html?realname=&account=&email=&mobile=', 'admin', 'AdminUser', 'index', 'GET', 'a:4:{s:8:\"realname\";s:0:\"\";s:7:\"account\";s:0:\"\";s:5:\"email\";s:0:\"\";s:6:\"mobile\";s:0:\"\";}', '1497340196');
INSERT INTO `tp_web_log_001` VALUES ('73', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340206');
INSERT INTO `tp_web_log_001` VALUES ('74', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340207');
INSERT INTO `tp_web_log_001` VALUES ('75', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340207');
INSERT INTO `tp_web_log_001` VALUES ('76', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340207');
INSERT INTO `tp_web_log_001` VALUES ('77', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340208');
INSERT INTO `tp_web_log_001` VALUES ('78', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340208');
INSERT INTO `tp_web_log_001` VALUES ('79', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340209');
INSERT INTO `tp_web_log_001` VALUES ('80', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340209');
INSERT INTO `tp_web_log_001` VALUES ('81', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497340263');
INSERT INTO `tp_web_log_001` VALUES ('82', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497340263');
INSERT INTO `tp_web_log_001` VALUES ('83', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497340644');
INSERT INTO `tp_web_log_001` VALUES ('84', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497340645');
INSERT INTO `tp_web_log_001` VALUES ('85', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340698');
INSERT INTO `tp_web_log_001` VALUES ('86', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340702');
INSERT INTO `tp_web_log_001` VALUES ('87', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340702');
INSERT INTO `tp_web_log_001` VALUES ('88', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340703');
INSERT INTO `tp_web_log_001` VALUES ('89', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340708');
INSERT INTO `tp_web_log_001` VALUES ('90', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340742');
INSERT INTO `tp_web_log_001` VALUES ('91', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340732');
INSERT INTO `tp_web_log_001` VALUES ('92', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340735');
INSERT INTO `tp_web_log_001` VALUES ('93', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340735');
INSERT INTO `tp_web_log_001` VALUES ('94', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340735');
INSERT INTO `tp_web_log_001` VALUES ('95', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340735');
INSERT INTO `tp_web_log_001` VALUES ('96', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340736');
INSERT INTO `tp_web_log_001` VALUES ('97', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340736');
INSERT INTO `tp_web_log_001` VALUES ('98', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340736');
INSERT INTO `tp_web_log_001` VALUES ('99', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340738');
INSERT INTO `tp_web_log_001` VALUES ('100', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340739');
INSERT INTO `tp_web_log_001` VALUES ('101', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340739');
INSERT INTO `tp_web_log_001` VALUES ('102', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340739');
INSERT INTO `tp_web_log_001` VALUES ('103', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340774');
INSERT INTO `tp_web_log_001` VALUES ('104', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340775');
INSERT INTO `tp_web_log_001` VALUES ('105', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340775');
INSERT INTO `tp_web_log_001` VALUES ('106', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340776');
INSERT INTO `tp_web_log_001` VALUES ('107', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340794');
INSERT INTO `tp_web_log_001` VALUES ('108', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340795');
INSERT INTO `tp_web_log_001` VALUES ('109', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340795');

-- ----------------------------
-- Table structure for tp_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC INSERT_METHOD=LAST UNION=(`tp_web_log_001`) COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
INSERT INTO `tp_web_log_all` VALUES ('1', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334482');
INSERT INTO `tp_web_log_all` VALUES ('2', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497334482');
INSERT INTO `tp_web_log_all` VALUES ('3', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:8:\"admin888\";s:7:\"captcha\";s:4:\"2ber\";}', '1497334493');
INSERT INTO `tp_web_log_all` VALUES ('4', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rjjr\";}', '1497334542');
INSERT INTO `tp_web_log_all` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334542');
INSERT INTO `tp_web_log_all` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497334542');
INSERT INTO `tp_web_log_all` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497334626');
INSERT INTO `tp_web_log_all` VALUES ('8', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497334627');
INSERT INTO `tp_web_log_all` VALUES ('9', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497335506');
INSERT INTO `tp_web_log_all` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497335507');
INSERT INTO `tp_web_log_all` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497335507');
INSERT INTO `tp_web_log_all` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497335507');
INSERT INTO `tp_web_log_all` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497335508');
INSERT INTO `tp_web_log_all` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', '1497335509');
INSERT INTO `tp_web_log_all` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497335510');
INSERT INTO `tp_web_log_all` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335571');
INSERT INTO `tp_web_log_all` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497335571');
INSERT INTO `tp_web_log_all` VALUES ('18', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335631');
INSERT INTO `tp_web_log_all` VALUES ('19', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497335631');
INSERT INTO `tp_web_log_all` VALUES ('20', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"stwb\";}', '1497335641');
INSERT INTO `tp_web_log_all` VALUES ('21', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"hsph\";}', '1497335650');
INSERT INTO `tp_web_log_all` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497335650');
INSERT INTO `tp_web_log_all` VALUES ('23', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497335650');
INSERT INTO `tp_web_log_all` VALUES ('24', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497338553');
INSERT INTO `tp_web_log_all` VALUES ('25', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497338553');
INSERT INTO `tp_web_log_all` VALUES ('26', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"vxtn\";}', '1497338565');
INSERT INTO `tp_web_log_all` VALUES ('27', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497338565');
INSERT INTO `tp_web_log_all` VALUES ('28', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497338565');
INSERT INTO `tp_web_log_all` VALUES ('29', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497339445');
INSERT INTO `tp_web_log_all` VALUES ('30', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1497339446');
INSERT INTO `tp_web_log_all` VALUES ('31', '0', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"38nd\";}', '1497339460');
INSERT INTO `tp_web_log_all` VALUES ('32', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497339462');
INSERT INTO `tp_web_log_all` VALUES ('33', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497339463');
INSERT INTO `tp_web_log_all` VALUES ('34', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497339520');
INSERT INTO `tp_web_log_all` VALUES ('35', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340010');
INSERT INTO `tp_web_log_all` VALUES ('36', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340010');
INSERT INTO `tp_web_log_all` VALUES ('37', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340010');
INSERT INTO `tp_web_log_all` VALUES ('38', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340011');
INSERT INTO `tp_web_log_all` VALUES ('39', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340012');
INSERT INTO `tp_web_log_all` VALUES ('40', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1497340031');
INSERT INTO `tp_web_log_all` VALUES ('41', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/demo/excel.html', 'admin', 'Demo', 'excel', 'GET', 'a:0:{}', '1497340032');
INSERT INTO `tp_web_log_all` VALUES ('42', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/demo/downloadimage.html', 'admin', 'Demo', 'downloadimage', 'GET', 'a:0:{}', '1497340033');
INSERT INTO `tp_web_log_all` VALUES ('43', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1497340040');
INSERT INTO `tp_web_log_all` VALUES ('44', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1497340043');
INSERT INTO `tp_web_log_all` VALUES ('45', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340052');
INSERT INTO `tp_web_log_all` VALUES ('46', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340076');
INSERT INTO `tp_web_log_all` VALUES ('47', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340078');
INSERT INTO `tp_web_log_all` VALUES ('48', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340080');
INSERT INTO `tp_web_log_all` VALUES ('49', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340082');
INSERT INTO `tp_web_log_all` VALUES ('50', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/2.html', 'admin', 'AdminRole', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', '1497340090');
INSERT INTO `tp_web_log_all` VALUES ('51', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/2.html', 'admin', 'AdminRole', 'edit', 'POST', 'a:4:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:9:\"代理商\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:1:\" \";}', '1497340097');
INSERT INTO `tp_web_log_all` VALUES ('52', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340097');
INSERT INTO `tp_web_log_all` VALUES ('53', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/1.html', 'admin', 'AdminRole', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1497340099');
INSERT INTO `tp_web_log_all` VALUES ('54', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/edit/id/1.html', 'admin', 'AdminRole', 'edit', 'POST', 'a:4:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"商户\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:1:\" \";}', '1497340103');
INSERT INTO `tp_web_log_all` VALUES ('55', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340104');
INSERT INTO `tp_web_log_all` VALUES ('56', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', '1497340105');
INSERT INTO `tp_web_log_all` VALUES ('57', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"业务员\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1497340110');
INSERT INTO `tp_web_log_all` VALUES ('58', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340110');
INSERT INTO `tp_web_log_all` VALUES ('59', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', '1497340111');
INSERT INTO `tp_web_log_all` VALUES ('60', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"客服\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1497340117');
INSERT INTO `tp_web_log_all` VALUES ('61', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340117');
INSERT INTO `tp_web_log_all` VALUES ('62', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340119');
INSERT INTO `tp_web_log_all` VALUES ('63', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/add.html', 'admin', 'AdminUser', 'add', 'GET', 'a:0:{}', '1497340121');
INSERT INTO `tp_web_log_all` VALUES ('64', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340132');
INSERT INTO `tp_web_log_all` VALUES ('65', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/user/id/4.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1497340136');
INSERT INTO `tp_web_log_all` VALUES ('66', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/user/id/4.html', 'admin', 'AdminRole', 'user', 'POST', 'a:2:{s:2:\"id\";s:1:\"4\";s:7:\"user_id\";a:1:{i:0;s:1:\"2\";}}', '1497340139');
INSERT INTO `tp_web_log_all` VALUES ('67', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340148');
INSERT INTO `tp_web_log_all` VALUES ('68', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340149');
INSERT INTO `tp_web_log_all` VALUES ('69', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_role/access/id/4.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1497340155');
INSERT INTO `tp_web_log_all` VALUES ('70', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340179');
INSERT INTO `tp_web_log_all` VALUES ('71', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1497340192');
INSERT INTO `tp_web_log_all` VALUES ('72', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_user/index.html?realname=&account=&email=&mobile=', 'admin', 'AdminUser', 'index', 'GET', 'a:4:{s:8:\"realname\";s:0:\"\";s:7:\"account\";s:0:\"\";s:5:\"email\";s:0:\"\";s:6:\"mobile\";s:0:\"\";}', '1497340196');
INSERT INTO `tp_web_log_all` VALUES ('73', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340206');
INSERT INTO `tp_web_log_all` VALUES ('74', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340207');
INSERT INTO `tp_web_log_all` VALUES ('75', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340207');
INSERT INTO `tp_web_log_all` VALUES ('76', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340207');
INSERT INTO `tp_web_log_all` VALUES ('77', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340208');
INSERT INTO `tp_web_log_all` VALUES ('78', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340208');
INSERT INTO `tp_web_log_all` VALUES ('79', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340209');
INSERT INTO `tp_web_log_all` VALUES ('80', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340209');
INSERT INTO `tp_web_log_all` VALUES ('81', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497340263');
INSERT INTO `tp_web_log_all` VALUES ('82', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497340263');
INSERT INTO `tp_web_log_all` VALUES ('83', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1497340644');
INSERT INTO `tp_web_log_all` VALUES ('84', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1497340645');
INSERT INTO `tp_web_log_all` VALUES ('85', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340698');
INSERT INTO `tp_web_log_all` VALUES ('86', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340702');
INSERT INTO `tp_web_log_all` VALUES ('87', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340702');
INSERT INTO `tp_web_log_all` VALUES ('88', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340703');
INSERT INTO `tp_web_log_all` VALUES ('89', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1497340708');
INSERT INTO `tp_web_log_all` VALUES ('90', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340742');
INSERT INTO `tp_web_log_all` VALUES ('91', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340732');
INSERT INTO `tp_web_log_all` VALUES ('92', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340735');
INSERT INTO `tp_web_log_all` VALUES ('93', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340735');
INSERT INTO `tp_web_log_all` VALUES ('94', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340735');
INSERT INTO `tp_web_log_all` VALUES ('95', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340735');
INSERT INTO `tp_web_log_all` VALUES ('96', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340736');
INSERT INTO `tp_web_log_all` VALUES ('97', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340736');
INSERT INTO `tp_web_log_all` VALUES ('98', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340736');
INSERT INTO `tp_web_log_all` VALUES ('99', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340738');
INSERT INTO `tp_web_log_all` VALUES ('100', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340739');
INSERT INTO `tp_web_log_all` VALUES ('101', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340739');
INSERT INTO `tp_web_log_all` VALUES ('102', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(53.0)', 'http://www.pay.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340739');
INSERT INTO `tp_web_log_all` VALUES ('103', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340774');
INSERT INTO `tp_web_log_all` VALUES ('104', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340775');
INSERT INTO `tp_web_log_all` VALUES ('105', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340775');
INSERT INTO `tp_web_log_all` VALUES ('106', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1497340776');
INSERT INTO `tp_web_log_all` VALUES ('107', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1497340794');
INSERT INTO `tp_web_log_all` VALUES ('108', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1497340795');
INSERT INTO `tp_web_log_all` VALUES ('109', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 98', 'Chrome(57.0.2987.110)', 'http://localhost/pay/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1497340795');
