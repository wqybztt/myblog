﻿# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.34)
# Database: blog
# Generation Time: 2017-10-25 12:26:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cate`;

CREATE TABLE `cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '父级分类id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称(zh-cn)',
  `alias` varchar(20) NOT NULL DEFAULT '' COMMENT '分类别名(en)',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cate` WRITE;
/*!40000 ALTER TABLE `cate` DISABLE KEYS */;

INSERT INTO `cate` (`id`, `pid`, `name`, `alias`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,0,'分类1','fl1','2017-10-24 00:01:41',NULL,NULL),
	(2,1,'分类1-1','fl1-1','2017-10-24 00:01:56',NULL,NULL),
	(3,0,'分类2','fl2','2017-10-24 21:53:24',NULL,NULL),
	(4,3,'分类2-1','fl2-3','2017-10-24 22:21:11',NULL,NULL);

/*!40000 ALTER TABLE `cate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `createtime` datetime DEFAULT NULL COMMENT '用户创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '用户删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `password`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,'wangqiyuan','wqy112690yqw','2017-08-29 13:42:55',NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;