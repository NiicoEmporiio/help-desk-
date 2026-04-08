-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: hesk
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hesk_attachments`
--

DROP TABLE IF EXISTS `hesk_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_attachments` (
  `att_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int unsigned NOT NULL DEFAULT '0',
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_attachments`
--

LOCK TABLES `hesk_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_auth_tokens`
--

DROP TABLE IF EXISTS `hesk_auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_auth_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) DEFAULT NULL,
  `token` char(64) DEFAULT NULL,
  `user_id` smallint unsigned NOT NULL,
  `user_type` varchar(8) NOT NULL DEFAULT 'STAFF',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_auth_tokens`
--

LOCK TABLES `hesk_auth_tokens` WRITE;
/*!40000 ALTER TABLE `hesk_auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_banned_emails`
--

DROP TABLE IF EXISTS `hesk_banned_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_banned_emails` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `banned_by` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_banned_emails`
--

LOCK TABLES `hesk_banned_emails` WRITE;
/*!40000 ALTER TABLE `hesk_banned_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_banned_ips`
--

DROP TABLE IF EXISTS `hesk_banned_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_banned_ips` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `ip_from` int unsigned NOT NULL DEFAULT '0',
  `ip_to` int unsigned NOT NULL DEFAULT '0',
  `ip_display` varchar(100) NOT NULL,
  `banned_by` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_banned_ips`
--

LOCK TABLES `hesk_banned_ips` WRITE;
/*!40000 ALTER TABLE `hesk_banned_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_bookmarks`
--

DROP TABLE IF EXISTS `hesk_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_bookmarks` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint unsigned NOT NULL,
  `ticket_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`,`user_id`),
  KEY `user_id` (`user_id`,`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_bookmarks`
--

LOCK TABLES `hesk_bookmarks` WRITE;
/*!40000 ALTER TABLE `hesk_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_categories`
--

DROP TABLE IF EXISTS `hesk_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_categories` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cat_order` smallint unsigned NOT NULL DEFAULT '0',
  `autoassign` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `autoassign_config` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '3',
  `default_due_date_amount` int DEFAULT NULL,
  `default_due_date_unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_categories`
--

LOCK TABLES `hesk_categories` WRITE;
/*!40000 ALTER TABLE `hesk_categories` DISABLE KEYS */;
INSERT INTO `hesk_categories` VALUES (1,'General',10,'1',NULL,'0',3,NULL,NULL);
/*!40000 ALTER TABLE `hesk_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_custom_fields`
--

DROP TABLE IF EXISTS `hesk_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_custom_fields` (
  `id` tinyint unsigned NOT NULL,
  `use` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `place` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `req` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `category` text COLLATE utf8mb3_unicode_ci,
  `name` text COLLATE utf8mb3_unicode_ci,
  `value` text COLLATE utf8mb3_unicode_ci,
  `order` smallint unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `useType` (`use`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_custom_fields`
--

LOCK TABLES `hesk_custom_fields` WRITE;
/*!40000 ALTER TABLE `hesk_custom_fields` DISABLE KEYS */;
INSERT INTO `hesk_custom_fields` VALUES (1,'0','0','text','0',NULL,'',NULL,1000),(2,'0','0','text','0',NULL,'',NULL,1000),(3,'0','0','text','0',NULL,'',NULL,1000),(4,'0','0','text','0',NULL,'',NULL,1000),(5,'0','0','text','0',NULL,'',NULL,1000),(6,'0','0','text','0',NULL,'',NULL,1000),(7,'0','0','text','0',NULL,'',NULL,1000),(8,'0','0','text','0',NULL,'',NULL,1000),(9,'0','0','text','0',NULL,'',NULL,1000),(10,'0','0','text','0',NULL,'',NULL,1000),(11,'0','0','text','0',NULL,'',NULL,1000),(12,'0','0','text','0',NULL,'',NULL,1000),(13,'0','0','text','0',NULL,'',NULL,1000),(14,'0','0','text','0',NULL,'',NULL,1000),(15,'0','0','text','0',NULL,'',NULL,1000),(16,'0','0','text','0',NULL,'',NULL,1000),(17,'0','0','text','0',NULL,'',NULL,1000),(18,'0','0','text','0',NULL,'',NULL,1000),(19,'0','0','text','0',NULL,'',NULL,1000),(20,'0','0','text','0',NULL,'',NULL,1000),(21,'0','0','text','0',NULL,'',NULL,1000),(22,'0','0','text','0',NULL,'',NULL,1000),(23,'0','0','text','0',NULL,'',NULL,1000),(24,'0','0','text','0',NULL,'',NULL,1000),(25,'0','0','text','0',NULL,'',NULL,1000),(26,'0','0','text','0',NULL,'',NULL,1000),(27,'0','0','text','0',NULL,'',NULL,1000),(28,'0','0','text','0',NULL,'',NULL,1000),(29,'0','0','text','0',NULL,'',NULL,1000),(30,'0','0','text','0',NULL,'',NULL,1000),(31,'0','0','text','0',NULL,'',NULL,1000),(32,'0','0','text','0',NULL,'',NULL,1000),(33,'0','0','text','0',NULL,'',NULL,1000),(34,'0','0','text','0',NULL,'',NULL,1000),(35,'0','0','text','0',NULL,'',NULL,1000),(36,'0','0','text','0',NULL,'',NULL,1000),(37,'0','0','text','0',NULL,'',NULL,1000),(38,'0','0','text','0',NULL,'',NULL,1000),(39,'0','0','text','0',NULL,'',NULL,1000),(40,'0','0','text','0',NULL,'',NULL,1000),(41,'0','0','text','0',NULL,'',NULL,1000),(42,'0','0','text','0',NULL,'',NULL,1000),(43,'0','0','text','0',NULL,'',NULL,1000),(44,'0','0','text','0',NULL,'',NULL,1000),(45,'0','0','text','0',NULL,'',NULL,1000),(46,'0','0','text','0',NULL,'',NULL,1000),(47,'0','0','text','0',NULL,'',NULL,1000),(48,'0','0','text','0',NULL,'',NULL,1000),(49,'0','0','text','0',NULL,'',NULL,1000),(50,'0','0','text','0',NULL,'',NULL,1000),(51,'0','0','text','0',NULL,'',NULL,1000),(52,'0','0','text','0',NULL,'',NULL,1000),(53,'0','0','text','0',NULL,'',NULL,1000),(54,'0','0','text','0',NULL,'',NULL,1000),(55,'0','0','text','0',NULL,'',NULL,1000),(56,'0','0','text','0',NULL,'',NULL,1000),(57,'0','0','text','0',NULL,'',NULL,1000),(58,'0','0','text','0',NULL,'',NULL,1000),(59,'0','0','text','0',NULL,'',NULL,1000),(60,'0','0','text','0',NULL,'',NULL,1000),(61,'0','0','text','0',NULL,'',NULL,1000),(62,'0','0','text','0',NULL,'',NULL,1000),(63,'0','0','text','0',NULL,'',NULL,1000),(64,'0','0','text','0',NULL,'',NULL,1000),(65,'0','0','text','0',NULL,'',NULL,1000),(66,'0','0','text','0',NULL,'',NULL,1000),(67,'0','0','text','0',NULL,'',NULL,1000),(68,'0','0','text','0',NULL,'',NULL,1000),(69,'0','0','text','0',NULL,'',NULL,1000),(70,'0','0','text','0',NULL,'',NULL,1000),(71,'0','0','text','0',NULL,'',NULL,1000),(72,'0','0','text','0',NULL,'',NULL,1000),(73,'0','0','text','0',NULL,'',NULL,1000),(74,'0','0','text','0',NULL,'',NULL,1000),(75,'0','0','text','0',NULL,'',NULL,1000),(76,'0','0','text','0',NULL,'',NULL,1000),(77,'0','0','text','0',NULL,'',NULL,1000),(78,'0','0','text','0',NULL,'',NULL,1000),(79,'0','0','text','0',NULL,'',NULL,1000),(80,'0','0','text','0',NULL,'',NULL,1000),(81,'0','0','text','0',NULL,'',NULL,1000),(82,'0','0','text','0',NULL,'',NULL,1000),(83,'0','0','text','0',NULL,'',NULL,1000),(84,'0','0','text','0',NULL,'',NULL,1000),(85,'0','0','text','0',NULL,'',NULL,1000),(86,'0','0','text','0',NULL,'',NULL,1000),(87,'0','0','text','0',NULL,'',NULL,1000),(88,'0','0','text','0',NULL,'',NULL,1000),(89,'0','0','text','0',NULL,'',NULL,1000),(90,'0','0','text','0',NULL,'',NULL,1000),(91,'0','0','text','0',NULL,'',NULL,1000),(92,'0','0','text','0',NULL,'',NULL,1000),(93,'0','0','text','0',NULL,'',NULL,1000),(94,'0','0','text','0',NULL,'',NULL,1000),(95,'0','0','text','0',NULL,'',NULL,1000),(96,'0','0','text','0',NULL,'',NULL,1000),(97,'0','0','text','0',NULL,'',NULL,1000),(98,'0','0','text','0',NULL,'',NULL,1000),(99,'0','0','text','0',NULL,'',NULL,1000),(100,'0','0','text','0',NULL,'',NULL,1000);
/*!40000 ALTER TABLE `hesk_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_custom_priorities`
--

DROP TABLE IF EXISTS `hesk_custom_priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_custom_priorities` (
  `id` tinyint unsigned NOT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8mb3_unicode_ci NOT NULL,
  `can_customers_select` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `priority_order` smallint unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_custom_priorities`
--

LOCK TABLES `hesk_custom_priorities` WRITE;
/*!40000 ALTER TABLE `hesk_custom_priorities` DISABLE KEYS */;
INSERT INTO `hesk_custom_priorities` VALUES (0,'{\"English\":\"NULL\"}','e74441','0',4),(1,'{\"English\":\"NULL\"}','fac500','1',3),(2,'{\"English\":\"NULL\"}','3abb7a','1',2),(3,'{\"English\":\"NULL\"}','71a5ec','1',1);
/*!40000 ALTER TABLE `hesk_custom_priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_custom_statuses`
--

DROP TABLE IF EXISTS `hesk_custom_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_custom_statuses` (
  `id` tinyint unsigned NOT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8mb3_unicode_ci NOT NULL,
  `can_customers_change` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `order` smallint unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_custom_statuses`
--

LOCK TABLES `hesk_custom_statuses` WRITE;
/*!40000 ALTER TABLE `hesk_custom_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_custom_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_customers`
--

DROP TABLE IF EXISTS `hesk_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_customers` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verified` smallint unsigned NOT NULL DEFAULT '0',
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verification_email_sent_at` timestamp NULL DEFAULT NULL,
  `mfa_enrollment` smallint unsigned NOT NULL DEFAULT '0',
  `mfa_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_customers`
--

LOCK TABLES `hesk_customers` WRITE;
/*!40000 ALTER TABLE `hesk_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_email_id_to_ticket`
--

DROP TABLE IF EXISTS `hesk_email_id_to_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_email_id_to_ticket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email_id` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ticket_id` mediumint unsigned NOT NULL,
  `reply_id` mediumint unsigned DEFAULT NULL,
  `from_hesk` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_email_id_to_ticket`
--

LOCK TABLES `hesk_email_id_to_ticket` WRITE;
/*!40000 ALTER TABLE `hesk_email_id_to_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_email_id_to_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_articles`
--

DROP TABLE IF EXISTS `hesk_kb_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_kb_articles` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint unsigned NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `keywords` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `votes` mediumint unsigned NOT NULL DEFAULT '0',
  `views` mediumint unsigned NOT NULL DEFAULT '0',
  `type` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `html` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sticky` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `art_order` smallint unsigned NOT NULL DEFAULT '0',
  `history` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `sticky` (`sticky`),
  KEY `type` (`type`),
  FULLTEXT KEY `subject` (`subject`,`content`,`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_articles`
--

LOCK TABLES `hesk_kb_articles` WRITE;
/*!40000 ALTER TABLE `hesk_kb_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_kb_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_attachments`
--

DROP TABLE IF EXISTS `hesk_kb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_kb_attachments` (
  `att_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_attachments`
--

LOCK TABLES `hesk_kb_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_kb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_kb_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_categories`
--

DROP TABLE IF EXISTS `hesk_kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_kb_categories` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent` smallint unsigned NOT NULL,
  `articles` smallint unsigned NOT NULL DEFAULT '0',
  `articles_private` smallint unsigned NOT NULL DEFAULT '0',
  `articles_draft` smallint unsigned NOT NULL DEFAULT '0',
  `cat_order` smallint unsigned NOT NULL,
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_categories`
--

LOCK TABLES `hesk_kb_categories` WRITE;
/*!40000 ALTER TABLE `hesk_kb_categories` DISABLE KEYS */;
INSERT INTO `hesk_kb_categories` VALUES (1,'Knowledgebase',0,0,0,0,10,'0');
/*!40000 ALTER TABLE `hesk_kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_linked_tickets`
--

DROP TABLE IF EXISTS `hesk_linked_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_linked_tickets` (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `ticket_id1` mediumint NOT NULL,
  `ticket_id2` mediumint NOT NULL,
  `dt_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id1` (`ticket_id1`),
  KEY `ticket_id2` (`ticket_id2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_linked_tickets`
--

LOCK TABLES `hesk_linked_tickets` WRITE;
/*!40000 ALTER TABLE `hesk_linked_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_linked_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_log_overdue`
--

DROP TABLE IF EXISTS `hesk_log_overdue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_log_overdue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket` mediumint unsigned NOT NULL,
  `category` smallint unsigned NOT NULL,
  `priority` tinyint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `owner` smallint unsigned NOT NULL DEFAULT '0',
  `due_date` timestamp NOT NULL DEFAULT '2000-01-01 03:00:00',
  `comments` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket` (`ticket`),
  KEY `category` (`category`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_log_overdue`
--

LOCK TABLES `hesk_log_overdue` WRITE;
/*!40000 ALTER TABLE `hesk_log_overdue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_log_overdue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_logins`
--

DROP TABLE IF EXISTS `hesk_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `number` tinyint unsigned NOT NULL DEFAULT '1',
  `last_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_logins`
--

LOCK TABLES `hesk_logins` WRITE;
/*!40000 ALTER TABLE `hesk_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mail`
--

DROP TABLE IF EXISTS `hesk_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_mail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` smallint unsigned NOT NULL,
  `to` smallint unsigned NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `deletedby` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`,`read`,`deletedby`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mail`
--

LOCK TABLES `hesk_mail` WRITE;
/*!40000 ALTER TABLE `hesk_mail` DISABLE KEYS */;
INSERT INTO `hesk_mail` VALUES (1,9999,1,'Hesk quick start guide','</p><div style=\"text-align:justify; padding-left: 10px; padding-right: 10px;\">\r\n\r\n<h2 style=\"padding-left:0px\">Welcome to Hesk, an excellent tool for improving your customer support!</h2>\r\n\r\n<h3>Below is a short guide to help you get started.</h3>\r\n\r\n<div class=\"main__content notice-flash \">\r\n<div class=\"notification orange\">\r\nAn up-to-date and expanded guide is available at <a href=\"https://www.hesk.com/knowledgebase/?article=109\" target=\"_blank\">Hesk online Quick Start Guide</a>.</div>\r\n</div>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #1: Set up your profile</h3>\r\n\r\n<ol>\r\n<li>go to <a href=\"profile.php\">Profile</a>,</li>\r\n<li>set your name and email address.</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #2: Configure Hesk</h3>\r\n\r\n<ol>\r\n<li>go to <a href=\"admin_settings_general.php\">Settings</a>,</li>\r\n<li>for a quick start, modify these settings on the \"General\" tab:<br><br>\r\n<b>Website title</b> - enter the title of your main website (not your help desk),<br>\r\n<b>Website URL</b> - enter the URL of your main website,<br>\r\n<b>Webmaster email</b> - enter an alternative email address people can contact in case your Hesk database is down<br>&nbsp;\r\n</li>\r\n<li>you can come back to the settings page later and explore all the options. To view details about a setting, click the [?]</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #3: Add support categories</h3>\r\n\r\n<p>Go to <a href=\"manage_categories.php\">Categories</a> to add support ticket categories.</p>\r\n<p>You cannot delete the default category, but you can rename it.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #4: Add your support team members</h3>\r\n\r\n<p>Go to <a href=\"manage_users.php\">Team</a> to create new support staff accounts.</p>\r\n<p>You can use two user types in Hesk:</p>\r\n<ul>\r\n<li><b>Administrators</b> who have full access to all Hesk features</li>\r\n<li><b>Staff</b> who you can restrict access to categories and features</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #5: Useful tools</h3>\r\n\r\n<p>You can do a lot in the <a href=\"banned_emails.php\">Tools</a> section, for example:</p>\r\n<ul>\r\n<li>create custom ticket statuses,</li>\r\n<li>add custom input fields to the &quot;Submit a ticket&quot; form,</li>\r\n<li>make public announcements (Service messages),</li>\r\n<li>modify email templates,</li>\r\n<li>ban disruptive customers,</li>\r\n<li>and more.</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #6: Create a Knowledgebase</h3>\r\n\r\n<p>A Knowledgebase is a collection of articles, guides, and answers to frequently asked questions, usually organized in multiple categories.</p>\r\n<p>A clear and comprehensive knowledgebase can drastically reduce the number of support tickets you receive, thereby saving you significant time and effort in the long run.</p>\r\n<p>Go to <a href=\"manage_knowledgebase.php\">Knowledgebase</a> to create categories and write articles for your knowledgebase.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #7: Don\'t repeat yourself</h3>\r\n\r\n<p>Sometimes several support tickets address the same issues - allowing you to use pre-written (&quot;canned&quot;) responses.</p>\r\n<p>To compose canned responses, go to the <a href=\"manage_canned.php\">Templates &gt; Responses</a> page.</p>\r\n<p>Similarly, you can create <a href=\"manage_ticket_templates.php\">Templates &gt; Tickets</a> if your staff will be submitting support tickets on the client\'s behalf, for example, from telephone conversations.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #8: Secure your help desk</h3>\r\n\r\n<p>Make sure your help desk is as secure as possible by going through the <a href=\"https://www.hesk.com/knowledgebase/?article=82\">Hesk security checklist</a>.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #9: Stay updated</h3>\r\n\r\n<p>Hesk regularly receives improvements and bug fixes; make sure you know about them!</p>\r\n<ul>\r\n<li>for fast notifications, <a href=\"https://x.com/HESKdotCOM\" rel=\"nofollow\">follow Hesk on <b>X</b></a></li>\r\n<li>for email notifications, subscribe to our low-volume, zero-spam <a href=\"https://www.hesk.com/newsletter.php\">newsletter</a></li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #10: Look professional</h3>\r\n\r\n<p><a href=\"https://www.hesk.com/get/hesk3-license\">Remove &quot;Powered by&quot; links</a> to support Hesk development and make it look more professional.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #11: Too much hassle? Switch to Hesk Cloud for the ultimate experience</h3>\r\n\r\n<p>Experience the best of Hesk by moving your help desk into the Hesk Cloud:</p>\r\n<ul>\r\n<li>exclusive advanced modules,</li>\r\n<li>automated updates,</li>\r\n<li>free migration of your existing Hesk tickets and settings,</li>\r\n<li>we take care of maintenance, server setup and optimization, backups, and more!</li>\r\n</ul>\r\n\r\n<p>&nbsp;<br><a href=\"https://www.hesk.com/get/hesk3-cloud\" class=\"btn btn--blue-border\" style=\"text-decoration:none\">Click here to learn more about Hesk Cloud</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Again, welcome to Hesk, and enjoy using it!</p>\r\n\r\n<p>Klemen Stirn<br>\r\nFounder<br>\r\n<a href=\"https://www.hesk.com\">https://www.hesk.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n</div><p>','2026-04-08 11:47:05','0',9999);
/*!40000 ALTER TABLE `hesk_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mfa_backup_codes`
--

DROP TABLE IF EXISTS `hesk_mfa_backup_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_mfa_backup_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` smallint unsigned NOT NULL,
  `user_type` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'STAFF',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mfa_backup_codes`
--

LOCK TABLES `hesk_mfa_backup_codes` WRITE;
/*!40000 ALTER TABLE `hesk_mfa_backup_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_mfa_backup_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mfa_verification_tokens`
--

DROP TABLE IF EXISTS `hesk_mfa_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_mfa_verification_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint unsigned NOT NULL,
  `user_type` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'STAFF',
  `verification_token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '2000-01-01 03:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `verification_token` (`verification_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mfa_verification_tokens`
--

LOCK TABLES `hesk_mfa_verification_tokens` WRITE;
/*!40000 ALTER TABLE `hesk_mfa_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_mfa_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_muted_emails`
--

DROP TABLE IF EXISTS `hesk_muted_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_muted_emails` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `muted_by` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_muted_emails`
--

LOCK TABLES `hesk_muted_emails` WRITE;
/*!40000 ALTER TABLE `hesk_muted_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_muted_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_notes`
--

DROP TABLE IF EXISTS `hesk_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_notes` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ticket` mediumint unsigned NOT NULL,
  `who` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_notes`
--

LOCK TABLES `hesk_notes` WRITE;
/*!40000 ALTER TABLE `hesk_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_oauth_providers`
--

DROP TABLE IF EXISTS `hesk_oauth_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_oauth_providers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `authorization_url` text NOT NULL,
  `token_url` text NOT NULL,
  `client_id` text NOT NULL,
  `client_secret` text NOT NULL,
  `scope` text NOT NULL,
  `no_val_ssl` tinyint NOT NULL DEFAULT '0',
  `verified` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_oauth_providers`
--

LOCK TABLES `hesk_oauth_providers` WRITE;
/*!40000 ALTER TABLE `hesk_oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_oauth_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_oauth_tokens`
--

DROP TABLE IF EXISTS `hesk_oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_oauth_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `token_value` text,
  `token_type` varchar(32) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_oauth_tokens`
--

LOCK TABLES `hesk_oauth_tokens` WRITE;
/*!40000 ALTER TABLE `hesk_oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_online`
--

DROP TABLE IF EXISTS `hesk_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_online` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tmp` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_online`
--

LOCK TABLES `hesk_online` WRITE;
/*!40000 ALTER TABLE `hesk_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_pending_customer_email_changes`
--

DROP TABLE IF EXISTS `hesk_pending_customer_email_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_pending_customer_email_changes` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` mediumint unsigned NOT NULL,
  `new_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '2000-01-01 03:00:00',
  PRIMARY KEY (`id`),
  KEY `email` (`new_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_pending_customer_email_changes`
--

LOCK TABLES `hesk_pending_customer_email_changes` WRITE;
/*!40000 ALTER TABLE `hesk_pending_customer_email_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_pending_customer_email_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_permission_group_categories`
--

DROP TABLE IF EXISTS `hesk_permission_group_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_permission_group_categories` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint unsigned NOT NULL,
  `category_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id_category_id` (`group_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_permission_group_categories`
--

LOCK TABLES `hesk_permission_group_categories` WRITE;
/*!40000 ALTER TABLE `hesk_permission_group_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_permission_group_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_permission_group_features`
--

DROP TABLE IF EXISTS `hesk_permission_group_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_permission_group_features` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint unsigned NOT NULL,
  `feature` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id_feature` (`group_id`,`feature`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_permission_group_features`
--

LOCK TABLES `hesk_permission_group_features` WRITE;
/*!40000 ALTER TABLE `hesk_permission_group_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_permission_group_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_permission_group_members`
--

DROP TABLE IF EXISTS `hesk_permission_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_permission_group_members` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id_user_id` (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_permission_group_members`
--

LOCK TABLES `hesk_permission_group_members` WRITE;
/*!40000 ALTER TABLE `hesk_permission_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_permission_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_permission_groups`
--

DROP TABLE IF EXISTS `hesk_permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_permission_groups` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_permission_groups`
--

LOCK TABLES `hesk_permission_groups` WRITE;
/*!40000 ALTER TABLE `hesk_permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_pipe_loops`
--

DROP TABLE IF EXISTS `hesk_pipe_loops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_pipe_loops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hits` smallint unsigned NOT NULL DEFAULT '0',
  `message_hash` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_pipe_loops`
--

LOCK TABLES `hesk_pipe_loops` WRITE;
/*!40000 ALTER TABLE `hesk_pipe_loops` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_pipe_loops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_pipe_rejections`
--

DROP TABLE IF EXISTS `hesk_pipe_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_pipe_rejections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_pipe_rejections`
--

LOCK TABLES `hesk_pipe_rejections` WRITE;
/*!40000 ALTER TABLE `hesk_pipe_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_pipe_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_replies`
--

DROP TABLE IF EXISTS `hesk_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_replies` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `replyto` mediumint unsigned NOT NULL DEFAULT '0',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `staffid` smallint unsigned NOT NULL DEFAULT '0',
  `customer_id` mediumint unsigned DEFAULT NULL,
  `rating` enum('1','5') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `read` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `replyto` (`replyto`),
  KEY `dt` (`dt`),
  KEY `staffid` (`staffid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_replies`
--

LOCK TABLES `hesk_replies` WRITE;
/*!40000 ALTER TABLE `hesk_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_reply_drafts`
--

DROP TABLE IF EXISTS `hesk_reply_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_reply_drafts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner` smallint unsigned NOT NULL,
  `ticket` mediumint unsigned NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_reply_drafts`
--

LOCK TABLES `hesk_reply_drafts` WRITE;
/*!40000 ALTER TABLE `hesk_reply_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reply_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_reset_password`
--

DROP TABLE IF EXISTS `hesk_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_reset_password` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `user` smallint unsigned NOT NULL,
  `hash` char(40) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` varchar(8) NOT NULL DEFAULT 'STAFF',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_reset_password`
--

LOCK TABLES `hesk_reset_password` WRITE;
/*!40000 ALTER TABLE `hesk_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_service_messages`
--

DROP TABLE IF EXISTS `hesk_service_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_service_messages` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `style` enum('0','1','2','3','4') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `order` smallint unsigned NOT NULL DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_service_messages`
--

LOCK TABLES `hesk_service_messages` WRITE;
/*!40000 ALTER TABLE `hesk_service_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_service_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_std_replies`
--

DROP TABLE IF EXISTS `hesk_std_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_std_replies` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reply_order` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_std_replies`
--

LOCK TABLES `hesk_std_replies` WRITE;
/*!40000 ALTER TABLE `hesk_std_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_std_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_temp_attachments`
--

DROP TABLE IF EXISTS `hesk_temp_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_temp_attachments` (
  `att_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int unsigned NOT NULL DEFAULT '0',
  `expires_at` timestamp NOT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_temp_attachments`
--

LOCK TABLES `hesk_temp_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_temp_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_temp_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_temp_attachments_limits`
--

DROP TABLE IF EXISTS `hesk_temp_attachments_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_temp_attachments_limits` (
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `upload_count` int unsigned NOT NULL DEFAULT '1',
  `last_upload_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_temp_attachments_limits`
--

LOCK TABLES `hesk_temp_attachments_limits` WRITE;
/*!40000 ALTER TABLE `hesk_temp_attachments_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_temp_attachments_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_ticket_templates`
--

DROP TABLE IF EXISTS `hesk_ticket_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_ticket_templates` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tpl_order` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_ticket_templates`
--

LOCK TABLES `hesk_ticket_templates` WRITE;
/*!40000 ALTER TABLE `hesk_ticket_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_ticket_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_ticket_to_collaborator`
--

DROP TABLE IF EXISTS `hesk_ticket_to_collaborator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_ticket_to_collaborator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` mediumint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_ticket_to_collaborator`
--

LOCK TABLES `hesk_ticket_to_collaborator` WRITE;
/*!40000 ALTER TABLE `hesk_ticket_to_collaborator` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_ticket_to_collaborator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_ticket_to_customer`
--

DROP TABLE IF EXISTS `hesk_ticket_to_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_ticket_to_customer` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` mediumint unsigned NOT NULL,
  `customer_id` mediumint unsigned NOT NULL,
  `customer_type` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'REQUESTER',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_ticket_to_customer`
--

LOCK TABLES `hesk_ticket_to_customer` WRITE;
/*!40000 ALTER TABLE `hesk_ticket_to_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_ticket_to_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_tickets`
--

DROP TABLE IF EXISTS `hesk_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_tickets` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `trackid` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `u_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `u_email` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `category` smallint unsigned NOT NULL DEFAULT '1',
  `priority` tinyint unsigned NOT NULL DEFAULT '3',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT '2000-01-01 03:00:00',
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstreply` timestamp NULL DEFAULT NULL,
  `closedat` timestamp NULL DEFAULT NULL,
  `articles` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `openedby` mediumint DEFAULT '0',
  `firstreplyby` smallint unsigned DEFAULT NULL,
  `closedby` mediumint DEFAULT NULL,
  `replies` smallint unsigned NOT NULL DEFAULT '0',
  `staffreplies` smallint unsigned NOT NULL DEFAULT '0',
  `owner` smallint unsigned NOT NULL DEFAULT '0',
  `assignedby` mediumint DEFAULT NULL,
  `time_worked` time NOT NULL DEFAULT '00:00:00',
  `lastreplier` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `replierid` smallint unsigned DEFAULT NULL,
  `archive` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `locked` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `merged` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `history` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom1` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom2` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom3` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom4` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom5` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom6` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom7` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom8` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom9` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom10` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom11` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom12` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom13` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom14` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom15` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom16` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom17` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom18` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom19` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom20` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom21` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom22` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom23` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom24` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom25` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom26` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom27` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom28` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom29` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom30` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom31` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom32` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom33` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom34` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom35` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom36` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom37` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom38` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom39` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom40` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom41` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom42` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom43` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom44` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom45` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom46` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom47` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom48` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom49` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom50` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom51` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom52` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom53` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom54` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom55` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom56` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom57` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom58` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom59` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom60` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom61` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom62` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom63` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom64` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom65` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom66` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom67` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom68` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom69` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom70` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom71` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom72` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom73` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom74` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom75` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom76` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom77` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom78` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom79` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom80` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom81` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom82` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom83` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom84` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom85` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom86` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom87` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom88` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom89` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom90` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom91` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom92` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom93` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom94` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom95` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom96` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom97` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom98` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom99` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom100` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `overdue_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trackid` (`trackid`),
  KEY `archive` (`archive`),
  KEY `categories` (`category`),
  KEY `statuses` (`status`),
  KEY `owner` (`owner`),
  KEY `openedby` (`openedby`,`firstreplyby`,`closedby`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_tickets`
--

LOCK TABLES `hesk_tickets` WRITE;
/*!40000 ALTER TABLE `hesk_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_users`
--

DROP TABLE IF EXISTS `hesk_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hesk_users` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `isadmin` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `active` smallint NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `signature` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `categories` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `afterreply` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `autostart` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `autoreload` smallint unsigned NOT NULL DEFAULT '0',
  `notify_customer_new` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_reply` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `show_suggested` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_assigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_pm` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_note` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_approval` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `notify_collaborator_added` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_collaborator_customer_reply` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_collaborator_staff_reply` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `notify_collaborator_note` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_collaborator_resolved` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `notify_collaborator_overdue` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `default_list` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `autoassign` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `heskprivileges` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ratingneg` mediumint unsigned NOT NULL DEFAULT '0',
  `ratingpos` mediumint unsigned NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `replies` mediumint unsigned NOT NULL DEFAULT '0',
  `mfa_enrollment` smallint unsigned NOT NULL DEFAULT '0',
  `mfa_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autoassign` (`autoassign`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_users`
--

LOCK TABLES `hesk_users` WRITE;
/*!40000 ALTER TABLE `hesk_users` DISABLE KEYS */;
INSERT INTO `hesk_users` VALUES (1,'Admin','$2y$10$Rey8M.9UaVnE1eiwpjMvae655cGaqAVdFiWWwCRCjNbt.uI8Qg2oW','1',1,'Admin','niicolas.emporiio@gmail.com','','',NULL,'','0','1',0,'1','1','1','1','1','1','1','1','1','1','1','1','0','1','1','0','1','0','1','','1','',0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `hesk_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08  8:53:18
