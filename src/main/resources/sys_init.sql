/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : xmanager

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2015-07-20 13:54:27
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

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
