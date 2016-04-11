/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50171
Source Host           : localhost:3306
Source Database       : battcn

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2016-03-21 18:25:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mp_buttom
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_buttom`;
CREATE TABLE `t_mp_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '按钮名字',
  `buttom` varchar(200) DEFAULT NULL COMMENT '按钮的代码',
  `description` varchar(100) DEFAULT NULL COMMENT '按钮的描述信息',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mp_buttom
-- ----------------------------
INSERT INTO `t_mp_buttom` VALUES ('1', '新增', '<button onclick=\"addFun()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', null, '2016-01-19 16:40:23');
INSERT INTO `t_mp_buttom` VALUES ('2', '编辑', '<button onclick=\"editFun()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', null, '2016-01-19 16:40:23');
INSERT INTO `t_mp_buttom` VALUES ('3', '删除', '<button onclick=\"delFun()\" class=\"btn btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', null, '2016-01-19 16:40:23');
INSERT INTO `t_mp_buttom` VALUES ('4', '导出', '<button onclick=\"exportFun()\" class=\"btn btn-primary\" type=\"button\"><i class=\"fa fa-file-excel-o\"></i> 导出</button>', null, '2016-01-19 16:40:23');
INSERT INTO `t_mp_buttom` VALUES ('5', '分配权限', '<button onclick=\"distFun()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', null, '2016-01-19 16:40:23');

-- ----------------------------
-- Table structure for t_mp_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_dictionary`;
CREATE TABLE `t_mp_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '0:已删除,1:可是用',
  `parent_id` int(11) DEFAULT NULL,
  `operater_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL COMMENT '字典表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mp_dictionary
-- ----------------------------
INSERT INTO `t_mp_dictionary` VALUES ('2', '1', '0', null, '122', '2016-02-23 13:51:15', null);
INSERT INTO `t_mp_dictionary` VALUES ('3', '1', '2', null, '122a', '2016-02-25 09:56:03', null);
INSERT INTO `t_mp_dictionary` VALUES ('4', '1', '2', null, '1222a', '2016-02-25 13:41:26', null);
INSERT INTO `t_mp_dictionary` VALUES ('5', '1', '3', null, '123b', '2016-02-25 11:30:56', null);
INSERT INTO `t_mp_dictionary` VALUES ('6', '1', '0', null, '124', '2016-02-24 17:59:13', null);
INSERT INTO `t_mp_dictionary` VALUES ('10', '1', '0', null, '126', '2016-02-23 13:51:20', null);
INSERT INTO `t_mp_dictionary` VALUES ('11', '1', '0', null, '127', '2016-02-23 14:53:16', '2016-02-23 14:49:56');
INSERT INTO `t_mp_dictionary` VALUES ('15', '1', '1', null, '131', '2016-02-25 09:05:48', null);

-- ----------------------------
-- Table structure for t_mp_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_log`;
CREATE TABLE `t_mp_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL COMMENT '账户名',
  `module` varchar(30) DEFAULT NULL COMMENT '请求模块',
  `methods` varchar(50) DEFAULT NULL COMMENT '请求方法',
  `actionTime` varchar(30) DEFAULT NULL COMMENT '执行时间',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `description` varchar(5000) DEFAULT NULL COMMENT '描述',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='枫叶网---->日志记录表';

-- ----------------------------
-- Records of t_mp_log
-- ----------------------------
INSERT INTO `t_mp_log` VALUES ('63', '无法获取登录用户信息！', '日志管理', '添加日志', '78', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 15:48:57');
INSERT INTO `t_mp_log` VALUES ('65', '无法获取登录用户信息！', '日志管理', '添加日志', '73', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:08:26');
INSERT INTO `t_mp_log` VALUES ('66', '无法获取登录用户信息！', '日志管理', '删除日志', '40', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:20:39');
INSERT INTO `t_mp_log` VALUES ('67', '无法获取登录用户信息！', '日志管理', '删除日志', '43', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:20:41');
INSERT INTO `t_mp_log` VALUES ('68', '无法获取登录用户信息！', '日志管理', '删除日志', '39', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:25:18');
INSERT INTO `t_mp_log` VALUES ('70', '无法获取登录用户信息！', '日志管理', '添加日志', '10040', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:39:29');
INSERT INTO `t_mp_log` VALUES ('71', '无法获取登录用户信息！', '日志管理', '删除日志', '49', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 16:42:51');
INSERT INTO `t_mp_log` VALUES ('73', '无法获取登录用户信息！', '日志管理', '添加日志', '83', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:21:48');
INSERT INTO `t_mp_log` VALUES ('107', '无法获取登录用户信息！', '日志管理', '批量删除日志', '86', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:26:41');
INSERT INTO `t_mp_log` VALUES ('109', '无法获取登录用户信息！', '日志管理', '添加日志', '82', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:26:49');
INSERT INTO `t_mp_log` VALUES ('110', '无法获取登录用户信息！', '日志管理', '批量删除日志', '42', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:29:59');
INSERT INTO `t_mp_log` VALUES ('112', '无法获取登录用户信息！', '日志管理', '添加日志', '84', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:30:10');
INSERT INTO `t_mp_log` VALUES ('114', '无法获取登录用户信息！', '日志管理', '添加日志', '80', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:30:43');
INSERT INTO `t_mp_log` VALUES ('116', '无法获取登录用户信息！', '日志管理', '添加日志', '86', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:31:02');
INSERT INTO `t_mp_log` VALUES ('117', '无法获取登录用户信息！', '日志管理', '删除日志', '44', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:31:08');
INSERT INTO `t_mp_log` VALUES ('118', '无法获取登录用户信息！', '日志管理', '删除日志', '42', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:31:11');
INSERT INTO `t_mp_log` VALUES ('119', '无法获取登录用户信息！', '日志管理', '删除日志', '47', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:31:14');
INSERT INTO `t_mp_log` VALUES ('121', '无法获取登录用户信息！', '日志管理', '添加日志', '85', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:32:06');
INSERT INTO `t_mp_log` VALUES ('123', '无法获取登录用户信息！', '日志管理', '添加日志', '91', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:32:09');
INSERT INTO `t_mp_log` VALUES ('124', '无法获取登录用户信息！', '日志管理', '批量删除日志', '43', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:32:18');
INSERT INTO `t_mp_log` VALUES ('126', '无法获取登录用户信息！', '日志管理', '添加日志', '80', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:44:03');
INSERT INTO `t_mp_log` VALUES ('127', '无法获取登录用户信息！', '日志管理', '删除日志', '42', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:44:24');
INSERT INTO `t_mp_log` VALUES ('129', '无法获取登录用户信息！', '日志管理', '添加日志', '87', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:56:53');
INSERT INTO `t_mp_log` VALUES ('130', '无法获取登录用户信息！', '日志管理', '删除日志', '41', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 17:56:57');
INSERT INTO `t_mp_log` VALUES ('132', '无法获取登录用户信息！', '日志管理', '添加日志', '93', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-05 18:03:07');
INSERT INTO `t_mp_log` VALUES ('133', '无法获取登录用户信息！', '日志管理', '删除日志', '117', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-06 13:46:46');
INSERT INTO `t_mp_log` VALUES ('135', '无法获取登录用户信息！', '日志管理', '添加日志', '231', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 13:22:11');
INSERT INTO `t_mp_log` VALUES ('136', '无法获取登录用户信息！', '日志管理', '删除日志', '55', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 13:22:17');
INSERT INTO `t_mp_log` VALUES ('150', 'memmsc', '日志管理', '删除日志', '43', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 14:42:07');
INSERT INTO `t_mp_log` VALUES ('151', 'memmsc', '日志管理', '删除日志', '56', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 14:42:17');
INSERT INTO `t_mp_log` VALUES ('152', '无法获取登录用户信息！', '日志管理', '删除日志', '37', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 15:11:59');
INSERT INTO `t_mp_log` VALUES ('154', 'memmsc', '日志管理', '添加日志', '79', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 15:45:35');
INSERT INTO `t_mp_log` VALUES ('155', 'memmsc', '日志管理', '删除日志', '41', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 15:49:07');
INSERT INTO `t_mp_log` VALUES ('156', 'memmsc', '用户管理', '添加用户', '83', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 16:07:05');
INSERT INTO `t_mp_log` VALUES ('157', 'memmsc', '用户管理', '添加用户', '82', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 16:07:35');
INSERT INTO `t_mp_log` VALUES ('158', 'memmsc', '用户管理', '<font color=\"red\">执行方法异常:-->删除用户</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n### The error may involve com.battcn.mapper.UserInfoMapper.deleteByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM t_mp_userinfo  WHERE  id = ?\r\n### Cause: java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long</font>', '2016-01-07 16:07:38');
INSERT INTO `t_mp_log` VALUES ('159', 'memmsc', '用户管理', '删除用户', '42', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 16:11:19');
INSERT INTO `t_mp_log` VALUES ('160', '无法获取登录用户信息！', '用户管理', '添加用户', '104', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 16:56:32');
INSERT INTO `t_mp_log` VALUES ('161', '无法获取登录用户信息！', '用户管理', '添加用户', '67', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 16:56:38');
INSERT INTO `t_mp_log` VALUES ('162', '无法获取登录用户信息！', '用户管理', '添加用户', '51', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:18:44');
INSERT INTO `t_mp_log` VALUES ('163', '无法获取登录用户信息！', '用户管理', '添加用户', '44', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:18:48');
INSERT INTO `t_mp_log` VALUES ('164', '无法获取登录用户信息！', '用户管理', '添加用户', '87', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:18:59');
INSERT INTO `t_mp_log` VALUES ('165', '无法获取登录用户信息！', '用户管理', '批量删除用户', '83', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:21:00');
INSERT INTO `t_mp_log` VALUES ('166', '无法获取登录用户信息！', '用户管理', '添加用户', '113', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:39:09');
INSERT INTO `t_mp_log` VALUES ('167', '无法获取登录用户信息！', '用户管理', '添加用户', '64', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 17:43:19');
INSERT INTO `t_mp_log` VALUES ('168', 'memmsc', '用户管理', '添加用户', '46', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 18:46:58');
INSERT INTO `t_mp_log` VALUES ('169', 'memmsc', '用户管理', '添加用户', '96', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 18:54:38');
INSERT INTO `t_mp_log` VALUES ('170', 'memmsc', '用户管理', '批量删除用户', '115', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 18:54:45');
INSERT INTO `t_mp_log` VALUES ('171', 'memmsc', '用户管理', '添加用户', '97', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 18:57:02');
INSERT INTO `t_mp_log` VALUES ('172', 'memmsc', '用户管理', '批量删除用户', '65', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-07 18:57:09');
INSERT INTO `t_mp_log` VALUES ('173', '无法获取登录用户信息！', '用户管理', '用户登陆', '227', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('174', '无法获取登录用户信息！', '用户管理', '用户登陆', '226', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('175', '无法获取登录用户信息！', '用户管理', '用户登陆', '181', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('176', '无法获取登录用户信息！', '用户管理', '用户登陆', '643', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('177', '无法获取登录用户信息！', '用户管理', '用户登陆', '212', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('178', '无法获取登录用户信息！', '用户管理', '用户登陆', '217', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('179', '无法获取登录用户信息！', '用户管理', '用户登陆', '236', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('180', '无法获取登录用户信息！', '用户管理', '用户登陆', '266', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('181', '无法获取登录用户信息！', '用户管理', '用户登陆', '197', '127.0.0.1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('182', '无法获取登录用户信息！', '用户管理', '用户登陆', '198', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('183', '无法获取登录用户信息！', '用户管理', '用户登陆', '269', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('184', '无法获取登录用户信息！', '用户管理', '用户登陆', '247', '0:0:0:0:0:0:0:1', '执行成功!', null);
INSERT INTO `t_mp_log` VALUES ('185', '无法获取登录用户信息！', '用户管理', '用户登陆', '712', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 13:24:28');
INSERT INTO `t_mp_log` VALUES ('186', '无法获取登录用户信息！', '用户管理', '用户登陆', '244', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 13:32:59');
INSERT INTO `t_mp_log` VALUES ('187', '无法获取登录用户信息！', '用户管理', '用户登陆', '1793', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 14:40:43');
INSERT INTO `t_mp_log` VALUES ('188', '无法获取登录用户信息！', '用户管理', '用户登陆', '414', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 15:05:55');
INSERT INTO `t_mp_log` VALUES ('189', '无法获取登录用户信息！', '用户管理', '用户登陆', '247', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 15:12:11');
INSERT INTO `t_mp_log` VALUES ('190', '无法获取登录用户信息！', '用户管理', '用户登陆', '984', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 16:11:13');
INSERT INTO `t_mp_log` VALUES ('191', '无法获取登录用户信息！', '用户管理', '用户登陆', '239', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 16:25:33');
INSERT INTO `t_mp_log` VALUES ('192', '无法获取登录用户信息！', '用户管理', '用户登陆', '261', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 16:49:39');
INSERT INTO `t_mp_log` VALUES ('193', '唐亚峰', '用户管理', '用户登陆', '715', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 16:52:33');
INSERT INTO `t_mp_log` VALUES ('194', '无法获取登录用户信息！', '用户管理', '用户登陆', '381', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:02:06');
INSERT INTO `t_mp_log` VALUES ('195', '无法获取登录用户信息！', '用户管理', '用户登陆', '213', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:03:16');
INSERT INTO `t_mp_log` VALUES ('196', '无法获取登录用户信息！', '用户管理', '用户登陆', '986', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:06:57');
INSERT INTO `t_mp_log` VALUES ('197', '唐亚峰', '用户管理', '添加用户', '9231', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:11:25');
INSERT INTO `t_mp_log` VALUES ('198', '唐亚峰', '用户管理', '添加用户', '212', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:11:46');
INSERT INTO `t_mp_log` VALUES ('199', '唐亚峰', '用户管理', '<font color=\"red\">执行方法异常:-->批量删除用户</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.hibernate.TypeMismatchException: Provided id of the wrong type for class com.battcn.entity.UserInfoEntity. Expected: class java.lang.Integer, got class java.lang.String</font>', '2016-01-19 17:16:49');
INSERT INTO `t_mp_log` VALUES ('200', '唐亚峰', '用户管理', '批量删除用户', '425', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:19:43');
INSERT INTO `t_mp_log` VALUES ('201', '唐亚峰', '用户管理', '添加用户', '365', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:19:53');
INSERT INTO `t_mp_log` VALUES ('202', '唐亚峰', '用户管理', '批量删除用户', '469', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:20:01');
INSERT INTO `t_mp_log` VALUES ('203', '无法获取登录用户信息！', '用户管理', '用户登陆', '462', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:22:53');
INSERT INTO `t_mp_log` VALUES ('204', '唐亚峰', '用户管理', '用户登陆', '342', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:35:03');
INSERT INTO `t_mp_log` VALUES ('205', '唐亚峰', '角色管理', '<font color=\"red\">执行方法异常:-->添加角色</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.hibernate.PropertyValueException: not-null property references a null or transient value: com.battcn.entity.RoleEntity.date</font>', '2016-01-19 17:54:42');
INSERT INTO `t_mp_log` VALUES ('206', '唐亚峰', '角色管理', '添加角色', '232', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:55:24');
INSERT INTO `t_mp_log` VALUES ('207', '唐亚峰', '角色管理', '添加角色', '315', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:59:38');
INSERT INTO `t_mp_log` VALUES ('208', '唐亚峰', '角色管理', '批量删除角色', '301', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 17:59:43');
INSERT INTO `t_mp_log` VALUES ('209', '唐亚峰', '用户管理', '添加用户', '6552', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:06:10');
INSERT INTO `t_mp_log` VALUES ('210', '唐亚峰', '用户管理', '批量删除用户', '300', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:06:21');
INSERT INTO `t_mp_log` VALUES ('211', '唐亚峰', '角色管理', '添加角色', '155', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:06:37');
INSERT INTO `t_mp_log` VALUES ('212', '唐亚峰', '角色管理', '批量删除角色', '339', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:06:41');
INSERT INTO `t_mp_log` VALUES ('213', '唐亚峰', '用户管理', '添加用户', '166', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:08:19');
INSERT INTO `t_mp_log` VALUES ('214', '唐亚峰', '用户管理', '<font color=\"red\">执行方法异常:-->批量删除用户</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.IllegalArgumentException: attempt to create delete event with null entity</font>', '2016-01-19 18:08:24');
INSERT INTO `t_mp_log` VALUES ('215', '唐亚峰', '用户管理', '批量删除用户', '966', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:08:57');
INSERT INTO `t_mp_log` VALUES ('216', '唐亚峰', '用户管理', '添加用户', '252', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:09:07');
INSERT INTO `t_mp_log` VALUES ('217', '唐亚峰', '用户管理', '批量删除用户', '1747', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-19 18:09:14');
INSERT INTO `t_mp_log` VALUES ('218', '无法获取登录用户信息！', '用户管理', '用户登陆', '649', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:21:51');
INSERT INTO `t_mp_log` VALUES ('219', '无法获取登录用户信息！', '用户管理', '用户登陆', '251', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:25:03');
INSERT INTO `t_mp_log` VALUES ('220', '唐亚峰', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.NullPointerException</font>', '2016-01-20 13:25:22');
INSERT INTO `t_mp_log` VALUES ('221', '唐亚峰', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.NullPointerException</font>', '2016-01-20 13:26:54');
INSERT INTO `t_mp_log` VALUES ('222', '唐亚峰', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.NullPointerException</font>', '2016-01-20 13:27:39');
INSERT INTO `t_mp_log` VALUES ('223', '唐亚峰', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.NullPointerException</font>', '2016-01-20 13:27:59');
INSERT INTO `t_mp_log` VALUES ('224', '唐亚峰', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.NullPointerException</font>', '2016-01-20 13:28:22');
INSERT INTO `t_mp_log` VALUES ('225', '唐亚峰', '系统管理', '用户管理/组管理-修改权限', '914', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:29:26');
INSERT INTO `t_mp_log` VALUES ('226', '唐亚峰', '系统管理', '用户管理/组管理-修改权限', '2701', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:29:58');
INSERT INTO `t_mp_log` VALUES ('227', '唐亚峰', '角色管理', '<font color=\"red\">执行方法异常:-->批量删除角色</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.IllegalArgumentException: attempt to create delete event with null entity</font>', '2016-01-20 13:30:27');
INSERT INTO `t_mp_log` VALUES ('228', '唐亚峰', '角色管理', '<font color=\"red\">执行方法异常:-->批量删除角色</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.IllegalArgumentException: attempt to create delete event with null entity</font>', '2016-01-20 13:30:39');
INSERT INTO `t_mp_log` VALUES ('229', '唐亚峰', '系统管理', '用户管理/组管理-修改权限', '15448', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:32:29');
INSERT INTO `t_mp_log` VALUES ('230', '唐亚峰', '角色管理', '批量删除角色', '4690', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 13:32:57');
INSERT INTO `t_mp_log` VALUES ('231', '唐亚峰', '用户管理', '用户登陆', '171', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:00:13');
INSERT INTO `t_mp_log` VALUES ('232', '唐亚峰', '用户管理', '用户登陆', '294', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:01:52');
INSERT INTO `t_mp_log` VALUES ('233', '秋殇', '用户管理', '用户登陆', '830', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:02:27');
INSERT INTO `t_mp_log` VALUES ('234', '无法获取登录用户信息！', '用户管理', '用户登陆', '248', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:06:15');
INSERT INTO `t_mp_log` VALUES ('235', '秋殇', '系统管理', '用户管理/组管理-修改权限', '641', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:19:02');
INSERT INTO `t_mp_log` VALUES ('236', '秋殇', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理/组管理-修改权限</font>', '0', '0:0:0:0:0:0:0:1', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.IllegalArgumentException: id to load is required for loading</font>', '2016-01-20 14:23:55');
INSERT INTO `t_mp_log` VALUES ('237', '秋殇', '系统管理', '用户管理/组管理-修改权限', '6410', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:34:17');
INSERT INTO `t_mp_log` VALUES ('238', '秋殇', '系统管理', '用户管理/组管理-修改权限', '868', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:35:30');
INSERT INTO `t_mp_log` VALUES ('239', '秋殇', '系统管理', '用户管理/组管理-修改权限', '3173', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:37:40');
INSERT INTO `t_mp_log` VALUES ('240', '无法获取登录用户信息！', '用户管理', '用户登陆', '310', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:50:20');
INSERT INTO `t_mp_log` VALUES ('241', '无法获取登录用户信息！', '用户管理', '用户登陆', '250', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:52:14');
INSERT INTO `t_mp_log` VALUES ('242', '无法获取登录用户信息！', '用户管理', '用户登陆', '277', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 14:58:16');
INSERT INTO `t_mp_log` VALUES ('243', '无法获取登录用户信息！', '用户管理', '用户登陆', '244', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:05:13');
INSERT INTO `t_mp_log` VALUES ('244', '无法获取登录用户信息！', '用户管理', '用户登陆', '593', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:08:45');
INSERT INTO `t_mp_log` VALUES ('245', '秋殇', '系统管理', '用户管理/组管理-修改权限', '819', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:09:03');
INSERT INTO `t_mp_log` VALUES ('246', '秋殇', '系统管理', '用户管理/组管理-修改权限', '3159', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:19:33');
INSERT INTO `t_mp_log` VALUES ('247', '秋殇', '系统管理', '用户管理/组管理-修改权限', '3026', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:24:57');
INSERT INTO `t_mp_log` VALUES ('248', '秋殇', '系统管理', '用户管理/组管理-修改权限', '2835', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:25:20');
INSERT INTO `t_mp_log` VALUES ('249', '秋殇', '用户管理', '添加用户', '350', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:32:06');
INSERT INTO `t_mp_log` VALUES ('250', '秋殇', '系统管理', '用户管理/组管理-修改权限', '1984', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:33:16');
INSERT INTO `t_mp_log` VALUES ('251', '秋殇', '用户管理', '用户登陆', '229', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:34:19');
INSERT INTO `t_mp_log` VALUES ('252', '秋殇', '用户管理', '用户登陆', '449', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:34:25');
INSERT INTO `t_mp_log` VALUES ('253', '测试用户', '用户管理', '用户登陆', '151', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:34:30');
INSERT INTO `t_mp_log` VALUES ('254', '测试用户', '用户管理', '用户登陆', '162', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:34:57');
INSERT INTO `t_mp_log` VALUES ('255', '无法获取登录用户信息！', '用户管理', '用户登陆', '234', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-20 15:40:12');
INSERT INTO `t_mp_log` VALUES ('256', '无法获取登录用户信息！', '用户管理', '用户登陆', '9800', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:44:54');
INSERT INTO `t_mp_log` VALUES ('257', '无法获取登录用户信息！', '用户管理', '用户登陆', '48', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:45:01');
INSERT INTO `t_mp_log` VALUES ('258', '无法获取登录用户信息！', '用户管理', '用户登陆', '151', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:45:18');
INSERT INTO `t_mp_log` VALUES ('259', '无法获取登录用户信息！', '用户管理', '用户登陆', '223', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:48:01');
INSERT INTO `t_mp_log` VALUES ('260', '无法获取登录用户信息！', '用户管理', '用户登陆', '80', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:48:04');
INSERT INTO `t_mp_log` VALUES ('261', '无法获取登录用户信息！', '用户管理', '用户登陆', '179', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:48:11');
INSERT INTO `t_mp_log` VALUES ('262', '无法获取登录用户信息！', '用户管理', '用户登陆', '100', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:48:19');
INSERT INTO `t_mp_log` VALUES ('263', '无法获取登录用户信息！', '用户管理', '用户登陆', '67', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:48:44');
INSERT INTO `t_mp_log` VALUES ('264', '无法获取登录用户信息！', '用户管理', '用户登陆', '18616', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:49:40');
INSERT INTO `t_mp_log` VALUES ('265', '无法获取登录用户信息！', '用户管理', '用户登陆', '8698', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:54:13');
INSERT INTO `t_mp_log` VALUES ('266', '无法获取登录用户信息！', '用户管理', '用户登陆', '8496', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:54:30');
INSERT INTO `t_mp_log` VALUES ('267', '无法获取登录用户信息！', '用户管理', '用户登陆', '2943', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:54:43');
INSERT INTO `t_mp_log` VALUES ('268', '无法获取登录用户信息！', '用户管理', '用户登陆', '46', '0:0:0:0:0:0:0:1', '执行成功!', '2016-01-21 18:55:02');

-- ----------------------------
-- Table structure for t_mp_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_resources`;
CREATE TABLE `t_mp_resources` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名字',
  `parentId` int(11) DEFAULT NULL COMMENT '父级菜单',
  `type` varchar(40) DEFAULT '0' COMMENT '0=菜单,1=按钮',
  `resUrl` varchar(200) DEFAULT NULL COMMENT '请求的URL地址',
  `level` int(4) DEFAULT NULL COMMENT '等级,根据此排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `description` varchar(5000) DEFAULT NULL COMMENT '描述',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `nlevel` varchar(10) DEFAULT NULL,
  `scort` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='枫叶网---->资源表';

-- ----------------------------
-- Records of t_mp_resources
-- ----------------------------
INSERT INTO `t_mp_resources` VALUES ('1', '系统管理', '0', '0', null, '1', 'fa fa-home', '系统管理', '2016-01-29 12:14:15', '0', ',1,');
INSERT INTO `t_mp_resources` VALUES ('2', '用户管理', '1', '1', '/user/list.shtml', '2', null, '用户管理', '2016-01-29 12:14:15', '1', ',1,2,');
INSERT INTO `t_mp_resources` VALUES ('3', '角色管理', '1', '1', '/role/list.shtml', '3', null, '角色管理', '2016-01-29 12:14:15', '1', ',1,3,');
INSERT INTO `t_mp_resources` VALUES ('4', '菜单管理', '1', '1', '/resources/list.shtml', '4', null, '菜单管理', '2016-01-29 12:14:15', '1', ',1,4,');
INSERT INTO `t_mp_resources` VALUES ('5', '按钮管理', '1', '1', '/buttom/list.shtml', '5', null, '按钮管理', '2016-01-29 12:14:15', '1', ',1,5,');
INSERT INTO `t_mp_resources` VALUES ('6', '日志管理', '0', '0', null, '3', 'fa fa-home', '日志管理', '2016-01-29 12:14:15', '0', ',6,');
INSERT INTO `t_mp_resources` VALUES ('7', '登陆日志', '6', '1', '/log/list.shtml', '4', null, '登陆日志', '2016-01-29 12:14:15', '1', ',6,7,');
INSERT INTO `t_mp_resources` VALUES ('8', '添加用户', '2', '2', null, '1', null, '<button onclick=\"addUser()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', '2016-01-29 12:14:15', '2', ',1,2,8,');
INSERT INTO `t_mp_resources` VALUES ('9', '编辑用户', '2', '2', null, '2', null, '<button onclick=\"editUser()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', '2016-01-29 12:14:15', '2', ',1,2,9,');
INSERT INTO `t_mp_resources` VALUES ('10', '删除用户', '2', '2', null, '3', null, '<button onclick=\"delUser()\" class=\"btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', '2016-01-29 12:14:15', '2', ',1,2,10,');
INSERT INTO `t_mp_resources` VALUES ('11', '分配权限', '2', '2', null, '4', null, '<button onclick=\"userPermissions()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', '2016-01-29 12:14:15', '2', ',1,2,11,');
INSERT INTO `t_mp_resources` VALUES ('12', '添加角色', '3', '2', null, '1', null, '<button onclick=\"addRole()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', '2016-01-29 12:14:15', '2', ',1,3,12,');
INSERT INTO `t_mp_resources` VALUES ('13', '编辑角色', '3', '2', null, '2', null, '<button onclick=\"editRole()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', '2016-01-29 12:14:15', '2', ',1,3,13,');
INSERT INTO `t_mp_resources` VALUES ('14', '删除角色', '3', '2', null, '3', null, '<button onclick=\"delRole()\" class=\"btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', '2016-01-29 12:14:15', '2', ',1,3,14,');
INSERT INTO `t_mp_resources` VALUES ('15', '分配权限', '3', '2', null, '4', null, '<button onclick=\"rolePermissions()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', '2016-01-29 12:14:15', '2', ',1,3,15,');
INSERT INTO `t_mp_resources` VALUES ('16', '系统监管', '0', '0', null, '1', 'fa fa-columns icon', '系统监管', '2016-03-16 10:24:23', '0', ',16,');
INSERT INTO `t_mp_resources` VALUES ('17', '实时监控', '16', '1', '/sys/monitor.shtml', '2', null, '实时监控', '2016-03-16 19:18:14', '1', ',16,17,');
INSERT INTO `t_mp_resources` VALUES ('18', '告警列表', '16', '1', '/sys/list.shtml', '3', null, '告警列表', '2016-03-17 11:57:53', '1', ',16,18,');

-- ----------------------------
-- Table structure for t_mp_role
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_role`;
CREATE TABLE `t_mp_role` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `isEnabled` int(2) DEFAULT '0' COMMENT '是否启用 0=禁用 1=启用',
  `roleName` varchar(64) DEFAULT NULL COMMENT '角色名',
  `description` varchar(5000) DEFAULT NULL COMMENT '描述',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='枫叶网---->角色表';

-- ----------------------------
-- Records of t_mp_role
-- ----------------------------
INSERT INTO `t_mp_role` VALUES ('1', '1', '超级管理员', '作者专用', '2016-01-20 13:33:33');
INSERT INTO `t_mp_role` VALUES ('2', '1', '管理员', '测试专用', '2016-01-07 11:20:32');

-- ----------------------------
-- Table structure for t_mp_role_res
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_role_res`;
CREATE TABLE `t_mp_role_res` (
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  `resId` int(11) NOT NULL COMMENT '菜单资源ID',
  PRIMARY KEY (`roleId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mp_role_res
-- ----------------------------
INSERT INTO `t_mp_role_res` VALUES ('1', '1');
INSERT INTO `t_mp_role_res` VALUES ('1', '2');
INSERT INTO `t_mp_role_res` VALUES ('1', '3');
INSERT INTO `t_mp_role_res` VALUES ('1', '4');
INSERT INTO `t_mp_role_res` VALUES ('1', '5');
INSERT INTO `t_mp_role_res` VALUES ('1', '6');
INSERT INTO `t_mp_role_res` VALUES ('1', '7');
INSERT INTO `t_mp_role_res` VALUES ('1', '8');
INSERT INTO `t_mp_role_res` VALUES ('1', '9');
INSERT INTO `t_mp_role_res` VALUES ('1', '10');
INSERT INTO `t_mp_role_res` VALUES ('1', '11');
INSERT INTO `t_mp_role_res` VALUES ('1', '12');
INSERT INTO `t_mp_role_res` VALUES ('1', '13');
INSERT INTO `t_mp_role_res` VALUES ('1', '14');
INSERT INTO `t_mp_role_res` VALUES ('1', '15');
INSERT INTO `t_mp_role_res` VALUES ('1', '16');
INSERT INTO `t_mp_role_res` VALUES ('1', '17');
INSERT INTO `t_mp_role_res` VALUES ('1', '18');
INSERT INTO `t_mp_role_res` VALUES ('2', '6');
INSERT INTO `t_mp_role_res` VALUES ('2', '7');

-- ----------------------------
-- Table structure for t_mp_server_info
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_server_info`;
CREATE TABLE `t_mp_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mp_server_info
-- ----------------------------
INSERT INTO `t_mp_server_info` VALUES ('1', '18', '40', '49', '40', '71', '40', '1837307557@qq.com', '2016-02-25 18:07:02', '<font color=\"red\">JVM当前：49%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>');
INSERT INTO `t_mp_server_info` VALUES ('2', '3', '40', '50', '40', '71', '40', '1837307557@qq.com', '2016-02-25 18:08:03', '<font color=\"red\">JVM当前：50%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>');
INSERT INTO `t_mp_server_info` VALUES ('3', '5', '40', '50', '40', '70', '40', '1837307557@qq.com', '2016-02-25 18:09:02', '<font color=\"red\">JVM当前：50%,超出预设值 40%<br>内存当前：70%,超出预设值  40%</font>');
INSERT INTO `t_mp_server_info` VALUES ('4', '5', '40', '52', '40', '69', '40', '1837307557@qq.com', '2016-02-25 18:10:03', '<font color=\"red\">JVM当前：52%,超出预设值 40%<br>内存当前：69%,超出预设值  40%</font>');
INSERT INTO `t_mp_server_info` VALUES ('5', '2', '40', '52', '40', '68', '40', '1837307557@qq.com', '2016-02-25 18:11:02', '<font color=\"red\">JVM当前：52%,超出预设值 40%<br>内存当前：68%,超出预设值  40%</font>');

-- ----------------------------
-- Table structure for t_mp_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_userinfo`;
CREATE TABLE `t_mp_userinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userName` varchar(64) DEFAULT NULL COMMENT '用户名',
  `accountName` varchar(20) DEFAULT NULL COMMENT '账号',
  `credentialsSalt` varchar(100) DEFAULT NULL COMMENT '验证凭证',
  `locked` varchar(3) DEFAULT '0' COMMENT '是否启用 0=禁用 1=启用',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱地址',
  `tel` varchar(24) DEFAULT NULL COMMENT '手机号码',
  `description` varchar(100) DEFAULT NULL COMMENT '介绍',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='枫叶网---->用户信息表';

-- ----------------------------
-- Records of t_mp_userinfo
-- ----------------------------
INSERT INTO `t_mp_userinfo` VALUES ('1', '秋殇', 'admin', '9c6c9e22ae8c773c8f07a75b28563152', '1', 'a122080ba7afebf036ed3c811c7880f9', '', '', null, '2016-03-15 14:31:54', 'upload/files/201603/2311350619jk.jpg');
INSERT INTO `t_mp_userinfo` VALUES ('16', '测试账号密码123', 'test', '42ce175f3fbc4b6ea58847508162a89e', '1', 'c6845b43c38a916abcc501a41706346e', 'test@163.com', '111', null, '2016-03-21 17:54:44', null);

-- ----------------------------
-- Table structure for t_mp_user_res
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_user_res`;
CREATE TABLE `t_mp_user_res` (
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `resId` int(11) NOT NULL COMMENT '菜单资源ID',
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mp_user_res
-- ----------------------------
INSERT INTO `t_mp_user_res` VALUES ('1', '1');
INSERT INTO `t_mp_user_res` VALUES ('1', '2');
INSERT INTO `t_mp_user_res` VALUES ('1', '3');
INSERT INTO `t_mp_user_res` VALUES ('1', '4');
INSERT INTO `t_mp_user_res` VALUES ('1', '5');
INSERT INTO `t_mp_user_res` VALUES ('1', '6');
INSERT INTO `t_mp_user_res` VALUES ('1', '7');
INSERT INTO `t_mp_user_res` VALUES ('1', '16');
INSERT INTO `t_mp_user_res` VALUES ('1', '17');
INSERT INTO `t_mp_user_res` VALUES ('1', '18');
INSERT INTO `t_mp_user_res` VALUES ('7', '1');
INSERT INTO `t_mp_user_res` VALUES ('7', '2');
INSERT INTO `t_mp_user_res` VALUES ('7', '3');
INSERT INTO `t_mp_user_res` VALUES ('7', '4');
INSERT INTO `t_mp_user_res` VALUES ('7', '5');
INSERT INTO `t_mp_user_res` VALUES ('7', '6');
INSERT INTO `t_mp_user_res` VALUES ('7', '7');
INSERT INTO `t_mp_user_res` VALUES ('13', '1');
INSERT INTO `t_mp_user_res` VALUES ('13', '2');
INSERT INTO `t_mp_user_res` VALUES ('13', '3');
INSERT INTO `t_mp_user_res` VALUES ('13', '4');
INSERT INTO `t_mp_user_res` VALUES ('13', '5');
INSERT INTO `t_mp_user_res` VALUES ('13', '8');
INSERT INTO `t_mp_user_res` VALUES ('13', '9');
INSERT INTO `t_mp_user_res` VALUES ('13', '10');
INSERT INTO `t_mp_user_res` VALUES ('13', '11');
INSERT INTO `t_mp_user_res` VALUES ('13', '12');
INSERT INTO `t_mp_user_res` VALUES ('13', '13');
INSERT INTO `t_mp_user_res` VALUES ('13', '14');
INSERT INTO `t_mp_user_res` VALUES ('13', '15');
INSERT INTO `t_mp_user_res` VALUES ('15', '16');
INSERT INTO `t_mp_user_res` VALUES ('15', '17');
INSERT INTO `t_mp_user_res` VALUES ('15', '18');
INSERT INTO `t_mp_user_res` VALUES ('16', '16');
INSERT INTO `t_mp_user_res` VALUES ('16', '17');
INSERT INTO `t_mp_user_res` VALUES ('16', '18');

-- ----------------------------
-- Table structure for t_mp_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_user_role`;
CREATE TABLE `t_mp_user_role` (
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联的角色';

-- ----------------------------
-- Records of t_mp_user_role
-- ----------------------------
INSERT INTO `t_mp_user_role` VALUES ('1', '1');
INSERT INTO `t_mp_user_role` VALUES ('7', '2');
INSERT INTO `t_mp_user_role` VALUES ('14', '2');
INSERT INTO `t_mp_user_role` VALUES ('15', '2');
INSERT INTO `t_mp_user_role` VALUES ('16', '1');
INSERT INTO `t_mp_user_role` VALUES ('16', '2');




-- ----------------------------
-- Procedure structure for treeNodes
-- ----------------------------
-- DROP PROCEDURE IF EXISTS `treeNodes`;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`%` PROCEDURE `treeNodes`()
-- BEGIN
--  DECLARE LEVEL INT ;
--  Set LEVEL=0 ;
--  update t_mp_resources a inner join (SELECT id,LEVEL,concat(',',ID,',') scort FROM t_mp_resources WHERE parentId = 0) b on a.id=b.id
--  set a.nlevel=b.LEVEL,a.scort=b.scort;
--  WHILE FOUND_ROWS()>0 DO
--   SET LEVEL=LEVEL+1;
-- update t_mp_resources a inner join (
--    SELECT ID,LEVEL,scort FROM t_mp_resources 
--     WHERE nLevel=LEVEL-1) b on a.parentId=b.id
-- set a.nlevel=b.LEVEL,a.scort=concat(b.scort,a.ID,',');
--  END WHILE;
-- END
-- ;;
-- DELIMITER ;
