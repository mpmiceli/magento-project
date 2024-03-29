-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: magento
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.19.04.1

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
-- Table structure for table `mp1_admin_passwords`
--

DROP TABLE IF EXISTS `mp1_admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `MP1_ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `MP1_ADMIN_PASSWORDS_USER_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_admin_passwords`
--

LOCK TABLES `mp1_admin_passwords` WRITE;
/*!40000 ALTER TABLE `mp1_admin_passwords` DISABLE KEYS */;
INSERT INTO `mp1_admin_passwords` VALUES (1,1,'26de974031d4e90d9284d0052010542dc4fdc395dd146ea70b8d5da31701ded0:5wxbKvZE21ZkdnaiUg63aGKJlGCWX4Jp:1',0,1557796355);
/*!40000 ALTER TABLE `mp1_admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_admin_system_messages`
--

DROP TABLE IF EXISTS `mp1_admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_admin_system_messages`
--

LOCK TABLES `mp1_admin_system_messages` WRITE;
/*!40000 ALTER TABLE `mp1_admin_system_messages` DISABLE KEYS */;
INSERT INTO `mp1_admin_system_messages` VALUES ('da332d712f3215b9b94bfa268c398323',2,'2019-05-14 01:31:01');
/*!40000 ALTER TABLE `mp1_admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_admin_user`
--

DROP TABLE IF EXISTS `mp1_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  `refresh_token` text COMMENT 'Email connector refresh token',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `MP1_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_admin_user`
--

LOCK TABLES `mp1_admin_user` WRITE;
/*!40000 ALTER TABLE `mp1_admin_user` DISABLE KEYS */;
INSERT INTO `mp1_admin_user` VALUES (1,'admin','admin','admin@mail.com','admin','26de974031d4e90d9284d0052010542dc4fdc395dd146ea70b8d5da31701ded0:5wxbKvZE21ZkdnaiUg63aGKJlGCWX4Jp:1','2019-05-14 01:12:35','2019-05-14 01:30:53','2019-05-14 01:30:53',1,0,1,NULL,NULL,NULL,'en_US',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp1_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_admin_user_session`
--

DROP TABLE IF EXISTS `mp1_admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `MP1_ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `MP1_ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `MP1_ADMIN_USER_SESSION_USER_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_admin_user_session`
--

LOCK TABLES `mp1_admin_user_session` WRITE;
/*!40000 ALTER TABLE `mp1_admin_user_session` DISABLE KEYS */;
INSERT INTO `mp1_admin_user_session` VALUES (1,'hod0t3dljluqpnvks6p2u679jt',1,1,'2019-05-14 01:30:53','2019-05-14 01:34:25','127.0.0.1');
/*!40000 ALTER TABLE `mp1_admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_adminnotification_inbox`
--

DROP TABLE IF EXISTS `mp1_adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `MP1_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `MP1_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `MP1_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_adminnotification_inbox`
--

LOCK TABLES `mp1_adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `mp1_adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `mp1_adminnotification_inbox` VALUES (1,4,'2019-05-14 01:12:33','Deprecation Notice','Catalog Search is currently configured to use the MySQL engine, which has been deprecated. Consider migrating to one of\nthe Elasticsearch engines now to ensure there are no service interruptions during your next upgrade.','',0,0);
/*!40000 ALTER TABLE `mp1_adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_customer`
--

DROP TABLE IF EXISTS `mp1_amazon_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_customer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer_id',
  `amazon_id` varchar(255) NOT NULL COMMENT 'Amazon_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID` (`customer_id`,`amazon_id`),
  UNIQUE KEY `MP1_AMAZON_CUSTOMER_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MP1_AMAZON_CUSTOMER_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_amazon_customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_customer`
--

LOCK TABLES `mp1_amazon_customer` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_pending_authorization`
--

DROP TABLE IF EXISTS `mp1_amazon_pending_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_pending_authorization` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  `authorization_id` varchar(255) DEFAULT NULL COMMENT 'Authorization_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `updated_at` datetime DEFAULT NULL COMMENT 'Updated_at',
  `processed` smallint(5) unsigned DEFAULT '0' COMMENT 'Initial authorization processed',
  `capture` smallint(5) unsigned DEFAULT '0' COMMENT 'Initial authorization has capture',
  `capture_id` varchar(255) DEFAULT NULL COMMENT 'Initial authorization capture id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_DD4971A4BD5C8439C369BC3D67FD94F9` (`order_id`,`payment_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_amazon_pending_authorization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_pending_authorization`
--

LOCK TABLES `mp1_amazon_pending_authorization` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_pending_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_pending_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_pending_capture`
--

DROP TABLE IF EXISTS `mp1_amazon_pending_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_pending_capture` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `capture_id` varchar(255) NOT NULL COMMENT 'Capture_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'payment id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID` (`order_id`,`payment_id`,`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_amazon_pending_capture';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_pending_capture`
--

LOCK TABLES `mp1_amazon_pending_capture` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_pending_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_pending_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_pending_refund`
--

DROP TABLE IF EXISTS `mp1_amazon_pending_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_pending_refund` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID` (`order_id`,`payment_id`,`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_amazon_pending_refund';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_pending_refund`
--

LOCK TABLES `mp1_amazon_pending_refund` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_pending_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_pending_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_quote`
--

DROP TABLE IF EXISTS `mp1_amazon_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  `sandbox_simulation_reference` varchar(255) DEFAULT NULL COMMENT 'Sandbox simulation reference',
  `confirmed` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote confirmed with Amazon',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_AMAZON_QUOTE_QUOTE_ID` (`quote_id`),
  CONSTRAINT `MP1_AMAZON_QUOTE_QUOTE_ID_MP1_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mp1_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_quote`
--

LOCK TABLES `mp1_amazon_quote` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_amazon_sales_order`
--

DROP TABLE IF EXISTS `mp1_amazon_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_amazon_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_AMAZON_SALES_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `MP1_AMAZON_SALES_ORDER_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_sales_order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_amazon_sales_order`
--

LOCK TABLES `mp1_amazon_sales_order` WRITE;
/*!40000 ALTER TABLE `mp1_amazon_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_amazon_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_authorization_role`
--

DROP TABLE IF EXISTS `mp1_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `MP1_AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `MP1_AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_authorization_role`
--

LOCK TABLES `mp1_authorization_role` WRITE;
/*!40000 ALTER TABLE `mp1_authorization_role` DISABLE KEYS */;
INSERT INTO `mp1_authorization_role` VALUES (1,0,1,1,'G',0,'2','Administrators'),(2,1,2,0,'U',1,'2','admin');
/*!40000 ALTER TABLE `mp1_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_authorization_rule`
--

DROP TABLE IF EXISTS `mp1_authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `MP1_AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `MP1_AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `MP1_AUTHORIZATION_RULE_ROLE_ID_MP1_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `mp1_authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_authorization_rule`
--

LOCK TABLES `mp1_authorization_rule` WRITE;
/*!40000 ALTER TABLE `mp1_authorization_rule` DISABLE KEYS */;
INSERT INTO `mp1_authorization_rule` VALUES (1,1,'Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `mp1_authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cache`
--

DROP TABLE IF EXISTS `mp1_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `MP1_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cache`
--

LOCK TABLES `mp1_cache` WRITE;
/*!40000 ALTER TABLE `mp1_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cache_tag`
--

DROP TABLE IF EXISTS `mp1_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `MP1_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cache_tag`
--

LOCK TABLES `mp1_cache_tag` WRITE;
/*!40000 ALTER TABLE `mp1_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_captcha_log`
--

DROP TABLE IF EXISTS `mp1_captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_captcha_log`
--

LOCK TABLES `mp1_captcha_log` WRITE;
/*!40000 ALTER TABLE `mp1_captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity`
--

LOCK TABLES `mp1_catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity` DISABLE KEYS */;
INSERT INTO `mp1_catalog_category_entity` VALUES (1,3,0,'2019-05-14 01:12:33','2019-05-14 01:12:33','1',0,0,1),(2,3,1,'2019-05-14 01:12:33','2019-05-14 01:12:33','1/2',1,1,0);
/*!40000 ALTER TABLE `mp1_catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_CTGR_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_DTIME_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_DTIME_ENTT_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity_datetime`
--

LOCK TABLES `mp1_catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_CTGR_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_DEC_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_DEC_ENTT_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity_decimal`
--

LOCK TABLES `mp1_catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity_int`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_INT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_INT_ENTT_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity_int`
--

LOCK TABLES `mp1_catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `mp1_catalog_category_entity_int` VALUES (1,69,0,1,1),(2,46,0,2,1),(3,69,0,2,1);
/*!40000 ALTER TABLE `mp1_catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity_text`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_TEXT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_TEXT_ENTT_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity_text`
--

LOCK TABLES `mp1_catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `mp1_catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_CTGR_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_VCHR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_ENTT_VCHR_ENTT_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_entity_varchar`
--

LOCK TABLES `mp1_catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `mp1_catalog_category_entity_varchar` VALUES (1,45,0,1,'Root Catalog'),(2,45,0,2,'Default Category'),(3,52,0,2,'PRODUCTS');
/*!40000 ALTER TABLE `mp1_catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `MP1_CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `MP1_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_CAT_CTGR_PRD_CTGR_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CTGR_PRD_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product`
--

LOCK TABLES `mp1_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product_index`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `MP1_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_AD832AB479C60BADE30FCDD4B9301C75` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product_index`
--

LOCK TABLES `mp1_catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `MP1_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_AD832AB479C60BADE30FCDD4B9301C75` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product_index_replica`
--

LOCK TABLES `mp1_catalog_category_product_index_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product_index_store1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product_index_store1` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `MP1_CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_DF1C3899DB222D46B5D2AADFD3A363B5` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mp1 Catalog Category Product Index Store1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product_index_store1`
--

LOCK TABLES `mp1_catalog_category_product_index_store1` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_store1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_store1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product_index_store1_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product_index_store1_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_A0EBBC5722CBA02892E5343E275DE6B5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_556C160254C6A725775B172622D524DE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mp1 Catalog Category Product Index Store1 Replica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product_index_store1_replica`
--

LOCK TABLES `mp1_catalog_category_product_index_store1_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_store1_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_store1_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `MP1_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_category_product_index_tmp`
--

LOCK TABLES `mp1_catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_compare_item`
--

DROP TABLE IF EXISTS `mp1_catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `MP1_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MP1_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `MP1_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MP1_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_COMPARE_ITEM_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_CAT_CMP_ITEM_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_CMP_ITEM_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_compare_item`
--

LOCK TABLES `mp1_catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_eav_attribute`
--

DROP TABLE IF EXISTS `mp1_catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `MP1_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `MP1_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `MP1_CAT_EAV_ATTR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_eav_attribute`
--

LOCK TABLES `mp1_catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `mp1_catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(64,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,configurable,downloadable,bundle',1,0,0,0,0,0,0,0,1,NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,0,1,NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,0,1,NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,configurable',1,0,0,0,0,1,0,1,1,NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable,bundle',0,0,0,0,0,0,0,0,1,NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,0,0,0,1,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,configurable,grouped',0,0,0,0,0,1,0,1,1,NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(117,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,NULL),(118,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,NULL),(119,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(120,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(121,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(122,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(123,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(124,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(125,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(126,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(127,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(128,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(129,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,configurable,downloadable,bundle',0,0,0,0,0,1,0,1,1,NULL),(130,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(131,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(132,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(133,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(134,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(135,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple',0,0,0,0,0,0,0,0,1,NULL),(136,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple',0,0,0,0,0,0,0,0,1,NULL),(137,NULL,0,1,0,0,0,0,0,0,0,0,0,'simple',0,0,0,0,0,0,0,0,1,NULL),(138,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,configurable,virtual,bundle,downloadable',0,0,0,0,0,0,0,0,1,NULL);
/*!40000 ALTER TABLE `mp1_catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_CAT_PRD_BNDL_OPT_PARENT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_option`
--

LOCK TABLES `mp1_catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `MP1_CAT_PRD_BNDL_OPT_VAL_OPT_ID_MP1_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_option_value`
--

LOCK TABLES `mp1_catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_AACF8876697F369A158ED28DC2C20E5A` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_BNDL_PRICE_IDX_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_price_index`
--

LOCK TABLES `mp1_catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_CAT_PRD_BNDL_SELECTION_OPT_ID_MP1_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_BNDL_SELECTION_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_selection`
--

LOCK TABLES `mp1_catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_8C674E4CD6A598B8FA678D3DDF53D7B6` FOREIGN KEY (`selection_id`) REFERENCES `mp1_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_selection_price`
--

LOCK TABLES `mp1_catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `mp1_catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_bundle_stock_index`
--

LOCK TABLES `mp1_catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity`
--

LOCK TABLES `mp1_catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_DTIME_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_DTIME_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_datetime`
--

LOCK TABLES `mp1_catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_DEC_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_DEC_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_decimal`
--

LOCK TABLES `mp1_catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_ENTT_GLR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_GLR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_GLR_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_gallery`
--

LOCK TABLES `mp1_catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_int`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_INT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_INT_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_int`
--

LOCK TABLES `mp1_catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_media_gallery`
--

LOCK TABLES `mp1_catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`),
  CONSTRAINT `FK_76B77081A77661D3A4E1848C59D2F3C6` FOREIGN KEY (`value_id`) REFERENCES `mp1_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_media_gallery_value`
--

LOCK TABLES `mp1_catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product Entity ID',
  UNIQUE KEY `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `FK_4474AABCA68BB11271DCCC249F02BCD8` (`entity_id`),
  CONSTRAINT `FK_4474AABCA68BB11271DCCC249F02BCD8` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_452A3249D41B52320A5FF239CAEFE70B` FOREIGN KEY (`value_id`) REFERENCES `mp1_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `mp1_catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_MP1_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_A36FFA4B982F43327B46BE68CC64FD11` FOREIGN KEY (`value_id`) REFERENCES `mp1_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `mp1_catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_text`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_TEXT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_TEXT_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_text`
--

LOCK TABLES `mp1_catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_DB941701BBD53047D7BEC24FF8BD5F1C` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_C283AD54219780698C4C86E29B7696A5` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_TIER_PRICE_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_tier_price`
--

LOCK TABLES `mp1_catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `mp1_catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_VCHR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_ENTT_VCHR_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_entity_varchar`
--

LOCK TABLES `mp1_catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `mp1_catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action Id',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `MP1_CAT_PRD_FRONTEND_ACTION_VISITOR_ID_PRD_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `MP1_CAT_PRD_FRONTEND_ACTION_CSTR_ID_PRD_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `MP1_CAT_PRD_FRONTEND_ACTION_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `MP1_CAT_PRD_FRONTEND_ACTION_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_FRONTEND_ACTION_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_frontend_action`
--

LOCK TABLES `mp1_catalog_product_frontend_action` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_frontend_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_frontend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav`
--

LOCK TABLES `mp1_catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_decimal`
--

LOCK TABLES `mp1_catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `mp1_catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_decimal_replica`
--

LOCK TABLES `mp1_catalog_product_index_eav_decimal_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `mp1_catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_idx`
--

LOCK TABLES `mp1_catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_replica`
--

LOCK TABLES `mp1_catalog_product_index_eav_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_eav_tmp`
--

LOCK TABLES `mp1_catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `MP1_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price`
--

LOCK TABLES `mp1_catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_downlod_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_final_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_final_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_opt_idx`
--

LOCK TABLES `mp1_catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_opt_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `MP1_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_replica`
--

LOCK TABLES `mp1_catalog_product_index_price_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_price_tmp`
--

LOCK TABLES `mp1_catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_D441F7F7269528D963E160CA5A7BBABB` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_IDX_TIER_PRICE_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_tier_price`
--

LOCK TABLES `mp1_catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_index_website`
--

DROP TABLE IF EXISTS `mp1_catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint(5) unsigned NOT NULL COMMENT 'Default store id for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `MP1_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `MP1_CAT_PRD_IDX_WS_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_index_website`
--

LOCK TABLES `mp1_catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_index_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `MP1_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `MP1_CAT_PRD_LNK_LNKED_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_LNK_LNK_TYPE_ID_MP1_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `mp1_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_LNK_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link`
--

LOCK TABLES `mp1_catalog_product_link` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `FK_F48FDF03FD315A1E813F1611FC634419` FOREIGN KEY (`link_type_id`) REFERENCES `mp1_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link_attribute`
--

LOCK TABLES `mp1_catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `mp1_catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `FK_1BF6173118E89B1420891C79A7A8954C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mp1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_LNK_ATTR_DEC_LNK_ID_MP1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mp1_catalog_product_link` (`link_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link_attribute_decimal`
--

LOCK TABLES `mp1_catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `FK_917053ED68714C20B4DD5080356332FA` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mp1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_LNK_ATTR_INT_LNK_ID_MP1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mp1_catalog_product_link` (`link_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link_attribute_int`
--

LOCK TABLES `mp1_catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MP1_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `FK_949DFA5E91BD1B0F842A1B377D4CF667` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mp1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_MP1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mp1_catalog_product_link` (`link_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link_attribute_varchar`
--

LOCK TABLES `mp1_catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_link_type`
--

DROP TABLE IF EXISTS `mp1_catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_link_type`
--

LOCK TABLES `mp1_catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `mp1_catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `mp1_catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_CAT_PRD_OPT_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option`
--

LOCK TABLES `mp1_catalog_product_option` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_OPT_PRICE_OPT_ID_MP1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option_price`
--

LOCK TABLES `mp1_catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option_title`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_OPT_TTL_OPT_ID_MP1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option_title`
--

LOCK TABLES `mp1_catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_01E550A801747977B5980B9A407F7032` FOREIGN KEY (`option_type_id`) REFERENCES `mp1_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_OPT_TYPE_PRICE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option_type_price`
--

LOCK TABLES `mp1_catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_86B263FD24F1CD9B80F7B7446BCB5891` FOREIGN KEY (`option_type_id`) REFERENCES `mp1_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_OPT_TYPE_TTL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option_type_title`
--

LOCK TABLES `mp1_catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `mp1_catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `MP1_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `MP1_CAT_PRD_OPT_TYPE_VAL_OPT_ID_MP1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_option_type_value`
--

LOCK TABLES `mp1_catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_relation`
--

DROP TABLE IF EXISTS `mp1_catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `MP1_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `MP1_CAT_PRD_RELATION_CHILD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_RELATION_PARENT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_relation`
--

LOCK TABLES `mp1_catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `mp1_catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `MP1_CAT_PRD_SPR_ATTR_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_super_attribute`
--

LOCK TABLES `mp1_catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `mp1_catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `MP1_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_92CAF7DE1B4C222392303EC08DB24BC9` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `mp1_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_SPR_ATTR_LBL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_super_attribute_label`
--

LOCK TABLES `mp1_catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_super_link`
--

DROP TABLE IF EXISTS `mp1_catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `MP1_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `MP1_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_CAT_PRD_SPR_LNK_PARENT_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_SPR_LNK_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_super_link`
--

LOCK TABLES `mp1_catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_product_website`
--

DROP TABLE IF EXISTS `mp1_catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `MP1_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_CAT_PRD_WS_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_PRD_WS_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_product_website`
--

LOCK TABLES `mp1_catalog_product_website` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_product_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `mp1_catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `MP1_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_17DE99C0D1C436C8A55070540156353A` (`url_rewrite_id`),
  KEY `MP1_CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  CONSTRAINT `FK_17DE99C0D1C436C8A55070540156353A` FOREIGN KEY (`url_rewrite_id`) REFERENCES `mp1_url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_MP1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `mp1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalog_url_rewrite_product_category`
--

LOCK TABLES `mp1_catalog_url_rewrite_product_category` WRITE;
/*!40000 ALTER TABLE `mp1_catalog_url_rewrite_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalog_url_rewrite_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock`
--

LOCK TABLES `mp1_cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `mp1_cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `mp1_cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `MP1_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `MP1_CATINV_STOCK_ITEM_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CATINV_STOCK_ITEM_STOCK_ID_MP1_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `mp1_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock_item`
--

LOCK TABLES `mp1_cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock_status`
--

LOCK TABLES `mp1_cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock_status_idx`
--

LOCK TABLES `mp1_cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock_status_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock_status_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock_status_replica`
--

LOCK TABLES `mp1_cataloginventory_stock_status_replica` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `mp1_cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `MP1_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cataloginventory_stock_status_tmp`
--

LOCK TABLES `mp1_cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule`
--

DROP TABLE IF EXISTS `mp1_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `MP1_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule`
--

LOCK TABLES `mp1_catalogrule` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_customer_group`
--

DROP TABLE IF EXISTS `mp1_catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `MP1_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_A4C1DFB5D9AAC8B8E57D552AB2523C8C` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_MP1_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_catalogrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_customer_group`
--

LOCK TABLES `mp1_catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_group_website`
--

DROP TABLE IF EXISTS `mp1_catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_group_website`
--

LOCK TABLES `mp1_catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `mp1_catalogrule_group_website_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_group_website_replica` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `MP1_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_group_website_replica`
--

LOCK TABLES `mp1_catalogrule_group_website_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_group_website_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_group_website_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_product`
--

DROP TABLE IF EXISTS `mp1_catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_AC42394790ECDF7BFEA5B30F78835028` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `MP1_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `MP1_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_product`
--

LOCK TABLES `mp1_catalogrule_product` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_product_price`
--

DROP TABLE IF EXISTS `mp1_catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `MP1_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_product_price`
--

LOCK TABLES `mp1_catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `mp1_catalogrule_product_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `MP1_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_product_price_replica`
--

LOCK TABLES `mp1_catalogrule_product_price_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_product_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_product_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_product_replica`
--

DROP TABLE IF EXISTS `mp1_catalogrule_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_product_replica` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_AC42394790ECDF7BFEA5B30F78835028` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `MP1_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `MP1_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `MP1_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `MP1_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_product_replica`
--

LOCK TABLES `mp1_catalogrule_product_replica` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_product_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_product_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogrule_website`
--

DROP TABLE IF EXISTS `mp1_catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `MP1_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_CATALOGRULE_WEBSITE_RULE_ID_MP1_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CATALOGRULE_WEBSITE_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogrule_website`
--

LOCK TABLES `mp1_catalogrule_website` WRITE;
/*!40000 ALTER TABLE `mp1_catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogsearch_fulltext_scope1`
--

DROP TABLE IF EXISTS `mp1_catalogsearch_fulltext_scope1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_catalogsearch_fulltext_scope1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogsearch_fulltext_scope1`
--

LOCK TABLES `mp1_catalogsearch_fulltext_scope1` WRITE;
/*!40000 ALTER TABLE `mp1_catalogsearch_fulltext_scope1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogsearch_fulltext_scope1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `mp1_catalogsearch_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_catalogsearch_recommendations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `query_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Query Id',
  `relation_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Relation Id',
  PRIMARY KEY (`id`),
  KEY `MP1_CATSRCH_RECOMMENDATIONS_QR_ID_MP1_SRCH_QR_QR_ID` (`query_id`),
  KEY `MP1_CATSRCH_RECOMMENDATIONS_RELATION_ID_MP1_SRCH_QR_QR_ID` (`relation_id`),
  CONSTRAINT `MP1_CATSRCH_RECOMMENDATIONS_QR_ID_MP1_SRCH_QR_QR_ID` FOREIGN KEY (`query_id`) REFERENCES `mp1_search_query` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CATSRCH_RECOMMENDATIONS_RELATION_ID_MP1_SRCH_QR_QR_ID` FOREIGN KEY (`relation_id`) REFERENCES `mp1_search_query` (`query_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Advanced Search Recommendations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_catalogsearch_recommendations`
--

LOCK TABLES `mp1_catalogsearch_recommendations` WRITE;
/*!40000 ALTER TABLE `mp1_catalogsearch_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_catalogsearch_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_checkout_agreement`
--

DROP TABLE IF EXISTS `mp1_checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_checkout_agreement`
--

LOCK TABLES `mp1_checkout_agreement` WRITE;
/*!40000 ALTER TABLE `mp1_checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_checkout_agreement_store`
--

DROP TABLE IF EXISTS `mp1_checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `MP1_CHECKOUT_AGREEMENT_STORE_STORE_ID_MP1_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CHECKOUT_AGREEMENT_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CHKT_AGRT_STORE_AGRT_ID_MP1_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `mp1_checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_checkout_agreement_store`
--

LOCK TABLES `mp1_checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `mp1_checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cms_block`
--

DROP TABLE IF EXISTS `mp1_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `MP1_CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cms_block`
--

LOCK TABLES `mp1_cms_block` WRITE;
/*!40000 ALTER TABLE `mp1_cms_block` DISABLE KEYS */;
INSERT INTO `mp1_cms_block` VALUES (1,'Payments Icons','payment-icons','<span class=\"payment-icons\">\n    <ul>\n        <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/paymet/americanexpress.png\"}}\" alt=\"americanexpress\" /></a></li>\n        <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/paymet/discover.png\"}}\" alt=\"discover\" /></a></li>\n        <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/paymet/maestro.png\"}}\" alt=\"maestro\" /></a></li>\n        <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/paymet/master.png\"}}\" alt=\"master\" /></a></li>\n        <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/paymet/visa.png\"}}\" alt=\"visa\" /></a></li>\n    </ul>\n</span>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(2,'Home Slider','home-slider','<div class=\"home-slider-wrapper\">\n    <div class=\"home-slider-main below-padding\">\n        <ul class=\"home-slider\">\n            <li><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/slider/bizkick-home-banner-1.png\"}}\" alt=\"home banner\" /> </a></li>\n            <li style=\"display:none;\"><a href=\"#\"><img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/slider/bizkick-home-banner-2.png\"}}\" alt=\"home banner\" /> </a></li>\n        </ul>\n    </div>\n    <script type=\"text/javascript\">\n        require([\'jquery\', \'bizkickowlcarousel\'], function() {\n            jQuery(document).ready(function() {\n                jQuery(\".home-slider\").owlCarousel({\n                    items: 1,\n                    itemsDesktop: [1198, 1],\n                    itemsDesktopSmall: [1023, 1],\n                    itemsTablet: [768, 1],\n                    itemsTabletSmall: [767, 1],\n                    itemsMobile: [479, 1],\n                    pagination: true,\n                    navigationText: [\"<div class=\'left-arrow\'><i class=\'fa fa-angle-left\'></i></div>\", \"<div class=\'right-arrow\'><i class=\'fa fa-angle-right\'></div>\"],\n                    navigation: true,\n                });\n                jQuery(\".home-slider li\").show();\n            });\n        });\n    </script>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(3,'Bizkick Above','bizkick-above','{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home-slider\"}}','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(4,'Home Images Block','home-images-one','<div class=\"home-images-wrapper above-padding below-padding\">\n    <div class=\"page-main\">\n        <div class=\"home-image-main\">\n            <div class=\"home-image-inner\">\n                <a href=\"#\">\n                    <img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/advertisement/bizkick-male-watch1.png\"}}\" alt=\"bizkick-fashion-image\" />\n                </a>\n            </div>\n            <div class=\"home-image-inner\">\n                <a href=\"#\">\n                    <img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/advertisement/bizkick-male-watch2.png\"}}\" alt=\"bizkick-fashion-image\" />\n                </a>\n            </div>\n            <div class=\"home-image-inner\">\n                <a href=\"#\">\n                    <img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/advertisement/bizkick-male-watch3.png\"}}\" alt=\"bizkick-fashion-image\" />\n                </a>\n            </div>\n        </div>\n    </div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(5,'Bizkick Below','bizkick-below','{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home-images-one\"}}\n<div class=\"page-main\">\n{{widget type=\"Magento\\Catalog\\Block\\Product\\Widget\\NewWidget\" display_type=\"all_products\" show_pager=\"0\" products_count=\"10\" template=\"product/widget/new/content/new_grid.phtml\"}}\n</div>\n{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home-images-two\"}}\n<div class=\"page-main\">\n    {{widget type=\"Magento\\CatalogWidget\\Block\\Product\\ProductsList\" title=\"Featured Products\" show_pager=\"0\" products_count=\"10\" template=\"product/widget/content/grid.phtml\" conditions_encoded=\"^[`1`:^[`type`:`Magento||CatalogWidget||Model||Rule||Condition||Combine`,`aggregator`:`all`,`value`:`1`,`new_child`:``^],`1--1`:^[`type`:`Magento||CatalogWidget||Model||Rule||Condition||Product`,`attribute`:`is_featured`,`operator`:`==`,`value`:`1`^]^]\"}}    \n</div>\n{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home-services\"}}\n{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home_testimonials\"}}\n{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home_blogs\"}}\n{{widget type=\"Magento\\Cms\\Block\\Widget\\Block\" template=\"widget/static_block/default.phtml\" block_id=\"home-brands\"}}','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(6,'Home Testimonials','home_testimonials','<div class=\"hb-wrapper above-padding below-padding above-margin below-margin\">\n    <div class=\"page-main\">\n        <div class=\"page-title-main\"><strong>What Our Customer Says</strong></div>\n        <div class=\"hb-row\">\n            <div class=\"hb-testimonoals\">\n                <ul id=\"hb-testimonials\">\n                    <li style=\"display: none;\">\n                        <div class=\"hb-inner\">\n                            <div class=\"hb-content\">\n                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\n                            </div>\n                            <div class=\"hb-image\">\n                                <img src=\"{{media url=\"wysiwyg/testimonial/testimonial-1.png\"}}\" alt=\"testimonial-image\" />\n                                <span>\n                                    <h4>Joh Doe</h4>\n                                    <p>Web Designer</p>\n                                </span>\n                            </div>\n                        </div>\n                    </li>\n                    <li style=\"display: none;\">\n                        <div class=\"hb-inner\">\n                            <div class=\"hb-content\">\n                                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.</p>\n                            </div>\n                            <div class=\"hb-image\">\n                                <img src=\"{{media url=\"wysiwyg/testimonial/testimonial-2.png\"}}\" alt=\"testimonial-image\" />\n                                <span>\n                                    <h4>Joh Doe</h4>\n                                    <p>Web Designer</p>\n                                </span>\n                            </div>\n                        </div>\n                    </li>\n                    <li style=\"display: none;\">\n                        <div class=\"hb-inner\">\n                            <div class=\"hb-content\">\n                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\n                            </div>\n                            <div class=\"hb-image\">\n                                <img src=\"{{media url=\"wysiwyg/testimonial/testimonial-3.png\"}}\" alt=\"testimonial-image\" />\n                                <span><h4>Joh Doe</h4>\n                                    <p>Web Designer</p>\n                                </span>\n                            </div>\n                        </div>\n                    </li>\n                </ul>\n                <script type=\"text/javascript\" xml=\"space\">\n                    require([\'jquery\', \'bizkickowlcarousel\'], function() {\n                        jQuery(document).ready(function() {\n                            jQuery(\"#hb-testimonials\").owlCarousel({\n                                items: 2,\n                                itemsDesktop: [1198, 2],\n                                itemsDesktopSmall: [1023, 2],\n                                itemsTablet: [768, 1],\n                                itemsTabletSmall: [767, 1],\n                                itemsMobile: [479, 1],\n                                pagination: false,\n                                navigationText: [\"<div class=\'left-arrow\'><i class=\'fa fa-angle-left\'></i></div>\", \"<div class=\'right-arrow\'><i class=\'fa fa-angle-right\'></div>\"],\n                                navigation: true,\n                            });\n                            jQuery(\"#hb-testimonials li\").show();\n                        });\n                    });\n                </script>\n            </div>\n        </div>\n    </div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(7,'Home Brands','home-brands','<div class=\"brands-wrapper above-padding below-padding\">\n    <div class=\"page-main\">\n        <div class=\"brands-main\">\n            <ul class=\"brands-slider\">\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-1.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-2.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-3.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-4.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-5.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-6.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-7.png\"}}\" alt=\"brand-image\" /></a></li>\n                <li style=\"display: none;\"><a href=\"#\"><img src=\"{{media url=\"wysiwyg/brand/brand-8.png\"}}\" alt=\"brand-image\" /></a></li>\n            </ul>\n            <script type=\"text/javascript\" xml=\"space\">\n                require([\'jquery\', \'bizkickowlcarousel\'], function() {\n                    jQuery(document).ready(function() {\n                        jQuery(\".brands-slider\").owlCarousel({\n                            items: 6,\n                            itemsDesktop: [1198, 5],\n                            itemsDesktopSmall: [1023, 5],\n                            itemsTablet: [768, 4],\n                            itemsTabletSmall: [767, 4],\n                            itemsMobile: [479, 2],\n                            pagination: false,\n                            navigationText: [\"<div class=\'left-arrow\'><i class=\'fa fa-angle-left\'></i></div>\", \"<div class=\'right-arrow\'><i class=\'fa fa-angle-right\'></div>\"],\n                            navigation: false,\n                        });\n                        jQuery(\".brands-slider li\").show();\n                    });\n                });\n            </script>\n        </div>\n    </div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(8,'Footer My Account Block','footer_myaccount','<div class=\"footer-colum-title\">\n                                    <h3>\n                                        My Account\n                                    </h3>\n                                </div>\n                                <div class=\"footer-column-content\">\n<ul class=\"footer links\">\n<li class=\"nav item\"><a href=\"#\">My Account</a></li>\n<li class=\"nav item\"><a href=\"#\">Login</a></li>\n<li class=\"nav item\"><a href=\"#\">My Cart</a></li>\n<li class=\"nav item\"><a href=\"#\">My Compare</a></li>\n<li class=\"nav item\"><a href=\"#\">My Wishlist</a></li>\n</ul>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(9,'Footer Payment & Shipping','footer_payment_shipping','<div class=\"footer-colum-title\">\n                            <h3>\n                                Payment & Shipping\n                            </h3>\n                        </div>\n                        <div class=\"footer-column-content\">\n<ul class=\"footer links\">\n<li class=\"nav item\"><a href=\"#\">Terms of Use</a></li>\n<li class=\"nav item\"><a href=\"#\">Payment Methods</a></li>\n<li class=\"nav item\"><a href=\"#\">Shipping Guide</a></li>\n<li class=\"nav item\"><a href=\"#\">Order Tracking</a></li>\n<li class=\"nav item\"><a href=\"#\">Return % Exchange</a></li>\n</ul>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(10,'Home Blogs','home_blogs','<div class=\"hb-wrapper above-padding below-padding\" style=\"background: #ffffff;\">\n<div class=\"page-main\">\n<div class=\"page-title-main\"><strong>Latest Posts</strong></div>\n<div class=\"hb-row\">\n<div class=\"hb-blog\">\n<ul id=\"hb-blogs\">\n<li style=\"display:none;\">\n<div class=\"hb-inner\">\n<div class=\"hb-img\"><img src=\"{{media url=\"wysiwyg/blog/bizkick-blog-1.png\"}}\" alt=\"blog-image\" /></div>\n<div class=\"hb-content\">\n<h3>Lorem ipsum is dolor sit amet.</h3>\n<p>Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet.</p>\n<span> 25 Jul 2016 </span></div>\n</div>\n</li>\n<li style=\"display:none;\">\n<div class=\"hb-inner\">\n<div class=\"hb-img\"><img src=\"{{media url=\"wysiwyg/blog/bizkick-blog-2.png\"}}\" alt=\"blog-image\" /></div>\n<div class=\"hb-content\">\n<h3>Lorem ipsum is dolor sit amet.</h3>\n<p>Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet.</p>\n<span> 25 Jul 2016 </span></div>\n</div>\n</li>\n<li style=\"display:none;\">\n<div class=\"hb-inner\">\n<div class=\"hb-img\"><img src=\"{{media url=\"wysiwyg/blog/bizkick-blog-3.png\"}}\" alt=\"blog-image\" /></div>\n<div class=\"hb-content\">\n<h3>Lorem ipsum is dolor sit amet.</h3>\n<p>Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet. Lorem ipsum is dolor sit amet.</p>\n<span> 25 Jul 2016 </span></div>\n</div>\n</li>\n</ul>\n<script type=\"text/javascript\" xml=\"space\">\n                    require([\'jquery\', \'bizkickowlcarousel\'], function() {\n                        jQuery(document).ready(function() {\n                            jQuery(\"#hb-blogs\").owlCarousel({\n                                items: 2,\n                                itemsDesktop: [1198, 2],\n                                itemsDesktopSmall: [1023, 2],\n                                itemsTablet: [768, 1],\n                                itemsTabletSmall: [767, 1],\n                                itemsMobile: [479, 1],\n                                pagination: false,\n                                navigationText: [\"<div class=\'left-arrow\'><i class=\'fa fa-angle-left\'></i></div>\", \"<div class=\'right-arrow\'><i class=\'fa fa-angle-right\'></div>\"],\n                                navigation: true,\n                            });\njQuery(\"#hb-blogs li\").show();\n                        });\n                    });\n</script>\n</div>\n</div>\n</div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(11,'Footer Socials Block','footer-socials','<div class=\"socials-block\">\n            <a href=\"#\"><em class=\"fa fa-facebook\"></em></a>\n            <a href=\"#\"><em class=\"fa fa-twitter\"></em></a>\n            <a href=\"#\"><em class=\"fa fa-linkedin\"></em></a>\n            <a href=\"#\"><em class=\"fa fa-vimeo\"></em></a>\n            <a href=\"#\"><em class=\"fa fa-google\"></em></a>\n        </div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(12,'Home Images Block','home-images-two','<div class=\"home-parallax-block above-margin below-margin\">\n<p>ONLY THIS MONTH</p>\n<h1>SAVE 60% OFF SALE</h1>\n<a class=\"action primary\" href=\"https://demo.hiddentechies.com/bizkick/electronics.html\" target=\"_blank\">Shop Now</a>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(13,'Home Services Block','home-services','<div class=\"home-advantage-block\">\n    <div class=\"page-main\">\n        <div class=\"hab-row\">\n            <div class=\"hab-inner\">\n                <div class=\"home-advantage-block-inner\">\n                    <span> \n                        <em class=\"fa fa-usd\"></em> \n                    </span>\n                    <p>30-Day Money Back</p>\n                </div>\n            </div>\n            <div class=\"hab-inner\">\n                <div class=\"home-advantage-block-inner\">\n                    <span> \n                        <em class=\"fa fa-headphones\"></em> \n                    </span>\n                    <p>1 year Free Support</p>\n                </div>\n            </div>\n            <div class=\"hab-inner\">\n                <div class=\"home-advantage-block-inner\">\n                    <span> \n                        <em class=\"fa fa-undo\"></em> \n                    </span>\n                    <p>Free Lifetime Update</p>\n                </div>\n            </div>\n            <div class=\"hab-inner\">\n                <div class=\"home-advantage-block-inner\">\n                    <span> \n                        <em class=\"fa fa-thumbs-up\"></em> \n                    </span>\n                    <p>100% Satisfaction</p>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(14,'Home Single Images Block','home-single-images-block','<div class=\"home-images-wrapper above-padding below-padding\">\n<div class=\"page-main\">\n<div class=\"home-image-main\">\n<div class=\"home-image-inner\"><a href=\"#\"> <img class=\"image-responsive middle-block\" src=\"{{media url=\"wysiwyg/advertisement/advt-block2.png\"}}\" alt=\"bizkick-fashion-image\" /> </a></div>\n</div>\n</div>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(15,'Sidebar add banner','sidebar-add-banner','<img src=\"{{media url=\"wysiwyg/advertisement/sidebar-banner.png\"}}\" alt=\"\" />','2019-05-14 01:29:18','2019-05-14 01:29:18',1),(16,'Footer Quicklinks Block','footer_quicklinks','<div class=\"footer-colum-title\">\n<h3>Quick Links</h3>\n</div>\n<div class=\"footer-column-content\">\n<ul class=\"footer links\">\n<li class=\"nav item\"><a href=\"{{store url=\'privacy-policy-cookie-restriction-mode\'}}\"> Privacy and Cookie Policy </a></li>\n<li class=\"nav item\"><a href=\"{{store url=\'search/term/popular\'}}\"> Search Terms </a></li>\n<li class=\"nav item\"><a href=\"{{store url=\'contact\'}}\"> Contact Us </a></li>\n<li class=\"nav item\"><a href=\"{{store url=\'sales/guest/form\'}}\"> Orders and Returns </a></li>\n<li class=\"nav item\"><a href=\"{{store url=\'catalogsearch/advanced\'}}\" data-action=\"advanced-search\"> Advanced Search </a></li>\n</ul>\n</div>','2019-05-14 01:29:18','2019-05-14 01:29:18',1);
/*!40000 ALTER TABLE `mp1_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cms_block_store`
--

DROP TABLE IF EXISTS `mp1_cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `MP1_CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CMS_BLOCK_STORE_BLOCK_ID_MP1_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `mp1_cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CMS_BLOCK_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cms_block_store`
--

LOCK TABLES `mp1_cms_block_store` WRITE;
/*!40000 ALTER TABLE `mp1_cms_block_store` DISABLE KEYS */;
INSERT INTO `mp1_cms_block_store` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0);
/*!40000 ALTER TABLE `mp1_cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cms_page`
--

DROP TABLE IF EXISTS `mp1_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `MP1_CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `FTI_E4EC79CCB46A3C6DABC809484C2AC465` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cms_page`
--

LOCK TABLES `mp1_cms_page` WRITE;
/*!40000 ALTER TABLE `mp1_cms_page` DISABLE KEYS */;
INSERT INTO `mp1_cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2019-05-14 01:12:33','2019-05-14 01:12:33',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Bizkick - Free Theme For Magento 2 | HiddenTechies','1column','','','home','','<span class=\"display:none;\"></span>','2019-05-14 01:12:33','2019-05-14 01:29:18',1,0,'','','','',NULL,NULL,NULL),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2019-05-14 01:12:33','2019-05-14 01:12:33',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2019-05-14 01:12:33','2019-05-14 01:12:33',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp1_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cms_page_store`
--

DROP TABLE IF EXISTS `mp1_cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `MP1_CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_CMS_PAGE_STORE_PAGE_ID_MP1_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `mp1_cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CMS_PAGE_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cms_page_store`
--

LOCK TABLES `mp1_cms_page_store` WRITE;
/*!40000 ALTER TABLE `mp1_cms_page_store` DISABLE KEYS */;
INSERT INTO `mp1_cms_page_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `mp1_cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_core_config_data`
--

DROP TABLE IF EXISTS `mp1_core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `MP1_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_core_config_data`
--

LOCK TABLES `mp1_core_config_data` WRITE;
/*!40000 ALTER TABLE `mp1_core_config_data` DISABLE KEYS */;
INSERT INTO `mp1_core_config_data` VALUES (1,'default',0,'web/seo/use_rewrites','1'),(2,'default',0,'web/unsecure/base_url','http://magento-project.local/'),(3,'default',0,'web/secure/base_url','https://magento-project.local/'),(4,'default',0,'general/locale/code','en_US'),(5,'default',0,'web/secure/use_in_frontend',NULL),(6,'default',0,'web/secure/use_in_adminhtml',NULL),(7,'default',0,'general/locale/timezone','UTC'),(8,'default',0,'currency/options/base','USD'),(9,'default',0,'currency/options/default','USD'),(10,'default',0,'currency/options/allow','USD'),(11,'default',0,'general/region/display_all','1'),(12,'default',0,'general/region/state_required','AU,BR,CA,CH,EE,ES,HR,IN,LT,LV,RO,US'),(13,'default',0,'catalog/category/root_id','2'),(14,'default',0,'msp_securitysuite_twofactorauth/duo/application_key','6E8Boi3g8t8obn3hVL1L9iin1TlyaIBjBcWqSwRPDaZiWEnUM0FToU7F2cEF1rXC'),(15,'default',0,'analytics/subscription/enabled','1'),(16,'default',0,'crontab/default/jobs/analytics_subscribe/schedule/cron_expr','0 * * * *'),(17,'default',0,'payment/authorizenet_acceptjs/cctypes','AE,VI,MC,DI,JCB,DN'),(18,'default',0,'payment/authorizenet_acceptjs/order_status','processing'),(19,'default',0,'payment/authorizenet_acceptjs/payment_action','authorize'),(20,'default',0,'payment/authorizenet_acceptjs/currency','USD'),(21,'websites',1,'payment/authorizenet_acceptjs/cctypes','AE,VI,MC,DI,JCB,DN'),(22,'websites',1,'payment/authorizenet_acceptjs/order_status','processing'),(23,'websites',1,'payment/authorizenet_acceptjs/payment_action','authorize'),(24,'websites',1,'payment/authorizenet_acceptjs/currency','USD'),(25,'website',0,'connector_configuration/transactional_data/order_statuses','canceled,closed,complete,fraud,holded,payment_review,paypal_canceled_reversal,paypal_reversed,pending,pending_payment,pending_paypal,processing'),(26,'website',0,'connector_configuration/catalog_sync/catalog_type','simple,virtual,configurable,downloadable,grouped,bundle'),(27,'website',0,'connector_configuration/catalog_sync/catalog_visibility','1,2,3,4'),(28,'default',0,'connector_dynamic_content/external_dynamic_content_urls/passcode','WIDmBGxbgNAtcd5PLzwv1FRDoKml9aoJ'),(29,'default',0,'connector_automation/review_settings/allow_non_subscribers','1'),(30,'default',0,'connector_configuration/abandoned_carts/allow_non_subscribers','1'),(31,'default',0,'sync_settings/addressbook/allow_non_subscribers','1'),(32,'stores',1,'design/theme/theme_id','4'),(33,'stores',1,'design/pagination/pagination_frame_skip',NULL),(34,'stores',1,'design/pagination/anchor_text_for_previous',NULL),(35,'stores',1,'design/pagination/anchor_text_for_next',NULL),(36,'stores',1,'design/head/title_prefix',NULL),(37,'stores',1,'design/head/title_suffix',NULL),(38,'stores',1,'design/head/default_description',NULL),(39,'stores',1,'design/head/default_keywords',NULL),(40,'stores',1,'design/head/includes',NULL),(41,'stores',1,'design/header/logo_width',NULL),(42,'stores',1,'design/header/logo_height',NULL),(43,'stores',1,'design/header/logo_alt',NULL),(44,'stores',1,'design/footer/absolute_footer',NULL),(45,'stores',1,'design/search_engine_robots/custom_instructions',NULL),(46,'stores',1,'design/watermark/image_size',NULL),(47,'stores',1,'design/watermark/image_imageOpacity',NULL),(48,'stores',1,'design/watermark/small_image_size',NULL),(49,'stores',1,'design/watermark/small_image_imageOpacity',NULL),(50,'stores',1,'design/watermark/thumbnail_size',NULL),(51,'stores',1,'design/watermark/thumbnail_imageOpacity',NULL),(52,'stores',1,'design/email/logo_alt',NULL),(53,'stores',1,'design/email/logo_width',NULL),(54,'stores',1,'design/email/logo_height',NULL),(55,'stores',1,'design/watermark/swatch_image_size',NULL),(56,'stores',1,'design/watermark/swatch_image_imageOpacity',NULL);
/*!40000 ALTER TABLE `mp1_core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_cron_schedule`
--

DROP TABLE IF EXISTS `mp1_cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `MP1_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `MP1_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_cron_schedule`
--

LOCK TABLES `mp1_cron_schedule` WRITE;
/*!40000 ALTER TABLE `mp1_cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_PARENT_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity`
--

LOCK TABLES `mp1_customer_address_entity` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_DTIME_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_DTIME_ENTT_ID_MP1_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity_datetime`
--

LOCK TABLES `mp1_customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_DEC_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_DEC_ENTT_ID_MP1_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity_decimal`
--

LOCK TABLES `mp1_customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity_int`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_INT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_INT_ENTT_ID_MP1_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity_int`
--

LOCK TABLES `mp1_customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity_text`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_TEXT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_TEXT_ENTT_ID_MP1_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity_text`
--

LOCK TABLES `mp1_customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `mp1_customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_VCHR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ADDR_ENTT_VCHR_ENTT_ID_MP1_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_address_entity_varchar`
--

LOCK TABLES `mp1_customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_eav_attribute`
--

DROP TABLE IF EXISTS `mp1_customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `MP1_CSTR_EAV_ATTR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_eav_attribute`
--

LOCK TABLES `mp1_customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `mp1_customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL,1,1,1,0),(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1),(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(5,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,0,0,0,0),(6,0,'trim',0,NULL,0,50,NULL,0,0,0,0),(7,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,0,0,0,0),(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0),(9,1,NULL,0,'{\"input_validation\":\"email\"}',1,80,NULL,1,1,1,1),(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0),(11,0,'date',0,'{\"input_validation\":\"date\"}',0,90,NULL,1,1,1,0),(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(14,0,NULL,0,'{\"input_validation\":\"date\"}',1,0,NULL,0,0,0,0),(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(17,0,NULL,0,'{\"max_text_length\":255}',0,100,NULL,1,1,0,1),(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0),(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0),(20,0,NULL,0,'[]',0,110,NULL,1,1,1,0),(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0),(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0),(23,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,20,NULL,1,0,0,1),(24,0,'trim',0,NULL,0,30,NULL,0,0,0,0),(25,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,1,0,0,1),(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(27,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,1,0,0,1),(28,1,NULL,3,'{\"max_text_length\":255,\"min_text_length\":1}',1,70,NULL,1,0,0,1),(29,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,80,NULL,1,0,0,1),(30,1,NULL,0,NULL,1,90,NULL,1,1,1,0),(31,1,NULL,0,NULL,1,100,NULL,1,1,0,1),(32,1,NULL,0,NULL,1,100,NULL,0,0,0,0),(33,1,NULL,0,'[]',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),(34,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL,1,1,1,1),(35,0,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',0,130,NULL,1,0,0,1),(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0),(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0),(42,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(43,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(44,0,NULL,0,NULL,1,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `mp1_customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `mp1_customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `MP1_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_CSTR_EAV_ATTR_WS_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_EAV_ATTR_WS_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_eav_attribute_website`
--

LOCK TABLES `mp1_customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `mp1_customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `mp1_customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(5,1,NULL,NULL,NULL,NULL),(6,1,NULL,NULL,NULL,NULL),(7,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp1_customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity`
--

DROP TABLE IF EXISTS `mp1_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `MP1_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `MP1_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `MP1_CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `MP1_CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `MP1_CUSTOMER_ENTITY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_CUSTOMER_ENTITY_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity`
--

LOCK TABLES `mp1_customer_entity` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity_datetime`
--

DROP TABLE IF EXISTS `mp1_customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ENTT_DTIME_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ENTT_DTIME_ENTT_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity_datetime`
--

LOCK TABLES `mp1_customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity_decimal`
--

DROP TABLE IF EXISTS `mp1_customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ENTT_DEC_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ENTT_DEC_ENTT_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity_decimal`
--

LOCK TABLES `mp1_customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity_int`
--

DROP TABLE IF EXISTS `mp1_customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ENTT_INT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CUSTOMER_ENTITY_INT_ENTITY_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity_int`
--

LOCK TABLES `mp1_customer_entity_int` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity_text`
--

DROP TABLE IF EXISTS `mp1_customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_CSTR_ENTT_TEXT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CUSTOMER_ENTITY_TEXT_ENTITY_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity_text`
--

LOCK TABLES `mp1_customer_entity_text` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_entity_varchar`
--

DROP TABLE IF EXISTS `mp1_customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `MP1_CSTR_ENTT_VCHR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_CSTR_ENTT_VCHR_ENTT_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_entity_varchar`
--

LOCK TABLES `mp1_customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_form_attribute`
--

DROP TABLE IF EXISTS `mp1_customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `MP1_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_CSTR_FORM_ATTR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_form_attribute`
--

LOCK TABLES `mp1_customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_customer_form_attribute` DISABLE KEYS */;
INSERT INTO `mp1_customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',17),('adminhtml_customer',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_customer',19),('customer_account_create',19),('customer_account_edit',19),('adminhtml_checkout',20),('adminhtml_customer',20),('customer_account_create',20),('customer_account_edit',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer_address',33),('customer_address_edit',33),('customer_register_address',33),('adminhtml_customer_address',34),('customer_address_edit',34),('customer_register_address',34),('adminhtml_customer_address',35),('customer_address_edit',35),('customer_register_address',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `mp1_customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_grid_flat`
--

DROP TABLE IF EXISTS `mp1_customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `MP1_CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `MP1_CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `MP1_CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `MP1_CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `MP1_CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `MP1_CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_4E888ACD1FE1976B9CF1E580A5F2825D` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_customer_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_grid_flat`
--

LOCK TABLES `mp1_customer_grid_flat` WRITE;
/*!40000 ALTER TABLE `mp1_customer_grid_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_group`
--

DROP TABLE IF EXISTS `mp1_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_group`
--

LOCK TABLES `mp1_customer_group` WRITE;
/*!40000 ALTER TABLE `mp1_customer_group` DISABLE KEYS */;
INSERT INTO `mp1_customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `mp1_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_log`
--

DROP TABLE IF EXISTS `mp1_customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `MP1_CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_log`
--

LOCK TABLES `mp1_customer_log` WRITE;
/*!40000 ALTER TABLE `mp1_customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_customer_visitor`
--

DROP TABLE IF EXISTS `mp1_customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `MP1_CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Visitor Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_customer_visitor`
--

LOCK TABLES `mp1_customer_visitor` WRITE;
/*!40000 ALTER TABLE `mp1_customer_visitor` DISABLE KEYS */;
INSERT INTO `mp1_customer_visitor` VALUES (1,NULL,'vr6ss9qdd2q007micugd0oelu5','2019-05-14 01:14:39');
/*!40000 ALTER TABLE `mp1_customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_design_change`
--

DROP TABLE IF EXISTS `mp1_design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `MP1_DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_DESIGN_CHANGE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_design_change`
--

LOCK TABLES `mp1_design_change` WRITE;
/*!40000 ALTER TABLE `mp1_design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_design_config_grid_flat`
--

DROP TABLE IF EXISTS `mp1_design_config_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `MP1_DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `MP1_DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `MP1_DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_design_config_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_design_config_grid_flat`
--

LOCK TABLES `mp1_design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `mp1_design_config_grid_flat` DISABLE KEYS */;
INSERT INTO `mp1_design_config_grid_flat` VALUES (0,NULL,NULL,NULL,''),(1,1,NULL,NULL,''),(2,1,1,1,'4');
/*!40000 ALTER TABLE `mp1_design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_directory_country`
--

DROP TABLE IF EXISTS `mp1_directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_directory_country`
--

LOCK TABLES `mp1_directory_country` WRITE;
/*!40000 ALTER TABLE `mp1_directory_country` DISABLE KEYS */;
INSERT INTO `mp1_directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `mp1_directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_directory_country_format`
--

DROP TABLE IF EXISTS `mp1_directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `MP1_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_directory_country_format`
--

LOCK TABLES `mp1_directory_country_format` WRITE;
/*!40000 ALTER TABLE `mp1_directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_directory_country_region`
--

DROP TABLE IF EXISTS `mp1_directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `MP1_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_directory_country_region`
--

LOCK TABLES `mp1_directory_country_region` WRITE;
/*!40000 ALTER TABLE `mp1_directory_country_region` DISABLE KEYS */;
INSERT INTO `mp1_directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AE','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AE','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AE','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','ES','Espírito Santo'),(492,'BR','GO','Goiás'),(493,'BR','MA','Maranhão'),(494,'BR','MT','Mato Grosso'),(495,'BR','MS','Mato Grosso do Sul'),(496,'BR','MG','Minas Gerais'),(497,'BR','PA','Pará'),(498,'BR','PB','Paraíba'),(499,'BR','PR','Paraná'),(500,'BR','PE','Pernambuco'),(501,'BR','PI','Piauí'),(502,'BR','RJ','Rio de Janeiro'),(503,'BR','RN','Rio Grande do Norte'),(504,'BR','RS','Rio Grande do Sul'),(505,'BR','RO','Rondônia'),(506,'BR','RR','Roraima'),(507,'BR','SC','Santa Catarina'),(508,'BR','SP','São Paulo'),(509,'BR','SE','Sergipe'),(510,'BR','TO','Tocantins'),(511,'BR','DF','Distrito Federal'),(512,'HR','HR-01','Zagrebačka županija'),(513,'HR','HR-02','Krapinsko-zagorska županija'),(514,'HR','HR-03','Sisačko-moslavačka županija'),(515,'HR','HR-04','Karlovačka županija'),(516,'HR','HR-05','Varaždinska županija'),(517,'HR','HR-06','Koprivničko-križevačka županija'),(518,'HR','HR-07','Bjelovarsko-bilogorska županija'),(519,'HR','HR-08','Primorsko-goranska županija'),(520,'HR','HR-09','Ličko-senjska županija'),(521,'HR','HR-10','Virovitičko-podravska županija'),(522,'HR','HR-11','Požeško-slavonska županija'),(523,'HR','HR-12','Brodsko-posavska županija'),(524,'HR','HR-13','Zadarska županija'),(525,'HR','HR-14','Osječko-baranjska županija'),(526,'HR','HR-15','Šibensko-kninska županija'),(527,'HR','HR-16','Vukovarsko-srijemska županija'),(528,'HR','HR-17','Splitsko-dalmatinska županija'),(529,'HR','HR-18','Istarska županija'),(530,'HR','HR-19','Dubrovačko-neretvanska županija'),(531,'HR','HR-20','Međimurska županija'),(532,'HR','HR-21','Grad Zagreb'),(533,'IN','AN','Andaman and Nicobar Islands'),(534,'IN','AP','Andhra Pradesh'),(535,'IN','AR','Arunachal Pradesh'),(536,'IN','AS','Assam'),(537,'IN','BR','Bihar'),(538,'IN','CH','Chandigarh'),(539,'IN','CT','Chhattisgarh'),(540,'IN','DN','Dadra and Nagar Haveli'),(541,'IN','DD','Daman and Diu'),(542,'IN','DL','Delhi'),(543,'IN','GA','Goa'),(544,'IN','GJ','Gujarat'),(545,'IN','HR','Haryana'),(546,'IN','HP','Himachal Pradesh'),(547,'IN','JK','Jammu and Kashmir'),(548,'IN','JH','Jharkhand'),(549,'IN','KA','Karnataka'),(550,'IN','KL','Kerala'),(551,'IN','LD','Lakshadweep'),(552,'IN','MP','Madhya Pradesh'),(553,'IN','MH','Maharashtra'),(554,'IN','MN','Manipur'),(555,'IN','ML','Meghalaya'),(556,'IN','MZ','Mizoram'),(557,'IN','NL','Nagaland'),(558,'IN','OR','Odisha'),(559,'IN','PY','Puducherry'),(560,'IN','PB','Punjab'),(561,'IN','RJ','Rajasthan'),(562,'IN','SK','Sikkim'),(563,'IN','TN','Tamil Nadu'),(564,'IN','TG','Telangana'),(565,'IN','TR','Tripura'),(566,'IN','UP','Uttar Pradesh'),(567,'IN','UT','Uttarakhand'),(568,'IN','WB','West Bengal'),(569,'AU','ACT','Australian Capital Territory'),(570,'AU','NSW','New South Wales'),(571,'AU','VIC','Victoria'),(572,'AU','QLD','Queensland'),(573,'AU','SA','South Australia'),(574,'AU','TAS','Tasmania'),(575,'AU','WA','Western Australia'),(576,'AU','NT','Northern Territory');
/*!40000 ALTER TABLE `mp1_directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_directory_country_region_name`
--

DROP TABLE IF EXISTS `mp1_directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `MP1_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `FK_BEA45FEBED9A0897363F147D168595E0` FOREIGN KEY (`region_id`) REFERENCES `mp1_directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_directory_country_region_name`
--

LOCK TABLES `mp1_directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `mp1_directory_country_region_name` DISABLE KEYS */;
INSERT INTO `mp1_directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Espírito Santo'),('en_US',492,'Goiás'),('en_US',493,'Maranhão'),('en_US',494,'Mato Grosso'),('en_US',495,'Mato Grosso do Sul'),('en_US',496,'Minas Gerais'),('en_US',497,'Pará'),('en_US',498,'Paraíba'),('en_US',499,'Paraná'),('en_US',500,'Pernambuco'),('en_US',501,'Piauí'),('en_US',502,'Rio de Janeiro'),('en_US',503,'Rio Grande do Norte'),('en_US',504,'Rio Grande do Sul'),('en_US',505,'Rondônia'),('en_US',506,'Roraima'),('en_US',507,'Santa Catarina'),('en_US',508,'São Paulo'),('en_US',509,'Sergipe'),('en_US',510,'Tocantins'),('en_US',511,'Distrito Federal'),('en_US',512,'Zagrebačka županija'),('en_US',513,'Krapinsko-zagorska županija'),('en_US',514,'Sisačko-moslavačka županija'),('en_US',515,'Karlovačka županija'),('en_US',516,'Varaždinska županija'),('en_US',517,'Koprivničko-križevačka županija'),('en_US',518,'Bjelovarsko-bilogorska županija'),('en_US',519,'Primorsko-goranska županija'),('en_US',520,'Ličko-senjska županija'),('en_US',521,'Virovitičko-podravska županija'),('en_US',522,'Požeško-slavonska županija'),('en_US',523,'Brodsko-posavska županija'),('en_US',524,'Zadarska županija'),('en_US',525,'Osječko-baranjska županija'),('en_US',526,'Šibensko-kninska županija'),('en_US',527,'Vukovarsko-srijemska županija'),('en_US',528,'Splitsko-dalmatinska županija'),('en_US',529,'Istarska županija'),('en_US',530,'Dubrovačko-neretvanska županija'),('en_US',531,'Međimurska županija'),('en_US',532,'Grad Zagreb'),('en_US',533,'Andaman and Nicobar Islands'),('en_US',534,'Andhra Pradesh'),('en_US',535,'Arunachal Pradesh'),('en_US',536,'Assam'),('en_US',537,'Bihar'),('en_US',538,'Chandigarh'),('en_US',539,'Chhattisgarh'),('en_US',540,'Dadra and Nagar Haveli'),('en_US',541,'Daman and Diu'),('en_US',542,'Delhi'),('en_US',543,'Goa'),('en_US',544,'Gujarat'),('en_US',545,'Haryana'),('en_US',546,'Himachal Pradesh'),('en_US',547,'Jammu and Kashmir'),('en_US',548,'Jharkhand'),('en_US',549,'Karnataka'),('en_US',550,'Kerala'),('en_US',551,'Lakshadweep'),('en_US',552,'Madhya Pradesh'),('en_US',553,'Maharashtra'),('en_US',554,'Manipur'),('en_US',555,'Meghalaya'),('en_US',556,'Mizoram'),('en_US',557,'Nagaland'),('en_US',558,'Odisha'),('en_US',559,'Puducherry'),('en_US',560,'Punjab'),('en_US',561,'Rajasthan'),('en_US',562,'Sikkim'),('en_US',563,'Tamil Nadu'),('en_US',564,'Telangana'),('en_US',565,'Tripura'),('en_US',566,'Uttar Pradesh'),('en_US',567,'Uttarakhand'),('en_US',568,'West Bengal'),('en_US',569,'Australian Capital Territory'),('en_US',570,'New South Wales'),('en_US',571,'Victoria'),('en_US',572,'Queensland'),('en_US',573,'South Australia'),('en_US',574,'Tasmania'),('en_US',575,'Western Australia'),('en_US',576,'Northern Territory');
/*!40000 ALTER TABLE `mp1_directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_directory_currency_rate`
--

DROP TABLE IF EXISTS `mp1_directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `MP1_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_directory_currency_rate`
--

LOCK TABLES `mp1_directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `mp1_directory_currency_rate` DISABLE KEYS */;
INSERT INTO `mp1_directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `mp1_directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_link`
--

DROP TABLE IF EXISTS `mp1_downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `MP1_DL_LNK_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_link`
--

LOCK TABLES `mp1_downloadable_link` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_link_price`
--

DROP TABLE IF EXISTS `mp1_downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_DL_LNK_PRICE_LNK_ID_MP1_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mp1_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_DL_LNK_PRICE_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_link_price`
--

LOCK TABLES `mp1_downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_link_purchased`
--

DROP TABLE IF EXISTS `mp1_downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MP1_DL_LNK_PURCHASED_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_DL_LNK_PURCHASED_ORDER_ID_MP1_SALES_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_link_purchased`
--

LOCK TABLES `mp1_downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `mp1_downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `MP1_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `FK_8470EF2D3EC0EC2262DEC70CF5059A9E` FOREIGN KEY (`order_item_id`) REFERENCES `mp1_sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F3EB3DFD967F9EFA48DB138C40475B74` FOREIGN KEY (`purchased_id`) REFERENCES `mp1_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_link_purchased_item`
--

LOCK TABLES `mp1_downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_link_title`
--

DROP TABLE IF EXISTS `mp1_downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `MP1_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `MP1_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_DL_LNK_TTL_LNK_ID_MP1_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mp1_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_DOWNLOADABLE_LINK_TITLE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_link_title`
--

LOCK TABLES `mp1_downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_sample`
--

DROP TABLE IF EXISTS `mp1_downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `MP1_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_DL_SAMPLE_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_sample`
--

LOCK TABLES `mp1_downloadable_sample` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_downloadable_sample_title`
--

DROP TABLE IF EXISTS `mp1_downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `MP1_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `MP1_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_DL_SAMPLE_TTL_SAMPLE_ID_MP1_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `mp1_downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_downloadable_sample_title`
--

LOCK TABLES `mp1_downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `mp1_downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute`
--

DROP TABLE IF EXISTS `mp1_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `MP1_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  CONSTRAINT `MP1_EAV_ATTR_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute`
--

LOCK TABLES `mp1_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute` DISABLE KEYS */;
INSERT INTO `mp1_eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change',NULL,'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'static',NULL,NULL,'text','VAT Number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(73,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(74,4,'sku',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(117,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(118,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(119,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(120,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(121,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(122,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(123,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(124,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(125,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(126,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL),(127,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(128,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL),(129,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL),(130,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),(131,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),(132,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),(133,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(134,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),(135,4,'ts_dimensions_length',NULL,NULL,'decimal',NULL,NULL,'text','Length',NULL,NULL,0,0,NULL,0,NULL),(136,4,'ts_dimensions_width',NULL,NULL,'decimal',NULL,NULL,'text','Width',NULL,NULL,0,0,NULL,0,NULL),(137,4,'ts_dimensions_height',NULL,NULL,'decimal',NULL,NULL,'text','Height',NULL,NULL,0,0,NULL,0,NULL),(138,4,'is_featured',NULL,NULL,'int',NULL,NULL,'boolean','Is Featured?',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,1,NULL,0,NULL);
/*!40000 ALTER TABLE `mp1_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_group`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `MP1_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `MP1_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `MP1_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `MP1_EAV_ATTR_GROUP_ATTR_SET_ID_MP1_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `mp1_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_group`
--

LOCK TABLES `mp1_eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_group` DISABLE KEYS */;
INSERT INTO `mp1_eav_attribute_group` VALUES (1,1,'General',1,1,'general',NULL),(2,2,'General',1,1,'general',NULL),(3,3,'General',10,1,'general',NULL),(4,3,'General Information',2,0,'general-information',NULL),(5,3,'Display Settings',20,0,'display-settings',NULL),(6,3,'Custom Design',30,0,'custom-design',NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Images',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,4,'Content',15,0,'content','basic'),(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),(15,5,'General',1,1,'general',NULL),(16,6,'General',1,1,'general',NULL),(17,7,'General',1,1,'general',NULL),(18,8,'General',1,1,'general',NULL),(19,4,'Gift Options',61,0,'gift-options',NULL),(20,4,'Bundle Items',16,0,'bundle-items',NULL);
/*!40000 ALTER TABLE `mp1_eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_label`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `MP1_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `MP1_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `MP1_EAV_ATTRIBUTE_LABEL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ATTR_LBL_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_label`
--

LOCK TABLES `mp1_eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_option`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `MP1_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_EAV_ATTR_OPT_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_option`
--

LOCK TABLES `mp1_eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_option` DISABLE KEYS */;
INSERT INTO `mp1_eav_attribute_option` VALUES (1,20,0),(2,20,1),(3,20,3);
/*!40000 ALTER TABLE `mp1_eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `MP1_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `MP1_EAV_ATTR_OPT_SWATCH_OPT_ID_MP1_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `MP1_EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  CONSTRAINT `MP1_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ATTR_OPT_SWATCH_OPT_ID_MP1_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_option_swatch`
--

LOCK TABLES `mp1_eav_attribute_option_swatch` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_option_swatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_attribute_option_swatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_option_value`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `MP1_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `MP1_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ATTR_OPT_VAL_OPT_ID_MP1_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_option_value`
--

LOCK TABLES `mp1_eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `mp1_eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Not Specified');
/*!40000 ALTER TABLE `mp1_eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_attribute_set`
--

DROP TABLE IF EXISTS `mp1_eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `MP1_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `MP1_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `MP1_EAV_ATTR_SET_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_attribute_set`
--

LOCK TABLES `mp1_eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `mp1_eav_attribute_set` DISABLE KEYS */;
INSERT INTO `mp1_eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `mp1_eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity`
--

DROP TABLE IF EXISTS `mp1_eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MP1_EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_ENTITY_ENTITY_TYPE_ID_MP1_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity`
--

LOCK TABLES `mp1_eav_entity` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_attribute`
--

DROP TABLE IF EXISTS `mp1_eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `MP1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `MP1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_EAV_ENTT_ATTR_ATTR_GROUP_ID_MP1_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `mp1_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_ATTR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_attribute`
--

LOCK TABLES `mp1_eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `mp1_eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,115),(14,1,1,1,14,120),(15,1,1,1,15,82),(16,1,1,1,16,83),(17,1,1,1,17,100),(18,1,1,1,18,0),(19,1,1,1,19,0),(20,1,1,1,20,110),(21,1,1,1,21,28),(22,2,2,2,22,10),(23,2,2,2,23,20),(24,2,2,2,24,30),(25,2,2,2,25,40),(26,2,2,2,26,50),(27,2,2,2,27,60),(28,2,2,2,28,70),(29,2,2,2,29,80),(30,2,2,2,30,90),(31,2,2,2,31,100),(32,2,2,2,32,100),(33,2,2,2,33,110),(34,2,2,2,34,120),(35,2,2,2,35,130),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,1,1,1,41,87),(42,1,1,1,42,100),(43,1,1,1,43,110),(44,1,1,1,44,120),(45,3,3,4,45,1),(46,3,3,4,46,2),(47,3,3,4,47,4),(48,3,3,4,48,5),(49,3,3,4,49,6),(50,3,3,4,50,7),(51,3,3,4,51,8),(52,3,3,5,52,10),(53,3,3,5,53,20),(54,3,3,5,54,30),(55,3,3,4,55,12),(56,3,3,4,56,13),(57,3,3,4,57,14),(58,3,3,4,58,15),(59,3,3,4,59,16),(60,3,3,6,60,10),(61,3,3,6,61,30),(62,3,3,6,62,40),(63,3,3,6,63,50),(64,3,3,6,64,60),(65,3,3,4,65,24),(66,3,3,4,66,25),(67,3,3,5,67,40),(68,3,3,5,68,50),(69,3,3,4,69,10),(70,3,3,6,70,5),(71,3,3,6,71,6),(72,3,3,5,72,51),(73,4,4,7,73,10),(74,4,4,7,74,20),(75,4,4,13,75,90),(76,4,4,13,76,100),(77,4,4,7,77,30),(78,4,4,8,78,3),(79,4,4,8,79,4),(80,4,4,8,80,5),(81,4,4,8,81,6),(82,4,4,7,82,70),(83,4,4,9,84,20),(84,4,4,9,85,30),(85,4,4,9,86,40),(86,4,4,10,87,1),(87,4,4,10,88,2),(88,4,4,10,89,3),(89,4,4,10,90,4),(90,4,4,7,91,6),(91,4,4,8,92,7),(92,4,4,7,94,90),(93,4,4,7,95,100),(94,4,4,10,96,5),(95,4,4,7,97,5),(96,4,4,8,98,8),(97,4,4,7,99,80),(98,4,4,14,100,40),(99,4,4,14,101,20),(100,4,4,14,102,30),(101,4,4,11,103,10),(102,4,4,11,104,5),(103,4,4,7,105,80),(104,4,4,11,106,6),(105,4,4,7,107,14),(106,4,4,7,108,15),(107,4,4,7,109,16),(108,4,4,7,110,17),(109,4,4,7,111,18),(110,4,4,7,112,19),(111,4,4,7,113,20),(112,4,4,7,114,110),(113,4,4,7,115,60),(114,4,4,14,116,50),(115,4,4,8,117,9),(116,4,4,8,118,10),(117,3,3,4,119,3),(118,3,3,4,120,17),(119,4,4,9,121,10),(120,4,4,7,122,11),(121,4,4,7,123,111),(122,4,4,7,124,112),(123,4,4,7,125,113),(124,4,4,7,126,114),(125,4,4,19,127,10),(126,4,4,10,128,3),(127,4,4,7,129,40),(128,4,4,7,130,31),(129,4,4,7,131,21),(130,4,4,7,132,71),(131,4,4,8,133,11),(132,4,4,20,134,1),(133,4,4,7,135,65),(134,4,4,7,136,66),(135,4,4,7,137,67),(136,4,4,7,138,102);
/*!40000 ALTER TABLE `mp1_eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_datetime`
--

DROP TABLE IF EXISTS `mp1_eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `MP1_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MP1_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `MP1_EAV_ENTITY_DATETIME_ENTITY_ID_MP1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_DATETIME_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_DTIME_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_datetime`
--

LOCK TABLES `mp1_eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_decimal`
--

DROP TABLE IF EXISTS `mp1_eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `MP1_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MP1_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `MP1_EAV_ENTITY_DECIMAL_ENTITY_ID_MP1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_DECIMAL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_DEC_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_decimal`
--

LOCK TABLES `mp1_eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_int`
--

DROP TABLE IF EXISTS `mp1_eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `MP1_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MP1_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `MP1_EAV_ENTITY_INT_ENTITY_ID_MP1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_INT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_INT_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_int`
--

LOCK TABLES `mp1_eav_entity_int` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_store`
--

DROP TABLE IF EXISTS `mp1_eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `MP1_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MP1_EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_ENTITY_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_STORE_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_store`
--

LOCK TABLES `mp1_eav_entity_store` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_text`
--

DROP TABLE IF EXISTS `mp1_eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MP1_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MP1_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_ENTITY_TEXT_ENTITY_ID_MP1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_TEXT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_TEXT_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_text`
--

LOCK TABLES `mp1_eav_entity_text` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_type`
--

DROP TABLE IF EXISTS `mp1_eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `MP1_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_type`
--

LOCK TABLES `mp1_eav_entity_type` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_type` DISABLE KEYS */;
INSERT INTO `mp1_eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `mp1_eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_entity_varchar`
--

DROP TABLE IF EXISTS `mp1_eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MP1_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `MP1_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MP1_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `MP1_EAV_ENTITY_VARCHAR_ENTITY_ID_MP1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTITY_VARCHAR_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_ENTT_VCHR_ENTT_TYPE_ID_MP1_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_entity_varchar`
--

LOCK TABLES `mp1_eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mp1_eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_form_element`
--

DROP TABLE IF EXISTS `mp1_eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `MP1_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `MP1_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `MP1_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_EAV_FORM_ELEMENT_ATTRIBUTE_ID_MP1_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_FORM_ELEMENT_TYPE_ID_MP1_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mp1_eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_FORM_ELM_FSET_ID_MP1_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `mp1_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_form_element`
--

LOCK TABLES `mp1_eav_form_element` WRITE;
/*!40000 ALTER TABLE `mp1_eav_form_element` DISABLE KEYS */;
INSERT INTO `mp1_eav_form_element` VALUES (1,1,NULL,23,0),(2,1,NULL,25,1),(3,1,NULL,27,2),(4,1,NULL,9,3),(5,1,NULL,28,4),(6,1,NULL,29,5),(7,1,NULL,31,6),(8,1,NULL,33,7),(9,1,NULL,30,8),(10,1,NULL,34,9),(11,1,NULL,35,10),(12,2,NULL,23,0),(13,2,NULL,25,1),(14,2,NULL,27,2),(15,2,NULL,9,3),(16,2,NULL,28,4),(17,2,NULL,29,5),(18,2,NULL,31,6),(19,2,NULL,33,7),(20,2,NULL,30,8),(21,2,NULL,34,9),(22,2,NULL,35,10),(23,3,NULL,23,0),(24,3,NULL,25,1),(25,3,NULL,27,2),(26,3,NULL,28,3),(27,3,NULL,29,4),(28,3,NULL,31,5),(29,3,NULL,33,6),(30,3,NULL,30,7),(31,3,NULL,34,8),(32,3,NULL,35,9),(33,4,NULL,23,0),(34,4,NULL,25,1),(35,4,NULL,27,2),(36,4,NULL,28,3),(37,4,NULL,29,4),(38,4,NULL,31,5),(39,4,NULL,33,6),(40,4,NULL,30,7),(41,4,NULL,34,8),(42,4,NULL,35,9);
/*!40000 ALTER TABLE `mp1_eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_form_fieldset`
--

DROP TABLE IF EXISTS `mp1_eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `MP1_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `MP1_EAV_FORM_FIELDSET_TYPE_ID_MP1_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mp1_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_form_fieldset`
--

LOCK TABLES `mp1_eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `mp1_eav_form_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `mp1_eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `MP1_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_FORM_FIELDSET_LABEL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_FORM_FSET_LBL_FSET_ID_MP1_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `mp1_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_form_fieldset_label`
--

LOCK TABLES `mp1_eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `mp1_eav_form_fieldset_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_form_type`
--

DROP TABLE IF EXISTS `mp1_eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `MP1_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `MP1_EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EAV_FORM_TYPE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_form_type`
--

LOCK TABLES `mp1_eav_form_type` WRITE;
/*!40000 ALTER TABLE `mp1_eav_form_type` DISABLE KEYS */;
INSERT INTO `mp1_eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `mp1_eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_eav_form_type_entity`
--

DROP TABLE IF EXISTS `mp1_eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `MP1_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_A8FD4C85A5EDD02DCEAF32319D55D4E2` FOREIGN KEY (`entity_type_id`) REFERENCES `mp1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EAV_FORM_TYPE_ENTITY_TYPE_ID_MP1_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mp1_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_eav_form_type_entity`
--

LOCK TABLES `mp1_eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `mp1_eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `mp1_eav_form_type_entity` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `mp1_eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_abandoned_cart`
--

DROP TABLE IF EXISTS `mp1_email_abandoned_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_abandoned_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `quote_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Email',
  `status` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Status',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Quote Active',
  `quote_updated_at` timestamp NULL DEFAULT NULL COMMENT 'Quote updated at',
  `abandoned_cart_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Abandoned Cart number',
  `items_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Quote items count',
  `items_ids` varchar(255) DEFAULT NULL COMMENT 'Quote item ids',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated at',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_ABANDONED_CART_QUOTE_ID` (`quote_id`),
  KEY `MP1_EMAIL_ABANDONED_CART_STORE_ID` (`store_id`),
  KEY `MP1_EMAIL_ABANDONED_CART_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_EMAIL_ABANDONED_CART_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Abandoned Carts Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_abandoned_cart`
--

LOCK TABLES `mp1_email_abandoned_cart` WRITE;
/*!40000 ALTER TABLE `mp1_email_abandoned_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_abandoned_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_automation`
--

DROP TABLE IF EXISTS `mp1_email_automation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_automation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `automation_type` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `enrolment_status` varchar(255) NOT NULL COMMENT 'Entrolment Status',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `type_id` varchar(255) DEFAULT NULL COMMENT 'Type ID',
  `program_id` varchar(255) DEFAULT NULL COMMENT 'Program ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `message` varchar(255) NOT NULL COMMENT 'Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_AUTOMATION_AUTOMATION_TYPE` (`automation_type`),
  KEY `MP1_EMAIL_AUTOMATION_ENROLMENT_STATUS` (`enrolment_status`),
  KEY `MP1_EMAIL_AUTOMATION_TYPE_ID` (`type_id`),
  KEY `MP1_EMAIL_AUTOMATION_EMAIL` (`email`),
  KEY `MP1_EMAIL_AUTOMATION_PROGRAM_ID` (`program_id`),
  KEY `MP1_EMAIL_AUTOMATION_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_AUTOMATION_UPDATED_AT` (`updated_at`),
  KEY `MP1_EMAIL_AUTOMATION_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Automation Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_automation`
--

LOCK TABLES `mp1_email_automation` WRITE;
/*!40000 ALTER TABLE `mp1_email_automation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_automation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_campaign`
--

DROP TABLE IF EXISTS `mp1_email_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_campaign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `campaign_id` int(10) unsigned NOT NULL COMMENT 'Campaign ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Email',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'Send Date',
  `order_increment_id` varchar(50) NOT NULL COMMENT 'Order Increment ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Sales Quote ID',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `checkout_method` varchar(255) NOT NULL DEFAULT '' COMMENT 'Checkout Method Used',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `event_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Name',
  `send_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Send Id',
  `send_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Campaign send status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_CAMPAIGN_STORE_ID` (`store_id`),
  KEY `MP1_EMAIL_CAMPAIGN_CAMPAIGN_ID` (`campaign_id`),
  KEY `MP1_EMAIL_CAMPAIGN_EMAIL` (`email`),
  KEY `MP1_EMAIL_CAMPAIGN_SEND_ID` (`send_id`),
  KEY `MP1_EMAIL_CAMPAIGN_SEND_STATUS` (`send_status`),
  KEY `MP1_EMAIL_CAMPAIGN_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_CAMPAIGN_UPDATED_AT` (`updated_at`),
  KEY `MP1_EMAIL_CAMPAIGN_SENT_AT` (`sent_at`),
  KEY `MP1_EMAIL_CAMPAIGN_EVENT_NAME` (`event_name`),
  KEY `MP1_EMAIL_CAMPAIGN_MESSAGE` (`message`),
  KEY `MP1_EMAIL_CAMPAIGN_QUOTE_ID` (`quote_id`),
  KEY `MP1_EMAIL_CAMPAIGN_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MP1_EMAIL_CAMPAIGN_STORE_ID_CORE/STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Campaigns';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_campaign`
--

LOCK TABLES `mp1_email_campaign` WRITE;
/*!40000 ALTER TABLE `mp1_email_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_catalog`
--

DROP TABLE IF EXISTS `mp1_email_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Imported',
  `modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_CATALOG_PRODUCT_ID` (`product_id`),
  KEY `MP1_EMAIL_CATALOG_IMPORTED` (`imported`),
  KEY `MP1_EMAIL_CATALOG_MODIFIED` (`modified`),
  KEY `MP1_EMAIL_CATALOG_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_CATALOG_UPDATED_AT` (`updated_at`),
  CONSTRAINT `MP1_EMAIL_CATALOG_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Catalog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_catalog`
--

LOCK TABLES `mp1_email_catalog` WRITE;
/*!40000 ALTER TABLE `mp1_email_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_contact`
--

DROP TABLE IF EXISTS `mp1_email_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_contact` (
  `email_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Guest',
  `contact_id` varchar(15) DEFAULT NULL COMMENT 'Connector Contact ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Customer Email',
  `is_subscriber` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Subscriber',
  `subscriber_status` smallint(5) unsigned DEFAULT NULL COMMENT 'Subscriber status',
  `email_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Imported',
  `subscriber_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Subscriber Imported',
  `suppressed` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Suppressed',
  PRIMARY KEY (`email_contact_id`),
  KEY `MP1_EMAIL_CONTACT_EMAIL_CONTACT_ID` (`email_contact_id`),
  KEY `MP1_EMAIL_CONTACT_IS_GUEST` (`is_guest`),
  KEY `MP1_EMAIL_CONTACT_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_EMAIL_CONTACT_WEBSITE_ID` (`website_id`),
  KEY `MP1_EMAIL_CONTACT_IS_SUBSCRIBER` (`is_subscriber`),
  KEY `MP1_EMAIL_CONTACT_SUBSCRIBER_STATUS` (`subscriber_status`),
  KEY `MP1_EMAIL_CONTACT_EMAIL_IMPORTED` (`email_imported`),
  KEY `MP1_EMAIL_CONTACT_SUBSCRIBER_IMPORTED` (`subscriber_imported`),
  KEY `MP1_EMAIL_CONTACT_SUPPRESSED` (`suppressed`),
  KEY `MP1_EMAIL_CONTACT_EMAIL` (`email`),
  KEY `MP1_EMAIL_CONTACT_CONTACT_ID` (`contact_id`),
  CONSTRAINT `MP1_EMAIL_CONTACT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_contact`
--

LOCK TABLES `mp1_email_contact` WRITE;
/*!40000 ALTER TABLE `mp1_email_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_contact_consent`
--

DROP TABLE IF EXISTS `mp1_email_contact_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_contact_consent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `email_contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Email Contact Id',
  `consent_url` varchar(255) DEFAULT NULL COMMENT 'Contact consent url',
  `consent_datetime` datetime DEFAULT NULL COMMENT 'Contact consent datetime',
  `consent_ip` varchar(255) DEFAULT NULL COMMENT 'Contact consent ip',
  `consent_user_agent` varchar(255) DEFAULT NULL COMMENT 'Contact consent user agent',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_CONTACT_CONSENT_EMAIL_CONTACT_ID` (`email_contact_id`),
  CONSTRAINT `FK_1A9A68C230FE148236FB22AC0F062628` FOREIGN KEY (`email_contact_id`) REFERENCES `mp1_email_contact` (`email_contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email contact consent table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_contact_consent`
--

LOCK TABLES `mp1_email_contact_consent` WRITE;
/*!40000 ALTER TABLE `mp1_email_contact_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_contact_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_failed_auth`
--

DROP TABLE IF EXISTS `mp1_email_failed_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_failed_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `failures_num` int(10) unsigned DEFAULT NULL COMMENT 'Number of fails',
  `first_attempt_date` datetime DEFAULT NULL COMMENT 'First attempt date',
  `last_attempt_date` datetime DEFAULT NULL COMMENT 'Last attempt date',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `store_id` int(10) unsigned DEFAULT NULL COMMENT 'Store Id',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_AUTH_EDC_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Failed Auth Table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_failed_auth`
--

LOCK TABLES `mp1_email_failed_auth` WRITE;
/*!40000 ALTER TABLE `mp1_email_failed_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_failed_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_importer`
--

DROP TABLE IF EXISTS `mp1_email_importer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_importer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `import_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Type',
  `website_id` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `import_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Import Status',
  `import_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Id',
  `import_data` mediumblob NOT NULL COMMENT 'Import Data',
  `import_mode` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Mode',
  `import_file` text NOT NULL COMMENT 'Import File',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `import_started` timestamp NULL DEFAULT NULL COMMENT 'Import Started',
  `import_finished` timestamp NULL DEFAULT NULL COMMENT 'Import Finished',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_TYPE` (`import_type`),
  KEY `MP1_EMAIL_IMPORTER_WEBSITE_ID` (`website_id`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_STATUS` (`import_status`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_MODE` (`import_mode`),
  KEY `MP1_EMAIL_IMPORTER_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_IMPORTER_UPDATED_AT` (`updated_at`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_ID` (`import_id`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_STARTED` (`import_started`),
  KEY `MP1_EMAIL_IMPORTER_IMPORT_FINISHED` (`import_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Importer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_importer`
--

LOCK TABLES `mp1_email_importer` WRITE;
/*!40000 ALTER TABLE `mp1_email_importer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_importer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_order`
--

DROP TABLE IF EXISTS `mp1_email_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_order` (
  `email_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `order_status` varchar(255) NOT NULL COMMENT 'Order Status',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Sales Quote ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Order Imported',
  `modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Order Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`email_order_id`),
  KEY `MP1_EMAIL_ORDER_STORE_ID` (`store_id`),
  KEY `MP1_EMAIL_ORDER_QUOTE_ID` (`quote_id`),
  KEY `MP1_EMAIL_ORDER_EMAIL_IMPORTED` (`email_imported`),
  KEY `MP1_EMAIL_ORDER_ORDER_STATUS` (`order_status`),
  KEY `MP1_EMAIL_ORDER_MODIFIED` (`modified`),
  KEY `MP1_EMAIL_ORDER_UPDATED_AT` (`updated_at`),
  KEY `MP1_EMAIL_ORDER_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  CONSTRAINT `MP1_EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EMAIL_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transactional Order Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_order`
--

LOCK TABLES `mp1_email_order` WRITE;
/*!40000 ALTER TABLE `mp1_email_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_review`
--

DROP TABLE IF EXISTS `mp1_email_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `review_id` int(10) unsigned NOT NULL COMMENT 'Review Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `review_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Review Imported',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_REVIEW_REVIEW_ID` (`review_id`),
  KEY `MP1_EMAIL_REVIEW_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_EMAIL_REVIEW_STORE_ID` (`store_id`),
  KEY `MP1_EMAIL_REVIEW_REVIEW_IMPORTED` (`review_imported`),
  KEY `MP1_EMAIL_REVIEW_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_REVIEW_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Reviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_review`
--

LOCK TABLES `mp1_email_review` WRITE;
/*!40000 ALTER TABLE `mp1_email_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_rules`
--

DROP TABLE IF EXISTS `mp1_email_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rule Name',
  `website_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Rule Type',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `combination` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rule Condition',
  `conditions` blob NOT NULL COMMENT 'Rule Conditions',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_rules`
--

LOCK TABLES `mp1_email_rules` WRITE;
/*!40000 ALTER TABLE `mp1_email_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_template`
--

DROP TABLE IF EXISTS `mp1_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `MP1_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `MP1_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `MP1_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_template`
--

LOCK TABLES `mp1_email_template` WRITE;
/*!40000 ALTER TABLE `mp1_email_template` DISABLE KEYS */;
INSERT INTO `mp1_email_template` VALUES (1,'New Pickup Order','<!--@subject {{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n\"var order.getCustomerName()\":\"Customer Name\",\n\"var store.getFrontendName()\":\"Customer Name\",\n\"var is_pickup_order\":\"Check if order is a pickup order\",\n\"var $this.getUrl($store,\'customer/account/\',[_nosid:1]) |raw\":\"Gets the link to the Customer Account\",\n\"var store_email |raw\":\"Defined Email Address for this type of mails\",\n\"var store_phone |raw\":\"Defined Phone Number in the Store Information\",\n\"var store_hours |raw\":\"Defined Opening Hours Phone Number in the Store Information\",\n\"var order.increment_id |raw\":\"Order Id\",\n\"var order.getCreatedAtFormatted(2) |raw\":\"Get the date of order creation\",\n\"var order.getEmailCustomerNote()\":\"Email Order Note\",\n\"var formattedBillingAddress|raw\":\"Billing Address\",\n\"var order.getIsNotVirtual()\":\"Check if shipment exists\",\n\"var pickupAddress|raw\":\"Pickup Location Address\",\n\"var formattedShippingAddress|raw\":\"Customer Shipping Address\",\n\"var payment_html|raw\":\"Payment Details\",\n\"var order.getShippingDescription()\":\"Shipping Description\",\n\"var shipping_msg\":\"Shipping message\",\n\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\"\n} @-->\n\n{{template config_path=\"design/email/header_template\"}}\n\n<table>\n    <tr class=\"email-intro\">\n        <td>\n            <p class=\"greeting\">{{trans \"%customer_name,\" customer_name=$order.getCustomerName()}}</p>\n            <p>\n                {{trans \"Thank you for your order from %store_name.\" store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans \"We will send you a notification once your items are ready for pickup.\"}}\n                {{else}}\n                    {{trans \"Once your package ships we will send you a tracking number.\"}}\n                {{/if}}\n                {{trans \'You can check the status of your order by <a href=\"%account_url\">logging into your account</a>.\' account_url=$this.getUrl($store,\'customer/account/\',[_nosid:1]) |raw}}\n            </p>\n            <p>\n                {{trans \'If you have questions about your order, you can email us at <a href=\"mailto:%store_email\">%store_email</a>\' store_email=$store_email |raw}}{{depend store_phone}} {{trans \' or call us at <a href=\"tel:%store_phone\">%store_phone</a>\' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                {{trans \'Our hours are <span class=\"no-link\">%store_hours</span>.\' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class=\"email-summary\">\n        <td>\n            <h1>{{trans \'Your Order <span class=\"no-link\">#%increment_id</span>\' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans \'Placed on <span class=\"no-link\">%created_at</span>\' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class=\"email-information\">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class=\"message-info\">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class=\"order-details\">\n                <tr>\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Billing Info\"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Shipping Info\"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans \"Pickup Location\"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans \"Recipient Address\"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Payment Method\"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Shipping Method\"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle=\"sales_email_order_items\" order=$order area=\"frontend\"}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path=\"design/email/footer_template\"}}\n',NULL,2,'{{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}}',NULL,NULL,'2019-05-14 01:12:34','2019-05-14 01:12:34','sales_email_order_template','{\"var formattedBillingAddress|raw\":\"Billing Address\",\"var order.getEmailCustomerNote()\":\"Email Order Note\",\"var order.increment_id\":\"Order Id\",\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\",\"var payment_html|raw\":\"Payment Details\",\"var formattedShippingAddress|raw\":\"Shipping Address\",\"var order.getShippingDescription()\":\"Shipping Description\",\"var shipping_msg\":\"Shipping message\"}'),(2,'New Pickup Order For Guest','<!--@subject {{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n\"var order.getBillingAddress().getName()\":\"Guest Customer Name\",\n\"var store.getFrontendName()\":\"Customer Name\",\n\"var is_pickup_order\":\"Check if order is a pickup order\",\n\"var store_email |raw\":\"Defined Email Address for this type of mails\",\n\"var store_phone |raw\":\"Defined Phone Number in the Store Information\",\n\"var store_hours |raw\":\"Defined Opening Hours Phone Number in the Store Information\",\n\"var order.increment_id |raw\":\"Order Id\",\n\"var order.getCreatedAtFormatted(2) |raw\":\"Get the date of order creation\",\n\"var order.getEmailCustomerNote()\":\"Email Order Note\",\n\"var formattedBillingAddress|raw\":\"Billing Address\",\n\"var order.getIsNotVirtual()\":\"Check if shipment exists\",\n\"var pickupAddress|raw\":\"Pickup Location Address\",\n\"var formattedShippingAddress|raw\":\"Customer Shipping Address\",\n\"var payment_html|raw\":\"Payment Details\",\n\"var order.getShippingDescription()\":\"Shipping Description\",\n\"var shipping_msg\":\"Shipping message\",\n\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\"\n} @-->\n\n{{template config_path=\"design/email/header_template\"}}\n\n<table>\n    <tr class=\"email-intro\">\n        <td>\n            <p class=\"greeting\">{{trans \"%name,\" name=$order.getBillingAddress().getName()}}</p>\n            <p>\n                {{trans \"Thank you for your order from %store_name.\" store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans \"We will send you a notification once your items are ready for pickup.\"}}\n                {{else}}\n                    {{trans \"Once your package ships we will send an email with a link to track your order.\"}}\n                {{/if}}\n                {{trans \'If you have questions about your order, you can email us at <a href=\"mailto:%store_email\">%store_email</a>\' store_email=$store_email |raw}}{{depend store_phone}} {{trans \' or call us at <a href=\"tel:%store_phone\">%store_phone</a>\' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                    {{trans \'Our hours are <span class=\"no-link\">%store_hours</span>.\' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class=\"email-summary\">\n        <td>\n            <h1>{{trans \'Your Order <span class=\"no-link\">#%increment_id</span>\' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans \'Placed on <span class=\"no-link\">%created_at</span>\' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class=\"email-information\">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class=\"message-info\">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class=\"order-details\">\n                <tr>\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Billing Info\"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Shipping Info\"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans \"Pickup Location\"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans \"Recipient Address\"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Payment Method\"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Shipping Method\"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle=\"sales_email_order_items\" order=$order}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path=\"design/email/footer_template\"}}\n',NULL,2,'{{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}}',NULL,NULL,'2019-05-14 01:12:34','2019-05-14 01:12:34','sales_email_order_guest_template','{\"var formattedBillingAddress|raw\":\"Billing Address\",\"var order.getEmailCustomerNote()\":\"Email Order Note\",\"var order.getBillingAddress().getName()\":\"Guest Customer Name\",\"var order.getCreatedAtFormatted(2)\":\"Order Created At (datetime)\",\"var order.increment_id\":\"Order Id\",\"layout handle=\\\"sales_email_order_items\\\" order=$order\":\"Order Items Grid\",\"var payment_html|raw\":\"Payment Details\",\"var formattedShippingAddress|raw\":\"Shipping Address\",\"var order.getShippingDescription()\":\"Shipping Description\",\"var shipping_msg\":\"Shipping message\"}');
/*!40000 ALTER TABLE `mp1_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_email_wishlist`
--

DROP TABLE IF EXISTS `mp1_email_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_email_wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `wishlist_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Id',
  `item_count` int(10) unsigned NOT NULL COMMENT 'Item Count',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `wishlist_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Wishlist Imported',
  `wishlist_modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Wishlist Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `MP1_EMAIL_WISHLIST_WISHLIST_ID` (`wishlist_id`),
  KEY `MP1_EMAIL_WISHLIST_ITEM_COUNT` (`item_count`),
  KEY `MP1_EMAIL_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_EMAIL_WISHLIST_WISHLIST_MODIFIED` (`wishlist_modified`),
  KEY `MP1_EMAIL_WISHLIST_WISHLIST_IMPORTED` (`wishlist_imported`),
  KEY `MP1_EMAIL_WISHLIST_CREATED_AT` (`created_at`),
  KEY `MP1_EMAIL_WISHLIST_UPDATED_AT` (`updated_at`),
  KEY `MP1_EMAIL_WISHLIST_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_EMAIL_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_EMAIL_WISHLIST_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `mp1_wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Wishlist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_email_wishlist`
--

LOCK TABLES `mp1_email_wishlist` WRITE;
/*!40000 ALTER TABLE `mp1_email_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_email_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_flag`
--

DROP TABLE IF EXISTS `mp1_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `MP1_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_flag`
--

LOCK TABLES `mp1_flag` WRITE;
/*!40000 ALTER TABLE `mp1_flag` DISABLE KEYS */;
INSERT INTO `mp1_flag` VALUES (1,'analytics_link_attempts_reverse_counter',0,'24','2019-05-14 01:12:34');
/*!40000 ALTER TABLE `mp1_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_gift_message`
--

DROP TABLE IF EXISTS `mp1_gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_gift_message`
--

LOCK TABLES `mp1_gift_message` WRITE;
/*!40000 ALTER TABLE `mp1_gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_googleoptimizer_code`
--

DROP TABLE IF EXISTS `mp1_googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `MP1_GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `MP1_GOOGLEOPTIMIZER_CODE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_googleoptimizer_code`
--

LOCK TABLES `mp1_googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `mp1_googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_import_history`
--

DROP TABLE IF EXISTS `mp1_import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_import_history`
--

LOCK TABLES `mp1_import_history` WRITE;
/*!40000 ALTER TABLE `mp1_import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_import_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_importexport_importdata`
--

DROP TABLE IF EXISTS `mp1_importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_importexport_importdata`
--

LOCK TABLES `mp1_importexport_importdata` WRITE;
/*!40000 ALTER TABLE `mp1_importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_indexer_state`
--

DROP TABLE IF EXISTS `mp1_indexer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `MP1_INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Indexer State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_indexer_state`
--

LOCK TABLES `mp1_indexer_state` WRITE;
/*!40000 ALTER TABLE `mp1_indexer_state` DISABLE KEYS */;
INSERT INTO `mp1_indexer_state` VALUES (1,'design_config_grid','valid','2019-05-14 01:34:34','34ec592bfa6c952bed4d0a1d58c98770'),(2,'customer_grid','valid','2019-05-14 01:29:19','b9632e06cf957d6e8103eb236ca38cc1'),(3,'catalog_category_product','invalid','2019-05-14 01:12:32','2124d5bfcd83b609c67eee94a0e4708c'),(4,'catalog_product_category','invalid','2019-05-14 01:12:32','77b6356629f3259568a68ea64c773238'),(5,'catalogrule_rule','invalid','2019-05-14 01:12:32','c4f8344a2e6a7d8ebc065631454a4724'),(6,'catalog_product_attribute','invalid','2019-05-14 01:12:32','f73cae77ec4dee3b587a60a2f38dd26a'),(7,'inventory','invalid','2019-05-14 01:12:32','ff158179c0d7dcaeb1be1da0011eae73'),(8,'catalogrule_product','invalid','2019-05-14 01:12:32','667205576ee3764b1ee81c4a076d10ae'),(9,'cataloginventory_stock','invalid','2019-05-14 01:12:32','1bf66e64558a5171e523b32f25cb99ca'),(10,'catalog_product_price','invalid','2019-05-14 01:12:32','0e6c8cd322db03524968ab671629718f'),(11,'catalogsearch_fulltext','valid','2019-05-14 01:12:34','fb6356539c73a2ee336bfb7c3d737d10');
/*!40000 ALTER TABLE `mp1_indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_integration`
--

DROP TABLE IF EXISTS `mp1_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `MP1_INTEGRATION_NAME` (`name`),
  UNIQUE KEY `MP1_INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `MP1_INTEGRATION_CONSUMER_ID_MP1_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mp1_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='integration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_integration`
--

LOCK TABLES `mp1_integration` WRITE;
/*!40000 ALTER TABLE `mp1_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_geoname`
--

DROP TABLE IF EXISTS `mp1_inventory_geoname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_geoname` (
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `region` varchar(64) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_geoname`
--

LOCK TABLES `mp1_inventory_geoname` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_geoname` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_geoname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_low_stock_notification_configuration`
--

DROP TABLE IF EXISTS `mp1_inventory_low_stock_notification_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_low_stock_notification_configuration`
--

LOCK TABLES `mp1_inventory_low_stock_notification_configuration` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_low_stock_notification_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_low_stock_notification_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_reservation`
--

DROP TABLE IF EXISTS `mp1_inventory_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_reservation` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `MP1_INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_reservation`
--

LOCK TABLES `mp1_inventory_reservation` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_shipment_source`
--

DROP TABLE IF EXISTS `mp1_inventory_shipment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_shipment_source` (
  `shipment_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_shipment_source`
--

LOCK TABLES `mp1_inventory_shipment_source` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_shipment_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_shipment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_source`
--

DROP TABLE IF EXISTS `mp1_inventory_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_source`
--

LOCK TABLES `mp1_inventory_source` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_source` DISABLE KEYS */;
INSERT INTO `mp1_inventory_source` VALUES ('default','Default Source',1,'Default Source',0.000000,0.000000,'US',NULL,NULL,NULL,NULL,'00000',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `mp1_inventory_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_source_carrier_link`
--

DROP TABLE IF EXISTS `mp1_inventory_source_carrier_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_source_carrier_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `FK_5D3EB12939AF2F8FA58250380BE593FA` (`source_code`),
  CONSTRAINT `FK_5D3EB12939AF2F8FA58250380BE593FA` FOREIGN KEY (`source_code`) REFERENCES `mp1_inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_source_carrier_link`
--

LOCK TABLES `mp1_inventory_source_carrier_link` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_source_carrier_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_source_carrier_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_source_item`
--

DROP TABLE IF EXISTS `mp1_inventory_source_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_source_item` (
  `source_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `MP1_INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`),
  KEY `MP1_INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY` (`sku`,`source_code`,`quantity`),
  CONSTRAINT `MP1_INV_SOURCE_ITEM_SOURCE_CODE_MP1_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `mp1_inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_source_item`
--

LOCK TABLES `mp1_inventory_source_item` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_source_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_inventory_source_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_source_stock_link`
--

DROP TABLE IF EXISTS `mp1_inventory_source_stock_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_source_stock_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `MP1_INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `MP1_INV_SOURCE_STOCK_LNK_SOURCE_CODE_MP1_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `MP1_INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`),
  CONSTRAINT `MP1_INV_SOURCE_STOCK_LNK_SOURCE_CODE_MP1_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `mp1_inventory_source` (`source_code`) ON DELETE CASCADE,
  CONSTRAINT `MP1_INV_SOURCE_STOCK_LNK_STOCK_ID_MP1_INV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `mp1_inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_source_stock_link`
--

LOCK TABLES `mp1_inventory_source_stock_link` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_source_stock_link` DISABLE KEYS */;
INSERT INTO `mp1_inventory_source_stock_link` VALUES (1,1,'default',1);
/*!40000 ALTER TABLE `mp1_inventory_source_stock_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_inventory_stock`
--

DROP TABLE IF EXISTS `mp1_inventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_stock`
--

LOCK TABLES `mp1_inventory_stock` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_stock` DISABLE KEYS */;
INSERT INTO `mp1_inventory_stock` VALUES (1,'Default Stock');
/*!40000 ALTER TABLE `mp1_inventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mp1_inventory_stock_1`
--

DROP TABLE IF EXISTS `mp1_inventory_stock_1`;
/*!50001 DROP VIEW IF EXISTS `mp1_inventory_stock_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mp1_inventory_stock_1` AS SELECT 
 1 AS `product_id`,
 1 AS `website_id`,
 1 AS `stock_id`,
 1 AS `quantity`,
 1 AS `is_salable`,
 1 AS `sku`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mp1_inventory_stock_sales_channel`
--

DROP TABLE IF EXISTS `mp1_inventory_stock_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `MP1_INV_STOCK_SALES_CHANNEL_STOCK_ID_MP1_INV_STOCK_STOCK_ID` (`stock_id`),
  CONSTRAINT `MP1_INV_STOCK_SALES_CHANNEL_STOCK_ID_MP1_INV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `mp1_inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_inventory_stock_sales_channel`
--

LOCK TABLES `mp1_inventory_stock_sales_channel` WRITE;
/*!40000 ALTER TABLE `mp1_inventory_stock_sales_channel` DISABLE KEYS */;
INSERT INTO `mp1_inventory_stock_sales_channel` VALUES ('website','base',1);
/*!40000 ALTER TABLE `mp1_inventory_stock_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_klarna_core_order`
--

DROP TABLE IF EXISTS `mp1_klarna_core_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_klarna_core_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `klarna_order_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Order Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Session Id',
  `reservation_id` varchar(255) DEFAULT NULL COMMENT 'Reservation Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `is_acknowledged` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Acknowledged',
  PRIMARY KEY (`id`),
  KEY `MP1_KLARNA_CORE_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  KEY `MP1_KLARNA_CORE_ORDER_IS_ACKNOWLEDGED` (`is_acknowledged`),
  CONSTRAINT `MP1_KLARNA_CORE_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_klarna_core_order`
--

LOCK TABLES `mp1_klarna_core_order` WRITE;
/*!40000 ALTER TABLE `mp1_klarna_core_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_klarna_core_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_klarna_payments_quote`
--

DROP TABLE IF EXISTS `mp1_klarna_payments_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_klarna_payments_quote` (
  `payments_quote_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payments Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Session Id',
  `client_token` text COMMENT 'Klarna Client Token',
  `authorization_token` varchar(255) DEFAULT NULL COMMENT 'Authorization Token',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote Id',
  `payment_methods` varchar(255) DEFAULT NULL COMMENT 'Payment Method Categories',
  `payment_method_info` text COMMENT 'Payment Method Category Info',
  PRIMARY KEY (`payments_quote_id`),
  KEY `MP1_KLARNA_PAYMENTS_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Payments Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_klarna_payments_quote`
--

LOCK TABLES `mp1_klarna_payments_quote` WRITE;
/*!40000 ALTER TABLE `mp1_klarna_payments_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_klarna_payments_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_layout_link`
--

DROP TABLE IF EXISTS `mp1_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `MP1_LAYOUT_LINK_THEME_ID_MP1_THEME_THEME_ID` (`theme_id`),
  KEY `MP1_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `MP1_LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  CONSTRAINT `MP1_LAYOUT_LINK_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_LAYOUT_LINK_THEME_ID_MP1_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mp1_theme` (`theme_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_LYT_LNK_LYT_UPDATE_ID_MP1_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `mp1_layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_layout_link`
--

LOCK TABLES `mp1_layout_link` WRITE;
/*!40000 ALTER TABLE `mp1_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_layout_update`
--

DROP TABLE IF EXISTS `mp1_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `MP1_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_layout_update`
--

LOCK TABLES `mp1_layout_update` WRITE;
/*!40000 ALTER TABLE `mp1_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_magento_acknowledged_bulk`
--

DROP TABLE IF EXISTS `mp1_magento_acknowledged_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_magento_acknowledged_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`),
  CONSTRAINT `MP1_MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MP1_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `mp1_magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk that was viewed by user from notification area';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_magento_acknowledged_bulk`
--

LOCK TABLES `mp1_magento_acknowledged_bulk` WRITE;
/*!40000 ALTER TABLE `mp1_magento_acknowledged_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_magento_acknowledged_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_magento_bulk`
--

DROP TABLE IF EXISTS `mp1_magento_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_magento_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int(11) DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int(10) unsigned NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_MAGENTO_BULK_UUID` (`uuid`),
  KEY `MP1_MAGENTO_BULK_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk entity that represents set of related asynchronous operations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_magento_bulk`
--

LOCK TABLES `mp1_magento_bulk` WRITE;
/*!40000 ALTER TABLE `mp1_magento_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_magento_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_magento_operation`
--

DROP TABLE IF EXISTS `mp1_magento_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_magento_operation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint(6) DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint(6) DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  PRIMARY KEY (`id`),
  KEY `MP1_MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`),
  CONSTRAINT `MP1_MAGENTO_OPERATION_BULK_UUID_MP1_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `mp1_magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Operation entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_magento_operation`
--

LOCK TABLES `mp1_magento_operation` WRITE;
/*!40000 ALTER TABLE `mp1_magento_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_magento_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_msp_tfa_country_codes`
--

DROP TABLE IF EXISTS `mp1_msp_tfa_country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_msp_tfa_country_codes` (
  `msp_tfa_country_codes_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `code` text NOT NULL COMMENT 'Country code',
  `name` text NOT NULL COMMENT 'Country name',
  `dial_code` text NOT NULL COMMENT 'Prefix',
  PRIMARY KEY (`msp_tfa_country_codes_id`),
  KEY `MP1_MSP_TFA_COUNTRY_CODES_CODE` (`code`(128))
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='mp1_msp_tfa_country_codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_msp_tfa_country_codes`
--

LOCK TABLES `mp1_msp_tfa_country_codes` WRITE;
/*!40000 ALTER TABLE `mp1_msp_tfa_country_codes` DISABLE KEYS */;
INSERT INTO `mp1_msp_tfa_country_codes` VALUES (1,'IL','Israel','+972'),(2,'AF','Afghanistan','+93'),(3,'AL','Albania','+355'),(4,'DZ','Algeria','+213'),(5,'AS','AmericanSamoa','+1 684'),(6,'AD','Andorra','+376'),(7,'AO','Angola','+244'),(8,'AI','Anguilla','+1 264'),(9,'AG','Antigua and Barbuda','+1268'),(10,'AR','Argentina','+54'),(11,'AM','Armenia','+374'),(12,'AW','Aruba','+297'),(13,'AU','Australia','+61'),(14,'AT','Austria','+43'),(15,'AZ','Azerbaijan','+994'),(16,'BS','Bahamas','+1 242'),(17,'BH','Bahrain','+973'),(18,'BD','Bangladesh','+880'),(19,'BB','Barbados','+1 246'),(20,'BY','Belarus','+375'),(21,'BE','Belgium','+32'),(22,'BZ','Belize','+501'),(23,'BJ','Benin','+229'),(24,'BM','Bermuda','+1 441'),(25,'BT','Bhutan','+975'),(26,'BA','Bosnia and Herzegovina','+387'),(27,'BW','Botswana','+267'),(28,'BR','Brazil','+55'),(29,'IO','British Indian Ocean Territory','+246'),(30,'BG','Bulgaria','+359'),(31,'BF','Burkina Faso','+226'),(32,'BI','Burundi','+257'),(33,'KH','Cambodia','+855'),(34,'CM','Cameroon','+237'),(35,'CA','Canada','+1'),(36,'CV','Cape Verde','+238'),(37,'KY','Cayman Islands','+ 345'),(38,'CF','Central African Republic','+236'),(39,'TD','Chad','+235'),(40,'CL','Chile','+56'),(41,'CN','China','+86'),(42,'CX','Christmas Island','+61'),(43,'CO','Colombia','+57'),(44,'KM','Comoros','+269'),(45,'CG','Congo','+242'),(46,'CK','Cook Islands','+682'),(47,'CR','Costa Rica','+506'),(48,'HR','Croatia','+385'),(49,'CU','Cuba','+53'),(50,'CY','Cyprus','+537'),(51,'CZ','Czech Republic','+420'),(52,'DK','Denmark','+45'),(53,'DJ','Djibouti','+253'),(54,'DM','Dominica','+1 767'),(55,'DO','Dominican Republic','+1 849'),(56,'EC','Ecuador','+593'),(57,'EG','Egypt','+20'),(58,'SV','El Salvador','+503'),(59,'GQ','Equatorial Guinea','+240'),(60,'ER','Eritrea','+291'),(61,'EE','Estonia','+372'),(62,'ET','Ethiopia','+251'),(63,'FO','Faroe Islands','+298'),(64,'FJ','Fiji','+679'),(65,'FI','Finland','+358'),(66,'FR','France','+33'),(67,'GF','French Guiana','+594'),(68,'PF','French Polynesia','+689'),(69,'GA','Gabon','+241'),(70,'GM','Gambia','+220'),(71,'GE','Georgia','+995'),(72,'DE','Germany','+49'),(73,'GH','Ghana','+233'),(74,'GI','Gibraltar','+350'),(75,'GR','Greece','+30'),(76,'GL','Greenland','+299'),(77,'GD','Grenada','+1 473'),(78,'GP','Guadeloupe','+590'),(79,'GU','Guam','+1 671'),(80,'GT','Guatemala','+502'),(81,'GN','Guinea','+224'),(82,'GW','Guinea-Bissau','+245'),(83,'GY','Guyana','+595'),(84,'HT','Haiti','+509'),(85,'HN','Honduras','+504'),(86,'HU','Hungary','+36'),(87,'IS','Iceland','+354'),(88,'IN','India','+91'),(89,'ID','Indonesia','+62'),(90,'IQ','Iraq','+964'),(91,'IE','Ireland','+353'),(92,'IL','Israel','+972'),(93,'IT','Italy','+39'),(94,'JM','Jamaica','+1 876'),(95,'JP','Japan','+81'),(96,'JO','Jordan','+962'),(97,'KZ','Kazakhstan','+7 7'),(98,'KE','Kenya','+254'),(99,'KI','Kiribati','+686'),(100,'KW','Kuwait','+965'),(101,'KG','Kyrgyzstan','+996'),(102,'LV','Latvia','+371'),(103,'LB','Lebanon','+961'),(104,'LS','Lesotho','+266'),(105,'LR','Liberia','+231'),(106,'LI','Liechtenstein','+423'),(107,'LT','Lithuania','+370'),(108,'LU','Luxembourg','+352'),(109,'MG','Madagascar','+261'),(110,'MW','Malawi','+265'),(111,'MY','Malaysia','+60'),(112,'MV','Maldives','+960'),(113,'ML','Mali','+223'),(114,'MT','Malta','+356'),(115,'MH','Marshall Islands','+692'),(116,'MQ','Martinique','+596'),(117,'MR','Mauritania','+222'),(118,'MU','Mauritius','+230'),(119,'YT','Mayotte','+262'),(120,'MX','Mexico','+52'),(121,'MC','Monaco','+377'),(122,'MN','Mongolia','+976'),(123,'ME','Montenegro','+382'),(124,'MS','Montserrat','+1664'),(125,'MA','Morocco','+212'),(126,'MM','Myanmar','+95'),(127,'NA','Namibia','+264'),(128,'NR','Nauru','+674'),(129,'NP','Nepal','+977'),(130,'NL','Netherlands','+31'),(131,'AN','Netherlands Antilles','+599'),(132,'NC','New Caledonia','+687'),(133,'NZ','New Zealand','+64'),(134,'NI','Nicaragua','+505'),(135,'NE','Niger','+227'),(136,'NG','Nigeria','+234'),(137,'NU','Niue','+683'),(138,'NF','Norfolk Island','+672'),(139,'MP','Northern Mariana Islands','+1 670'),(140,'NO','Norway','+47'),(141,'OM','Oman','+968'),(142,'PK','Pakistan','+92'),(143,'PW','Palau','+680'),(144,'PA','Panama','+507'),(145,'PG','Papua New Guinea','+675'),(146,'PY','Paraguay','+595'),(147,'PE','Peru','+51'),(148,'PH','Philippines','+63'),(149,'PL','Poland','+48'),(150,'PT','Portugal','+351'),(151,'PR','Puerto Rico','+1 939'),(152,'QA','Qatar','+974'),(153,'RO','Romania','+40'),(154,'RW','Rwanda','+250'),(155,'WS','Samoa','+685'),(156,'SM','San Marino','+378'),(157,'SA','Saudi Arabia','+966'),(158,'SN','Senegal','+221'),(159,'RS','Serbia','+381'),(160,'SC','Seychelles','+248'),(161,'SL','Sierra Leone','+232'),(162,'SG','Singapore','+65'),(163,'SK','Slovakia','+421'),(164,'SI','Slovenia','+386'),(165,'SB','Solomon Islands','+677'),(166,'ZA','South Africa','+27'),(167,'GS','South Georgia and the South Sandwich Islands','+500'),(168,'ES','Spain','+34'),(169,'LK','Sri Lanka','+94'),(170,'SD','Sudan','+249'),(171,'SR','Suriname','+597'),(172,'SZ','Swaziland','+268'),(173,'SE','Sweden','+46'),(174,'CH','Switzerland','+41'),(175,'TJ','Tajikistan','+992'),(176,'TH','Thailand','+66'),(177,'TG','Togo','+228'),(178,'TK','Tokelau','+690'),(179,'TO','Tonga','+676'),(180,'TT','Trinidad and Tobago','+1 868'),(181,'TN','Tunisia','+216'),(182,'TR','Turkey','+90'),(183,'TM','Turkmenistan','+993'),(184,'TC','Turks and Caicos Islands','+1 649'),(185,'TV','Tuvalu','+688'),(186,'UG','Uganda','+256'),(187,'UA','Ukraine','+380'),(188,'AE','United Arab Emirates','+971'),(189,'GB','United Kingdom','+44'),(190,'US','United States','+1'),(191,'UY','Uruguay','+598'),(192,'UZ','Uzbekistan','+998'),(193,'VU','Vanuatu','+678'),(194,'WF','Wallis and Futuna','+681'),(195,'YE','Yemen','+967'),(196,'ZM','Zambia','+260'),(197,'ZW','Zimbabwe','+263'),(198,'AX','land Islands',''),(199,'BO','Bolivia, Plurinational State of','+591'),(200,'BN','Brunei Darussalam','+673'),(201,'CC','Cocos (Keeling) Islands','+61'),(202,'CD','Congo, The Democratic Republic of the','+243'),(203,'CI','Cote d\'Ivoire','+225'),(204,'FK','Falkland Islands (Malvinas)','+500'),(205,'GG','Guernsey','+44'),(206,'VA','Holy See (Vatican City State)','+379'),(207,'HK','Hong Kong','+852'),(208,'IR','Iran, Islamic Republic of','+98'),(209,'IM','Isle of Man','+44'),(210,'JE','Jersey','+44'),(211,'KP','Korea, Democratic People\'s Republic of','+850'),(212,'KR','Korea, Republic of','+82'),(213,'LA','Lao People\'s Democratic Republic','+856'),(214,'LY','Libyan Arab Jamahiriya','+218'),(215,'MO','Macao','+853'),(216,'MK','Macedonia, The Former Yugoslav Republic of','+389'),(217,'FM','Micronesia, Federated States of','+691'),(218,'MD','Moldova, Republic of','+373'),(219,'MZ','Mozambique','+258'),(220,'PS','Palestinian Territory, Occupied','+970'),(221,'PN','Pitcairn','+872'),(222,'RE','Réunion','+262'),(223,'RU','Russia','+7'),(224,'BL','Saint Barthélemy','+590'),(225,'SH','Saint Helena, Ascension and Tristan Da Cunha','+290'),(226,'KN','Saint Kitts and Nevis','+1 869'),(227,'LC','Saint Lucia','+1 758'),(228,'MF','Saint Martin','+590'),(229,'PM','Saint Pierre and Miquelon','+508'),(230,'VC','Saint Vincent and the Grenadines','+1 784'),(231,'ST','Sao Tome and Principe','+239'),(232,'SO','Somalia','+252'),(233,'SJ','Svalbard and Jan Mayen','+47'),(234,'SY','Syrian Arab Republic','+963'),(235,'TW','Taiwan, Province of China','+886'),(236,'TZ','Tanzania, United Republic of','+255'),(237,'TL','Timor-Leste','+670'),(238,'VE','Venezuela, Bolivarian Republic of','+58'),(239,'VN','Viet Nam','+84'),(240,'VG','Virgin Islands, British','+1 284'),(241,'VI','Virgin Islands, U.S.','+1 340');
/*!40000 ALTER TABLE `mp1_msp_tfa_country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_msp_tfa_trusted`
--

DROP TABLE IF EXISTS `mp1_msp_tfa_trusted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_msp_tfa_trusted` (
  `msp_tfa_trusted_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Trusted device ID',
  `date_time` datetime NOT NULL COMMENT 'Date and time',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `device_name` text NOT NULL COMMENT 'Device name',
  `token` text NOT NULL COMMENT 'Token',
  `last_ip` text NOT NULL COMMENT 'Last IP',
  PRIMARY KEY (`msp_tfa_trusted_id`),
  KEY `MP1_MSP_TFA_TRUSTED_USER_ID_MP1_ADMIN_USER_USER_ID` (`user_id`),
  CONSTRAINT `MP1_MSP_TFA_TRUSTED_USER_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_msp_tfa_trusted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_msp_tfa_trusted`
--

LOCK TABLES `mp1_msp_tfa_trusted` WRITE;
/*!40000 ALTER TABLE `mp1_msp_tfa_trusted` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_msp_tfa_trusted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_msp_tfa_user_config`
--

DROP TABLE IF EXISTS `mp1_msp_tfa_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_msp_tfa_user_config` (
  `msp_tfa_user_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `encoded_providers` text COMMENT 'Encoded providers list',
  `encoded_config` text COMMENT 'Encoded providers configuration',
  `default_provider` text COMMENT 'Default provider',
  PRIMARY KEY (`msp_tfa_user_config_id`),
  KEY `MP1_MSP_TFA_USER_CONFIG_USER_ID_MP1_ADMIN_USER_USER_ID` (`user_id`),
  CONSTRAINT `MP1_MSP_TFA_USER_CONFIG_USER_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_msp_tfa_user_config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_msp_tfa_user_config`
--

LOCK TABLES `mp1_msp_tfa_user_config` WRITE;
/*!40000 ALTER TABLE `mp1_msp_tfa_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_msp_tfa_user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_mview_state`
--

DROP TABLE IF EXISTS `mp1_mview_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MP1_MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MP1_MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_mview_state`
--

LOCK TABLES `mp1_mview_state` WRITE;
/*!40000 ALTER TABLE `mp1_mview_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_mview_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_problem`
--

DROP TABLE IF EXISTS `mp1_newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `MP1_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `MP1_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `FK_2E949B68A56CB93CB89222E566A0AA02` FOREIGN KEY (`subscriber_id`) REFERENCES `mp1_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_NEWSLETTER_PROBLEM_QUEUE_ID_MP1_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mp1_newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_problem`
--

LOCK TABLES `mp1_newsletter_problem` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_queue`
--

DROP TABLE IF EXISTS `mp1_newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `MP1_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `MP1_NLTTR_QUEUE_TEMPLATE_ID_MP1_NLTTR_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `mp1_newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_queue`
--

LOCK TABLES `mp1_newsletter_queue` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_queue_link`
--

DROP TABLE IF EXISTS `mp1_newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `MP1_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `MP1_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_B0A3F29C149FFDA7E2DD8B8BAB9BA308` FOREIGN KEY (`subscriber_id`) REFERENCES `mp1_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_NEWSLETTER_QUEUE_LINK_QUEUE_ID_MP1_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mp1_newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_queue_link`
--

LOCK TABLES `mp1_newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `mp1_newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `MP1_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_MP1_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mp1_newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_queue_store_link`
--

LOCK TABLES `mp1_newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_subscriber`
--

DROP TABLE IF EXISTS `mp1_newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `MP1_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `MP1_NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`),
  CONSTRAINT `MP1_NEWSLETTER_SUBSCRIBER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_subscriber`
--

LOCK TABLES `mp1_newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_newsletter_template`
--

DROP TABLE IF EXISTS `mp1_newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `MP1_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `MP1_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `MP1_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_newsletter_template`
--

LOCK TABLES `mp1_newsletter_template` WRITE;
/*!40000 ALTER TABLE `mp1_newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_oauth_consumer`
--

DROP TABLE IF EXISTS `mp1_oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `MP1_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `MP1_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `MP1_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_oauth_consumer`
--

LOCK TABLES `mp1_oauth_consumer` WRITE;
/*!40000 ALTER TABLE `mp1_oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_oauth_nonce`
--

DROP TABLE IF EXISTS `mp1_oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `MP1_OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `MP1_OAUTH_NONCE_CONSUMER_ID_MP1_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `MP1_OAUTH_NONCE_TIMESTAMP` (`timestamp`),
  CONSTRAINT `MP1_OAUTH_NONCE_CONSUMER_ID_MP1_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mp1_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_oauth_nonce`
--

LOCK TABLES `mp1_oauth_nonce` WRITE;
/*!40000 ALTER TABLE `mp1_oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_oauth_token`
--

DROP TABLE IF EXISTS `mp1_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `MP1_OAUTH_TOKEN_ADMIN_ID_MP1_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `MP1_OAUTH_TOKEN_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `MP1_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `MP1_OAUTH_TOKEN_ADMIN_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_OAUTH_TOKEN_CONSUMER_ID_MP1_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mp1_oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_OAUTH_TOKEN_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_oauth_token`
--

LOCK TABLES `mp1_oauth_token` WRITE;
/*!40000 ALTER TABLE `mp1_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_oauth_token_request_log`
--

DROP TABLE IF EXISTS `mp1_oauth_token_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `MP1_OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_oauth_token_request_log`
--

LOCK TABLES `mp1_oauth_token_request_log` WRITE;
/*!40000 ALTER TABLE `mp1_oauth_token_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_oauth_token_request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_password_reset_request_event`
--

DROP TABLE IF EXISTS `mp1_password_reset_request_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `MP1_PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `MP1_PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_password_reset_request_event`
--

LOCK TABLES `mp1_password_reset_request_event` WRITE;
/*!40000 ALTER TABLE `mp1_password_reset_request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_password_reset_request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_patch_list`
--

DROP TABLE IF EXISTS `mp1_patch_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_patch_list` (
  `patch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='List of data/schema patches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_patch_list`
--

LOCK TABLES `mp1_patch_list` WRITE;
/*!40000 ALTER TABLE `mp1_patch_list` DISABLE KEYS */;
INSERT INTO `mp1_patch_list` VALUES (1,'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),(2,'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),(3,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),(4,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),(5,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),(6,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),(7,'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),(8,'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),(9,'Magento\\Wishlist\\Setup\\Patch\\Schema\\AddProductIdConstraint'),(10,'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),(11,'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),(12,'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),(13,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),(14,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),(15,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAustralia'),(16,'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),(17,'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),(18,'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),(19,'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),(20,'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),(21,'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),(22,'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),(23,'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),(24,'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),(25,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),(26,'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),(27,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),(28,'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),(29,'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),(30,'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),(31,'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),(32,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),(33,'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),(34,'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),(35,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),(36,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),(37,'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),(38,'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),(39,'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),(40,'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),(41,'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(42,'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),(43,'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),(44,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),(45,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),(46,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),(47,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),(48,'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(49,'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),(50,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),(51,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),(52,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),(53,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),(54,'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),(55,'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(56,'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),(57,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),(58,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),(59,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(60,'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),(61,'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(62,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchDeprecationNotification'),(63,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),(64,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),(65,'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),(66,'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),(67,'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),(68,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),(69,'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(70,'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),(71,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),(72,'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),(73,'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),(74,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),(75,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),(76,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),(77,'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),(78,'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),(79,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdatePaypalCreditOption'),(80,'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),(81,'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),(82,'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),(83,'Magento\\Downloadable\\Setup\\Patch\\Data\\UpdateLinksExistDefaultAttributeValue'),(84,'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),(85,'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),(86,'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),(87,'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),(88,'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),(89,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),(90,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),(91,'Magento\\AuthorizenetAcceptjs\\Setup\\Patch\\Data\\CopyCurrentConfig'),(92,'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),(93,'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),(94,'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(95,'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),(96,'Magento\\Braintree\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(97,'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),(98,'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),(99,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),(100,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateShippingTablerate'),(101,'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(102,'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),(103,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),(104,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),(105,'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),(106,'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),(107,'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),(108,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),(109,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),(110,'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),(111,'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),(112,'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),(113,'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTypes'),(114,'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes');
/*!40000 ALTER TABLE `mp1_patch_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_billing_agreement`
--

DROP TABLE IF EXISTS `mp1_paypal_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `MP1_PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_PAYPAL_BILLING_AGREEMENT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_PAYPAL_BILLING_AGRT_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_billing_agreement`
--

LOCK TABLES `mp1_paypal_billing_agreement` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `mp1_paypal_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `MP1_PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `FK_8631D0EBB28A8BF25F00372944DA37B0` FOREIGN KEY (`agreement_id`) REFERENCES `mp1_paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PAYPAL_BILLING_AGRT_ORDER_ORDER_ID_MP1_SALES_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_billing_agreement_order`
--

LOCK TABLES `mp1_paypal_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_cert`
--

DROP TABLE IF EXISTS `mp1_paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `MP1_PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_PAYPAL_CERT_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_cert`
--

LOCK TABLES `mp1_paypal_cert` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_payment_transaction`
--

DROP TABLE IF EXISTS `mp1_paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `MP1_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_payment_transaction`
--

LOCK TABLES `mp1_paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_settlement_report`
--

DROP TABLE IF EXISTS `mp1_paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `MP1_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_settlement_report`
--

LOCK TABLES `mp1_paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `mp1_paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `MP1_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_12780E6D0F34F1898016752E74FB3F15` FOREIGN KEY (`report_id`) REFERENCES `mp1_paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_paypal_settlement_report_row`
--

LOCK TABLES `mp1_paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `mp1_paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_persistent_session`
--

DROP TABLE IF EXISTS `mp1_persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `MP1_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `MP1_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_PERSISTENT_SESSION_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `MP1_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  CONSTRAINT `MP1_PERSISTENT_SESSION_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PERSISTENT_SESSION_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_persistent_session`
--

LOCK TABLES `mp1_persistent_session` WRITE;
/*!40000 ALTER TABLE `mp1_persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_product_alert_price`
--

DROP TABLE IF EXISTS `mp1_product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `MP1_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `MP1_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `MP1_PRODUCT_ALERT_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_PRD_ALERT_PRICE_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRD_ALERT_PRICE_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRODUCT_ALERT_PRICE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRODUCT_ALERT_PRICE_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_product_alert_price`
--

LOCK TABLES `mp1_product_alert_price` WRITE;
/*!40000 ALTER TABLE `mp1_product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_product_alert_stock`
--

DROP TABLE IF EXISTS `mp1_product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `MP1_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `MP1_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  KEY `MP1_PRODUCT_ALERT_STOCK_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_PRD_ALERT_STOCK_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRD_ALERT_STOCK_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRODUCT_ALERT_STOCK_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_PRODUCT_ALERT_STOCK_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_product_alert_stock`
--

LOCK TABLES `mp1_product_alert_stock` WRITE;
/*!40000 ALTER TABLE `mp1_product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_queue`
--

DROP TABLE IF EXISTS `mp1_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_QUEUE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table storing unique queues';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_queue`
--

LOCK TABLES `mp1_queue` WRITE;
/*!40000 ALTER TABLE `mp1_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_queue_lock`
--

DROP TABLE IF EXISTS `mp1_queue_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_queue_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages that were processed are inserted here to be locked.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_queue_lock`
--

LOCK TABLES `mp1_queue_lock` WRITE;
/*!40000 ALTER TABLE `mp1_queue_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_queue_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_queue_message`
--

DROP TABLE IF EXISTS `mp1_queue_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_queue_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_queue_message`
--

LOCK TABLES `mp1_queue_message` WRITE;
/*!40000 ALTER TABLE `mp1_queue_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_queue_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_queue_message_status`
--

DROP TABLE IF EXISTS `mp1_queue_message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_queue_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int(10) unsigned NOT NULL COMMENT 'Queue ID',
  `message_id` bigint(20) unsigned NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `MP1_QUEUE_MESSAGE_STATUS_MESSAGE_ID_MP1_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `MP1_QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`),
  CONSTRAINT `MP1_QUEUE_MESSAGE_STATUS_MESSAGE_ID_MP1_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `mp1_queue_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_QUEUE_MESSAGE_STATUS_QUEUE_ID_MP1_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mp1_queue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation table to keep associations between queues and messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_queue_message_status`
--

LOCK TABLES `mp1_queue_message_status` WRITE;
/*!40000 ALTER TABLE `mp1_queue_message_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_queue_message_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote`
--

DROP TABLE IF EXISTS `mp1_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `MP1_QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_QUOTE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote`
--

LOCK TABLES `mp1_quote` WRITE;
/*!40000 ALTER TABLE `mp1_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_address`
--

DROP TABLE IF EXISTS `mp1_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  PRIMARY KEY (`address_id`),
  KEY `MP1_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `MP1_QUOTE_ADDRESS_QUOTE_ID_MP1_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mp1_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_address`
--

LOCK TABLES `mp1_quote_address` WRITE;
/*!40000 ALTER TABLE `mp1_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_address_item`
--

DROP TABLE IF EXISTS `mp1_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `MP1_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `MP1_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `MP1_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  KEY `MP1_QUOTE_ADDRESS_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_53EBFAA8947569681CF7705F910BA25C` FOREIGN KEY (`parent_item_id`) REFERENCES `mp1_quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_MP1_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `mp1_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_QUOTE_ADDR_ITEM_QUOTE_ADDR_ID_MP1_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `mp1_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_address_item`
--

LOCK TABLES `mp1_quote_address_item` WRITE;
/*!40000 ALTER TABLE `mp1_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_id_mask`
--

DROP TABLE IF EXISTS `mp1_quote_id_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `MP1_QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `MP1_QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `MP1_QUOTE_ID_MASK_QUOTE_ID_MP1_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mp1_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_id_mask`
--

LOCK TABLES `mp1_quote_id_mask` WRITE;
/*!40000 ALTER TABLE `mp1_quote_id_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_id_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_item`
--

DROP TABLE IF EXISTS `mp1_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `MP1_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `MP1_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MP1_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `MP1_QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_QUOTE_ITEM_PARENT_ITEM_ID_MP1_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `mp1_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_QUOTE_ITEM_QUOTE_ID_MP1_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mp1_quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_QUOTE_ITEM_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_item`
--

LOCK TABLES `mp1_quote_item` WRITE;
/*!40000 ALTER TABLE `mp1_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_item_option`
--

DROP TABLE IF EXISTS `mp1_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `MP1_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `MP1_QUOTE_ITEM_OPTION_ITEM_ID_MP1_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `mp1_quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_item_option`
--

LOCK TABLES `mp1_quote_item_option` WRITE;
/*!40000 ALTER TABLE `mp1_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_payment`
--

DROP TABLE IF EXISTS `mp1_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `MP1_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `MP1_QUOTE_PAYMENT_QUOTE_ID_MP1_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mp1_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_payment`
--

LOCK TABLES `mp1_quote_payment` WRITE;
/*!40000 ALTER TABLE `mp1_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_quote_shipping_rate`
--

DROP TABLE IF EXISTS `mp1_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `MP1_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `MP1_QUOTE_SHIPPING_RATE_ADDRESS_ID_MP1_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `mp1_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_quote_shipping_rate`
--

LOCK TABLES `mp1_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `mp1_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating`
--

DROP TABLE IF EXISTS `mp1_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating ID',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `MP1_RATING_RATING_CODE` (`rating_code`),
  KEY `MP1_RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `MP1_RATING_ENTITY_ID_MP1_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating`
--

LOCK TABLES `mp1_rating` WRITE;
/*!40000 ALTER TABLE `mp1_rating` DISABLE KEYS */;
INSERT INTO `mp1_rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `mp1_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_entity`
--

DROP TABLE IF EXISTS `mp1_rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_entity`
--

LOCK TABLES `mp1_rating_entity` WRITE;
/*!40000 ALTER TABLE `mp1_rating_entity` DISABLE KEYS */;
INSERT INTO `mp1_rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `mp1_rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_option`
--

DROP TABLE IF EXISTS `mp1_rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `MP1_RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `MP1_RATING_OPTION_RATING_ID_MP1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mp1_rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_option`
--

LOCK TABLES `mp1_rating_option` WRITE;
/*!40000 ALTER TABLE `mp1_rating_option` DISABLE KEYS */;
INSERT INTO `mp1_rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `mp1_rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_option_vote`
--

DROP TABLE IF EXISTS `mp1_rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `MP1_RATING_OPTION_VOTE_REVIEW_ID_MP1_REVIEW_REVIEW_ID` (`review_id`),
  KEY `MP1_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  CONSTRAINT `MP1_RATING_OPTION_VOTE_OPTION_ID_MP1_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `mp1_rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_RATING_OPTION_VOTE_REVIEW_ID_MP1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mp1_review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_option_vote`
--

LOCK TABLES `mp1_rating_option_vote` WRITE;
/*!40000 ALTER TABLE `mp1_rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `mp1_rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `MP1_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `MP1_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_MP1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mp1_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_option_vote_aggregated`
--

LOCK TABLES `mp1_rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `mp1_rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_store`
--

DROP TABLE IF EXISTS `mp1_rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `MP1_RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_RATING_STORE_RATING_ID_MP1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mp1_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_RATING_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_store`
--

LOCK TABLES `mp1_rating_store` WRITE;
/*!40000 ALTER TABLE `mp1_rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_rating_title`
--

DROP TABLE IF EXISTS `mp1_rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `MP1_RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_RATING_TITLE_RATING_ID_MP1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mp1_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_RATING_TITLE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_rating_title`
--

LOCK TABLES `mp1_rating_title` WRITE;
/*!40000 ALTER TABLE `mp1_rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_release_notification_viewer_log`
--

DROP TABLE IF EXISTS `mp1_release_notification_viewer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_release_notification_viewer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int(10) unsigned NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`),
  CONSTRAINT `MP1_RELEASE_NTFC_VIEWER_LOG_VIEWER_ID_MP1_ADM_USR_USR_ID` FOREIGN KEY (`viewer_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Release Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_release_notification_viewer_log`
--

LOCK TABLES `mp1_release_notification_viewer_log` WRITE;
/*!40000 ALTER TABLE `mp1_release_notification_viewer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_release_notification_viewer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_compared_product_index`
--

DROP TABLE IF EXISTS `mp1_report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MP1_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `MP1_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MP1_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `MP1_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `MP1_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_REPORT_CMPD_PRD_IDX_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_CMPD_PRD_IDX_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_compared_product_index`
--

LOCK TABLES `mp1_report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `mp1_report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_event`
--

DROP TABLE IF EXISTS `mp1_report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `MP1_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `MP1_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `MP1_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `MP1_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `MP1_REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_4BAF7D82D5D83970382695DA15C3A9C5` FOREIGN KEY (`event_type_id`) REFERENCES `mp1_report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_EVENT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_event`
--

LOCK TABLES `mp1_report_event` WRITE;
/*!40000 ALTER TABLE `mp1_report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_event_types`
--

DROP TABLE IF EXISTS `mp1_report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_event_types`
--

LOCK TABLES `mp1_report_event_types` WRITE;
/*!40000 ALTER TABLE `mp1_report_event_types` DISABLE KEYS */;
INSERT INTO `mp1_report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `mp1_report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `mp1_report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_C5A0ED173FADCCC3A6E050FAA25EBA14` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_viewed_product_aggregated_daily`
--

LOCK TABLES `mp1_report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `mp1_report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_4F3C3F6D925A69662A4F4DD5BFC63E91` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_viewed_product_aggregated_monthly`
--

LOCK TABLES `mp1_report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `mp1_report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_FF1FA1084D9FF6408C20796025E375B6` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_viewed_product_aggregated_yearly`
--

LOCK TABLES `mp1_report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_report_viewed_product_index`
--

DROP TABLE IF EXISTS `mp1_report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MP1_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `MP1_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `MP1_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_REPORT_VIEWED_PRD_IDX_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_VIEWED_PRD_IDX_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_report_viewed_product_index`
--

LOCK TABLES `mp1_report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `mp1_report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_reporting_counts`
--

DROP TABLE IF EXISTS `mp1_reporting_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_reporting_counts`
--

LOCK TABLES `mp1_reporting_counts` WRITE;
/*!40000 ALTER TABLE `mp1_reporting_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_reporting_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_reporting_module_status`
--

DROP TABLE IF EXISTS `mp1_reporting_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_reporting_module_status`
--

LOCK TABLES `mp1_reporting_module_status` WRITE;
/*!40000 ALTER TABLE `mp1_reporting_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_reporting_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_reporting_orders`
--

DROP TABLE IF EXISTS `mp1_reporting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `total` decimal(20,4) unsigned DEFAULT NULL,
  `total_base` decimal(20,4) unsigned DEFAULT NULL,
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_reporting_orders`
--

LOCK TABLES `mp1_reporting_orders` WRITE;
/*!40000 ALTER TABLE `mp1_reporting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_reporting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_reporting_system_updates`
--

DROP TABLE IF EXISTS `mp1_reporting_system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_reporting_system_updates`
--

LOCK TABLES `mp1_reporting_system_updates` WRITE;
/*!40000 ALTER TABLE `mp1_reporting_system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_reporting_system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_reporting_users`
--

DROP TABLE IF EXISTS `mp1_reporting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_reporting_users`
--

LOCK TABLES `mp1_reporting_users` WRITE;
/*!40000 ALTER TABLE `mp1_reporting_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_reporting_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review`
--

DROP TABLE IF EXISTS `mp1_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `MP1_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `MP1_REVIEW_STATUS_ID` (`status_id`),
  KEY `MP1_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `MP1_REVIEW_ENTITY_ID_MP1_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REVIEW_STATUS_ID_MP1_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `mp1_review_status` (`status_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review`
--

LOCK TABLES `mp1_review` WRITE;
/*!40000 ALTER TABLE `mp1_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review_detail`
--

DROP TABLE IF EXISTS `mp1_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `MP1_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `MP1_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `MP1_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `MP1_REVIEW_DETAIL_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_REVIEW_DETAIL_REVIEW_ID_MP1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mp1_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REVIEW_DETAIL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review_detail`
--

LOCK TABLES `mp1_review_detail` WRITE;
/*!40000 ALTER TABLE `mp1_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review_entity`
--

DROP TABLE IF EXISTS `mp1_review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review_entity`
--

LOCK TABLES `mp1_review_entity` WRITE;
/*!40000 ALTER TABLE `mp1_review_entity` DISABLE KEYS */;
INSERT INTO `mp1_review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `mp1_review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review_entity_summary`
--

DROP TABLE IF EXISTS `mp1_review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  KEY `MP1_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_REVIEW_ENTITY_SUMMARY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review_entity_summary`
--

LOCK TABLES `mp1_review_entity_summary` WRITE;
/*!40000 ALTER TABLE `mp1_review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review_status`
--

DROP TABLE IF EXISTS `mp1_review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review_status`
--

LOCK TABLES `mp1_review_status` WRITE;
/*!40000 ALTER TABLE `mp1_review_status` DISABLE KEYS */;
INSERT INTO `mp1_review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `mp1_review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_review_store`
--

DROP TABLE IF EXISTS `mp1_review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `MP1_REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_REVIEW_STORE_REVIEW_ID_MP1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mp1_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_REVIEW_STORE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_review_store`
--

LOCK TABLES `mp1_review_store` WRITE;
/*!40000 ALTER TABLE `mp1_review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `mp1_sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_SALES_BESTSELLERS_AGGRED_DAILY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_bestsellers_aggregated_daily`
--

LOCK TABLES `mp1_sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `mp1_sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `mp1_sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `mp1_sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `MP1_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `MP1_SALES_BESTSELLERS_AGGRED_YEARLY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `mp1_sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_creditmemo`
--

DROP TABLE IF EXISTS `mp1_sales_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `MP1_SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `MP1_SALES_CREDITMEMO_STATE` (`state`),
  KEY `MP1_SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `MP1_SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `MP1_SALES_CREDITMEMO_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_CREDITMEMO_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_creditmemo`
--

LOCK TABLES `mp1_sales_creditmemo` WRITE;
/*!40000 ALTER TABLE `mp1_sales_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `mp1_sales_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_56228EC5A3B91E185538FB3B79A6B479` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_creditmemo_comment`
--

LOCK TABLES `mp1_sales_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `mp1_sales_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MP1_SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MP1_SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `MP1_SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `MP1_SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `MP1_SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MP1_SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `MP1_SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `MP1_SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_0704ECE734059BA7D5AF5C47672C7D3B` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_creditmemo_grid`
--

LOCK TABLES `mp1_sales_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_creditmemo_item`
--

DROP TABLE IF EXISTS `mp1_sales_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_CREDITMEMO_ITEM_PARENT_ID_MP1_SALES_CREDITMEMO_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_creditmemo_item`
--

LOCK TABLES `mp1_sales_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoice`
--

DROP TABLE IF EXISTS `mp1_sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `MP1_SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `MP1_SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_INVOICE_STATE` (`state`),
  KEY `MP1_SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `MP1_SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `MP1_SALES_INVOICE_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_INVOICE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoice`
--

LOCK TABLES `mp1_sales_invoice` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoice_comment`
--

DROP TABLE IF EXISTS `mp1_sales_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_INVOICE_COMMENT_PARENT_ID_MP1_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoice_comment`
--

LOCK TABLES `mp1_sales_invoice_comment` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoice_grid`
--

DROP TABLE IF EXISTS `mp1_sales_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `MP1_SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `MP1_SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_INVOICE_GRID_STATE` (`state`),
  KEY `MP1_SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MP1_SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MP1_SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `MP1_SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_84469BD3550DF21F8D10ADD4B241FE86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoice_grid`
--

LOCK TABLES `mp1_sales_invoice_grid` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoice_item`
--

DROP TABLE IF EXISTS `mp1_sales_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_INVOICE_ITEM_PARENT_ID_MP1_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoice_item`
--

LOCK TABLES `mp1_sales_invoice_item` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `mp1_sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_INVOICED_AGGREGATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoiced_aggregated`
--

LOCK TABLES `mp1_sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `mp1_sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_invoiced_aggregated_order`
--

LOCK TABLES `mp1_sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `mp1_sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order`
--

DROP TABLE IF EXISTS `mp1_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(20,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(20,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_ORDER_STATUS` (`status`),
  KEY `MP1_SALES_ORDER_STATE` (`state`),
  KEY `MP1_SALES_ORDER_STORE_ID` (`store_id`),
  KEY `MP1_SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `MP1_SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `MP1_SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `MP1_SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `MP1_SALES_ORDER_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_SALES_ORDER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order`
--

LOCK TABLES `mp1_sales_order` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_address`
--

DROP TABLE IF EXISTS `mp1_sales_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_ORDER_ADDRESS_PARENT_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_address`
--

LOCK TABLES `mp1_sales_order_address` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `mp1_sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_aggregated_created`
--

LOCK TABLES `mp1_sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `mp1_sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_aggregated_updated`
--

LOCK TABLES `mp1_sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_grid`
--

DROP TABLE IF EXISTS `mp1_sales_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `signifyd_guarantee_status` varchar(32) DEFAULT NULL COMMENT 'Signifyd Guarantee Disposition Status',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_ORDER_GRID_STATUS` (`status`),
  KEY `MP1_SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `MP1_SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MP1_SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `MP1_SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `MP1_SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `MP1_SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `MP1_SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `MP1_SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_010EEFB8F8BEA025AF722AF4C7C2DC6A` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_grid`
--

LOCK TABLES `mp1_sales_order_grid` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_item`
--

DROP TABLE IF EXISTS `mp1_sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `MP1_SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_ORDER_ITEM_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_ORDER_ITEM_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_item`
--

LOCK TABLES `mp1_sales_order_item` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_payment`
--

DROP TABLE IF EXISTS `mp1_sales_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_ORDER_PAYMENT_PARENT_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_payment`
--

LOCK TABLES `mp1_sales_order_payment` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_status`
--

DROP TABLE IF EXISTS `mp1_sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_status`
--

LOCK TABLES `mp1_sales_order_status` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_status` DISABLE KEYS */;
INSERT INTO `mp1_sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `mp1_sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_status_history`
--

DROP TABLE IF EXISTS `mp1_sales_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `MP1_SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `MP1_SALES_ORDER_STS_HISTORY_PARENT_ID_MP1_SALES_ORDER_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_status_history`
--

LOCK TABLES `mp1_sales_order_status_history` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_status_label`
--

DROP TABLE IF EXISTS `mp1_sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `MP1_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_ORDER_STATUS_LABEL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_ORDER_STS_LBL_STS_MP1_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `mp1_sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_status_label`
--

LOCK TABLES `mp1_sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_status_state`
--

DROP TABLE IF EXISTS `mp1_sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `MP1_SALES_ORDER_STS_STATE_STS_MP1_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `mp1_sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_status_state`
--

LOCK TABLES `mp1_sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_status_state` DISABLE KEYS */;
INSERT INTO `mp1_sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1);
/*!40000 ALTER TABLE `mp1_sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_tax`
--

DROP TABLE IF EXISTS `mp1_sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(20,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `MP1_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_tax`
--

LOCK TABLES `mp1_sales_order_tax` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_order_tax_item`
--

DROP TABLE IF EXISTS `mp1_sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(20,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(20,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(20,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(20,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `MP1_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `FK_8A3ABFB2D67C8D78B660539C8F3A7586` (`associated_item_id`),
  KEY `MP1_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_8A3ABFB2D67C8D78B660539C8F3A7586` FOREIGN KEY (`associated_item_id`) REFERENCES `mp1_sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_ORDER_TAX_ITEM_ITEM_ID_MP1_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `mp1_sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_ORDER_TAX_ITEM_TAX_ID_MP1_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `mp1_sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_order_tax_item`
--

LOCK TABLES `mp1_sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `mp1_sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_payment_transaction`
--

DROP TABLE IF EXISTS `mp1_sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `MP1_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `MP1_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `MP1_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_4B6245D2736A6F14594C10A9E3ACB243` FOREIGN KEY (`payment_id`) REFERENCES `mp1_sales_order_payment` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FD513D69583C2A203D9736A279911FA2` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_PAYMENT_TRANSACTION_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_payment_transaction`
--

LOCK TABLES `mp1_sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `mp1_sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `mp1_sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_REFUNDED_AGGREGATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_refunded_aggregated`
--

LOCK TABLES `mp1_sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `mp1_sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `mp1_sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MP1_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_refunded_aggregated_order`
--

LOCK TABLES `mp1_sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `mp1_sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_sequence_meta`
--

DROP TABLE IF EXISTS `mp1_sales_sequence_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(64) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `MP1_SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_meta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_sequence_meta`
--

LOCK TABLES `mp1_sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `mp1_sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `mp1_sales_sequence_meta` VALUES (1,'order',0,'mp1_sequence_order_0'),(2,'invoice',0,'mp1_sequence_invoice_0'),(3,'creditmemo',0,'mp1_sequence_creditmemo_0'),(4,'shipment',0,'mp1_sequence_shipment_0'),(5,'order',1,'mp1_sequence_order_1'),(6,'invoice',1,'mp1_sequence_invoice_1'),(7,'creditmemo',1,'mp1_sequence_creditmemo_1'),(8,'shipment',1,'mp1_sequence_shipment_1');
/*!40000 ALTER TABLE `mp1_sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_sequence_profile`
--

DROP TABLE IF EXISTS `mp1_sales_sequence_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `MP1_SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `FK_505E062EA30B63D56F33FD8B9CCDFCAF` FOREIGN KEY (`meta_id`) REFERENCES `mp1_sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_sequence_profile`
--

LOCK TABLES `mp1_sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `mp1_sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `mp1_sales_sequence_profile` VALUES (1,1,NULL,NULL,1,1,4294967295,4294966295,1),(2,2,NULL,NULL,1,1,4294967295,4294966295,1),(3,3,NULL,NULL,1,1,4294967295,4294966295,1),(4,4,NULL,NULL,1,1,4294967295,4294966295,1),(5,5,NULL,NULL,1,1,4294967295,4294966295,1),(6,6,NULL,NULL,1,1,4294967295,4294966295,1),(7,7,NULL,NULL,1,1,4294967295,4294966295,1),(8,8,NULL,NULL,1,1,4294967295,4294966295,1);
/*!40000 ALTER TABLE `mp1_sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipment`
--

DROP TABLE IF EXISTS `mp1_sales_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `MP1_SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `MP1_SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `MP1_SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `MP1_SALES_SHIPMENT_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALES_SHIPMENT_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipment`
--

LOCK TABLES `mp1_sales_shipment` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipment_comment`
--

DROP TABLE IF EXISTS `mp1_sales_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_SHIPMENT_COMMENT_PARENT_ID_MP1_SALES_SHIPMENT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipment_comment`
--

LOCK TABLES `mp1_sales_shipment_comment` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipment_grid`
--

DROP TABLE IF EXISTS `mp1_sales_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MP1_SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `MP1_SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `MP1_SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MP1_SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `MP1_SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `MP1_SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `MP1_SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `MP1_SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MP1_SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `MP1_SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_690ABFB866F6BC6A2BBB4A9C8C6D0DE6` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipment_grid`
--

LOCK TABLES `mp1_sales_shipment_grid` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipment_item`
--

DROP TABLE IF EXISTS `mp1_sales_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `MP1_SALES_SHIPMENT_ITEM_PARENT_ID_MP1_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipment_item`
--

LOCK TABLES `mp1_sales_shipment_item` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipment_track`
--

DROP TABLE IF EXISTS `mp1_sales_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `MP1_SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `MP1_SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `MP1_SALES_SHIPMENT_TRACK_PARENT_ID_MP1_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mp1_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipment_track`
--

LOCK TABLES `mp1_sales_shipment_track` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `mp1_sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MP1_SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `MP1_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_SHIPPING_AGGREGATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipping_aggregated`
--

LOCK TABLES `mp1_sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `mp1_sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_5B509F1B285BFA1105618983F4881430` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `MP1_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sales_shipping_aggregated_order`
--

LOCK TABLES `mp1_sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `mp1_sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule`
--

DROP TABLE IF EXISTS `mp1_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `MP1_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule`
--

LOCK TABLES `mp1_salesrule` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_coupon`
--

DROP TABLE IF EXISTS `mp1_salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  `generated_by_dotmailer` smallint(6) DEFAULT NULL COMMENT '1 = Generated by dotmailer',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `MP1_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `MP1_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `MP1_SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `MP1_SALESRULE_COUPON_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_coupon`
--

LOCK TABLES `mp1_salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `mp1_salesrule_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C513AB41AC8C2C8AEA118E3DCC478C08` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `MP1_SALESRULE_COUPON_AGGREGATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_coupon_aggregated`
--

LOCK TABLES `mp1_salesrule_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `mp1_salesrule_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_A6A6910034B0355DBCD66B43C1C7F3A2` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `MP1_SALESRULE_COUPON_AGGRED_ORDER_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_coupon_aggregated_order`
--

LOCK TABLES `mp1_salesrule_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `mp1_salesrule_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_B685CF3E94C1B649A07481EF267DA67D` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `MP1_SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `MP1_SALESRULE_COUPON_AGGRED_UPDATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_coupon_aggregated_updated`
--

LOCK TABLES `mp1_salesrule_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `mp1_salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `MP1_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_8BEDF63BA3854D8E426DA54417E84DAE` FOREIGN KEY (`coupon_id`) REFERENCES `mp1_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_COUPON_USAGE_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_coupon_usage`
--

LOCK TABLES `mp1_salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_customer`
--

DROP TABLE IF EXISTS `mp1_salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `MP1_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `MP1_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `MP1_SALESRULE_CUSTOMER_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_CUSTOMER_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_customer`
--

LOCK TABLES `mp1_salesrule_customer` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_customer_group`
--

DROP TABLE IF EXISTS `mp1_salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `MP1_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_BF54A306D5250FE93D73A8072C5D6C79` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_CUSTOMER_GROUP_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_customer_group`
--

LOCK TABLES `mp1_salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_label`
--

DROP TABLE IF EXISTS `mp1_salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `MP1_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `MP1_SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SALESRULE_LABEL_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_LABEL_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_label`
--

LOCK TABLES `mp1_salesrule_label` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_product_attribute`
--

DROP TABLE IF EXISTS `mp1_salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `MP1_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `MP1_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MP1_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_A5671C5395D084948F0E00BA87EDB15D` FOREIGN KEY (`customer_group_id`) REFERENCES `mp1_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_PRD_ATTR_ATTR_ID_MP1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_PRD_ATTR_WS_ID_MP1_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_product_attribute`
--

LOCK TABLES `mp1_salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_salesrule_website`
--

DROP TABLE IF EXISTS `mp1_salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `MP1_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `MP1_SALESRULE_WEBSITE_RULE_ID_MP1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mp1_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SALESRULE_WEBSITE_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_salesrule_website`
--

LOCK TABLES `mp1_salesrule_website` WRITE;
/*!40000 ALTER TABLE `mp1_salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_search_query`
--

DROP TABLE IF EXISTS `mp1_search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `MP1_SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `MP1_SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `MP1_SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `MP1_SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  CONSTRAINT `MP1_SEARCH_QUERY_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_search_query`
--

LOCK TABLES `mp1_search_query` WRITE;
/*!40000 ALTER TABLE `mp1_search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_search_synonyms`
--

DROP TABLE IF EXISTS `mp1_search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `MP1_SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `MP1_SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `MP1_SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `MP1_SEARCH_SYNONYMS_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_SEARCH_SYNONYMS_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_search_synonyms`
--

LOCK TABLES `mp1_search_synonyms` WRITE;
/*!40000 ALTER TABLE `mp1_search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sendfriend_log`
--

DROP TABLE IF EXISTS `mp1_sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `MP1_SENDFRIEND_LOG_IP` (`ip`),
  KEY `MP1_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sendfriend_log`
--

LOCK TABLES `mp1_sendfriend_log` WRITE;
/*!40000 ALTER TABLE `mp1_sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `mp1_sequence_creditmemo_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_creditmemo_0`
--

LOCK TABLES `mp1_sequence_creditmemo_0` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_creditmemo_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_creditmemo_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `mp1_sequence_creditmemo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_creditmemo_1`
--

LOCK TABLES `mp1_sequence_creditmemo_1` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_creditmemo_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_creditmemo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_invoice_0`
--

DROP TABLE IF EXISTS `mp1_sequence_invoice_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_invoice_0`
--

LOCK TABLES `mp1_sequence_invoice_0` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_invoice_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_invoice_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_invoice_1`
--

DROP TABLE IF EXISTS `mp1_sequence_invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_invoice_1`
--

LOCK TABLES `mp1_sequence_invoice_1` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_order_0`
--

DROP TABLE IF EXISTS `mp1_sequence_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_order_0`
--

LOCK TABLES `mp1_sequence_order_0` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_order_1`
--

DROP TABLE IF EXISTS `mp1_sequence_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_order_1`
--

LOCK TABLES `mp1_sequence_order_1` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_shipment_0`
--

DROP TABLE IF EXISTS `mp1_sequence_shipment_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_shipment_0`
--

LOCK TABLES `mp1_sequence_shipment_0` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_shipment_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_shipment_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sequence_shipment_1`
--

DROP TABLE IF EXISTS `mp1_sequence_shipment_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sequence_shipment_1`
--

LOCK TABLES `mp1_sequence_shipment_1` WRITE;
/*!40000 ALTER TABLE `mp1_sequence_shipment_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sequence_shipment_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_session`
--

DROP TABLE IF EXISTS `mp1_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_session`
--

LOCK TABLES `mp1_session` WRITE;
/*!40000 ALTER TABLE `mp1_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_setup_module`
--

DROP TABLE IF EXISTS `mp1_setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_setup_module`
--

LOCK TABLES `mp1_setup_module` WRITE;
/*!40000 ALTER TABLE `mp1_setup_module` DISABLE KEYS */;
INSERT INTO `mp1_setup_module` VALUES ('Amazon_Core','3.1.4','3.1.4'),('Amazon_Login','3.1.4','3.1.4'),('Amazon_Payment','3.1.4','3.1.4'),('Dotdigitalgroup_Email','3.1.1','3.1.1'),('Hiddentechies_Base','2.0.0','2.0.0'),('Hiddentechies_Bizkick','2.0.2','2.0.2'),('Klarna_Core','5.1.0','5.1.0'),('Klarna_Kp','6.1.0','6.1.0'),('Klarna_Ordermanagement','5.0.2','5.0.2'),('Magento_AuthorizenetAcceptjs','1.0.0','1.0.0'),('Magento_Inventory','1.0.0','1.0.0'),('Magento_InventoryAdminUi','1.0.0','1.0.0'),('Magento_InventoryApi','1.0.0','1.0.0'),('Magento_InventoryBundleProduct','1.0.0','1.0.0'),('Magento_InventoryBundleProductAdminUi','1.0.0','1.0.0'),('Magento_InventoryCache','1.0.0','1.0.0'),('Magento_InventoryCatalog','1.0.0','1.0.0'),('Magento_InventoryCatalogAdminUi','1.0.0','1.0.0'),('Magento_InventoryCatalogApi','1.0.0','1.0.0'),('Magento_InventoryCatalogSearch','1.0.0','1.0.0'),('Magento_InventoryConfigurableProduct','1.0.0','1.0.0'),('Magento_InventoryConfigurableProductAdminUi','1.0.0','1.0.0'),('Magento_InventoryConfigurableProductIndexer','1.0.0','1.0.0'),('Magento_InventoryConfiguration','1.0.0','1.0.0'),('Magento_InventoryConfigurationApi','1.0.0','1.0.0'),('Magento_InventoryElasticsearch','1.0.0','1.0.0'),('Magento_InventoryGroupedProduct','1.0.0','1.0.0'),('Magento_InventoryGroupedProductAdminUi','1.0.0','1.0.0'),('Magento_InventoryGroupedProductIndexer','1.0.0','1.0.0'),('Magento_InventoryImportExport','1.0.0','1.0.0'),('Magento_InventoryIndexer','1.0.0','1.0.0'),('Magento_InventoryLowQuantityNotification','1.0.0','1.0.0'),('Magento_InventoryLowQuantityNotificationAdminUi','1.0.0','1.0.0'),('Magento_InventoryLowQuantityNotificationApi','1.0.0','1.0.0'),('Magento_InventoryMultiDimensionalIndexerApi','1.0.0','1.0.0'),('Magento_InventoryProductAlert','1.0.0','1.0.0'),('Magento_InventoryReservations','1.0.0','1.0.0'),('Magento_InventoryReservationsApi','1.0.0','1.0.0'),('Magento_InventorySales','1.0.0','1.0.0'),('Magento_InventorySalesAdminUi','1.0.0','1.0.0'),('Magento_InventorySalesApi','1.0.0','1.0.0'),('Magento_InventoryShipping','1.0.0','1.0.0'),('Magento_InventoryShippingAdminUi','1.0.0','1.0.0'),('Magento_InventorySourceDeductionApi','1.0.0','1.0.0'),('Magento_InventorySourceSelection','1.0.0','1.0.0'),('Magento_InventorySourceSelectionApi','1.0.0','1.0.0'),('MSP_ReCaptcha','1.5.0','1.5.0'),('MSP_TwoFactorAuth','2.2.0','2.2.0'),('Temando_Shipping','1.5.0','1.5.0'),('Vertex_Tax','100.3.0','100.3.0');
/*!40000 ALTER TABLE `mp1_setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_shipping_tablerate`
--

DROP TABLE IF EXISTS `mp1_shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(30) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_2510A94BAEAE964326F37AE1E8781D31` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_shipping_tablerate`
--

LOCK TABLES `mp1_shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `mp1_shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_signifyd_case`
--

DROP TABLE IF EXISTS `mp1_signifyd_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_signifyd_case` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'Order_id',
  `case_id` int(10) unsigned DEFAULT NULL COMMENT 'Case_id',
  `guarantee_eligible` tinyint(1) DEFAULT NULL COMMENT 'Guarantee_eligible',
  `guarantee_disposition` varchar(32) DEFAULT 'PENDING' COMMENT 'Guarantee_disposition',
  `status` varchar(32) DEFAULT 'PENDING' COMMENT 'Status',
  `score` int(10) unsigned DEFAULT NULL COMMENT 'Score',
  `associated_team` text COMMENT 'Associated_team',
  `review_disposition` varchar(32) DEFAULT NULL COMMENT 'Review_disposition',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated_at',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_SIGNIFYD_CASE_ORDER_ID` (`order_id`),
  UNIQUE KEY `MP1_SIGNIFYD_CASE_CASE_ID` (`case_id`),
  CONSTRAINT `MP1_SIGNIFYD_CASE_ORDER_ID_MP1_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='signifyd_case';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_signifyd_case`
--

LOCK TABLES `mp1_signifyd_case` WRITE;
/*!40000 ALTER TABLE `mp1_signifyd_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_signifyd_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_sitemap`
--

DROP TABLE IF EXISTS `mp1_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `MP1_SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_SITEMAP_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_sitemap`
--

LOCK TABLES `mp1_sitemap` WRITE;
/*!40000 ALTER TABLE `mp1_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_store`
--

DROP TABLE IF EXISTS `mp1_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `MP1_STORE_CODE` (`code`),
  KEY `MP1_STORE_WEBSITE_ID` (`website_id`),
  KEY `MP1_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `MP1_STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `MP1_STORE_GROUP_ID_MP1_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `mp1_store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_STORE_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_store`
--

LOCK TABLES `mp1_store` WRITE;
/*!40000 ALTER TABLE `mp1_store` DISABLE KEYS */;
INSERT INTO `mp1_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `mp1_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_store_group`
--

DROP TABLE IF EXISTS `mp1_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `MP1_STORE_GROUP_CODE` (`code`),
  KEY `MP1_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `MP1_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `MP1_STORE_GROUP_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_store_group`
--

LOCK TABLES `mp1_store_group` WRITE;
/*!40000 ALTER TABLE `mp1_store_group` DISABLE KEYS */;
INSERT INTO `mp1_store_group` VALUES (0,0,'Default',0,0,'default'),(1,1,'Main Website Store',2,1,'main_website_store');
/*!40000 ALTER TABLE `mp1_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_store_website`
--

DROP TABLE IF EXISTS `mp1_store_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `MP1_STORE_WEBSITE_CODE` (`code`),
  KEY `MP1_STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `MP1_STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_store_website`
--

LOCK TABLES `mp1_store_website` WRITE;
/*!40000 ALTER TABLE `mp1_store_website` DISABLE KEYS */;
INSERT INTO `mp1_store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `mp1_store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_calculation`
--

DROP TABLE IF EXISTS `mp1_tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `MP1_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `MP1_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `MP1_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `MP1_TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `MP1_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_MP1_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `mp1_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_MP1_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `mp1_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_TAX_CALC_TAX_CALC_RATE_ID_MP1_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `mp1_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_TAX_CALC_TAX_CALC_RULE_ID_MP1_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `mp1_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_calculation`
--

LOCK TABLES `mp1_tax_calculation` WRITE;
/*!40000 ALTER TABLE `mp1_tax_calculation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_calculation_rate`
--

DROP TABLE IF EXISTS `mp1_tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `MP1_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `MP1_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_89CD784DD5C3DEBE3F91DA825B4BCFAD` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_calculation_rate`
--

LOCK TABLES `mp1_tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `mp1_tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `mp1_tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp1_tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `mp1_tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `MP1_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `MP1_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_6919699EE3E6B274752D453120DF1654` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `mp1_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_TAX_CALCULATION_RATE_TITLE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_calculation_rate_title`
--

LOCK TABLES `mp1_tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `mp1_tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_calculation_rule`
--

DROP TABLE IF EXISTS `mp1_tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `MP1_TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `MP1_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_calculation_rule`
--

LOCK TABLES `mp1_tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `mp1_tax_calculation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_class`
--

DROP TABLE IF EXISTS `mp1_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_class`
--

LOCK TABLES `mp1_tax_class` WRITE;
/*!40000 ALTER TABLE `mp1_tax_class` DISABLE KEYS */;
INSERT INTO `mp1_tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Refund Adjustments','PRODUCT'),(5,'Gift Options','PRODUCT'),(6,'Order Gift Wrapping','PRODUCT'),(7,'Item Gift Wrapping','PRODUCT'),(8,'Printed Gift Card','PRODUCT'),(9,'Reward Points','PRODUCT');
/*!40000 ALTER TABLE `mp1_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `mp1_tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_284DF8E586BEB303B18A4AF8560016B9` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `MP1_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_order_aggregated_created`
--

LOCK TABLES `mp1_tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `mp1_tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `mp1_tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_6364FABD70DD36AC19D943135A7B2133` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `MP1_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_tax_order_aggregated_updated`
--

LOCK TABLES `mp1_tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `mp1_tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_checkout_address`
--

DROP TABLE IF EXISTS `mp1_temando_checkout_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_checkout_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Magento Quote Address Id',
  `service_selection` text COMMENT 'Value Added Services',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_TEMANDO_CHKT_ADDR_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` (`shipping_address_id`),
  CONSTRAINT `MP1_TEMANDO_CHKT_ADDR_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`shipping_address_id`) REFERENCES `mp1_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Checkout Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_checkout_address`
--

LOCK TABLES `mp1_temando_checkout_address` WRITE;
/*!40000 ALTER TABLE `mp1_temando_checkout_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_checkout_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_collection_point_search`
--

DROP TABLE IF EXISTS `mp1_temando_collection_point_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_collection_point_search` (
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `country_id` varchar(2) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Pending',
  PRIMARY KEY (`shipping_address_id`),
  KEY `FK_EFDEAFEFE08CDBDEA238C2959D14E313` (`country_id`),
  CONSTRAINT `FK_C8C7721BA8DD98A7B5314E5844206517` FOREIGN KEY (`shipping_address_id`) REFERENCES `mp1_quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EFDEAFEFE08CDBDEA238C2959D14E313` FOREIGN KEY (`country_id`) REFERENCES `mp1_directory_country` (`country_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Collection Point Search';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_collection_point_search`
--

LOCK TABLES `mp1_temando_collection_point_search` WRITE;
/*!40000 ALTER TABLE `mp1_temando_collection_point_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_collection_point_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_order`
--

DROP TABLE IF EXISTS `mp1_temando_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Magento Order Id',
  `ext_order_id` varchar(64) NOT NULL COMMENT 'Temando Order Id',
  PRIMARY KEY (`entity_id`),
  KEY `MP1_TEMANDO_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  CONSTRAINT `MP1_TEMANDO_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mp1_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_order`
--

LOCK TABLES `mp1_temando_order` WRITE;
/*!40000 ALTER TABLE `mp1_temando_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_order_collection_point`
--

DROP TABLE IF EXISTS `mp1_temando_order_collection_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_order_collection_point` (
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`),
  CONSTRAINT `FK_7D9F24132B63A75193DBE787FAA7F706` FOREIGN KEY (`recipient_address_id`) REFERENCES `mp1_sales_order_address` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Collection Point Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_order_collection_point`
--

LOCK TABLES `mp1_temando_order_collection_point` WRITE;
/*!40000 ALTER TABLE `mp1_temando_order_collection_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_order_collection_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_order_pickup_location`
--

DROP TABLE IF EXISTS `mp1_temando_order_pickup_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_order_pickup_location` (
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`),
  CONSTRAINT `FK_CCF2BB47E3057FE8ADD30F8E4EA36BA2` FOREIGN KEY (`recipient_address_id`) REFERENCES `mp1_sales_order_address` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Pickup Location Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_order_pickup_location`
--

LOCK TABLES `mp1_temando_order_pickup_location` WRITE;
/*!40000 ALTER TABLE `mp1_temando_order_pickup_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_order_pickup_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_pickup_location_search`
--

DROP TABLE IF EXISTS `mp1_temando_pickup_location_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_pickup_location_search` (
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `active` tinyint(1) NOT NULL COMMENT 'Active',
  PRIMARY KEY (`shipping_address_id`),
  CONSTRAINT `MP1_TEMANDO_PICKUP_LOCATION_SRCH_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`shipping_address_id`) REFERENCES `mp1_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pickup Location Search';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_pickup_location_search`
--

LOCK TABLES `mp1_temando_pickup_location_search` WRITE;
/*!40000 ALTER TABLE `mp1_temando_pickup_location_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_pickup_location_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_quote_collection_point`
--

DROP TABLE IF EXISTS `mp1_temando_quote_collection_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_quote_collection_point` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Quote Address Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  `distance` int(10) unsigned DEFAULT NULL COMMENT 'Distance in Meters',
  PRIMARY KEY (`entity_id`),
  KEY `FK_4F4D850802A406FB1DA7B9645BEE683D` (`recipient_address_id`),
  CONSTRAINT `FK_4F4D850802A406FB1DA7B9645BEE683D` FOREIGN KEY (`recipient_address_id`) REFERENCES `mp1_temando_collection_point_search` (`shipping_address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Collection Point Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_quote_collection_point`
--

LOCK TABLES `mp1_temando_quote_collection_point` WRITE;
/*!40000 ALTER TABLE `mp1_temando_quote_collection_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_quote_collection_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_quote_pickup_location`
--

DROP TABLE IF EXISTS `mp1_temando_quote_pickup_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_quote_pickup_location` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Quote Address Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  `distance` int(10) unsigned DEFAULT NULL COMMENT 'Distance in Meters',
  PRIMARY KEY (`entity_id`),
  KEY `FK_5BE7A9DF1831FB3D89394A5CD110E1B4` (`recipient_address_id`),
  CONSTRAINT `FK_5BE7A9DF1831FB3D89394A5CD110E1B4` FOREIGN KEY (`recipient_address_id`) REFERENCES `mp1_temando_pickup_location_search` (`shipping_address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Pickup Location Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_quote_pickup_location`
--

LOCK TABLES `mp1_temando_quote_pickup_location` WRITE;
/*!40000 ALTER TABLE `mp1_temando_quote_pickup_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_quote_pickup_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_temando_shipment`
--

DROP TABLE IF EXISTS `mp1_temando_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_temando_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipment_id` int(10) unsigned NOT NULL COMMENT 'Magento Shipment Id',
  `ext_shipment_id` varchar(64) NOT NULL COMMENT 'External Shipment Id',
  `ext_location_id` varchar(64) DEFAULT NULL,
  `ext_tracking_url` varchar(255) DEFAULT NULL COMMENT 'External Tracking Url',
  `ext_tracking_reference` varchar(255) DEFAULT NULL COMMENT 'External Tracking Reference',
  `ext_return_shipment_id` varchar(64) DEFAULT NULL COMMENT 'External Return Shipment Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_TEMANDO_SHIPMENT_SHIPMENT_ID_EXT_SHIPMENT_ID` (`shipment_id`,`ext_shipment_id`),
  CONSTRAINT `MP1_TEMANDO_SHIPMENT_SHIPMENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`shipment_id`) REFERENCES `mp1_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_temando_shipment`
--

LOCK TABLES `mp1_temando_shipment` WRITE;
/*!40000 ALTER TABLE `mp1_temando_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_temando_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_theme`
--

DROP TABLE IF EXISTS `mp1_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Core theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_theme`
--

LOCK TABLES `mp1_theme` WRITE;
/*!40000 ALTER TABLE `mp1_theme` DISABLE KEYS */;
INSERT INTO `mp1_theme` VALUES (1,NULL,'Magento/blank','Magento Blank','preview_image_5cda1600c9131.jpeg',0,'frontend',0,'Magento/blank'),(2,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend'),(3,1,'Magento/luma','Magento Luma','preview_image_5cda1600d2431.jpeg',0,'frontend',0,'Magento/luma'),(4,1,'Hiddentechies/bizkick','Hiddentechies Bizkick','preview_image_5cda19eee72e8.jpeg',0,'frontend',0,'Hiddentechies/bizkick');
/*!40000 ALTER TABLE `mp1_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_theme_file`
--

DROP TABLE IF EXISTS `mp1_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `MP1_THEME_FILE_THEME_ID_MP1_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `MP1_THEME_FILE_THEME_ID_MP1_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mp1_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_theme_file`
--

LOCK TABLES `mp1_theme_file` WRITE;
/*!40000 ALTER TABLE `mp1_theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_translation`
--

DROP TABLE IF EXISTS `mp1_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `MP1_TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `MP1_TRANSLATION_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_translation`
--

LOCK TABLES `mp1_translation` WRITE;
/*!40000 ALTER TABLE `mp1_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_ui_bookmark`
--

DROP TABLE IF EXISTS `mp1_ui_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `MP1_UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `MP1_UI_BOOKMARK_USER_ID_MP1_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mp1_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Bookmark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_ui_bookmark`
--

LOCK TABLES `mp1_ui_bookmark` WRITE;
/*!40000 ALTER TABLE `mp1_ui_bookmark` DISABLE KEYS */;
INSERT INTO `mp1_ui_bookmark` VALUES (1,1,'design_config_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"actions\":4,\"theme_theme_id\":5},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'design_config_listing','current',0,NULL,'{\"current\":{\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"actions\":4,\"theme_theme_id\":5},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,'design_theme_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"theme_id\":{\"visible\":false,\"sorting\":\"asc\"},\"theme_title\":{\"visible\":true,\"sorting\":false},\"parent_theme_title\":{\"visible\":true,\"sorting\":false},\"theme_path\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"theme_id\":0,\"theme_title\":1,\"parent_theme_title\":2,\"theme_path\":3,\"actions\":4}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,'design_theme_listing','current',0,NULL,'{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"theme_id\":{\"visible\":false,\"sorting\":\"asc\"},\"theme_title\":{\"visible\":true,\"sorting\":false},\"parent_theme_title\":{\"visible\":true,\"sorting\":false},\"theme_path\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"theme_id\":0,\"theme_title\":1,\"parent_theme_title\":2,\"theme_path\":3,\"actions\":4}}}','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `mp1_ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_url_rewrite`
--

DROP TABLE IF EXISTS `mp1_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `MP1_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `MP1_URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `MP1_URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_url_rewrite`
--

LOCK TABLES `mp1_url_rewrite` WRITE;
/*!40000 ALTER TABLE `mp1_url_rewrite` DISABLE KEYS */;
INSERT INTO `mp1_url_rewrite` VALUES (1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL);
/*!40000 ALTER TABLE `mp1_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_variable`
--

DROP TABLE IF EXISTS `mp1_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `MP1_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_variable`
--

LOCK TABLES `mp1_variable` WRITE;
/*!40000 ALTER TABLE `mp1_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_variable_value`
--

DROP TABLE IF EXISTS `mp1_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MP1_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `MP1_VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_VARIABLE_VALUE_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_VARIABLE_VALUE_VARIABLE_ID_MP1_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `mp1_variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_variable_value`
--

LOCK TABLES `mp1_variable_value` WRITE;
/*!40000 ALTER TABLE `mp1_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vault_payment_token`
--

DROP TABLE IF EXISTS `mp1_vault_payment_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MP1_VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `UNQ_80F582A66651BFBAFA31006C69D581A7` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `MP1_VAULT_PAYMENT_TOKEN_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` (`customer_id`),
  CONSTRAINT `MP1_VAULT_PAYMENT_TOKEN_CSTR_ID_MP1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vault_payment_token`
--

LOCK TABLES `mp1_vault_payment_token` WRITE;
/*!40000 ALTER TABLE `mp1_vault_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vault_payment_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `mp1_vault_payment_token_order_payment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_2304EE9B3691336C5FACEB88EFA5E5C0` (`payment_token_id`),
  CONSTRAINT `FK_2304EE9B3691336C5FACEB88EFA5E5C0` FOREIGN KEY (`payment_token_id`) REFERENCES `mp1_vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E69E6395A663E071BC1ACB2830BEA9F3` FOREIGN KEY (`order_payment_id`) REFERENCES `mp1_sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vault_payment_token_order_payment_link`
--

LOCK TABLES `mp1_vault_payment_token_order_payment_link` WRITE;
/*!40000 ALTER TABLE `mp1_vault_payment_token_order_payment_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vault_payment_token_order_payment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_customer_code`
--

DROP TABLE IF EXISTS `mp1_vertex_customer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_customer_code` (
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `customer_code` text COMMENT 'Customer Code for Vertex',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_customer_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_customer_code`
--

LOCK TABLES `mp1_vertex_customer_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_customer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_customer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_invoice_sent`
--

DROP TABLE IF EXISTS `mp1_vertex_invoice_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_invoice_sent` (
  `invoice_id` int(10) unsigned NOT NULL COMMENT 'Invoice ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_invoice_sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_invoice_sent`
--

LOCK TABLES `mp1_vertex_invoice_sent` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_invoice_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_invoice_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_order_invoice_status`
--

DROP TABLE IF EXISTS `mp1_vertex_order_invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_order_invoice_status` (
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_order_invoice_status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_order_invoice_status`
--

LOCK TABLES `mp1_vertex_order_invoice_status` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_order_invoice_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_order_invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_creditmemo_item_invoice_text_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_creditmemo_item_invoice_text_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_creditmemo_item_invoice_text_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Creditmemo Item ID',
  `invoice_text_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `UNQ_ED7E293DCF26816BCCC53816A4480D18` (`item_id`,`invoice_text_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_creditmemo_item_invoice_text_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_creditmemo_item_invoice_text_code`
--

LOCK TABLES `mp1_vertex_sales_creditmemo_item_invoice_text_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_invoice_text_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_invoice_text_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_creditmemo_item_tax_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_creditmemo_item_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_creditmemo_item_tax_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Creditmemo Item ID',
  `tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `MP1_VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_ITEM_ID_TAX_CODE` (`item_id`,`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_creditmemo_item_tax_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_creditmemo_item_tax_code`
--

LOCK TABLES `mp1_vertex_sales_creditmemo_item_tax_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_creditmemo_item_vertex_tax_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_creditmemo_item_vertex_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_creditmemo_item_vertex_tax_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Creditmemo Item ID',
  `vertex_tax_code` varchar(100) NOT NULL COMMENT 'Text code from Vertex',
  UNIQUE KEY `UNQ_A6ED90257074FB81DF487952A070D624` (`item_id`,`vertex_tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_creditmemo_item_vertex_tax_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_creditmemo_item_vertex_tax_code`
--

LOCK TABLES `mp1_vertex_sales_creditmemo_item_vertex_tax_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_vertex_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_creditmemo_item_vertex_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_order_item_invoice_text_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_order_item_invoice_text_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_order_item_invoice_text_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Order Item ID',
  `invoice_text_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `UNQ_6A3010E235C716D951BFE01FC9925A04` (`item_id`,`invoice_text_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_order_item_invoice_text_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_order_item_invoice_text_code`
--

LOCK TABLES `mp1_vertex_sales_order_item_invoice_text_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_invoice_text_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_invoice_text_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_order_item_tax_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_order_item_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_order_item_tax_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Order Item ID',
  `tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `MP1_VERTEX_SALES_ORDER_ITEM_TAX_CODE_ITEM_ID_TAX_CODE` (`item_id`,`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_order_item_tax_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_order_item_tax_code`
--

LOCK TABLES `mp1_vertex_sales_order_item_tax_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_sales_order_item_vertex_tax_code`
--

DROP TABLE IF EXISTS `mp1_vertex_sales_order_item_vertex_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_sales_order_item_vertex_tax_code` (
  `item_id` int(10) unsigned NOT NULL COMMENT 'Order Item ID',
  `vertex_tax_code` varchar(100) NOT NULL COMMENT 'Text code from Vertex',
  UNIQUE KEY `UNQ_339627011144705C8915A964178D3843` (`item_id`,`vertex_tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mp1_vertex_sales_order_item_vertex_tax_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_sales_order_item_vertex_tax_code`
--

LOCK TABLES `mp1_vertex_sales_order_item_vertex_tax_code` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_vertex_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_sales_order_item_vertex_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_vertex_taxrequest`
--

DROP TABLE IF EXISTS `mp1_vertex_taxrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_vertex_taxrequest` (
  `request_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_type` varchar(255) NOT NULL COMMENT 'Request Type',
  `quote_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `total_tax` varchar(255) NOT NULL COMMENT 'Total Tax Amount',
  `source_path` varchar(255) NOT NULL COMMENT 'Source path controller_module_action',
  `tax_area_id` varchar(255) NOT NULL COMMENT 'Tax Jurisdictions Id',
  `sub_total` varchar(255) NOT NULL COMMENT 'Response Subtotal Amount',
  `total` varchar(255) NOT NULL COMMENT 'Response Total Amount',
  `lookup_result` varchar(255) NOT NULL COMMENT 'Tax Area Response Lookup Result',
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Request create date',
  `request_xml` text NOT NULL COMMENT 'Request XML',
  `response_xml` text NOT NULL COMMENT 'Response XML',
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `MP1_VERTEX_TAXREQUEST_REQUEST_ID` (`request_id`),
  KEY `MP1_VERTEX_TAXREQUEST_REQUEST_TYPE` (`request_type`),
  KEY `MP1_VERTEX_TAXREQUEST_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of requests to Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_vertex_taxrequest`
--

LOCK TABLES `mp1_vertex_taxrequest` WRITE;
/*!40000 ALTER TABLE `mp1_vertex_taxrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_vertex_taxrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_weee_tax`
--

DROP TABLE IF EXISTS `mp1_weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `MP1_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `MP1_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `MP1_WEEE_TAX_COUNTRY` (`country`),
  KEY `MP1_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `MP1_WEEE_TAX_ATTRIBUTE_ID_MP1_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mp1_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_WEEE_TAX_COUNTRY_MP1_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `mp1_directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_WEEE_TAX_ENTITY_ID_MP1_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_WEEE_TAX_WEBSITE_ID_MP1_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mp1_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_weee_tax`
--

LOCK TABLES `mp1_weee_tax` WRITE;
/*!40000 ALTER TABLE `mp1_weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_widget`
--

DROP TABLE IF EXISTS `mp1_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `MP1_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_widget`
--

LOCK TABLES `mp1_widget` WRITE;
/*!40000 ALTER TABLE `mp1_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_widget_instance`
--

DROP TABLE IF EXISTS `mp1_widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `MP1_WIDGET_INSTANCE_THEME_ID_MP1_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `MP1_WIDGET_INSTANCE_THEME_ID_MP1_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mp1_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_widget_instance`
--

LOCK TABLES `mp1_widget_instance` WRITE;
/*!40000 ALTER TABLE `mp1_widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_widget_instance_page`
--

DROP TABLE IF EXISTS `mp1_widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `MP1_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_D68145DD55B7EFFE3EDD0AC5DB8E9E28` FOREIGN KEY (`instance_id`) REFERENCES `mp1_widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_widget_instance_page`
--

LOCK TABLES `mp1_widget_instance_page` WRITE;
/*!40000 ALTER TABLE `mp1_widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_widget_instance_page_layout`
--

DROP TABLE IF EXISTS `mp1_widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `MP1_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `MP1_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `FK_1F151203CF46EBE26A4C926DBE453946` FOREIGN KEY (`layout_update_id`) REFERENCES `mp1_layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FF56B0CE7B1ECB0C83A4FF4070C5019D` FOREIGN KEY (`page_id`) REFERENCES `mp1_widget_instance_page` (`page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_widget_instance_page_layout`
--

LOCK TABLES `mp1_widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `mp1_widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_wishlist`
--

DROP TABLE IF EXISTS `mp1_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `MP1_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `MP1_WISHLIST_SHARED` (`shared`),
  CONSTRAINT `MP1_WISHLIST_CUSTOMER_ID_MP1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mp1_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_wishlist`
--

LOCK TABLES `mp1_wishlist` WRITE;
/*!40000 ALTER TABLE `mp1_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_wishlist_item`
--

DROP TABLE IF EXISTS `mp1_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `MP1_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `MP1_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MP1_WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `MP1_WISHLIST_ITEM_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mp1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `MP1_WISHLIST_ITEM_STORE_ID_MP1_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mp1_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `MP1_WISHLIST_ITEM_WISHLIST_ID_MP1_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `mp1_wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_wishlist_item`
--

LOCK TABLES `mp1_wishlist_item` WRITE;
/*!40000 ALTER TABLE `mp1_wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp1_wishlist_item_option`
--

DROP TABLE IF EXISTS `mp1_wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp1_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_D537E6ACF51E3F0A20ECB91BB84E0416` (`wishlist_item_id`),
  KEY `MP1_WISHLIST_ITEM_OPT_PRD_ID_MP1_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `FK_D537E6ACF51E3F0A20ECB91BB84E0416` FOREIGN KEY (`wishlist_item_id`) REFERENCES `mp1_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp1_wishlist_item_option`
--

LOCK TABLES `mp1_wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `mp1_wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp1_wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `mp1_inventory_stock_1`
--

/*!50001 DROP VIEW IF EXISTS `mp1_inventory_stock_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `mp1_inventory_stock_1` AS select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`mp1_cataloginventory_stock_status` `legacy_stock_status` join `mp1_catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-13 22:38:09
