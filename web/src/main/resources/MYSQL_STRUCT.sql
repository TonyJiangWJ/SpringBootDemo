-- MySQL dump 10.13  Distrib 5.7.24, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: my_daily_cost
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tokenId` varchar(42) NOT NULL DEFAULT '',
  `tokenVerify` bigint(20) NOT NULL DEFAULT '0',
  `code` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `email` varchar(256) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(256) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_asset`
--

DROP TABLE IF EXISTS `t_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `extName` varchar(128) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `type` int(11) DEFAULT NULL,
  `available` char(1) NOT NULL DEFAULT 'Y' COMMENT '是否可以随时使用，定期理财无法随时使用',
  `amount` bigint(20) NOT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_asset_types`
--

DROP TABLE IF EXISTS `t_asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_asset_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL DEFAULT '-1',
  `parentCode` varchar(32) DEFAULT NULL,
  `typeIdentify` varchar(32) NOT NULL,
  `typeDesc` varchar(64) NOT NULL DEFAULT '',
  `typeCode` varchar(32) NOT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_type` (`userId`,`parentCode`,`typeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_budget`
--

DROP TABLE IF EXISTS `t_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_budget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `budgetName` varchar(64) NOT NULL DEFAULT '' COMMENT '预算名称',
  `budgetMoney` bigint(20) NOT NULL DEFAULT '0' COMMENT '预算金额 单位分',
  `belongYear` char(4) NOT NULL COMMENT '年份',
  `belongMonth` tinyint(4) NOT NULL COMMENT '月份',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `version` int(11) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_budget_tag`
--

DROP TABLE IF EXISTS `t_budget_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_budget_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tagId` bigint(20) NOT NULL COMMENT '标签id',
  `budgetId` bigint(20) NOT NULL COMMENT '预算id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签和预算关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cost_info`
--

DROP TABLE IF EXISTS `t_cost_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cost_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL DEFAULT '-1',
  `tradeNo` varchar(100) DEFAULT NULL,
  `orderNo` varchar(100) DEFAULT NULL,
  `costCreateTime` varchar(32) NOT NULL DEFAULT '' COMMENT '账单创建时间',
  `paidTime` varchar(100) DEFAULT NULL,
  `costModifyTime` varchar(32) DEFAULT '' COMMENT '账单修改时间',
  `location` varchar(100) DEFAULT NULL,
  `orderType` varchar(100) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `inOutType` varchar(100) DEFAULT NULL,
  `orderStatus` varchar(100) DEFAULT NULL,
  `serviceCost` bigint(20) DEFAULT '0',
  `refundMoney` bigint(20) DEFAULT '0',
  `memo` varchar(100) DEFAULT NULL,
  `tradeStatus` varchar(100) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `isHidden` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradeNoAndUserId` (`tradeNo`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cost_info_deleted`
--

DROP TABLE IF EXISTS `t_cost_info_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cost_info_deleted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL DEFAULT '-1',
  `tradeNo` varchar(100) DEFAULT NULL,
  `orderNo` varchar(100) DEFAULT NULL,
  `createTime` varchar(100) DEFAULT NULL,
  `paidTime` varchar(100) DEFAULT NULL,
  `modifyTime` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `orderType` varchar(100) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `inOutType` varchar(100) DEFAULT NULL,
  `orderStatus` varchar(100) DEFAULT NULL,
  `serviceCost` bigint(20) DEFAULT '0',
  `refundMoney` bigint(20) DEFAULT '0',
  `memo` varchar(100) DEFAULT NULL,
  `tradeStatus` varchar(100) DEFAULT NULL,
  `isHidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradeNo` (`tradeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cost_tag`
--

DROP TABLE IF EXISTS `t_cost_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cost_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tagId` bigint(20) NOT NULL,
  `costId` bigint(20) NOT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_liability`
--

DROP TABLE IF EXISTS `t_liability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_liability` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  `repaymentDay` datetime NOT NULL COMMENT '还款时间',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `amount` bigint(20) DEFAULT NULL COMMENT '总金额 单位分',
  `installment` int(11) DEFAULT NULL COMMENT '分期总期数',
  `index` int(11) DEFAULT NULL COMMENT '第几期',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态0 未还，1已还',
  `paid` bigint(20) NOT NULL DEFAULT '0' COMMENT '已还金额',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_log` (
  `id` bigint(14) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `userName` varchar(60) NOT NULL COMMENT '用户账号',
  `loginResult` varchar(256) DEFAULT NULL COMMENT '登录结果',
  `loginIp` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `code` varchar(10) DEFAULT NULL COMMENT 'code',
  `msg` varchar(64) DEFAULT NULL COMMENT '返回信息',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_log` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tag_info`
--

DROP TABLE IF EXISTS `t_tag_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tag_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(32) NOT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `userId` bigint(20) NOT NULL DEFAULT '-1',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'my_daily_cost'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29 13:44:51

-- init assetTypes
LOCK TABLES `t_asset_types` WRITE;
/*!40000 ALTER TABLE `t_asset_types` DISABLE KEYS */;
INSERT INTO `t_asset_types` VALUES (1,-1,'','A','其他','asset_other','2018-07-02 09:03:33','2018-07-02 09:03:33',0),(2,-1,'','L','其他','liability_other','2018-07-02 09:03:33','2018-07-02 09:03:33',0),(3,-1,'','A','支付宝','asset_alipay','2018-07-02 09:03:33','2018-07-02 09:03:33',0),(4,-1,NULL,'A','京东','asset_jd','2018-07-11 09:42:49','2018-07-11 09:42:49',0),(5,-1,NULL,'L','信用卡','liability_credit','2018-07-11 09:48:28','2018-07-11 09:48:28',0),(6,-1,NULL,'A','现金','asset_cash','2018-07-11 10:02:37','2018-07-11 10:02:37',0),(7,2,NULL,'L','小米','liability_xiaomi','2018-07-11 10:26:32','2018-07-11 10:26:32',0),(8,-1,NULL,'L','京东','liability_jd','2018-07-11 10:26:50','2018-07-11 10:26:50',0),(9,-1,NULL,'L','支付宝','liability_alipay','2018-07-11 10:27:05','2018-07-11 10:27:05',0),(10,-1,NULL,'A','银行卡','asset_bank','2018-07-11 10:39:07','2018-07-11 10:39:07',0),(11,-1,'asset_bank','A','招商银行','asset_zhaoshang','2018-07-11 10:39:33','2018-07-11 10:39:33',0),(12,-1,'asset_alipay','A','余额宝','asset_yuebao','2018-07-11 10:40:29','2018-07-11 10:40:29',0),(13,-1,'asset_alipay','A','基金','asset_alipay_jijin','2018-07-11 10:40:47','2018-07-11 10:40:47',0),(14,-1,'asset_jd','A','理财金','asset_licaijin','2018-07-11 10:42:00','2018-07-11 10:42:00',0),(15,-1,'asset_jd','A','小金库','asset_xiaojinku','2018-07-11 10:42:12','2018-07-11 10:42:12',0),(16,-1,'liability_credit','L','招行信用卡','liability_zhaohang','2018-07-11 11:17:24','2018-07-11 11:17:24',0),(17,-1,'liability_xiaomi','L','小米分期','liability_xiaomifenqi','2018-07-11 11:17:50','2018-07-11 11:17:50',0),(18,-1,'liability_jd','L','京东白条','liability_baitiao','2018-07-11 11:18:04','2018-07-11 11:18:04',0),(19,-1,'liability_alipay','L','花呗','liability_huabei','2018-07-11 11:18:16','2018-07-11 11:18:16',0),(20,-1,'asset_alipay','A','余利宝','liability_yulibao','2018-07-11 13:19:01','2018-07-11 13:19:01',0);
/*!40000 ALTER TABLE `t_asset_types` ENABLE KEYS */;
UNLOCK TABLES;