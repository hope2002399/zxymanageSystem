/*
SQLyog Ultimate v8.32 
MySQL - 5.1.73 : Database - zxy_managesystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zxy_managesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zxy_managesystem`;

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `psn_code` bigint(9) NOT NULL AUTO_INCREMENT COMMENT '主键code',
  `zh_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `birthday` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `tel` varchar(11) DEFAULT NULL COMMENT '电话',
  `position` varchar(20) DEFAULT NULL COMMENT '职称',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `parent_id` bigint(9) DEFAULT NULL COMMENT '所属谁管理',
  PRIMARY KEY (`psn_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`psn_code`,`zh_name`,`birthday`,`tel`,`position`,`phone`,`parent_id`) values (2,'你好','2017-12-01','123123','123123','123213123',1),(5,'2','2017-12-01','2','123123','123123',1),(6,'1','2017-12-07','123213','123123','123213',1),(9,'?','2017-12-01','s1','2','2',0),(10,'哈哈','2017-12-06','888822','2123123','123213213',1),(11,'???','2017-12-02','13123123','123123123','12313123',0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `loginname` varchar(50) DEFAULT NULL COMMENT '登录名',
  `loginpass` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `zh_name` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`loginname`,`loginpass`,`email`,`status`,`zh_name`) values (0,'admin','admin',NULL,1,'超级管理员'),(1,'zxy','111111','xinyang@irissz.com',1,'张老大'),(4,'yx','111111','1w',1,'yx'),(5,'1123','111111','2',1,'21');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
