/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : xmanager

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2015-08-12 09:39:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单ID',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `url` varchar(255) NOT NULL COMMENT '权限路径',
  `status` enum('delete','invalid','valid') NOT NULL DEFAULT 'valid' COMMENT '状态',
  `create_time` datetime NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL DEFAULT '0',
  `modifier` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '菜单URL',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单ID',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '菜单顺序',
  `icon` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '菜单类型：1-一级菜单； 2-二级菜单',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `status` enum('delete','invalid','valid') NOT NULL DEFAULT 'valid' COMMENT '状态',
  `create_time` datetime NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL DEFAULT '0',
  `modifier` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `status` enum('delete','invalid','valid') NOT NULL DEFAULT 'valid' COMMENT '状态',
  `create_time` datetime NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL DEFAULT '0',
  `modifier` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '资源类型：1-一级菜单； 2-二级菜单；3-权限',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `last_login` datetime DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `status` enum('delete','invalid','valid') NOT NULL DEFAULT 'valid' COMMENT '状态',
  `description` varchar(255) NOT NULL,
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `phone` varchar(32) NOT NULL,
  `skin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL DEFAULT '0',
  `modifier` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '312', '321', '123', null, '12', 'delete', '1', '2', '3', '1', '2015-07-06 17:56:45', '2015-07-17 09:09:51', '0', '2');
INSERT INTO `sys_user` VALUES ('2', 'test', 'ac8de3b5b736fd627b42c91071c5c2a6ec963a89', '唐乾', '2015-07-08 10:19:35', null, 'delete', '测试账号', '275855127@qq.com', '88888888', '1', '2015-07-07 10:00:53', '2015-07-17 09:38:42', '1', '2');
INSERT INTO `sys_user` VALUES ('3', 'test1', '4bbc30cd4208c09e02ed2a9eafdea77e5305e5ff', 'tq', null, null, 'delete', 'test123', '275855127@qq.com', '999999999', '1', '2015-07-07 10:07:59', '2015-07-18 11:29:12', '1', '2');
INSERT INTO `sys_user` VALUES ('4', 'admin', '28dca2a7b33b7413ad3bce1d58c26dd679c799f1', '唐乾', null, null, 'delete', '222222222222', '275855127@qq.com', '88888888', '1', '2015-07-08 10:10:41', '2015-07-18 11:56:13', '1', '2');
INSERT INTO `sys_user` VALUES ('5', 'tq', '9d14e150574333636fd23ae1216e42c9a2f4bf17', '唐乾1', null, null, 'delete', 'ddddddddddd1', '275855127@qq.com', '888888881', '1', '2015-07-08 14:12:34', '2015-07-18 14:01:21', '1', '2');
INSERT INTO `sys_user` VALUES ('6', '特点', '67725379c92070bdbfca60a6cb358e585af00e7f', '磊', null, null, 'delete', '磊', '275855127@qq.com', '磊', '1', '2015-07-09 15:23:08', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('7', 'test2', 'b48956c53de593d46a6ef3f1262cfdc808c76381', '唐乾', null, null, 'delete', 'ddddd2', '275855127@qq.com', '88888888', '1', '2015-07-09 16:47:36', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('8', 'test22', '9976ba36e15632966e5c6aeae89a81db706f9e1d', 'test', null, null, 'delete', '123', '275855127@qq.com', '123', '1', '2015-07-09 17:06:54', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('9', 'ddd', '7f098fb1da9d37f5747a6e7ed5724c96f96007db', 'ddd2w', null, null, 'delete', '333333333211w', '275855127@qq.com2w', '3333211w', '1', '2015-07-09 17:08:06', '2015-07-17 16:22:46', '1', '2');
INSERT INTO `sys_user` VALUES ('10', 'dddd', 'd15087ca48a637e7f86274a236bdc9c2c631e513', '12345', null, null, 'delete', '222245', '275855127@qq.com', '8888888845', '1', '2015-07-10 10:17:45', '2015-07-18 11:51:15', '1', '2');
INSERT INTO `sys_user` VALUES ('11', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '1231', null, null, 'delete', '222221', '275855127@qq.com', '888888881', '1', '2015-07-10 16:54:45', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('12', 'ddd', '0427545ac5e1db3ec9d795905f08e30b15aac940', '23', null, null, 'delete', '2222', '23', '23', '1', '2015-07-10 19:19:01', '2015-07-17 16:14:55', '1', '2');
INSERT INTO `sys_user` VALUES ('13', 'test1', '4bbc30cd4208c09e02ed2a9eafdea77e5305e5ff', '唐乾', null, null, 'delete', '2222222', '275855127@qq.com', '33332', '1', '2015-07-13 10:51:51', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('14', 'tes1', 'b8e8d16ad50a378c9b443cff1a1fc19a48b8ac5e', '1232', null, null, 'delete', '22222222', '275855127@qq.com', '22222', '1', '2015-07-13 14:35:50', '2015-07-18 14:03:05', '1', '2');
INSERT INTO `sys_user` VALUES ('15', 'ddd', '0427545ac5e1db3ec9d795905f08e30b15aac940', '1233w', null, null, 'delete', '22223w', '275855127@qq.com', '22223w', '1', '2015-07-13 14:46:12', '2015-07-17 16:22:02', '1', '2');
INSERT INTO `sys_user` VALUES ('16', '123', '601f1889667efaebb33b8c12572835da3f027f78', '1', null, null, 'delete', '321321', '275855127@qq.com', '2321', '1', '2015-07-13 14:46:50', '2015-07-18 14:12:26', '1', '2');
INSERT INTO `sys_user` VALUES ('17', '1233', 'a971f78af101664553ac2e6d2997b1f7b491936f', '123', null, null, 'delete', '3333333333', '275855127@qq.com', '222222', '1', '2015-07-13 14:47:49', '2015-07-18 15:49:10', '1', '2');
INSERT INTO `sys_user` VALUES ('18', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '唐乾', null, null, 'delete', '22222222', '275855127@qq.com', '88888888', '1', '2015-07-16 19:38:58', '2015-07-21 15:50:43', '1', '2');
INSERT INTO `sys_user` VALUES ('19', 'admin2', '3860fdcdae38a9a5be3660ca55fa09d151e42277', '唐乾', null, null, 'valid', '2222222222222', '275855127@qq.com', '88888888', '1', '2015-07-16 19:39:16', '2015-07-16 20:37:28', '1', '2');
INSERT INTO `sys_user` VALUES ('20', 'admin111', 'b102a391d61cd24b9b4bb9f9b271feb672f2fb59', '唐乾1', null, null, 'delete', '21321', '275855127@qq.com3', '88888888', '1', '2015-07-16 19:46:44', '2015-07-21 14:24:45', '1', '2');
INSERT INTO `sys_user` VALUES ('21', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '123', null, null, 'delete', '2222', '275855127@qq.com', '88888888', '1', '2015-07-16 20:09:23', '2015-07-18 15:49:10', '1', '2');
INSERT INTO `sys_user` VALUES ('22', 'admin2', '3860fdcdae38a9a5be3660ca55fa09d151e42277', '唐乾', null, null, 'valid', '22222222222222', '275855127@qq.com', '88888888', '1', '2015-07-16 20:24:52', '2015-07-16 20:37:21', '1', '2');
INSERT INTO `sys_user` VALUES ('23', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '唐乾1', null, null, 'delete', '2222222', '275855127@qq.com1', '888888881', '1', '2015-07-16 20:45:45', '2015-07-21 15:50:54', '1', '2');
INSERT INTO `sys_user` VALUES ('24', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '唐乾', null, null, 'delete', '2222222222', '275855127@qq.com2', '88888888', '1', '2015-07-16 20:47:11', '2015-07-21 15:50:54', '1', '2');
INSERT INTO `sys_user` VALUES ('25', '123', '601f1889667efaebb33b8c12572835da3f027f78', '唐乾22', null, null, 'valid', '222222222', '275855127@qq.com2', '333322', '1', '2015-07-16 20:47:27', '2015-07-18 10:31:11', '1', '2');
INSERT INTO `sys_user` VALUES ('26', 'ddd2', '10c01257c95fbc361c9032e16e99422be3979b4a', '唐乾', null, null, 'valid', 'sssssssss', '275855127@qq.com', 'eeeeeeeee', '1', '2015-07-17 16:13:00', '2015-07-17 16:13:00', '1', '1');
INSERT INTO `sys_user` VALUES ('27', 'ddd9', '8785b7c44005469d83acd7afae1ef54021549983', '3434333', null, null, 'delete', 'ddddddddddd', '275855127@qq.com', 'eeewwww', '1', '2015-07-17 16:14:00', '2015-07-17 16:14:27', '1', '2');
INSERT INTO `sys_user` VALUES ('28', 'admin111', 'b102a391d61cd24b9b4bb9f9b271feb672f2fb59', '唐乾', null, null, 'valid', 'eeeeeee', '275855127@qq.com', '8888888845', '1', '2015-07-18 10:34:15', '2015-07-18 10:34:15', '1', '1');
INSERT INTO `sys_user` VALUES ('29', 'admin12', '0cc3cc9edabcf2e4a94957548177acf0d1536b5a', '唐乾', null, null, 'valid', '222222222', '275855127@qq.com', '8888888845', '1', '2015-07-18 10:34:48', '2015-07-18 10:34:48', '1', '1');
INSERT INTO `sys_user` VALUES ('30', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '唐乾', null, null, 'valid', '222222', '275855127@qq.com', '8888888845', '1', '2015-07-18 10:37:06', '2015-07-18 10:37:06', '1', '1');
INSERT INTO `sys_user` VALUES ('31', 'admin12', '0cc3cc9edabcf2e4a94957548177acf0d1536b5a', '唐乾', null, null, 'valid', '222222222222', '275855127@qq.com', '888888884', '1', '2015-07-18 11:26:59', '2015-07-18 11:26:59', '1', '1');
INSERT INTO `sys_user` VALUES ('32', 'admin1', 'ab367f41a5b051730cca3dcadca6e0c5a4d93bfe', '唐乾', null, null, 'valid', '222', '222', '222', '1', '2015-07-18 11:28:28', '2015-07-18 11:28:28', '1', '1');
INSERT INTO `sys_user` VALUES ('33', 'admin', '28dca2a7b33b7413ad3bce1d58c26dd679c799f1', '唐乾', null, null, 'valid', '33333', '275855127@qq.com', '8888888845', '1', '2015-07-18 11:35:08', '2015-07-18 11:35:08', '1', '1');
INSERT INTO `sys_user` VALUES ('34', '12', '73da7bb9d2a475bbc2ab79da7d4e94940cb9f9d5', '唐乾', null, null, 'valid', '22222222', '275855127@qq.com2', '888888884', '1', '2015-07-18 11:35:33', '2015-07-18 11:35:33', '1', '1');
INSERT INTO `sys_user` VALUES ('35', 'admin333', '0b53154edec75dd6315d174b0e8eb53dc07e5534', '123', null, null, 'valid', '22222222', '275855127@qq.com', '888888884', '1', '2015-07-21 14:26:15', '2015-07-21 14:26:15', '1', '1');
INSERT INTO `sys_user` VALUES ('36', 'dddd', 'd15087ca48a637e7f86274a236bdc9c2c631e513', '21', null, null, 'valid', '22222', '321', '312', '1', '2015-07-21 15:49:23', '2015-07-21 15:49:23', '1', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

CREATE TABLE `file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `save_path` varchar(225) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `original_name` varchar(225) NOT NULL DEFAULT '' COMMENT '原始名称',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `ext` varchar(100) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `status` enum('delete','invalid','valid') NOT NULL DEFAULT 'valid' COMMENT '状态',
  `md5` varchar(225) NOT NULL DEFAULT '' COMMENT 'md5值',
  `content_type` varchar(100) NOT NULL DEFAULT '',
  `temp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否临时文件',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='文件信息表';

