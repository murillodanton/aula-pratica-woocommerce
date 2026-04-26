/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: woocommerce_db
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 10,
  `args` varchar(191) DEFAULT NULL,
  `schedule` longtext DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_priority_scheduled_date_gmt` (`claim_id`,`status`,`priority`,`scheduled_date_gmt`),
  KEY `status_last_attempt_gmt` (`status`,`last_attempt_gmt`),
  KEY `status_claim_id` (`status`,`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES
(6,'action_scheduler/migration_hook','pending','2026-04-25 20:57:48','2026-04-25 17:57:48',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777150668;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777150668;}',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(7,'woocommerce_delete_legacy_report_transients','pending','2026-04-25 22:14:20','2026-04-25 19:14:20',10,'[0,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777155260;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777155260;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(8,'wc-admin_import_orders','pending','2026-04-25 22:13:26','2026-04-25 19:13:26',10,'[21]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777155206;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777155206;}',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(9,'wc-admin_import_orders','pending','2026-04-25 22:13:26','2026-04-25 19:13:26',10,'[22]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777155206;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777155206;}',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(10,'wc_schedule_pending_batch_processes','pending','2026-04-25 22:33:53','2026-04-25 19:33:53',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777156433;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777156433;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(11,'wc-admin_import_orders','pending','2026-04-26 00:15:27','2026-04-25 21:15:27',10,'[35]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777162527;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777162527;}',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES
(1,'action-scheduler-migration'),
(2,'woocommerce'),
(3,'wc-admin-data'),
(4,'wc_batch_processes');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES
(1,6,'action created','2026-04-25 20:56:48','2026-04-25 17:56:48'),
(2,7,'action created','2026-04-25 22:13:20','2026-04-25 19:13:20'),
(3,8,'action created','2026-04-25 22:13:21','2026-04-25 19:13:21'),
(4,9,'action created','2026-04-25 22:13:21','2026-04-25 19:13:21'),
(5,10,'ação criada','2026-04-25 22:33:53','2026-04-25 19:33:53'),
(6,11,'ação criada','2026-04-26 00:15:22','2026-04-25 21:15:22');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
INSERT INTO `wp_commentmeta` VALUES
(1,2,'note_group','product_stock'),
(2,3,'note_group','product_stock'),
(3,4,'note_group','order_update');
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`),
  KEY `woo_idx_comment_date_type` (`comment_date_gmt`,`comment_type`,`comment_approved`,`comment_post_ID`),
  KEY `woo_idx_comment_approved_type` (`comment_approved`,`comment_type`,`comment_post_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2026-04-25 20:45:40','2026-04-25 20:45:40','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0),
(2,22,'WooCommerce','','','','2026-04-25 19:33:50','2026-04-25 22:33:50','Retenção de estoque de 60 minutos aplicada a: <br>- Pijama Azul (#14) × 1',0,'1','WooCommerce','order_note',0,0),
(3,22,'WooCommerce','','','','2026-04-25 19:33:50','2026-04-25 22:33:50','Níveis de estoque reduzidos: Pijama Azul (10&rarr;9)',0,'1','WooCommerce','order_note',0,0),
(4,22,'WooCommerce','','','','2026-04-25 19:33:50','2026-04-25 22:33:50','O pagamento será efetuado no momento da entrega. Status do pedido alterado de Pagamento pendente para Processando.',0,'1','WooCommerce','order_note',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:11:{i:1777149943;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777149946;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1777150557;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1777150588;a:2:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:20:\"jetpack_v2_heartbeat\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777150593;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777150682;a:1:{s:30:\"wp_1_wc_regenerate_images_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:39:\"wp_1_wc_regenerate_images_cron_interval\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}}i:1777153539;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777155339;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777157139;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777236343;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','http://localhost:8080','on'),
(3,'home','http://localhost:8080','on'),
(4,'blogname','Loja Pijamas','on'),
(5,'blogdescription','Loja online de pijamas - aula prática','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','murillodantondlc@gmail.com','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','/%postname%/','on'),
(30,'rewrite_rules','a:188:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:21:\"^wc/file/transient/?$\";s:33:\"index.php?wc-transient-file-name=\";s:24:\"^wc/file/transient/(.+)$\";s:44:\"index.php?wc-transient-file-name=$matches[1]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:15:\"^checkout-link$\";s:28:\"index.php?checkout-link=true\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:43:\"category/(.+?)/wc/file/transient(/(.*))?/?$\";s:65:\"index.php?category_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:40:\"tag/([^/]+)/wc/file/transient(/(.*))?/?$\";s:55:\"index.php?tag=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:44:\"brand/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:39:\"brand/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:20:\"brand/(.+?)/embed/?$\";s:46:\"index.php?product_brand=$matches[1]&embed=true\";s:32:\"brand/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?product_brand=$matches[1]&paged=$matches[2]\";s:14:\"brand/(.+?)/?$\";s:35:\"index.php?product_brand=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:44:\"product/([^/]+)/wc/file/transient(/(.*))?/?$\";s:59:\"index.php?product=$matches[1]&wc/file/transient=$matches[3]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:61:\"product/[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:24:\"index.php??sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=6&cpage=$matches[1]\";s:28:\"wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:37:\"comments/wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:40:\"search/(.+)/wc/file/transient(/(.*))?/?$\";s:53:\"index.php?s=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:43:\"author/([^/]+)/wc/file/transient(/(.*))?/?$\";s:63:\"index.php?author_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:93:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc/file/transient=$matches[5]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:52:\"([0-9]{4})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:77:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc/file/transient=$matches[4]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:39:\"([0-9]{4})/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?year=$matches[1]&wc/file/transient=$matches[3]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:36:\"(.?.+?)/wc/file/transient(/(.*))?/?$\";s:60:\"index.php?pagename=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:42:\".?.+?/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\".?.+?/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:36:\"([^/]+)/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?name=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\"[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:1:{i:0;s:27:\"woocommerce/woocommerce.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','http://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','storefront','on'),
(42,'stylesheet','storefront','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','58975','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','page','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:0:{}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','America/Sao_Paulo','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','6','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','0','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1792701939','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'initial_db_version','58975','on'),
(102,'wp_user_roles','a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:115:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:93:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}','on'),
(103,'fresh_site','0','off'),
(104,'user_count','1','off'),
(105,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(106,'sidebars_widgets','a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:8:\"header-1\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}s:13:\"array_version\";i:3;}','auto'),
(107,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(108,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"6.8.3\";s:5:\"files\";a:536:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:21:\"button/editor-rtl.css\";i:29;s:25:\"button/editor-rtl.min.css\";i:30;s:17:\"button/editor.css\";i:31;s:21:\"button/editor.min.css\";i:32;s:20:\"button/style-rtl.css\";i:33;s:24:\"button/style-rtl.min.css\";i:34;s:16:\"button/style.css\";i:35;s:20:\"button/style.min.css\";i:36;s:22:\"buttons/editor-rtl.css\";i:37;s:26:\"buttons/editor-rtl.min.css\";i:38;s:18:\"buttons/editor.css\";i:39;s:22:\"buttons/editor.min.css\";i:40;s:21:\"buttons/style-rtl.css\";i:41;s:25:\"buttons/style-rtl.min.css\";i:42;s:17:\"buttons/style.css\";i:43;s:21:\"buttons/style.min.css\";i:44;s:22:\"calendar/style-rtl.css\";i:45;s:26:\"calendar/style-rtl.min.css\";i:46;s:18:\"calendar/style.css\";i:47;s:22:\"calendar/style.min.css\";i:48;s:25:\"categories/editor-rtl.css\";i:49;s:29:\"categories/editor-rtl.min.css\";i:50;s:21:\"categories/editor.css\";i:51;s:25:\"categories/editor.min.css\";i:52;s:24:\"categories/style-rtl.css\";i:53;s:28:\"categories/style-rtl.min.css\";i:54;s:20:\"categories/style.css\";i:55;s:24:\"categories/style.min.css\";i:56;s:19:\"code/editor-rtl.css\";i:57;s:23:\"code/editor-rtl.min.css\";i:58;s:15:\"code/editor.css\";i:59;s:19:\"code/editor.min.css\";i:60;s:18:\"code/style-rtl.css\";i:61;s:22:\"code/style-rtl.min.css\";i:62;s:14:\"code/style.css\";i:63;s:18:\"code/style.min.css\";i:64;s:18:\"code/theme-rtl.css\";i:65;s:22:\"code/theme-rtl.min.css\";i:66;s:14:\"code/theme.css\";i:67;s:18:\"code/theme.min.css\";i:68;s:22:\"columns/editor-rtl.css\";i:69;s:26:\"columns/editor-rtl.min.css\";i:70;s:18:\"columns/editor.css\";i:71;s:22:\"columns/editor.min.css\";i:72;s:21:\"columns/style-rtl.css\";i:73;s:25:\"columns/style-rtl.min.css\";i:74;s:17:\"columns/style.css\";i:75;s:21:\"columns/style.min.css\";i:76;s:33:\"comment-author-name/style-rtl.css\";i:77;s:37:\"comment-author-name/style-rtl.min.css\";i:78;s:29:\"comment-author-name/style.css\";i:79;s:33:\"comment-author-name/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:26:\"comment-date/style-rtl.css\";i:85;s:30:\"comment-date/style-rtl.min.css\";i:86;s:22:\"comment-date/style.css\";i:87;s:26:\"comment-date/style.min.css\";i:88;s:31:\"comment-edit-link/style-rtl.css\";i:89;s:35:\"comment-edit-link/style-rtl.min.css\";i:90;s:27:\"comment-edit-link/style.css\";i:91;s:31:\"comment-edit-link/style.min.css\";i:92;s:32:\"comment-reply-link/style-rtl.css\";i:93;s:36:\"comment-reply-link/style-rtl.min.css\";i:94;s:28:\"comment-reply-link/style.css\";i:95;s:32:\"comment-reply-link/style.min.css\";i:96;s:30:\"comment-template/style-rtl.css\";i:97;s:34:\"comment-template/style-rtl.min.css\";i:98;s:26:\"comment-template/style.css\";i:99;s:30:\"comment-template/style.min.css\";i:100;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:101;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:102;s:38:\"comments-pagination-numbers/editor.css\";i:103;s:42:\"comments-pagination-numbers/editor.min.css\";i:104;s:34:\"comments-pagination/editor-rtl.css\";i:105;s:38:\"comments-pagination/editor-rtl.min.css\";i:106;s:30:\"comments-pagination/editor.css\";i:107;s:34:\"comments-pagination/editor.min.css\";i:108;s:33:\"comments-pagination/style-rtl.css\";i:109;s:37:\"comments-pagination/style-rtl.min.css\";i:110;s:29:\"comments-pagination/style.css\";i:111;s:33:\"comments-pagination/style.min.css\";i:112;s:29:\"comments-title/editor-rtl.css\";i:113;s:33:\"comments-title/editor-rtl.min.css\";i:114;s:25:\"comments-title/editor.css\";i:115;s:29:\"comments-title/editor.min.css\";i:116;s:23:\"comments/editor-rtl.css\";i:117;s:27:\"comments/editor-rtl.min.css\";i:118;s:19:\"comments/editor.css\";i:119;s:23:\"comments/editor.min.css\";i:120;s:22:\"comments/style-rtl.css\";i:121;s:26:\"comments/style-rtl.min.css\";i:122;s:18:\"comments/style.css\";i:123;s:22:\"comments/style.min.css\";i:124;s:20:\"cover/editor-rtl.css\";i:125;s:24:\"cover/editor-rtl.min.css\";i:126;s:16:\"cover/editor.css\";i:127;s:20:\"cover/editor.min.css\";i:128;s:19:\"cover/style-rtl.css\";i:129;s:23:\"cover/style-rtl.min.css\";i:130;s:15:\"cover/style.css\";i:131;s:19:\"cover/style.min.css\";i:132;s:22:\"details/editor-rtl.css\";i:133;s:26:\"details/editor-rtl.min.css\";i:134;s:18:\"details/editor.css\";i:135;s:22:\"details/editor.min.css\";i:136;s:21:\"details/style-rtl.css\";i:137;s:25:\"details/style-rtl.min.css\";i:138;s:17:\"details/style.css\";i:139;s:21:\"details/style.min.css\";i:140;s:20:\"embed/editor-rtl.css\";i:141;s:24:\"embed/editor-rtl.min.css\";i:142;s:16:\"embed/editor.css\";i:143;s:20:\"embed/editor.min.css\";i:144;s:19:\"embed/style-rtl.css\";i:145;s:23:\"embed/style-rtl.min.css\";i:146;s:15:\"embed/style.css\";i:147;s:19:\"embed/style.min.css\";i:148;s:19:\"embed/theme-rtl.css\";i:149;s:23:\"embed/theme-rtl.min.css\";i:150;s:15:\"embed/theme.css\";i:151;s:19:\"embed/theme.min.css\";i:152;s:19:\"file/editor-rtl.css\";i:153;s:23:\"file/editor-rtl.min.css\";i:154;s:15:\"file/editor.css\";i:155;s:19:\"file/editor.min.css\";i:156;s:18:\"file/style-rtl.css\";i:157;s:22:\"file/style-rtl.min.css\";i:158;s:14:\"file/style.css\";i:159;s:18:\"file/style.min.css\";i:160;s:23:\"footnotes/style-rtl.css\";i:161;s:27:\"footnotes/style-rtl.min.css\";i:162;s:19:\"footnotes/style.css\";i:163;s:23:\"footnotes/style.min.css\";i:164;s:23:\"freeform/editor-rtl.css\";i:165;s:27:\"freeform/editor-rtl.min.css\";i:166;s:19:\"freeform/editor.css\";i:167;s:23:\"freeform/editor.min.css\";i:168;s:22:\"gallery/editor-rtl.css\";i:169;s:26:\"gallery/editor-rtl.min.css\";i:170;s:18:\"gallery/editor.css\";i:171;s:22:\"gallery/editor.min.css\";i:172;s:21:\"gallery/style-rtl.css\";i:173;s:25:\"gallery/style-rtl.min.css\";i:174;s:17:\"gallery/style.css\";i:175;s:21:\"gallery/style.min.css\";i:176;s:21:\"gallery/theme-rtl.css\";i:177;s:25:\"gallery/theme-rtl.min.css\";i:178;s:17:\"gallery/theme.css\";i:179;s:21:\"gallery/theme.min.css\";i:180;s:20:\"group/editor-rtl.css\";i:181;s:24:\"group/editor-rtl.min.css\";i:182;s:16:\"group/editor.css\";i:183;s:20:\"group/editor.min.css\";i:184;s:19:\"group/style-rtl.css\";i:185;s:23:\"group/style-rtl.min.css\";i:186;s:15:\"group/style.css\";i:187;s:19:\"group/style.min.css\";i:188;s:19:\"group/theme-rtl.css\";i:189;s:23:\"group/theme-rtl.min.css\";i:190;s:15:\"group/theme.css\";i:191;s:19:\"group/theme.min.css\";i:192;s:21:\"heading/style-rtl.css\";i:193;s:25:\"heading/style-rtl.min.css\";i:194;s:17:\"heading/style.css\";i:195;s:21:\"heading/style.min.css\";i:196;s:19:\"html/editor-rtl.css\";i:197;s:23:\"html/editor-rtl.min.css\";i:198;s:15:\"html/editor.css\";i:199;s:19:\"html/editor.min.css\";i:200;s:20:\"image/editor-rtl.css\";i:201;s:24:\"image/editor-rtl.min.css\";i:202;s:16:\"image/editor.css\";i:203;s:20:\"image/editor.min.css\";i:204;s:19:\"image/style-rtl.css\";i:205;s:23:\"image/style-rtl.min.css\";i:206;s:15:\"image/style.css\";i:207;s:19:\"image/style.min.css\";i:208;s:19:\"image/theme-rtl.css\";i:209;s:23:\"image/theme-rtl.min.css\";i:210;s:15:\"image/theme.css\";i:211;s:19:\"image/theme.min.css\";i:212;s:29:\"latest-comments/style-rtl.css\";i:213;s:33:\"latest-comments/style-rtl.min.css\";i:214;s:25:\"latest-comments/style.css\";i:215;s:29:\"latest-comments/style.min.css\";i:216;s:27:\"latest-posts/editor-rtl.css\";i:217;s:31:\"latest-posts/editor-rtl.min.css\";i:218;s:23:\"latest-posts/editor.css\";i:219;s:27:\"latest-posts/editor.min.css\";i:220;s:26:\"latest-posts/style-rtl.css\";i:221;s:30:\"latest-posts/style-rtl.min.css\";i:222;s:22:\"latest-posts/style.css\";i:223;s:26:\"latest-posts/style.min.css\";i:224;s:18:\"list/style-rtl.css\";i:225;s:22:\"list/style-rtl.min.css\";i:226;s:14:\"list/style.css\";i:227;s:18:\"list/style.min.css\";i:228;s:22:\"loginout/style-rtl.css\";i:229;s:26:\"loginout/style-rtl.min.css\";i:230;s:18:\"loginout/style.css\";i:231;s:22:\"loginout/style.min.css\";i:232;s:25:\"media-text/editor-rtl.css\";i:233;s:29:\"media-text/editor-rtl.min.css\";i:234;s:21:\"media-text/editor.css\";i:235;s:25:\"media-text/editor.min.css\";i:236;s:24:\"media-text/style-rtl.css\";i:237;s:28:\"media-text/style-rtl.min.css\";i:238;s:20:\"media-text/style.css\";i:239;s:24:\"media-text/style.min.css\";i:240;s:19:\"more/editor-rtl.css\";i:241;s:23:\"more/editor-rtl.min.css\";i:242;s:15:\"more/editor.css\";i:243;s:19:\"more/editor.min.css\";i:244;s:30:\"navigation-link/editor-rtl.css\";i:245;s:34:\"navigation-link/editor-rtl.min.css\";i:246;s:26:\"navigation-link/editor.css\";i:247;s:30:\"navigation-link/editor.min.css\";i:248;s:29:\"navigation-link/style-rtl.css\";i:249;s:33:\"navigation-link/style-rtl.min.css\";i:250;s:25:\"navigation-link/style.css\";i:251;s:29:\"navigation-link/style.min.css\";i:252;s:33:\"navigation-submenu/editor-rtl.css\";i:253;s:37:\"navigation-submenu/editor-rtl.min.css\";i:254;s:29:\"navigation-submenu/editor.css\";i:255;s:33:\"navigation-submenu/editor.min.css\";i:256;s:25:\"navigation/editor-rtl.css\";i:257;s:29:\"navigation/editor-rtl.min.css\";i:258;s:21:\"navigation/editor.css\";i:259;s:25:\"navigation/editor.min.css\";i:260;s:24:\"navigation/style-rtl.css\";i:261;s:28:\"navigation/style-rtl.min.css\";i:262;s:20:\"navigation/style.css\";i:263;s:24:\"navigation/style.min.css\";i:264;s:23:\"nextpage/editor-rtl.css\";i:265;s:27:\"nextpage/editor-rtl.min.css\";i:266;s:19:\"nextpage/editor.css\";i:267;s:23:\"nextpage/editor.min.css\";i:268;s:24:\"page-list/editor-rtl.css\";i:269;s:28:\"page-list/editor-rtl.min.css\";i:270;s:20:\"page-list/editor.css\";i:271;s:24:\"page-list/editor.min.css\";i:272;s:23:\"page-list/style-rtl.css\";i:273;s:27:\"page-list/style-rtl.min.css\";i:274;s:19:\"page-list/style.css\";i:275;s:23:\"page-list/style.min.css\";i:276;s:24:\"paragraph/editor-rtl.css\";i:277;s:28:\"paragraph/editor-rtl.min.css\";i:278;s:20:\"paragraph/editor.css\";i:279;s:24:\"paragraph/editor.min.css\";i:280;s:23:\"paragraph/style-rtl.css\";i:281;s:27:\"paragraph/style-rtl.min.css\";i:282;s:19:\"paragraph/style.css\";i:283;s:23:\"paragraph/style.min.css\";i:284;s:35:\"post-author-biography/style-rtl.css\";i:285;s:39:\"post-author-biography/style-rtl.min.css\";i:286;s:31:\"post-author-biography/style.css\";i:287;s:35:\"post-author-biography/style.min.css\";i:288;s:30:\"post-author-name/style-rtl.css\";i:289;s:34:\"post-author-name/style-rtl.min.css\";i:290;s:26:\"post-author-name/style.css\";i:291;s:30:\"post-author-name/style.min.css\";i:292;s:26:\"post-author/editor-rtl.css\";i:293;s:30:\"post-author/editor-rtl.min.css\";i:294;s:22:\"post-author/editor.css\";i:295;s:26:\"post-author/editor.min.css\";i:296;s:25:\"post-author/style-rtl.css\";i:297;s:29:\"post-author/style-rtl.min.css\";i:298;s:21:\"post-author/style.css\";i:299;s:25:\"post-author/style.min.css\";i:300;s:33:\"post-comments-form/editor-rtl.css\";i:301;s:37:\"post-comments-form/editor-rtl.min.css\";i:302;s:29:\"post-comments-form/editor.css\";i:303;s:33:\"post-comments-form/editor.min.css\";i:304;s:32:\"post-comments-form/style-rtl.css\";i:305;s:36:\"post-comments-form/style-rtl.min.css\";i:306;s:28:\"post-comments-form/style.css\";i:307;s:32:\"post-comments-form/style.min.css\";i:308;s:26:\"post-content/style-rtl.css\";i:309;s:30:\"post-content/style-rtl.min.css\";i:310;s:22:\"post-content/style.css\";i:311;s:26:\"post-content/style.min.css\";i:312;s:23:\"post-date/style-rtl.css\";i:313;s:27:\"post-date/style-rtl.min.css\";i:314;s:19:\"post-date/style.css\";i:315;s:23:\"post-date/style.min.css\";i:316;s:27:\"post-excerpt/editor-rtl.css\";i:317;s:31:\"post-excerpt/editor-rtl.min.css\";i:318;s:23:\"post-excerpt/editor.css\";i:319;s:27:\"post-excerpt/editor.min.css\";i:320;s:26:\"post-excerpt/style-rtl.css\";i:321;s:30:\"post-excerpt/style-rtl.min.css\";i:322;s:22:\"post-excerpt/style.css\";i:323;s:26:\"post-excerpt/style.min.css\";i:324;s:34:\"post-featured-image/editor-rtl.css\";i:325;s:38:\"post-featured-image/editor-rtl.min.css\";i:326;s:30:\"post-featured-image/editor.css\";i:327;s:34:\"post-featured-image/editor.min.css\";i:328;s:33:\"post-featured-image/style-rtl.css\";i:329;s:37:\"post-featured-image/style-rtl.min.css\";i:330;s:29:\"post-featured-image/style.css\";i:331;s:33:\"post-featured-image/style.min.css\";i:332;s:34:\"post-navigation-link/style-rtl.css\";i:333;s:38:\"post-navigation-link/style-rtl.min.css\";i:334;s:30:\"post-navigation-link/style.css\";i:335;s:34:\"post-navigation-link/style.min.css\";i:336;s:27:\"post-template/style-rtl.css\";i:337;s:31:\"post-template/style-rtl.min.css\";i:338;s:23:\"post-template/style.css\";i:339;s:27:\"post-template/style.min.css\";i:340;s:24:\"post-terms/style-rtl.css\";i:341;s:28:\"post-terms/style-rtl.min.css\";i:342;s:20:\"post-terms/style.css\";i:343;s:24:\"post-terms/style.min.css\";i:344;s:24:\"post-title/style-rtl.css\";i:345;s:28:\"post-title/style-rtl.min.css\";i:346;s:20:\"post-title/style.css\";i:347;s:24:\"post-title/style.min.css\";i:348;s:26:\"preformatted/style-rtl.css\";i:349;s:30:\"preformatted/style-rtl.min.css\";i:350;s:22:\"preformatted/style.css\";i:351;s:26:\"preformatted/style.min.css\";i:352;s:24:\"pullquote/editor-rtl.css\";i:353;s:28:\"pullquote/editor-rtl.min.css\";i:354;s:20:\"pullquote/editor.css\";i:355;s:24:\"pullquote/editor.min.css\";i:356;s:23:\"pullquote/style-rtl.css\";i:357;s:27:\"pullquote/style-rtl.min.css\";i:358;s:19:\"pullquote/style.css\";i:359;s:23:\"pullquote/style.min.css\";i:360;s:23:\"pullquote/theme-rtl.css\";i:361;s:27:\"pullquote/theme-rtl.min.css\";i:362;s:19:\"pullquote/theme.css\";i:363;s:23:\"pullquote/theme.min.css\";i:364;s:39:\"query-pagination-numbers/editor-rtl.css\";i:365;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:366;s:35:\"query-pagination-numbers/editor.css\";i:367;s:39:\"query-pagination-numbers/editor.min.css\";i:368;s:31:\"query-pagination/editor-rtl.css\";i:369;s:35:\"query-pagination/editor-rtl.min.css\";i:370;s:27:\"query-pagination/editor.css\";i:371;s:31:\"query-pagination/editor.min.css\";i:372;s:30:\"query-pagination/style-rtl.css\";i:373;s:34:\"query-pagination/style-rtl.min.css\";i:374;s:26:\"query-pagination/style.css\";i:375;s:30:\"query-pagination/style.min.css\";i:376;s:25:\"query-title/style-rtl.css\";i:377;s:29:\"query-title/style-rtl.min.css\";i:378;s:21:\"query-title/style.css\";i:379;s:25:\"query-title/style.min.css\";i:380;s:25:\"query-total/style-rtl.css\";i:381;s:29:\"query-total/style-rtl.min.css\";i:382;s:21:\"query-total/style.css\";i:383;s:25:\"query-total/style.min.css\";i:384;s:20:\"query/editor-rtl.css\";i:385;s:24:\"query/editor-rtl.min.css\";i:386;s:16:\"query/editor.css\";i:387;s:20:\"query/editor.min.css\";i:388;s:19:\"quote/style-rtl.css\";i:389;s:23:\"quote/style-rtl.min.css\";i:390;s:15:\"quote/style.css\";i:391;s:19:\"quote/style.min.css\";i:392;s:19:\"quote/theme-rtl.css\";i:393;s:23:\"quote/theme-rtl.min.css\";i:394;s:15:\"quote/theme.css\";i:395;s:19:\"quote/theme.min.css\";i:396;s:23:\"read-more/style-rtl.css\";i:397;s:27:\"read-more/style-rtl.min.css\";i:398;s:19:\"read-more/style.css\";i:399;s:23:\"read-more/style.min.css\";i:400;s:18:\"rss/editor-rtl.css\";i:401;s:22:\"rss/editor-rtl.min.css\";i:402;s:14:\"rss/editor.css\";i:403;s:18:\"rss/editor.min.css\";i:404;s:17:\"rss/style-rtl.css\";i:405;s:21:\"rss/style-rtl.min.css\";i:406;s:13:\"rss/style.css\";i:407;s:17:\"rss/style.min.css\";i:408;s:21:\"search/editor-rtl.css\";i:409;s:25:\"search/editor-rtl.min.css\";i:410;s:17:\"search/editor.css\";i:411;s:21:\"search/editor.min.css\";i:412;s:20:\"search/style-rtl.css\";i:413;s:24:\"search/style-rtl.min.css\";i:414;s:16:\"search/style.css\";i:415;s:20:\"search/style.min.css\";i:416;s:20:\"search/theme-rtl.css\";i:417;s:24:\"search/theme-rtl.min.css\";i:418;s:16:\"search/theme.css\";i:419;s:20:\"search/theme.min.css\";i:420;s:24:\"separator/editor-rtl.css\";i:421;s:28:\"separator/editor-rtl.min.css\";i:422;s:20:\"separator/editor.css\";i:423;s:24:\"separator/editor.min.css\";i:424;s:23:\"separator/style-rtl.css\";i:425;s:27:\"separator/style-rtl.min.css\";i:426;s:19:\"separator/style.css\";i:427;s:23:\"separator/style.min.css\";i:428;s:23:\"separator/theme-rtl.css\";i:429;s:27:\"separator/theme-rtl.min.css\";i:430;s:19:\"separator/theme.css\";i:431;s:23:\"separator/theme.min.css\";i:432;s:24:\"shortcode/editor-rtl.css\";i:433;s:28:\"shortcode/editor-rtl.min.css\";i:434;s:20:\"shortcode/editor.css\";i:435;s:24:\"shortcode/editor.min.css\";i:436;s:24:\"site-logo/editor-rtl.css\";i:437;s:28:\"site-logo/editor-rtl.min.css\";i:438;s:20:\"site-logo/editor.css\";i:439;s:24:\"site-logo/editor.min.css\";i:440;s:23:\"site-logo/style-rtl.css\";i:441;s:27:\"site-logo/style-rtl.min.css\";i:442;s:19:\"site-logo/style.css\";i:443;s:23:\"site-logo/style.min.css\";i:444;s:27:\"site-tagline/editor-rtl.css\";i:445;s:31:\"site-tagline/editor-rtl.min.css\";i:446;s:23:\"site-tagline/editor.css\";i:447;s:27:\"site-tagline/editor.min.css\";i:448;s:26:\"site-tagline/style-rtl.css\";i:449;s:30:\"site-tagline/style-rtl.min.css\";i:450;s:22:\"site-tagline/style.css\";i:451;s:26:\"site-tagline/style.min.css\";i:452;s:25:\"site-title/editor-rtl.css\";i:453;s:29:\"site-title/editor-rtl.min.css\";i:454;s:21:\"site-title/editor.css\";i:455;s:25:\"site-title/editor.min.css\";i:456;s:24:\"site-title/style-rtl.css\";i:457;s:28:\"site-title/style-rtl.min.css\";i:458;s:20:\"site-title/style.css\";i:459;s:24:\"site-title/style.min.css\";i:460;s:26:\"social-link/editor-rtl.css\";i:461;s:30:\"social-link/editor-rtl.min.css\";i:462;s:22:\"social-link/editor.css\";i:463;s:26:\"social-link/editor.min.css\";i:464;s:27:\"social-links/editor-rtl.css\";i:465;s:31:\"social-links/editor-rtl.min.css\";i:466;s:23:\"social-links/editor.css\";i:467;s:27:\"social-links/editor.min.css\";i:468;s:26:\"social-links/style-rtl.css\";i:469;s:30:\"social-links/style-rtl.min.css\";i:470;s:22:\"social-links/style.css\";i:471;s:26:\"social-links/style.min.css\";i:472;s:21:\"spacer/editor-rtl.css\";i:473;s:25:\"spacer/editor-rtl.min.css\";i:474;s:17:\"spacer/editor.css\";i:475;s:21:\"spacer/editor.min.css\";i:476;s:20:\"spacer/style-rtl.css\";i:477;s:24:\"spacer/style-rtl.min.css\";i:478;s:16:\"spacer/style.css\";i:479;s:20:\"spacer/style.min.css\";i:480;s:20:\"table/editor-rtl.css\";i:481;s:24:\"table/editor-rtl.min.css\";i:482;s:16:\"table/editor.css\";i:483;s:20:\"table/editor.min.css\";i:484;s:19:\"table/style-rtl.css\";i:485;s:23:\"table/style-rtl.min.css\";i:486;s:15:\"table/style.css\";i:487;s:19:\"table/style.min.css\";i:488;s:19:\"table/theme-rtl.css\";i:489;s:23:\"table/theme-rtl.min.css\";i:490;s:15:\"table/theme.css\";i:491;s:19:\"table/theme.min.css\";i:492;s:24:\"tag-cloud/editor-rtl.css\";i:493;s:28:\"tag-cloud/editor-rtl.min.css\";i:494;s:20:\"tag-cloud/editor.css\";i:495;s:24:\"tag-cloud/editor.min.css\";i:496;s:23:\"tag-cloud/style-rtl.css\";i:497;s:27:\"tag-cloud/style-rtl.min.css\";i:498;s:19:\"tag-cloud/style.css\";i:499;s:23:\"tag-cloud/style.min.css\";i:500;s:28:\"template-part/editor-rtl.css\";i:501;s:32:\"template-part/editor-rtl.min.css\";i:502;s:24:\"template-part/editor.css\";i:503;s:28:\"template-part/editor.min.css\";i:504;s:27:\"template-part/theme-rtl.css\";i:505;s:31:\"template-part/theme-rtl.min.css\";i:506;s:23:\"template-part/theme.css\";i:507;s:27:\"template-part/theme.min.css\";i:508;s:30:\"term-description/style-rtl.css\";i:509;s:34:\"term-description/style-rtl.min.css\";i:510;s:26:\"term-description/style.css\";i:511;s:30:\"term-description/style.min.css\";i:512;s:27:\"text-columns/editor-rtl.css\";i:513;s:31:\"text-columns/editor-rtl.min.css\";i:514;s:23:\"text-columns/editor.css\";i:515;s:27:\"text-columns/editor.min.css\";i:516;s:26:\"text-columns/style-rtl.css\";i:517;s:30:\"text-columns/style-rtl.min.css\";i:518;s:22:\"text-columns/style.css\";i:519;s:26:\"text-columns/style.min.css\";i:520;s:19:\"verse/style-rtl.css\";i:521;s:23:\"verse/style-rtl.min.css\";i:522;s:15:\"verse/style.css\";i:523;s:19:\"verse/style.min.css\";i:524;s:20:\"video/editor-rtl.css\";i:525;s:24:\"video/editor-rtl.min.css\";i:526;s:16:\"video/editor.css\";i:527;s:20:\"video/editor.min.css\";i:528;s:19:\"video/style-rtl.css\";i:529;s:23:\"video/style-rtl.min.css\";i:530;s:15:\"video/style.css\";i:531;s:19:\"video/style.min.css\";i:532;s:19:\"video/theme-rtl.css\";i:533;s:23:\"video/theme-rtl.min.css\";i:534;s:15:\"video/theme.css\";i:535;s:19:\"video/theme.min.css\";}}','on'),
(124,'_transient_doing_cron','1777163175.9806330204010009765625','on'),
(125,'WPLANG','pt_BR','auto'),
(126,'theme_mods_twentytwentyfive','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1777150660;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(127,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"cff496f44febc3f8774d24347fc208a9\";s:6:\"blocks\";a:5:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:12:\"core/columns\";s:0:\"\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on'),
(134,'action_scheduler_hybrid_store_demarkation','5','auto'),
(135,'schema-ActionScheduler_StoreSchema','8.0.1777150557','auto'),
(136,'schema-ActionScheduler_LoggerSchema','3.0.1777150557','auto'),
(137,'_transient_timeout_as-post-store-dependencies-met','1777236957','off'),
(138,'_transient_as-post-store-dependencies-met','yes','off'),
(142,'woocommerce_newly_installed','yes','auto'),
(143,'woocommerce_order_stats_has_fulfillment_column','no','off'),
(144,'woocommerce_schema_version','920','auto'),
(145,'woocommerce_store_address','Rua das Flores, 123','on'),
(146,'woocommerce_store_address_2','','on'),
(147,'woocommerce_store_city','Paraisópolis','on'),
(148,'woocommerce_default_country','BR:MG','on'),
(149,'woocommerce_store_postcode','37960-000','on'),
(150,'woocommerce_allowed_countries','all','on'),
(151,'woocommerce_all_except_countries','','on'),
(152,'woocommerce_specific_allowed_countries','','on'),
(153,'woocommerce_ship_to_countries','','on'),
(154,'woocommerce_specific_ship_to_countries','','on'),
(155,'woocommerce_default_customer_address','base','on'),
(156,'woocommerce_address_autocomplete_enabled','no','on'),
(157,'woocommerce_calc_taxes','no','on'),
(158,'woocommerce_enable_coupons','yes','on'),
(159,'woocommerce_calc_discounts_sequentially','no','off'),
(160,'woocommerce_currency','BRL','on'),
(161,'woocommerce_currency_pos','left_space','on'),
(162,'woocommerce_price_thousand_sep','.','on'),
(163,'woocommerce_price_decimal_sep',',','on'),
(164,'woocommerce_price_num_decimals','2','on'),
(165,'woocommerce_shop_page_id','6','on'),
(166,'woocommerce_cart_redirect_after_add','no','on'),
(167,'woocommerce_enable_ajax_add_to_cart','yes','on'),
(168,'woocommerce_placeholder_image','5','on'),
(169,'woocommerce_weight_unit','kg','on'),
(170,'woocommerce_dimension_unit','cm','on'),
(171,'woocommerce_enable_reviews','yes','on'),
(172,'woocommerce_review_rating_verification_label','yes','off'),
(173,'woocommerce_review_rating_verification_required','no','off'),
(174,'woocommerce_enable_review_rating','yes','on'),
(175,'woocommerce_review_rating_required','yes','off'),
(176,'woocommerce_manage_stock','yes','on'),
(177,'woocommerce_hold_stock_minutes','60','off'),
(178,'woocommerce_notify_low_stock','yes','off'),
(179,'woocommerce_notify_no_stock','yes','off'),
(180,'woocommerce_stock_email_recipient','murillodantondlc@gmail.com','off'),
(181,'woocommerce_notify_low_stock_amount','2','off'),
(182,'woocommerce_notify_no_stock_amount','0','on'),
(183,'woocommerce_hide_out_of_stock_items','no','on'),
(184,'woocommerce_stock_format','','on'),
(185,'woocommerce_file_download_method','force','off'),
(186,'woocommerce_downloads_redirect_fallback_allowed','no','off'),
(187,'woocommerce_downloads_require_login','no','off'),
(188,'woocommerce_downloads_grant_access_after_payment','yes','off'),
(189,'woocommerce_downloads_deliver_inline','','off'),
(190,'woocommerce_downloads_add_hash_to_filename','yes','on'),
(191,'woocommerce_downloads_count_partial','yes','on'),
(193,'woocommerce_attribute_lookup_direct_updates','no','on'),
(194,'woocommerce_attribute_lookup_optimized_updates','no','on'),
(195,'woocommerce_product_match_featured_image_by_sku','no','on'),
(196,'woocommerce_prices_include_tax','no','on'),
(197,'woocommerce_tax_based_on','shipping','on'),
(198,'woocommerce_shipping_tax_class','inherit','on'),
(199,'woocommerce_tax_round_at_subtotal','no','on'),
(200,'woocommerce_tax_classes','','on'),
(201,'woocommerce_tax_display_shop','excl','on'),
(202,'woocommerce_tax_display_cart','excl','on'),
(203,'woocommerce_price_display_suffix','','on'),
(204,'woocommerce_tax_total_display','itemized','off'),
(205,'woocommerce_enable_shipping_calc','yes','off'),
(206,'woocommerce_shipping_cost_requires_address','no','on'),
(207,'woocommerce_shipping_hide_rates_when_free','no','off'),
(208,'woocommerce_ship_to_destination','billing','off'),
(209,'woocommerce_shipping_debug_mode','no','on'),
(210,'woocommerce_enable_guest_checkout','yes','off'),
(211,'woocommerce_enable_checkout_login_reminder','no','off'),
(212,'woocommerce_enable_delayed_account_creation','no','off'),
(213,'woocommerce_enable_signup_and_login_from_checkout','no','off'),
(214,'woocommerce_enable_myaccount_registration','no','off'),
(215,'woocommerce_registration_generate_password','yes','off'),
(216,'woocommerce_registration_generate_username','yes','off'),
(217,'woocommerce_erasure_request_removes_order_data','no','off'),
(218,'woocommerce_erasure_request_removes_download_data','no','off'),
(219,'woocommerce_allow_bulk_remove_personal_data','no','off'),
(220,'woocommerce_registration_privacy_policy_text','Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].','on'),
(221,'woocommerce_checkout_privacy_policy_text','Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].','on'),
(222,'woocommerce_delete_inactive_accounts','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(223,'woocommerce_trash_pending_orders','','off'),
(224,'woocommerce_trash_failed_orders','','off'),
(225,'woocommerce_trash_cancelled_orders','','off'),
(226,'woocommerce_anonymize_refunded_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(227,'woocommerce_anonymize_completed_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(228,'woocommerce_email_from_address','murillodantondlc@gmail.com','off'),
(229,'woocommerce_email_header_image','','off'),
(230,'woocommerce_email_header_image_width','120','on'),
(231,'woocommerce_email_header_alignment','left','on'),
(232,'woocommerce_email_font_family','Helvetica','on'),
(233,'woocommerce_email_footer_text','{site_title}<br />{store_address}','off'),
(234,'woocommerce_email_base_color','#720eec','off'),
(235,'woocommerce_email_background_color','#f7f7f7','off'),
(236,'woocommerce_email_body_background_color','#ffffff','off'),
(237,'woocommerce_email_text_color','#3c3c3c','off'),
(238,'woocommerce_email_footer_text_color','#3c3c3c','off'),
(239,'woocommerce_email_auto_sync_with_theme','no','off'),
(240,'woocommerce_pos_store_address','','on'),
(241,'woocommerce_pos_store_phone','','on'),
(242,'woocommerce_pos_store_email','murillodantondlc@gmail.com','on'),
(243,'woocommerce_pos_refund_returns_policy','','on'),
(244,'woocommerce_cart_page_id','7','off'),
(245,'woocommerce_checkout_page_id','8','off'),
(246,'woocommerce_myaccount_page_id','9','off'),
(247,'woocommerce_terms_page_id','','off'),
(248,'woocommerce_force_ssl_checkout','no','on'),
(249,'woocommerce_unforce_ssl_checkout','no','on'),
(250,'woocommerce_checkout_pay_endpoint','order-pay','on'),
(251,'woocommerce_checkout_order_received_endpoint','order-received','on'),
(252,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','on'),
(253,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','on'),
(254,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','on'),
(255,'woocommerce_myaccount_orders_endpoint','orders','on'),
(256,'woocommerce_myaccount_view_order_endpoint','view-order','on'),
(257,'woocommerce_myaccount_downloads_endpoint','downloads','on'),
(258,'woocommerce_myaccount_edit_account_endpoint','edit-account','on'),
(259,'woocommerce_myaccount_edit_address_endpoint','edit-address','on'),
(260,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','on'),
(261,'woocommerce_myaccount_lost_password_endpoint','lost-password','on'),
(262,'woocommerce_logout_endpoint','customer-logout','on'),
(263,'woocommerce_api_enabled','no','on'),
(264,'woocommerce_allow_tracking','no','on'),
(265,'woocommerce_show_marketplace_suggestions','yes','off'),
(266,'woocommerce_custom_orders_table_enabled','no','on'),
(267,'woocommerce_analytics_enabled','yes','on'),
(268,'woocommerce_feature_rate_limit_checkout_enabled','no','on'),
(269,'woocommerce_feature_order_attribution_enabled','yes','on'),
(270,'woocommerce_feature_site_visibility_badge_enabled','yes','on'),
(271,'woocommerce_hpos_datastore_caching_enabled','no','on'),
(272,'woocommerce_feature_remote_logging_enabled','yes','on'),
(273,'woocommerce_feature_email_improvements_enabled','no','on'),
(274,'_transient_timeout_wc_settings_email_improvements_reverted','1777150585','off'),
(275,'_transient_wc_settings_email_improvements_reverted','yes','off'),
(276,'woocommerce_email_improvements_disabled_count','1','auto'),
(277,'woocommerce_email_improvements_first_disabled_at','2026-04-25 20:56:10','auto'),
(278,'woocommerce_email_improvements_last_disabled_at','2026-04-25 20:56:10','auto'),
(279,'woocommerce_feature_blueprint_enabled','yes','on'),
(280,'woocommerce_feature_cost_of_goods_sold_enabled','no','on'),
(281,'woocommerce_hpos_fts_index_enabled','no','on'),
(282,'woocommerce_feature_block_email_editor_enabled','no','on'),
(283,'woocommerce_feature_point_of_sale_enabled','yes','on'),
(284,'woocommerce_feature_mcp_integration_enabled','no','on'),
(285,'woocommerce_feature_destroy-empty-sessions_enabled','no','on'),
(286,'woocommerce_feature_rest_api_caching_enabled','no','on'),
(287,'woocommerce_feature_product_instance_caching_enabled','no','on'),
(288,'woocommerce_single_image_width','600','on'),
(289,'woocommerce_thumbnail_image_width','300','on'),
(290,'woocommerce_checkout_highlight_required_fields','yes','on'),
(291,'woocommerce_demo_store','no','off'),
(292,'wc_downloads_approved_directories_mode','enabled','auto'),
(293,'woocommerce_permalinks','a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}','auto'),
(294,'current_theme_supports_woocommerce','yes','auto'),
(295,'woocommerce_queue_flush_rewrite_rules','no','auto'),
(296,'_transient_wc_attribute_taxonomies','a:0:{}','on'),
(300,'default_product_cat','15','auto'),
(301,'woocommerce_refund_returns_page_id','10','auto'),
(302,'_transient_timeout__wc_activation_redirect','1777150604','off'),
(303,'_transient__wc_activation_redirect','1','off'),
(304,'woocommerce_paypal_settings','a:25:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:6:\"PayPal\";s:11:\"description\";s:46:\"Pague com PayPal; aceita cartões de crédito.\";s:5:\"email\";s:17:\"[email protected]\";s:8:\"advanced\";s:0:\"\";s:8:\"testmode\";s:3:\"yes\";s:13:\"paymentaction\";s:4:\"sale\";s:14:\"paypal_buttons\";s:3:\"yes\";s:14:\"invoice_prefix\";s:3:\"WC-\";s:13:\"send_shipping\";s:3:\"yes\";s:16:\"address_override\";s:2:\"no\";s:5:\"debug\";s:2:\"no\";s:9:\"image_url\";s:0:\"\";s:16:\"ipn_notification\";s:3:\"yes\";s:14:\"receiver_email\";s:17:\"[email protected]\";s:14:\"identity_token\";s:0:\"\";s:11:\"api_details\";s:0:\"\";s:12:\"api_username\";s:0:\"\";s:12:\"api_password\";s:0:\"\";s:13:\"api_signature\";s:0:\"\";s:20:\"sandbox_api_username\";s:0:\"\";s:20:\"sandbox_api_password\";s:0:\"\";s:21:\"sandbox_api_signature\";s:0:\"\";s:28:\"transact_onboarding_complete\";s:2:\"no\";s:12:\"_should_load\";s:2:\"no\";}','on'),
(305,'woocommerce_version','10.7.0','auto'),
(306,'woocommerce_db_version','10.7.0','auto'),
(307,'woocommerce_store_id','f55fa24f-5507-4b3e-99d4-0a6653c37f60','auto'),
(308,'woocommerce_admin_install_timestamp','1777150574','auto'),
(309,'woocommerce_inbox_variant_assignment','11','auto'),
(310,'woocommerce_remote_variant_assignment','14','auto'),
(311,'woocommerce_attribute_lookup_enabled','no','auto'),
(312,'_transient_timeout__woocommerce_upload_directory_status','1777236974','off'),
(313,'_transient__woocommerce_upload_directory_status','protected','off'),
(314,'_transient_woocommerce_activated_plugin','woocommerce/woocommerce.php','on'),
(315,'_transient_jetpack_autoloader_plugin_paths','a:1:{i:0;s:29:\"{{WP_PLUGIN_DIR}}/woocommerce\";}','on'),
(316,'woocommerce_admin_notices','a:2:{i:0;s:20:\"no_secure_connection\";i:1;s:14:\"template_files\";}','auto'),
(317,'woocommerce_maxmind_geolocation_settings','a:1:{s:15:\"database_prefix\";s:32:\"ElVWYbBr26Rmre1woLf42mycvfsZ9IKo\";}','on'),
(318,'_transient_woocommerce_webhook_ids_status_active','a:0:{}','on'),
(319,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(320,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(321,'widget_woocommerce_layered_nav','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(322,'widget_woocommerce_price_filter','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(323,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(324,'widget_woocommerce_product_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(325,'widget_woocommerce_product_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(326,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(327,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(328,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(329,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(330,'widget_woocommerce_rating_filter','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(331,'widget_wc_brands_brand_description','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(332,'widget_woocommerce_brand_nav','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(333,'widget_wc_brands_brand_thumbnails','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(334,'_site_transient_timeout_woocommerce_blocks_patterns','1779742595','off'),
(335,'_site_transient_woocommerce_blocks_patterns','a:2:{s:7:\"version\";s:6:\"10.7.0\";s:8:\"patterns\";a:41:{i:0;a:11:{s:5:\"title\";s:6:\"Banner\";s:4:\"slug\";s:25:\"woocommerce-blocks/banner\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:10:\"banner.php\";}i:1;a:11:{s:5:\"title\";s:23:\"Coming Soon Entire Site\";s:4:\"slug\";s:35:\"woocommerce/coming-soon-entire-site\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"coming-soon-entire-site.php\";}i:2;a:11:{s:5:\"title\";s:22:\"Coming Soon Store Only\";s:4:\"slug\";s:34:\"woocommerce/coming-soon-store-only\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"coming-soon-store-only.php\";}i:3;a:11:{s:5:\"title\";s:11:\"Coming Soon\";s:4:\"slug\";s:23:\"woocommerce/coming-soon\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:15:\"coming-soon.php\";}i:4;a:11:{s:5:\"title\";s:29:\"Content Right with Image Left\";s:4:\"slug\";s:48:\"woocommerce-blocks/content-right-with-image-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"content-right-image-left.php\";}i:5;a:11:{s:5:\"title\";s:29:\"Featured Category Cover Image\";s:4:\"slug\";s:48:\"woocommerce-blocks/featured-category-cover-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"featured-category-cover-image.php\";}i:6;a:11:{s:5:\"title\";s:24:\"Featured Category Triple\";s:4:\"slug\";s:43:\"woocommerce-blocks/featured-category-triple\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"featured-category-triple.php\";}i:7;a:11:{s:5:\"title\";s:12:\"Large Footer\";s:4:\"slug\";s:31:\"woocommerce-blocks/footer-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"footer-large.php\";}i:8;a:11:{s:5:\"title\";s:23:\"Footer with Simple Menu\";s:4:\"slug\";s:37:\"woocommerce-blocks/footer-simple-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"footer-simple-menu.php\";}i:9;a:11:{s:5:\"title\";s:19:\"Footer with 3 Menus\";s:4:\"slug\";s:38:\"woocommerce-blocks/footer-with-3-menus\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"footer-with-3-menus.php\";}i:10;a:11:{s:5:\"title\";s:28:\"Four Image Grid Content Left\";s:4:\"slug\";s:47:\"woocommerce-blocks/four-image-grid-content-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"four-image-grid-content-left.php\";}i:11;a:11:{s:5:\"title\";s:20:\"Centered Header Menu\";s:4:\"slug\";s:39:\"woocommerce-blocks/header-centered-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-centered-pattern.php\";}i:12;a:11:{s:5:\"title\";s:23:\"Distraction Free Header\";s:4:\"slug\";s:42:\"woocommerce-blocks/header-distraction-free\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-distraction-free.php\";}i:13;a:11:{s:5:\"title\";s:16:\"Essential Header\";s:4:\"slug\";s:35:\"woocommerce-blocks/header-essential\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"header-essential.php\";}i:14;a:11:{s:5:\"title\";s:12:\"Large Header\";s:4:\"slug\";s:31:\"woocommerce-blocks/header-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"header-large.php\";}i:15;a:11:{s:5:\"title\";s:14:\"Minimal Header\";s:4:\"slug\";s:33:\"woocommerce-blocks/header-minimal\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:18:\"header-minimal.php\";}i:16;a:11:{s:5:\"title\";s:46:\"Heading with Three Columns of Content and Link\";s:4:\"slug\";s:66:\"woocommerce-blocks/heading-with-three-columns-of-content-with-link\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:51:\"heading-with-three-columns-of-content-with-link.php\";}i:17;a:11:{s:5:\"title\";s:20:\"Hero Product 3 Split\";s:4:\"slug\";s:39:\"woocommerce-blocks/hero-product-3-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:24:\"hero-product-3-split.php\";}i:18;a:11:{s:5:\"title\";s:23:\"Hero Product Chessboard\";s:4:\"slug\";s:42:\"woocommerce-blocks/hero-product-chessboard\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"hero-product-chessboard.php\";}i:19;a:11:{s:5:\"title\";s:18:\"Hero Product Split\";s:4:\"slug\";s:37:\"woocommerce-blocks/hero-product-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"hero-product-split.php\";}i:20;a:11:{s:5:\"title\";s:33:\"Centered Content with Image Below\";s:4:\"slug\";s:52:\"woocommerce-blocks/centered-content-with-image-below\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:43:\"intro-centered-content-with-image-below.php\";}i:21;a:11:{s:5:\"title\";s:22:\"Just Arrived Full Hero\";s:4:\"slug\";s:41:\"woocommerce-blocks/just-arrived-full-hero\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"just-arrived-full-hero.php\";}i:22;a:11:{s:5:\"title\";s:33:\"No Products Found - Clear Filters\";s:4:\"slug\";s:43:\"woocommerce/no-products-found-clear-filters\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:29:\"no-products-found-filters.php\";}i:23;a:11:{s:5:\"title\";s:17:\"No Products Found\";s:4:\"slug\";s:29:\"woocommerce/no-products-found\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:21:\"no-products-found.php\";}i:24;a:11:{s:5:\"title\";s:19:\"Default Coming Soon\";s:4:\"slug\";s:36:\"woocommerce/page-coming-soon-default\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:28:\"page-coming-soon-default.php\";}i:25;a:11:{s:5:\"title\";s:25:\"Coming Soon Image Gallery\";s:4:\"slug\";s:42:\"woocommerce/page-coming-soon-image-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:34:\"page-coming-soon-image-gallery.php\";}i:26;a:11:{s:5:\"title\";s:30:\"Coming Soon Minimal Left Image\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-minimal-left-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-minimal-left-image.php\";}i:27;a:11:{s:5:\"title\";s:24:\"Coming Soon Modern Black\";s:4:\"slug\";s:41:\"woocommerce/page-coming-soon-modern-black\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:33:\"page-coming-soon-modern-black.php\";}i:28;a:11:{s:5:\"title\";s:29:\"Coming Soon Split Right Image\";s:4:\"slug\";s:46:\"woocommerce/page-coming-soon-split-right-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:38:\"page-coming-soon-split-right-image.php\";}i:29;a:11:{s:5:\"title\";s:34:\"Coming Soon with Header and Footer\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-with-header-footer\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-with-header-footer.php\";}i:30;a:11:{s:5:\"title\";s:28:\"Product Collection 3 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-3-columns.php\";}i:31;a:11:{s:5:\"title\";s:28:\"Product Collection 4 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-4-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-4-columns.php\";}i:32;a:11:{s:5:\"title\";s:28:\"Product Collection 5 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-5-columns.php\";}i:33;a:11:{s:5:\"title\";s:47:\"Product Collection: Featured Products 5 Columns\";s:4:\"slug\";s:65:\"woocommerce-blocks/product-collection-featured-products-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:50:\"product-collection-featured-products-5-columns.php\";}i:34;a:11:{s:5:\"title\";s:15:\"Product Gallery\";s:4:\"slug\";s:48:\"woocommerce-blocks/product-query-product-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:36:\"core/query/woocommerce/product-query\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"product-query-product-gallery.php\";}i:35;a:11:{s:5:\"title\";s:14:\"Product Search\";s:4:\"slug\";s:31:\"woocommerce/product-search-form\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"product-search-form.php\";}i:36;a:11:{s:5:\"title\";s:16:\"Related Products\";s:4:\"slug\";s:35:\"woocommerce-blocks/related-products\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"related-products.php\";}i:37;a:11:{s:5:\"title\";s:33:\"Social: Follow Us on Social Media\";s:4:\"slug\";s:51:\"woocommerce-blocks/social-follow-us-in-social-media\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:25:\"WooCommerce, social-media\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:36:\"social-follow-us-in-social-media.php\";}i:38;a:11:{s:5:\"title\";s:22:\"Testimonials 3 Columns\";s:4:\"slug\";s:41:\"woocommerce-blocks/testimonials-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"testimonials-3-columns.php\";}i:39;a:11:{s:5:\"title\";s:18:\"Testimonial Single\";s:4:\"slug\";s:38:\"woocommerce-blocks/testimonials-single\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"testimonials-single.php\";}i:40;a:11:{s:5:\"title\";s:37:\"Three Columns with Images and Content\";s:4:\"slug\";s:56:\"woocommerce-blocks/three-columns-with-images-and-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:41:\"three-columns-with-images-and-content.php\";}}}','off'),
(336,'woocommerce_checkout_phone_field','optional','auto'),
(337,'woocommerce_checkout_company_field','hidden','auto'),
(338,'woocommerce_checkout_address_2_field','optional','auto'),
(339,'_transient_timeout_woocommerce_blocks_asset_api_script_data','1779748323','off'),
(340,'_transient_woocommerce_blocks_asset_api_script_data','{\"script_data\":{\"assets\\/client\\/blocks\\/wc-settings.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-settings.js\",\"version\":\"a6cb3c938fd270888ce4\",\"dependencies\":[\"wc-types\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-types.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-types.js\",\"version\":\"f0cc692c0367e0930c80\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-entities.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-entities.js\",\"version\":\"cdb01de69fb7dbbbb30f\",\"dependencies\":[\"wc-settings\",\"wp-core-data\",\"wp-data\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-middleware.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-middleware.js\",\"version\":\"d79dedade2f2e4dc9df4\",\"dependencies\":[\"wp-api-fetch\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-data.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-data.js\",\"version\":\"ffb2849a705ee55d810e\",\"dependencies\":[\"wc-blocks-checkout-events\",\"wc-blocks-registry\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-data\",\"wp-data-controls\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-vendors.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-vendors.js\",\"version\":\"9b3f9ad7437063887d6c\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-registry.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-registry.js\",\"version\":\"6436a923b42f4d1b1f6d\",\"dependencies\":[\"react-jsx-runtime\",\"wc-settings\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks.js\",\"version\":\"0db759a8a6e010732c50\",\"dependencies\":[\"react-jsx-runtime\",\"wp-blocks\",\"wp-compose\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-context.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-context.js\",\"version\":\"621353d8a3a7c8d44b41\",\"dependencies\":[\"react-jsx-runtime\",\"wp-element\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\",\"version\":\"c18bbb2325f333897e6b\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-blocks-shared-context\",\"wc-types\",\"wp-data\",\"wp-element\",\"wp-is-shallow-equal\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/price-format.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/price-format.js\",\"version\":\"0df720e448f7ab3c5d0d\",\"dependencies\":[\"wc-settings\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\",\"version\":\"00b931bcc27024fa60ca\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\",\"version\":\"04a71982bb4ef85763c1\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\",\"version\":\"f669b3c33346e637602f\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-checkout.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout.js\",\"version\":\"da57c8c98d31b28d806e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\",\"wp-warning\"]},\"assets\\/client\\/blocks\\/blocks-checkout-events.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout-events.js\",\"version\":\"2d0fd4590f6cc663947c\",\"dependencies\":[\"wc-types\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-components.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-components.js\",\"version\":\"8b64025baef8d338aa5e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\"]},\"assets\\/client\\/blocks\\/wc-schema-parser.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-schema-parser.js\",\"version\":\"f762078aeb4207fe9c3d\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/admin\\/sanitize\\/index.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/sanitize\\/index.js\",\"version\":\"5e942711022623794947\",\"dependencies\":[]},\"assets\\/client\\/admin\\/customer-effort-score\\/index.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/customer-effort-score\\/index.js\",\"version\":\"ed4a4ae27866cf6eafe2\",\"dependencies\":[\"react\",\"wc-experimental\",\"wc-navigation\",\"wc-store-data\",\"wc-tracks\",\"wp-api-fetch\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-data-controls\",\"wp-element\",\"wp-i18n\"]},\"assets\\/client\\/blocks\\/wc-payment-method-paypal.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-payment-method-paypal.js\",\"version\":\"56524a17b39741f984d2\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wp-api-fetch\",\"wp-data\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-payment-method-cod.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-payment-method-cod.js\",\"version\":\"c94f320fb6275390c73d\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/checkout-express-payment-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-express-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-contact-information-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-contact-information-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-method-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-method-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-pickup-options-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-pickup-options-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-address-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-address-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-billing-address-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-billing-address-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-methods-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-methods-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-payment-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-additional-information-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-additional-information-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-note-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-note-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-terms-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-terms-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-actions-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-actions-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-fields-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-fields-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-cart-items-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-cart-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-coupon-form-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-coupon-form-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-subtotal-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-subtotal-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-fee-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-fee-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-discount-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-discount-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-shipping-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-shipping-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-taxes-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-taxes-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-totals-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-totals-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout.js\",\"version\":\"7471eb95867dc92e87b9\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/checkout-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-frontend.js\",\"version\":\"fd3b672b3e6033d2fcf3\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-dom-ready\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/cart-blocks\\/cart-express-payment--checkout-blocks\\/express-payment-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-blocks\\/cart-express-payment--checkout-blocks\\/express-payment-frontend.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-line-items-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-line-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/product-template.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-template.js\",\"version\":\"dc1e6689935eae5616fe\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-shared-context\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-element\",\"wp-i18n\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/product-collection.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-collection.js\",\"version\":\"a0893f120865a60de547\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-registry\",\"wc-customer-effort-score\",\"wc-price-format\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-editor\",\"wp-element\",\"wp-escape-html\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\"]},\"assets\\/client\\/blocks\\/cart-items-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-heading-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-heading-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-coupon-form-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-coupon-form-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-subtotal-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-subtotal-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-fee-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-fee-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-discount-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-discount-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-shipping-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-shipping-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-taxes-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-taxes-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-express-payment-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-express-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/proceed-to-checkout-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/proceed-to-checkout-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-accepted-payment-methods-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-accepted-payment-methods-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-totals-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-totals-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/filled-cart-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/filled-cart-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/product-new.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-new.js\",\"version\":\"dc319ffe83e918c335e2\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-settings\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-element\",\"wp-escape-html\",\"wp-html-entities\",\"wp-i18n\",\"wp-polyfill\",\"wp-primitives\",\"wp-server-side-render\",\"wp-url\"]},\"assets\\/client\\/blocks\\/empty-cart-block.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/empty-cart-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart.js\",\"version\":\"d7aab23deff6ea435917\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-context\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-style-engine\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/cart-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-frontend.js\",\"version\":\"38214368643f2bc1f44d\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-context\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-style-engine\",\"wp-wordcount\"]}},\"version\":\"wc-10.7.0\",\"hash\":\"cf9336202f1d290a7f6d40bb1739786c\"}','off'),
(345,'current_theme','Storefront','auto'),
(346,'theme_switched','','auto'),
(349,'theme_mods_storefront','a:3:{s:18:\"nav_menu_locations\";a:0:{}s:11:\"custom_logo\";s:2:\"33\";s:18:\"custom_css_post_id\";i:-1;}','auto'),
(350,'woocommerce_catalog_rows','4','auto'),
(351,'woocommerce_catalog_columns','3','auto'),
(352,'woocommerce_maybe_regenerate_images_hash','27acde77266b4d2a3491118955cb3f66','auto'),
(353,'wp_1_wc_regenerate_images_batch_940613966f14019ece7cee84ca8cad14','a:1:{i:0;a:1:{s:13:\"attachment_id\";s:1:\"5\";}}','off'),
(354,'woocommerce_onboarding_profile','a:2:{s:9:\"completed\";b:1;s:7:\"skipped\";b:1;}','auto'),
(355,'_transient_woocommerce_product_task_has_product_transient','no','on'),
(357,'woocommerce_default_homepage_layout','two_columns','auto'),
(358,'woocommerce_task_list_hidden_lists','a:1:{i:0;s:5:\"setup\";}','auto'),
(359,'woocommerce_task_list_completed_lists','a:1:{i:0;s:5:\"setup\";}','on'),
(360,'product_cat_children','a:0:{}','auto'),
(361,'_transient_product_query-transient-version','1777156430','on'),
(366,'woocommerce_cod_settings','a:6:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:20:\"Pagamento na entrega\";s:11:\"description\";s:39:\"Pague em dinheiro ao receber o produto.\";s:12:\"instructions\";s:39:\"Pague em dinheiro ao receber o produto.\";s:18:\"enable_for_methods\";a:0:{}s:18:\"enable_for_virtual\";s:2:\"no\";}','auto'),
(367,'_transient_shipping-transient-version','1777156756','on'),
(368,'woocommerce_flat_rate_1_settings','a:3:{s:5:\"title\";s:10:\"Frete fixo\";s:10:\"tax_status\";s:4:\"none\";s:4:\"cost\";s:1:\"5\";}','auto'),
(369,'site_logo','33','auto'),
(370,'_transient_timeout_wc_term_counts','1779745604','off'),
(371,'_transient_wc_term_counts','a:2:{s:14:\"16_product_cat\";i:3;s:14:\"15_product_cat\";i:0;}','off'),
(373,'_transient_timeout_wc_related_12','1777238476','off'),
(374,'_transient_wc_related_12','a:1:{s:50:\"limit=3&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=12\";a:2:{i:0;s:2:\"14\";i:1;s:2:\"16\";}}','off'),
(377,'_transient_timeout_wc_shipping_method_count','1779754498','off'),
(378,'_transient_wc_shipping_method_count','a:4:{s:7:\"version\";s:10:\"1777156756\";s:6:\"legacy\";i:0;s:7:\"enabled\";i:1;s:8:\"disabled\";i:0;}','off'),
(379,'_transient_timeout_woocommerce_block_asset_resource_hints','1777760000','off'),
(380,'_transient_woocommerce_block_asset_resource_hints','a:2:{s:5:\"files\";a:2:{s:13:\"cart-frontend\";a:45:{i:0;a:2:{s:4:\"href\";s:115:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/cart-frontend.js?ver=38214368643f2bc1f44d\";s:2:\"as\";s:6:\"script\";}i:1;a:2:{s:4:\"href\";s:132:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-base-frontend.js?ver=f669b3c33346e637602f\";s:2:\"as\";s:6:\"script\";}i:2;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0\";s:2:\"as\";s:6:\"script\";}i:3;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6\";s:2:\"as\";s:6:\"script\";}i:4;a:2:{s:4:\"href\";s:79:\"http://localhost:8080/wp-includes/js/dist/hooks.min.js?ver=4d63a3d491d11ffd8ac6\";s:2:\"as\";s:6:\"script\";}i:5;a:2:{s:4:\"href\";s:135:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-vendors-frontend.js?ver=04a71982bb4ef85763c1\";s:2:\"as\";s:6:\"script\";}i:6;a:2:{s:4:\"href\";s:74:\"http://localhost:8080/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:7;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/vendor/react-jsx-runtime.min.js?ver=18.3.1\";s:2:\"as\";s:6:\"script\";}i:8;a:2:{s:4:\"href\";s:117:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout.js?ver=da57c8c98d31b28d806e\";s:2:\"as\";s:6:\"script\";}i:9;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:10;a:2:{s:4:\"href\";s:124:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout-events.js?ver=2d0fd4590f6cc663947c\";s:2:\"as\";s:6:\"script\";}i:11;a:2:{s:4:\"href\";s:110:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-types.js?ver=f0cc692c0367e0930c80\";s:2:\"as\";s:6:\"script\";}i:12;a:2:{s:4:\"href\";s:119:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-components.js?ver=8b64025baef8d338aa5e\";s:2:\"as\";s:6:\"script\";}i:13;a:2:{s:4:\"href\";s:116:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-data.js?ver=ffb2849a705ee55d810e\";s:2:\"as\";s:6:\"script\";}i:14;a:2:{s:4:\"href\";s:120:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-registry.js?ver=6436a923b42f4d1b1f6d\";s:2:\"as\";s:6:\"script\";}i:15;a:2:{s:4:\"href\";s:113:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-settings.js?ver=a6cb3c938fd270888ce4\";s:2:\"as\";s:6:\"script\";}i:16;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/api-fetch.min.js?ver=3623a576c78df404ff20\";s:2:\"as\";s:6:\"script\";}i:17;a:2:{s:4:\"href\";s:77:\"http://localhost:8080/wp-includes/js/dist/url.min.js?ver=c2964167dfe2477c14ea\";s:2:\"as\";s:6:\"script\";}i:18;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/data.min.js?ver=fe6c4835cd00e12493c3\";s:2:\"as\";s:6:\"script\";}i:19;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/compose.min.js?ver=84bcf832a5c99203f3db\";s:2:\"as\";s:6:\"script\";}i:20;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/deprecated.min.js?ver=e1f84915c5e8ae38964c\";s:2:\"as\";s:6:\"script\";}i:21;a:2:{s:4:\"href\";s:77:\"http://localhost:8080/wp-includes/js/dist/dom.min.js?ver=80bd57c84b45cf04f4ce\";s:2:\"as\";s:6:\"script\";}i:22;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/element.min.js?ver=a4eeeadd23c0d7ab1d2d\";s:2:\"as\";s:6:\"script\";}i:23;a:2:{s:4:\"href\";s:85:\"http://localhost:8080/wp-includes/js/dist/escape-html.min.js?ver=6561a406d2d232a6fbd2\";s:2:\"as\";s:6:\"script\";}i:24;a:2:{s:4:\"href\";s:90:\"http://localhost:8080/wp-includes/js/dist/is-shallow-equal.min.js?ver=e0f9f1d78d83f5196979\";s:2:\"as\";s:6:\"script\";}i:25;a:2:{s:4:\"href\";s:82:\"http://localhost:8080/wp-includes/js/dist/keycodes.min.js?ver=034ff647a54b018581d3\";s:2:\"as\";s:6:\"script\";}i:26;a:2:{s:4:\"href\";s:88:\"http://localhost:8080/wp-includes/js/dist/priority-queue.min.js?ver=9c21c957c7e50ffdbf48\";s:2:\"as\";s:6:\"script\";}i:27;a:2:{s:4:\"href\";s:86:\"http://localhost:8080/wp-includes/js/dist/private-apis.min.js?ver=0f8478f1ba7e0eea562b\";s:2:\"as\";s:6:\"script\";}i:28;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/redux-routine.min.js?ver=8bb92d45458b29590f53\";s:2:\"as\";s:6:\"script\";}i:29;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/data-controls.min.js?ver=49f5587e8b90f9e7cc7e\";s:2:\"as\";s:6:\"script\";}i:30;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/html-entities.min.js?ver=2cd3358363e0675638fb\";s:2:\"as\";s:6:\"script\";}i:31;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/notices.min.js?ver=673a68a7ac2f556ed50b\";s:2:\"as\";s:6:\"script\";}i:32;a:2:{s:4:\"href\";s:122:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-middleware.js?ver=d79dedade2f2e4dc9df4\";s:2:\"as\";s:6:\"script\";}i:33;a:2:{s:4:\"href\";s:115:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/admin/sanitize/index.js?ver=5e942711022623794947\";s:2:\"as\";s:6:\"script\";}i:34;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/a11y.min.js?ver=3156534cc54473497e14\";s:2:\"as\";s:6:\"script\";}i:35;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/dom-ready.min.js?ver=f77871ff7694fffea381\";s:2:\"as\";s:6:\"script\";}i:36;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/primitives.min.js?ver=aef2543ab60c8c9bb609\";s:2:\"as\";s:6:\"script\";}i:37;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/warning.min.js?ver=ed7c8b0940914f4fe44b\";s:2:\"as\";s:6:\"script\";}i:38;a:2:{s:4:\"href\";s:126:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-context.js?ver=621353d8a3a7c8d44b41\";s:2:\"as\";s:6:\"script\";}i:39;a:2:{s:4:\"href\";s:123:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-hocs.js?ver=c18bbb2325f333897e6b\";s:2:\"as\";s:6:\"script\";}i:40;a:2:{s:4:\"href\";s:114:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/price-format.js?ver=0df720e448f7ab3c5d0d\";s:2:\"as\";s:6:\"script\";}i:41;a:2:{s:4:\"href\";s:79:\"http://localhost:8080/wp-includes/js/dist/autop.min.js?ver=9fb50649848277dd318d\";s:2:\"as\";s:6:\"script\";}i:42;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/plugins.min.js?ver=20303a2de19246c83e5a\";s:2:\"as\";s:6:\"script\";}i:43;a:2:{s:4:\"href\";s:86:\"http://localhost:8080/wp-includes/js/dist/style-engine.min.js?ver=08cc10e9532531e22456\";s:2:\"as\";s:6:\"script\";}i:44;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/wordcount.min.js?ver=55d8c2bf3dc99e7ea5ec\";s:2:\"as\";s:6:\"script\";}}s:17:\"checkout-frontend\";a:48:{i:0;a:2:{s:4:\"href\";s:119:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/checkout-frontend.js?ver=fd3b672b3e6033d2fcf3\";s:2:\"as\";s:6:\"script\";}i:1;a:2:{s:4:\"href\";s:132:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-base-frontend.js?ver=f669b3c33346e637602f\";s:2:\"as\";s:6:\"script\";}i:2;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0\";s:2:\"as\";s:6:\"script\";}i:3;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6\";s:2:\"as\";s:6:\"script\";}i:4;a:2:{s:4:\"href\";s:79:\"http://localhost:8080/wp-includes/js/dist/hooks.min.js?ver=4d63a3d491d11ffd8ac6\";s:2:\"as\";s:6:\"script\";}i:5;a:2:{s:4:\"href\";s:135:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-vendors-frontend.js?ver=04a71982bb4ef85763c1\";s:2:\"as\";s:6:\"script\";}i:6;a:2:{s:4:\"href\";s:74:\"http://localhost:8080/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:7;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/vendor/react-jsx-runtime.min.js?ver=18.3.1\";s:2:\"as\";s:6:\"script\";}i:8;a:2:{s:4:\"href\";s:117:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout.js?ver=da57c8c98d31b28d806e\";s:2:\"as\";s:6:\"script\";}i:9;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:10;a:2:{s:4:\"href\";s:124:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout-events.js?ver=2d0fd4590f6cc663947c\";s:2:\"as\";s:6:\"script\";}i:11;a:2:{s:4:\"href\";s:110:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-types.js?ver=f0cc692c0367e0930c80\";s:2:\"as\";s:6:\"script\";}i:12;a:2:{s:4:\"href\";s:119:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/blocks-components.js?ver=8b64025baef8d338aa5e\";s:2:\"as\";s:6:\"script\";}i:13;a:2:{s:4:\"href\";s:116:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-data.js?ver=ffb2849a705ee55d810e\";s:2:\"as\";s:6:\"script\";}i:14;a:2:{s:4:\"href\";s:120:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-registry.js?ver=6436a923b42f4d1b1f6d\";s:2:\"as\";s:6:\"script\";}i:15;a:2:{s:4:\"href\";s:113:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-settings.js?ver=a6cb3c938fd270888ce4\";s:2:\"as\";s:6:\"script\";}i:16;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/api-fetch.min.js?ver=3623a576c78df404ff20\";s:2:\"as\";s:6:\"script\";}i:17;a:2:{s:4:\"href\";s:77:\"http://localhost:8080/wp-includes/js/dist/url.min.js?ver=c2964167dfe2477c14ea\";s:2:\"as\";s:6:\"script\";}i:18;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/data.min.js?ver=fe6c4835cd00e12493c3\";s:2:\"as\";s:6:\"script\";}i:19;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/compose.min.js?ver=84bcf832a5c99203f3db\";s:2:\"as\";s:6:\"script\";}i:20;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/deprecated.min.js?ver=e1f84915c5e8ae38964c\";s:2:\"as\";s:6:\"script\";}i:21;a:2:{s:4:\"href\";s:77:\"http://localhost:8080/wp-includes/js/dist/dom.min.js?ver=80bd57c84b45cf04f4ce\";s:2:\"as\";s:6:\"script\";}i:22;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/element.min.js?ver=a4eeeadd23c0d7ab1d2d\";s:2:\"as\";s:6:\"script\";}i:23;a:2:{s:4:\"href\";s:85:\"http://localhost:8080/wp-includes/js/dist/escape-html.min.js?ver=6561a406d2d232a6fbd2\";s:2:\"as\";s:6:\"script\";}i:24;a:2:{s:4:\"href\";s:90:\"http://localhost:8080/wp-includes/js/dist/is-shallow-equal.min.js?ver=e0f9f1d78d83f5196979\";s:2:\"as\";s:6:\"script\";}i:25;a:2:{s:4:\"href\";s:82:\"http://localhost:8080/wp-includes/js/dist/keycodes.min.js?ver=034ff647a54b018581d3\";s:2:\"as\";s:6:\"script\";}i:26;a:2:{s:4:\"href\";s:88:\"http://localhost:8080/wp-includes/js/dist/priority-queue.min.js?ver=9c21c957c7e50ffdbf48\";s:2:\"as\";s:6:\"script\";}i:27;a:2:{s:4:\"href\";s:86:\"http://localhost:8080/wp-includes/js/dist/private-apis.min.js?ver=0f8478f1ba7e0eea562b\";s:2:\"as\";s:6:\"script\";}i:28;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/redux-routine.min.js?ver=8bb92d45458b29590f53\";s:2:\"as\";s:6:\"script\";}i:29;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/data-controls.min.js?ver=49f5587e8b90f9e7cc7e\";s:2:\"as\";s:6:\"script\";}i:30;a:2:{s:4:\"href\";s:87:\"http://localhost:8080/wp-includes/js/dist/html-entities.min.js?ver=2cd3358363e0675638fb\";s:2:\"as\";s:6:\"script\";}i:31;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/notices.min.js?ver=673a68a7ac2f556ed50b\";s:2:\"as\";s:6:\"script\";}i:32;a:2:{s:4:\"href\";s:122:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-middleware.js?ver=d79dedade2f2e4dc9df4\";s:2:\"as\";s:6:\"script\";}i:33;a:2:{s:4:\"href\";s:115:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/admin/sanitize/index.js?ver=5e942711022623794947\";s:2:\"as\";s:6:\"script\";}i:34;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/a11y.min.js?ver=3156534cc54473497e14\";s:2:\"as\";s:6:\"script\";}i:35;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/dom-ready.min.js?ver=f77871ff7694fffea381\";s:2:\"as\";s:6:\"script\";}i:36;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/primitives.min.js?ver=aef2543ab60c8c9bb609\";s:2:\"as\";s:6:\"script\";}i:37;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/warning.min.js?ver=ed7c8b0940914f4fe44b\";s:2:\"as\";s:6:\"script\";}i:38;a:2:{s:4:\"href\";s:123:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-hocs.js?ver=c18bbb2325f333897e6b\";s:2:\"as\";s:6:\"script\";}i:39;a:2:{s:4:\"href\";s:126:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-context.js?ver=621353d8a3a7c8d44b41\";s:2:\"as\";s:6:\"script\";}i:40;a:2:{s:4:\"href\";s:114:\"http://localhost:8080/wp-content/plugins/woocommerce/assets/client/blocks/price-format.js?ver=0df720e448f7ab3c5d0d\";s:2:\"as\";s:6:\"script\";}i:41;a:2:{s:4:\"href\";s:79:\"http://localhost:8080/wp-includes/js/dist/autop.min.js?ver=9fb50649848277dd318d\";s:2:\"as\";s:6:\"script\";}i:42;a:2:{s:4:\"href\";s:84:\"http://localhost:8080/wp-includes/js/dist/components.min.js?ver=865f2ec3b5f5195705e0\";s:2:\"as\";s:6:\"script\";}i:43;a:2:{s:4:\"href\";s:78:\"http://localhost:8080/wp-includes/js/dist/date.min.js?ver=85ff222add187a4e358f\";s:2:\"as\";s:6:\"script\";}i:44;a:2:{s:4:\"href\";s:73:\"http://localhost:8080/wp-includes/js/dist/vendor/moment.min.js?ver=2.30.1\";s:2:\"as\";s:6:\"script\";}i:45;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/rich-text.min.js?ver=74178fc8c4d67d66f1a8\";s:2:\"as\";s:6:\"script\";}i:46;a:2:{s:4:\"href\";s:81:\"http://localhost:8080/wp-includes/js/dist/plugins.min.js?ver=20303a2de19246c83e5a\";s:2:\"as\";s:6:\"script\";}i:47;a:2:{s:4:\"href\";s:83:\"http://localhost:8080/wp-includes/js/dist/wordcount.min.js?ver=55d8c2bf3dc99e7ea5ec\";s:2:\"as\";s:6:\"script\";}}}s:7:\"version\";a:3:{s:11:\"woocommerce\";s:6:\"10.7.0\";s:9:\"wordpress\";s:5:\"6.8.3\";s:8:\"site_url\";s:21:\"http://localhost:8080\";}}','off'),
(381,'_transient_orders-transient-version','1777162527','on'),
(382,'_transient_timeout_wc_blocks_query_5363a57d92ddac380bcea0733b79eaad','1779754507','off'),
(383,'_transient_wc_blocks_query_5363a57d92ddac380bcea0733b79eaad','a:2:{s:7:\"version\";s:10:\"1777156430\";s:5:\"value\";a:3:{i:0;i:16;i:1;i:14;i:2;i:12;}}','off'),
(388,'_transient_timeout__woocommerce_helper_subscriptions','1777156409','off'),
(389,'_transient__woocommerce_helper_subscriptions','a:0:{}','off'),
(390,'_site_transient_timeout_theme_roots','1777157309','off'),
(391,'_site_transient_theme_roots','a:4:{s:10:\"storefront\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}','off'),
(392,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1777155510;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:3:\"7.0\";s:12:\"requires_php\";s:3:\"7.2\";s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:6:\"10.7.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/woocommerce.10.7.0.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:56:\"https://ps.w.org/woocommerce/assets/icon.svg?rev=3234504\";s:3:\"svg\";s:56:\"https://ps.w.org/woocommerce/assets/icon.svg?rev=3234504\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=3234504\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=3234504\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.8\";}}s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:3:\"5.5\";s:9:\"hello.php\";s:5:\"1.7.2\";s:27:\"woocommerce/woocommerce.php\";s:6:\"10.7.0\";}}','off'),
(393,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1777155532;s:7:\"checked\";a:4:{s:10:\"storefront\";s:5:\"4.6.2\";s:16:\"twentytwentyfive\";s:3:\"1.3\";s:16:\"twentytwentyfour\";s:3:\"1.3\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:2:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.4.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.4.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}}s:9:\"no_update\";a:2:{s:10:\"storefront\";a:6:{s:5:\"theme\";s:10:\"storefront\";s:11:\"new_version\";s:5:\"4.6.2\";s:3:\"url\";s:40:\"https://wordpress.org/themes/storefront/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/storefront.4.6.2.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:5:\"5.6.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:4:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:10:\"storefront\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.6.2\";s:7:\"updated\";s:19:\"2023-10-06 13:52:47\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/translation/theme/storefront/4.6.2/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:16:\"twentytwentyfive\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"1.3\";s:7:\"updated\";s:19:\"2025-09-22 20:18:15\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/translation/theme/twentytwentyfive/1.3/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:16:\"twentytwentyfour\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"1.3\";s:7:\"updated\";s:19:\"2025-11-26 03:13:14\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/translation/theme/twentytwentyfour/1.3/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:17:\"twentytwentythree\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"1.6\";s:7:\"updated\";s:19:\"2022-10-26 19:28:33\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/theme/twentytwentythree/1.6/pt_BR.zip\";s:10:\"autoupdate\";b:1;}}}','off'),
(394,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.9.4.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.9.4.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.9.4\";s:7:\"version\";s:5:\"6.9.4\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.9.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.9.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.9.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.9.4-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.9.4\";s:7:\"version\";s:5:\"6.9.4\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:51:\"https://downloads.w.org/release/wordpress-6.9.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:51:\"https://downloads.w.org/release/wordpress-6.9.4.zip\";s:10:\"no_content\";s:62:\"https://downloads.w.org/release/wordpress-6.9.4-no-content.zip\";s:11:\"new_bundled\";s:63:\"https://downloads.w.org/release/wordpress-6.9.4-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.9.4\";s:7:\"version\";s:5:\"6.9.4\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:51:\"https://downloads.w.org/release/wordpress-6.8.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:51:\"https://downloads.w.org/release/wordpress-6.8.5.zip\";s:10:\"no_content\";s:62:\"https://downloads.w.org/release/wordpress-6.8.5-no-content.zip\";s:11:\"new_bundled\";s:63:\"https://downloads.w.org/release/wordpress-6.8.5-new-bundled.zip\";s:7:\"partial\";s:61:\"https://downloads.w.org/release/wordpress-6.8.5-partial-3.zip\";s:8:\"rollback\";s:62:\"https://downloads.w.org/release/wordpress-6.8.5-rollback-3.zip\";}s:7:\"current\";s:5:\"6.8.5\";s:7:\"version\";s:5:\"6.8.5\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:5:\"6.8.3\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1777155662;s:15:\"version_checked\";s:5:\"6.8.3\";s:12:\"translations\";a:0:{}}','off'),
(395,'_transient_timeout_wc_order_22_needs_processing','1777242830','off'),
(396,'_transient_wc_order_22_needs_processing','1','off'),
(397,'_transient_product-transient-version','1777156430','on'),
(398,'wc_pending_batch_processes','a:1:{i:0;s:66:\"Automattic\\WooCommerce\\Internal\\Logging\\OrderLogsDeletionProcessor\";}','off'),
(400,'_transient_timeout_wc_featured_products','1779748591','off'),
(401,'_transient_wc_featured_products','a:0:{}','off'),
(402,'_transient_timeout_wc_products_onsale','1779748591','off'),
(403,'_transient_wc_products_onsale','a:1:{i:0;i:14;}','off'),
(404,'_transient_timeout_wc_product_loop_f8750b57056624be64e2149d8891a66c','1779748591','off'),
(405,'_transient_wc_product_loop_f8750b57056624be64e2149d8891a66c','a:2:{s:7:\"version\";s:10:\"1777156430\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:1:{i:0;i:14;}s:5:\"total\";i:1;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:2;s:12:\"current_page\";i:1;}}','off'),
(406,'_transient_timeout_wc_product_loop_cd4ceb08a6a3e9bac7f4260a4e03a47f','1779748591','off'),
(407,'_transient_wc_product_loop_cd4ceb08a6a3e9bac7f4260a4e03a47f','a:2:{s:7:\"version\";s:10:\"1777156430\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:1:{i:0;i:14;}s:5:\"total\";i:1;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}}','off'),
(408,'woocommerce_pickup_location_settings','a:4:{s:7:\"enabled\";s:2:\"no\";s:5:\"title\";s:0:\"\";s:4:\"cost\";s:0:\"\";s:10:\"tax_status\";s:7:\"taxable\";}','auto'),
(409,'custom_logo','32','auto'),
(413,'_transient_timeout_wc_related_14','1777244872','off'),
(414,'_transient_wc_related_14','a:1:{s:50:\"limit=3&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=14\";a:2:{i:0;s:2:\"12\";i:1;s:2:\"16\";}}','off'),
(415,'_site_transient_timeout_wp_theme_files_patterns-ec66bb55a2ce1cbdd8a2fd4cb9a6193d','1777164012','off'),
(416,'_site_transient_wp_theme_files_patterns-ec66bb55a2ce1cbdd8a2fd4cb9a6193d','a:2:{s:7:\"version\";s:5:\"4.6.2\";s:8:\"patterns\";a:0:{}}','off');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(2,3,'_wp_page_template','default'),
(3,5,'_wp_attached_file','woocommerce-placeholder.webp'),
(4,5,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:28:\"woocommerce-placeholder.webp\";s:8:\"filesize\";i:9892;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-300x300.webp\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:1362;}s:5:\"large\";a:5:{s:4:\"file\";s:38:\"woocommerce-placeholder-1024x1024.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:6032;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:662;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-768x768.webp\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:4240;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5,11,'_wp_attached_file','2026/04/categoria-pijamas.jpg'),
(6,11,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:400;s:4:\"file\";s:29:\"2026/04/categoria-pijamas.jpg\";s:8:\"filesize\";i:10697;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2635;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2240;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-768x384.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:384;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8905;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:29:\"categoria-pijamas-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5418;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-416x208.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:208;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3779;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1551;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(7,12,'_regular_price','20.00'),
(8,12,'_price','20.00'),
(9,12,'_manage_stock','yes'),
(10,12,'_stock','15'),
(11,12,'_stock_status','instock'),
(12,12,'_backorders','no'),
(13,12,'_weight','0.5'),
(14,12,'_length','30'),
(15,12,'_width','25'),
(16,12,'_height','5'),
(17,12,'_virtual','no'),
(18,12,'_downloadable','no'),
(19,12,'_sold_individually','no'),
(20,12,'_visibility','visible'),
(21,12,'_featured','no'),
(22,12,'_tax_status','taxable'),
(23,13,'_wp_attached_file','2026/04/pijama-laranja.jpg'),
(24,13,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:26:\"2026/04/pijama-laranja.jpg\";s:8:\"filesize\";i:32729;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"pijama-laranja-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7526;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"pijama-laranja-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3410;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"pijama-laranja-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:25591;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"pijama-laranja-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8618;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"pijama-laranja-416x416.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:416;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11492;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"pijama-laranja-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2381;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(25,12,'_thumbnail_id','23'),
(26,14,'_regular_price','40.00'),
(27,14,'_sale_price','35.00'),
(28,14,'_price','35.00'),
(29,14,'_manage_stock','yes'),
(30,14,'_stock','9'),
(31,14,'_stock_status','instock'),
(32,14,'_backorders','no'),
(33,14,'_weight','0.5'),
(34,14,'_length','30'),
(35,14,'_width','25'),
(36,14,'_height','5'),
(37,14,'_virtual','no'),
(38,14,'_downloadable','no'),
(39,14,'_sold_individually','no'),
(40,14,'_visibility','visible'),
(41,14,'_featured','no'),
(42,14,'_tax_status','taxable'),
(43,15,'_wp_attached_file','2026/04/pijama-azul.jpg'),
(44,15,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:23:\"2026/04/pijama-azul.jpg\";s:8:\"filesize\";i:29268;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"pijama-azul-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6672;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"pijama-azul-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3039;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"pijama-azul-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:23390;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:23:\"pijama-azul-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7570;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:23:\"pijama-azul-416x416.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:416;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10263;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:23:\"pijama-azul-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2158;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(45,14,'_thumbnail_id','24'),
(46,16,'_regular_price','30.00'),
(47,16,'_sale_price','25.00'),
(48,16,'_price','25.00'),
(49,16,'_manage_stock','yes'),
(50,16,'_stock','12'),
(51,16,'_stock_status','instock'),
(52,16,'_backorders','no'),
(53,16,'_weight','0.5'),
(54,16,'_length','30'),
(55,16,'_width','25'),
(56,16,'_height','5'),
(57,16,'_virtual','no'),
(58,16,'_downloadable','no'),
(59,16,'_sold_individually','no'),
(60,16,'_visibility','visible'),
(61,16,'_featured','no'),
(62,16,'_tax_status','taxable'),
(63,17,'_wp_attached_file','2026/04/pijama-rosa.jpg'),
(64,17,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:23:\"2026/04/pijama-rosa.jpg\";s:8:\"filesize\";i:28671;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"pijama-rosa-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6564;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"pijama-rosa-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2978;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"pijama-rosa-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:23066;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:23:\"pijama-rosa-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7396;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:23:\"pijama-rosa-416x416.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:416;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10138;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:23:\"pijama-rosa-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2116;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(65,16,'_thumbnail_id','25'),
(66,18,'_wp_attached_file','2026/04/logo.png'),
(67,18,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:200;s:4:\"file\";s:16:\"2026/04/logo.png\";s:8:\"filesize\";i:6742;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:16:\"logo-300x100.png\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4382;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:16:\"logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3234;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:16:\"logo-324x200.png\";s:5:\"width\";i:324;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4354;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:16:\"logo-416x139.png\";s:5:\"width\";i:416;s:6:\"height\";i:139;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8728;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:16:\"logo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1771;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(68,19,'_wp_attached_file','2026/04/categoria-pijamas-1.jpg'),
(69,19,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:400;s:4:\"file\";s:31:\"2026/04/categoria-pijamas-1.jpg\";s:8:\"filesize\";i:10697;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:31:\"categoria-pijamas-1-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2635;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:31:\"categoria-pijamas-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2240;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:31:\"categoria-pijamas-1-768x384.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:384;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8905;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:31:\"categoria-pijamas-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5418;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:31:\"categoria-pijamas-1-416x208.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:208;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3779;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:31:\"categoria-pijamas-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1551;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(70,20,'_wp_attached_file','2026/04/logo-1.png'),
(71,20,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:200;s:4:\"file\";s:18:\"2026/04/logo-1.png\";s:8:\"filesize\";i:6742;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"logo-1-300x100.png\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4382;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3234;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:18:\"logo-1-324x200.png\";s:5:\"width\";i:324;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4354;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:18:\"logo-1-416x139.png\";s:5:\"width\";i:416;s:6:\"height\";i:139;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8728;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1771;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(72,21,'_order_key','wc_order_hmFyKrqQERuUt'),
(73,21,'_customer_user','0'),
(74,21,'_payment_method','cod'),
(75,21,'_customer_ip_address','172.25.0.1'),
(76,21,'_customer_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(77,21,'_created_via','store-api'),
(78,21,'_cart_hash','b7593e2f372c2fef83bb48d37ff77315'),
(79,21,'_download_permissions_granted','no'),
(80,21,'_recorded_sales','no'),
(81,21,'_recorded_coupon_usage_counts','no'),
(82,21,'_new_order_email_sent','false'),
(83,21,'_order_stock_reduced','no'),
(84,21,'_billing_state','MG'),
(85,21,'_billing_country','BR'),
(86,21,'_shipping_state','MG'),
(87,21,'_shipping_country','BR'),
(88,21,'_order_currency','BRL'),
(89,21,'_cart_discount','0'),
(90,21,'_cart_discount_tax','0'),
(91,21,'_order_shipping','5'),
(92,21,'_order_shipping_tax','0'),
(93,21,'_order_tax','0'),
(94,21,'_order_total','40.00'),
(95,21,'_order_version','10.7.0'),
(96,21,'_prices_include_tax','no'),
(97,21,'_billing_address_index','      MG  BR  '),
(98,21,'_shipping_address_index','      MG  BR '),
(99,21,'_shipping_hash','804bc1676ed862cb4d231891e3ffb89e'),
(100,21,'_coupons_hash','d751713988987e9331980363e24189ce'),
(101,21,'_fees_hash','d751713988987e9331980363e24189ce'),
(102,21,'_taxes_hash','d751713988987e9331980363e24189ce'),
(103,21,'is_vat_exempt','no'),
(104,22,'_order_key','wc_order_2ZLYPls5IiyAo'),
(105,22,'_customer_user','0'),
(106,22,'_payment_method','cod'),
(107,22,'_customer_ip_address','172.25.0.1'),
(108,22,'_customer_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(109,22,'_created_via','store-api'),
(110,22,'_cart_hash','b7593e2f372c2fef83bb48d37ff77315'),
(111,22,'_download_permissions_granted','yes'),
(112,22,'_recorded_sales','yes'),
(113,22,'_recorded_coupon_usage_counts','yes'),
(114,22,'_new_order_email_sent','false'),
(115,22,'_order_stock_reduced','yes'),
(116,22,'_billing_state','MG'),
(117,22,'_billing_country','BR'),
(118,22,'_shipping_state','MG'),
(119,22,'_shipping_country','BR'),
(120,22,'_order_currency','BRL'),
(121,22,'_cart_discount','0'),
(122,22,'_cart_discount_tax','0'),
(123,22,'_order_shipping','5'),
(124,22,'_order_shipping_tax','0'),
(125,22,'_order_tax','0'),
(126,22,'_order_total','40.00'),
(127,22,'_order_version','10.7.0'),
(128,22,'_prices_include_tax','no'),
(129,22,'_billing_address_index','Murillo  Danton  Rua sete de setembro Casa Paraisopolis MG 37660-000 BR murillodanton@hotmail.com '),
(130,22,'_shipping_address_index','Murillo  Danton  Rua sete de setembro Casa Paraisopolis MG 37660-000 BR '),
(131,22,'_shipping_hash','b22ca1bb6378b0e443afb9bfbad85f0c'),
(132,22,'_coupons_hash','d751713988987e9331980363e24189ce'),
(133,22,'_fees_hash','d751713988987e9331980363e24189ce'),
(134,22,'_taxes_hash','d751713988987e9331980363e24189ce'),
(135,22,'is_vat_exempt','no'),
(136,23,'_wp_attached_file','2026/04/pijama-laranja-1.jpg'),
(137,23,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1800;s:4:\"file\";s:28:\"2026/04/pijama-laranja-1.jpg\";s:8:\"filesize\";i:512961;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:28:\"pijama-laranja-1-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16923;}s:5:\"large\";a:5:{s:4:\"file\";s:29:\"pijama-laranja-1-683x1024.jpg\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:157195;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:28:\"pijama-laranja-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8299;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:29:\"pijama-laranja-1-768x1152.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:191659;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:30:\"pijama-laranja-1-1024x1536.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:311668;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:28:\"pijama-laranja-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:30910;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:28:\"pijama-laranja-1-416x624.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:624;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:63444;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:28:\"pijama-laranja-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4549;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(138,24,'_wp_attached_file','2026/04/pijama-azul-1.jpg'),
(139,24,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:25:\"2026/04/pijama-azul-1.jpg\";s:8:\"filesize\";i:82705;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:25:\"pijama-azul-1-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8531;}s:5:\"large\";a:5:{s:4:\"file\";s:26:\"pijama-azul-1-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:53428;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:25:\"pijama-azul-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4085;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:25:\"pijama-azul-1-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:34832;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:25:\"pijama-azul-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12048;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:25:\"pijama-azul-1-416x312.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:312;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13699;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:25:\"pijama-azul-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2582;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(140,25,'_wp_attached_file','2026/04/pijama-rosa-1.jpg'),
(141,25,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:25:\"2026/04/pijama-rosa-1.jpg\";s:8:\"filesize\";i:60881;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:25:\"pijama-rosa-1-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5912;}s:5:\"large\";a:5:{s:4:\"file\";s:26:\"pijama-rosa-1-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:38084;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:25:\"pijama-rosa-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3234;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:25:\"pijama-rosa-1-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:23756;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:25:\"pijama-rosa-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9019;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:25:\"pijama-rosa-1-416x312.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:312;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9103;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:25:\"pijama-rosa-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2071;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(148,22,'_billing_email','murillodanton@hotmail.com'),
(149,22,'_billing_first_name','Murillo '),
(150,22,'_billing_last_name','Danton'),
(151,22,'_billing_address_1','Rua sete de setembro'),
(152,22,'_shipping_first_name','Murillo '),
(153,22,'_shipping_last_name','Danton'),
(154,22,'_shipping_address_1','Rua sete de setembro'),
(155,22,'_billing_address_2','Casa'),
(156,22,'_shipping_address_2','Casa'),
(157,22,'_billing_city','Paraisopolis'),
(158,22,'_billing_postcode','37660-000'),
(159,22,'_shipping_city','Paraisopolis'),
(160,22,'_shipping_postcode','37660-000'),
(161,22,'_payment_method_title','Pagamento na entrega'),
(165,22,'_wc_order_attribution_source_type','typein'),
(166,22,'_wc_order_attribution_utm_source','(direct)'),
(167,22,'_wc_order_attribution_session_entry','http://localhost:8080/'),
(168,22,'_wc_order_attribution_session_start_time','2026-04-25 22:12:11'),
(169,22,'_wc_order_attribution_session_pages','6'),
(170,22,'_wc_order_attribution_session_count','1'),
(171,22,'_wc_order_attribution_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(172,22,'_wc_order_attribution_device_type','Desktop'),
(177,14,'total_sales','1'),
(178,14,'_tax_class',''),
(179,14,'_download_limit','-1'),
(180,14,'_download_expiry','-1'),
(181,14,'_wc_average_rating','0'),
(182,14,'_wc_review_count','0'),
(183,14,'_product_version','10.7.0'),
(185,22,'_debug_log_source_pending_deletion','place-order-debug-6eb3ddcb'),
(186,32,'_wp_attached_file','2026/04/logo-2.png'),
(187,32,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:420;s:6:\"height\";i:110;s:4:\"file\";s:18:\"2026/04/logo-2.png\";s:8:\"filesize\";i:1348;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"logo-2-300x79.png\";s:5:\"width\";i:300;s:6:\"height\";i:79;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3409;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-2-150x110.png\";s:5:\"width\";i:150;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:750;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:18:\"logo-2-324x110.png\";s:5:\"width\";i:324;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1126;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:18:\"logo-2-416x109.png\";s:5:\"width\";i:416;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5389;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1700;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(188,33,'_wp_attached_file','2026/04/logo-3.png'),
(189,33,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:505;s:6:\"height\";i:125;s:4:\"file\";s:18:\"2026/04/logo-3.png\";s:8:\"filesize\";i:62854;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"logo-3-300x74.png\";s:5:\"width\";i:300;s:6:\"height\";i:74;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28157;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-3-150x125.png\";s:5:\"width\";i:150;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23873;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:18:\"logo-3-324x125.png\";s:5:\"width\";i:324;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:48226;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:18:\"logo-3-416x103.png\";s:5:\"width\";i:416;s:6:\"height\";i:103;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:49603;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:18:\"logo-3-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13622;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(190,34,'_wp_attached_file','2026/04/categoria-pijamas.png'),
(191,34,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1536;s:6:\"height\";i:241;s:4:\"file\";s:29:\"2026/04/categoria-pijamas.png\";s:8:\"filesize\";i:429291;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:28:\"categoria-pijamas-300x47.png\";s:5:\"width\";i:300;s:6:\"height\";i:47;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:26527;}s:5:\"large\";a:5:{s:4:\"file\";s:30:\"categoria-pijamas-1024x161.png\";s:5:\"width\";i:1024;s:6:\"height\";i:161;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:235064;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:24580;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-768x121.png\";s:5:\"width\";i:768;s:6:\"height\";i:121;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:145273;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:29:\"categoria-pijamas-324x241.png\";s:5:\"width\";i:324;s:6:\"height\";i:241;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:68864;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:28:\"categoria-pijamas-416x65.png\";s:5:\"width\";i:416;s:6:\"height\";i:65;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:47607;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:29:\"categoria-pijamas-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12942;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(192,35,'_order_key','wc_order_DC4Me7OFsDV3a'),
(193,35,'_customer_user','0'),
(194,35,'_payment_method','cod'),
(195,35,'_customer_ip_address','172.25.0.1'),
(196,35,'_customer_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(197,35,'_created_via','store-api'),
(198,35,'_cart_hash','b7593e2f372c2fef83bb48d37ff77315'),
(199,35,'_download_permissions_granted','no'),
(200,35,'_recorded_sales','no'),
(201,35,'_recorded_coupon_usage_counts','no'),
(202,35,'_new_order_email_sent','false'),
(203,35,'_order_stock_reduced','no'),
(204,35,'_billing_first_name','Murillo '),
(205,35,'_billing_last_name','Danton'),
(206,35,'_billing_address_1','Rua sete de setembro'),
(207,35,'_billing_address_2','Casa'),
(208,35,'_billing_city','Paraisopolis'),
(209,35,'_billing_state','MG'),
(210,35,'_billing_postcode','37660-000'),
(211,35,'_billing_country','BR'),
(212,35,'_billing_email','murillodanton@hotmail.com'),
(213,35,'_shipping_first_name','Murillo '),
(214,35,'_shipping_last_name','Danton'),
(215,35,'_shipping_address_1','Rua sete de setembro'),
(216,35,'_shipping_address_2','Casa'),
(217,35,'_shipping_city','Paraisopolis'),
(218,35,'_shipping_state','MG'),
(219,35,'_shipping_postcode','37660-000'),
(220,35,'_shipping_country','BR'),
(221,35,'_order_currency','BRL'),
(222,35,'_cart_discount','0'),
(223,35,'_cart_discount_tax','0'),
(224,35,'_order_shipping','5'),
(225,35,'_order_shipping_tax','0'),
(226,35,'_order_tax','0'),
(227,35,'_order_total','40.00'),
(228,35,'_order_version','10.7.0'),
(229,35,'_prices_include_tax','no'),
(230,35,'_billing_address_index','Murillo  Danton  Rua sete de setembro Casa Paraisopolis MG 37660-000 BR murillodanton@hotmail.com '),
(231,35,'_shipping_address_index','Murillo  Danton  Rua sete de setembro Casa Paraisopolis MG 37660-000 BR '),
(232,35,'_shipping_hash','b22ca1bb6378b0e443afb9bfbad85f0c'),
(233,35,'_coupons_hash','d751713988987e9331980363e24189ce'),
(234,35,'_fees_hash','d751713988987e9331980363e24189ce'),
(235,35,'_taxes_hash','d751713988987e9331980363e24189ce'),
(236,35,'is_vat_exempt','no');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(1,1,'2026-04-25 20:45:40','2026-04-25 20:45:40','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2026-04-25 20:45:40','2026-04-25 20:45:40','',0,'http://localhost:8080/?p=1',0,'post','',1),
(3,1,'2026-04-25 20:45:40','2026-04-25 20:45:40','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost:8080.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','draft','closed','open','','privacy-policy','','','2026-04-25 20:45:40','2026-04-25 20:45:40','',0,'http://localhost:8080/?page_id=3',0,'page','',0),
(4,0,'2026-04-25 17:49:04','2026-04-25 20:49:04','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2026-04-25 17:49:04','2026-04-25 20:49:04','',0,'http://localhost:8080/?p=4',0,'wp_navigation','',0),
(5,0,'2026-04-25 17:56:13','2026-04-25 20:56:13','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2026-04-25 17:56:13','2026-04-25 20:56:13','',0,'http://localhost:8080/wp-content/uploads/2026/04/woocommerce-placeholder.webp',0,'attachment','image/webp',0),
(6,1,'2026-04-25 17:56:13','2026-04-25 20:56:13','','Loja','','publish','closed','closed','','shop','','','2026-04-25 21:26:19','2026-04-26 00:26:19','',0,'http://localhost:8080/?page_id=6',0,'page','',0),
(7,1,'2026-04-25 17:56:13','2026-04-25 20:56:13','<!-- wp:woocommerce/cart -->\n<div class=\"wp-block-woocommerce-cart alignwide is-loading\"><!-- wp:woocommerce/filled-cart-block -->\n<div class=\"wp-block-woocommerce-filled-cart-block\"><!-- wp:woocommerce/cart-items-block -->\n<div class=\"wp-block-woocommerce-cart-items-block\"><!-- wp:woocommerce/cart-line-items-block -->\n<div class=\"wp-block-woocommerce-cart-line-items-block\"></div>\n<!-- /wp:woocommerce/cart-line-items-block -->\n\n<!-- wp:woocommerce/product-collection {\"queryId\":0,\"query\":{\"perPage\":3,\"pages\":1,\"offset\":0,\"postType\":\"product\",\"order\":\"asc\",\"orderBy\":\"title\",\"search\":\"\",\"exclude\":[],\"inherit\":false,\"taxQuery\":{},\"isProductCollectionBlock\":true,\"featured\":false,\"woocommerceOnSale\":false,\"woocommerceStockStatus\":[\"instock\",\"outofstock\",\"onbackorder\"],\"woocommerceAttributes\":[],\"woocommerceHandPickedProducts\":[],\"filterable\":false,\"relatedBy\":{\"categories\":true,\"tags\":true}},\"tagName\":\"div\",\"displayLayout\":{\"type\":\"flex\",\"columns\":3,\"shrinkColumns\":true},\"dimensions\":{\"widthType\":\"fill\"},\"collection\":\"woocommerce/product-collection/cross-sells\",\"hideControls\":[\"filterable\"],\"queryContextIncludes\":[\"collection\"],\"__privatePreviewState\":{\"isPreview\":true,\"previewMessage\":\"Actual products will vary depending on the page being viewed.\"}} -->\n<div class=\"wp-block-woocommerce-product-collection\"><!-- wp:heading {\"textAlign\":\"left\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"1rem\"}}}} -->\n<h2 class=\"wp-block-heading has-text-align-left\" style=\"margin-bottom:1rem\">You may be interested in&hellip;</h2>\n\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {\"showSaleBadge\":false,\"imageSizing\":\"thumbnail\",\"isDescendentOfQueryLoop\":true} -->\n<!-- wp:woocommerce/product-sale-badge {\"align\":\"right\"} /-->\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0.75rem\",\"top\":\"0\"}},\"typography\":{\"lineHeight\":\"1.4\"}},\"fontSize\":\"medium\",\"__woocommerceNamespace\":\"woocommerce/product-collection/product-title\"} /-->\n\n<!-- wp:woocommerce/product-price {\"isDescendentOfQueryLoop\":true,\"textAlign\":\"center\",\"fontSize\":\"small\"} /-->\n\n<!-- wp:woocommerce/product-button {\"textAlign\":\"center\",\"isDescendentOfQueryLoop\":true,\"fontSize\":\"small\"} /-->\n<!-- /wp:woocommerce/product-template --></div>\n<!-- /wp:woocommerce/product-collection --></div>\n\n<!-- /wp:woocommerce/cart-items-block -->\n\n<!-- wp:woocommerce/cart-totals-block -->\n<div class=\"wp-block-woocommerce-cart-totals-block\"><!-- wp:woocommerce/cart-order-summary-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-block\"><!-- wp:woocommerce/cart-order-summary-heading-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-heading-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-heading-block -->\n\n<!-- wp:woocommerce/cart-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/cart-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/cart-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-fee-block -->\n\n<!-- wp:woocommerce/cart-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-discount-block -->\n\n<!-- wp:woocommerce/cart-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/cart-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/cart-order-summary-block -->\n\n<!-- wp:woocommerce/cart-express-payment-block -->\n<div class=\"wp-block-woocommerce-cart-express-payment-block\"></div>\n<!-- /wp:woocommerce/cart-express-payment-block -->\n\n<!-- wp:woocommerce/proceed-to-checkout-block -->\n<div class=\"wp-block-woocommerce-proceed-to-checkout-block\"></div>\n<!-- /wp:woocommerce/proceed-to-checkout-block -->\n\n<!-- wp:woocommerce/cart-accepted-payment-methods-block -->\n<div class=\"wp-block-woocommerce-cart-accepted-payment-methods-block\"></div>\n<!-- /wp:woocommerce/cart-accepted-payment-methods-block --></div>\n<!-- /wp:woocommerce/cart-totals-block --></div>\n<!-- /wp:woocommerce/filled-cart-block -->\n\n<!-- wp:woocommerce/empty-cart-block -->\n<div class=\"wp-block-woocommerce-empty-cart-block\"><!-- wp:heading {\"textAlign\":\"center\",\"className\":\"with-empty-cart-icon wc-block-cart__empty-cart__title\"} -->\n<h2 class=\"wp-block-heading has-text-align-center with-empty-cart-icon wc-block-cart__empty-cart__title\">Your cart is currently empty!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator {\"className\":\"is-style-dots\"} -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity is-style-dots\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"textAlign\":\"center\"} -->\n<h2 class=\"wp-block-heading has-text-align-center\">New in store</h2>\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-new {\"columns\":4,\"rows\":1} /--></div>\n<!-- /wp:woocommerce/empty-cart-block --></div>\n<!-- /wp:woocommerce/cart -->','Carrinho','','publish','closed','closed','','cart','','','2026-04-25 19:38:55','2026-04-25 22:38:55','',0,'http://localhost:8080/?page_id=7',0,'page','',0),
(8,1,'2026-04-25 17:56:13','2026-04-25 20:56:13','<!-- wp:woocommerce/checkout -->\n<div class=\"wp-block-woocommerce-checkout alignwide wc-block-checkout is-loading\"><!-- wp:woocommerce/checkout-fields-block -->\n<div class=\"wp-block-woocommerce-checkout-fields-block\"><!-- wp:woocommerce/checkout-express-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-express-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-express-payment-block -->\n\n<!-- wp:woocommerce/checkout-contact-information-block -->\n<div class=\"wp-block-woocommerce-checkout-contact-information-block\"></div>\n<!-- /wp:woocommerce/checkout-contact-information-block -->\n\n<!-- wp:woocommerce/checkout-shipping-method-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-method-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-method-block -->\n\n<!-- wp:woocommerce/checkout-pickup-options-block -->\n<div class=\"wp-block-woocommerce-checkout-pickup-options-block\"></div>\n<!-- /wp:woocommerce/checkout-pickup-options-block -->\n\n<!-- wp:woocommerce/checkout-shipping-address-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-address-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-address-block -->\n\n<!-- wp:woocommerce/checkout-billing-address-block -->\n<div class=\"wp-block-woocommerce-checkout-billing-address-block\"></div>\n<!-- /wp:woocommerce/checkout-billing-address-block -->\n\n<!-- wp:woocommerce/checkout-shipping-methods-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-methods-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-methods-block -->\n\n<!-- wp:woocommerce/checkout-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-payment-block -->\n\n<!-- wp:woocommerce/checkout-additional-information-block -->\n<div class=\"wp-block-woocommerce-checkout-additional-information-block\"></div>\n<!-- /wp:woocommerce/checkout-additional-information-block -->\n\n<!-- wp:woocommerce/checkout-order-note-block -->\n<div class=\"wp-block-woocommerce-checkout-order-note-block\"></div>\n<!-- /wp:woocommerce/checkout-order-note-block -->\n\n<!-- wp:woocommerce/checkout-terms-block -->\n<div class=\"wp-block-woocommerce-checkout-terms-block\"></div>\n<!-- /wp:woocommerce/checkout-terms-block -->\n\n<!-- wp:woocommerce/checkout-actions-block -->\n<div class=\"wp-block-woocommerce-checkout-actions-block\"></div>\n<!-- /wp:woocommerce/checkout-actions-block --></div>\n<!-- /wp:woocommerce/checkout-fields-block -->\n\n<!-- wp:woocommerce/checkout-totals-block -->\n<div class=\"wp-block-woocommerce-checkout-totals-block\"><!-- wp:woocommerce/checkout-order-summary-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-block\"><!-- wp:woocommerce/checkout-order-summary-cart-items-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-cart-items-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-cart-items-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-fee-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-discount-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/checkout-order-summary-block --></div>\n<!-- /wp:woocommerce/checkout-totals-block --></div>\n<!-- /wp:woocommerce/checkout -->','Finalizar Compra','','publish','closed','closed','','checkout','','','2026-04-25 19:39:16','2026-04-25 22:39:16','',0,'http://localhost:8080/?page_id=8',0,'page','',0),
(9,1,'2026-04-25 17:56:13','2026-04-25 20:56:13','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','Minha Conta','','publish','closed','closed','','my-account','','','2026-04-25 19:39:36','2026-04-25 22:39:36','',0,'http://localhost:8080/?page_id=9',0,'page','',0),
(10,1,'2026-04-25 17:56:13','0000-00-00 00:00:00','<!-- wp:paragraph -->\n<p><b>This is a sample page.</b></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Overview</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Additional non-returnable items:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Gift cards</li>\n<li>Downloadable software products</li>\n<li>Some health and personal care items</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>To complete your return, we require a receipt or proof of purchase.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Please do not send your purchase back to the manufacturer.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>There are certain situations where only partial refunds are granted:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Book with obvious signs of use</li>\n<li>CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.</li>\n<li>Any item not in its original condition, is damaged or missing parts for reasons not due to our error.</li>\n<li>Any item that is returned more than 30 days after delivery</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Refunds</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Late or missing refunds</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you haven’t received a refund yet, first check your bank account again.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Then contact your credit card company, it may take some time before your refund is officially posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Next contact your bank. There is often some processing time before a refund is posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you’ve done all of this and you still have not received your refund yet, please contact us at {email address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Sale items</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Only regular priced items may be refunded. Sale items cannot be refunded.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Exchanges</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at {email address} and send your item to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Gifts</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and they will find out about your return.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Shipping returns</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>To return your product, you should mail your product to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Depending on where you live, the time it may take for your exchanged product to reach you may vary.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are returning more expensive items, you may consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Need help?</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Contact us at {email} for questions related to refunds and returns.</p>\n<!-- /wp:paragraph -->','Refund and Returns Policy','','draft','closed','closed','','refund_returns','','','2026-04-25 17:56:13','0000-00-00 00:00:00','',0,'http://localhost:8080/?page_id=10',0,'page','',0),
(11,0,'2026-04-25 17:58:05','2026-04-25 20:58:05','','Categoria Pijamas','','inherit','open','closed','','categoria-pijamas','','','2026-04-25 17:58:05','2026-04-25 20:58:05','',0,'http://localhost:8080/wp-content/uploads/2026/04/categoria-pijamas.jpg',0,'attachment','image/jpeg',0),
(12,0,'2026-04-25 17:58:06','2026-04-25 20:58:06','Pijama laranja confortável, ideal para noites tranquilas. Tecido 100% algodão.','Pijama Laranja','Pijama laranja confortável, ideal para noites tranquilas. Tecido 100% algodão.','publish','open','closed','','pijama-laranja','','','2026-04-25 17:58:06','2026-04-25 20:58:06','',0,'http://localhost:8080/?product=pijama-laranja',0,'product','',0),
(13,0,'2026-04-25 17:58:06','2026-04-25 20:58:06','','Pijama Laranja','','inherit','open','closed','','pijama-laranja-2','','','2026-04-25 17:58:06','2026-04-25 20:58:06','',0,'http://localhost:8080/wp-content/uploads/2026/04/pijama-laranja.jpg',0,'attachment','image/jpeg',0),
(14,0,'2026-04-25 17:58:06','2026-04-25 20:58:06','Pijama azul com estampa de estrela. Macio e durável.','Pijama Azul','Pijama azul com estampa de estrela. Macio e durável.','publish','open','closed','','pijama-azul','','','2026-04-25 19:33:50','2026-04-25 22:33:50','',0,'http://localhost:8080/?product=pijama-azul',0,'product','',0),
(15,0,'2026-04-25 17:58:06','2026-04-25 20:58:06','','Pijama Azul','','inherit','open','closed','','pijama-azul-2','','','2026-04-25 17:58:06','2026-04-25 20:58:06','',0,'http://localhost:8080/wp-content/uploads/2026/04/pijama-azul.jpg',0,'attachment','image/jpeg',0),
(16,0,'2026-04-25 17:58:07','2026-04-25 20:58:07','Pijama rosa com estampa floral. Conforto para o dia a dia.','Pijama Rosa','Pijama rosa com estampa floral. Conforto para o dia a dia.','publish','open','closed','','pijama-rosa','','','2026-04-25 17:58:07','2026-04-25 20:58:07','',0,'http://localhost:8080/?product=pijama-rosa',0,'product','',0),
(17,0,'2026-04-25 17:58:07','2026-04-25 20:58:07','','Pijama Rosa','','inherit','open','closed','','pijama-rosa-2','','','2026-04-25 17:58:07','2026-04-25 20:58:07','',0,'http://localhost:8080/wp-content/uploads/2026/04/pijama-rosa.jpg',0,'attachment','image/jpeg',0),
(18,0,'2026-04-25 17:58:15','2026-04-25 20:58:15','','Logo Loja Pijamas','','inherit','open','closed','','logo-loja-pijamas','','','2026-04-25 17:58:15','2026-04-25 20:58:15','',0,'http://localhost:8080/wp-content/uploads/2026/04/logo.png',0,'attachment','image/png',0),
(19,0,'2026-04-25 18:01:55','2026-04-25 21:01:55','','Categoria Pijamas','','inherit','open','closed','','categoria-pijamas-2','','','2026-04-25 18:01:55','2026-04-25 21:01:55','',0,'http://localhost:8080/wp-content/uploads/2026/04/categoria-pijamas-1.jpg',0,'attachment','image/jpeg',0),
(20,0,'2026-04-25 18:01:55','2026-04-25 21:01:55','','Logo Loja Pijamas','','inherit','open','closed','','logo-loja-pijamas-2','','','2026-04-25 18:01:55','2026-04-25 21:01:55','',0,'http://localhost:8080/wp-content/uploads/2026/04/logo-1.png',0,'attachment','image/png',0),
(21,1,'2026-04-25 19:13:20','2026-04-25 22:13:20','','Order &ndash; abril 25, 2026 @ 07:13 PM','','wc-checkout-draft','open','closed','wc_order_hmFyKrqQERuUt','order-apr-25-2026-1013-pm','','','2026-04-25 19:13:20','2026-04-25 22:13:20','',0,'http://localhost:8080/?post_type=shop_order&p=21',0,'shop_order','',0),
(22,1,'2026-04-25 19:13:21','2026-04-25 22:13:21','','Order &ndash; abril 25, 2026 @ 07:13 PM','','wc-processing','open','closed','wc_order_2ZLYPls5IiyAo','order-apr-25-2026-1013-pm-2','','','2026-04-25 19:33:50','2026-04-25 22:33:50','',0,'http://localhost:8080/?post_type=shop_order&#038;p=22',0,'shop_order','',3),
(23,0,'2026-04-25 19:26:40','2026-04-25 22:26:40','','Pijama Laranja','','inherit','open','closed','','pijama-laranja-3','','','2026-04-25 19:26:40','2026-04-25 22:26:40','',12,'http://localhost:8080/wp-content/uploads/2026/04/pijama-laranja-1.jpg',0,'attachment','image/jpeg',0),
(24,0,'2026-04-25 19:27:43','2026-04-25 22:27:43','','Pijama Azul','','inherit','open','closed','','pijama-azul-3','','','2026-04-25 19:27:43','2026-04-25 22:27:43','',14,'http://localhost:8080/wp-content/uploads/2026/04/pijama-azul-1.jpg',0,'attachment','image/jpeg',0),
(25,0,'2026-04-25 19:28:46','2026-04-25 22:28:46','','Pijama Rosa','','inherit','open','closed','','pijama-rosa-3','','','2026-04-25 19:28:46','2026-04-25 22:28:46','',16,'http://localhost:8080/wp-content/uploads/2026/04/pijama-rosa-1.jpg',0,'attachment','image/jpeg',0),
(29,0,'2026-04-25 19:38:55','2026-04-25 22:38:55','<!-- wp:woocommerce/cart -->\n<div class=\"wp-block-woocommerce-cart alignwide is-loading\"><!-- wp:woocommerce/filled-cart-block -->\n<div class=\"wp-block-woocommerce-filled-cart-block\"><!-- wp:woocommerce/cart-items-block -->\n<div class=\"wp-block-woocommerce-cart-items-block\"><!-- wp:woocommerce/cart-line-items-block -->\n<div class=\"wp-block-woocommerce-cart-line-items-block\"></div>\n<!-- /wp:woocommerce/cart-line-items-block -->\n\n<!-- wp:woocommerce/product-collection {\"queryId\":0,\"query\":{\"perPage\":3,\"pages\":1,\"offset\":0,\"postType\":\"product\",\"order\":\"asc\",\"orderBy\":\"title\",\"search\":\"\",\"exclude\":[],\"inherit\":false,\"taxQuery\":{},\"isProductCollectionBlock\":true,\"featured\":false,\"woocommerceOnSale\":false,\"woocommerceStockStatus\":[\"instock\",\"outofstock\",\"onbackorder\"],\"woocommerceAttributes\":[],\"woocommerceHandPickedProducts\":[],\"filterable\":false,\"relatedBy\":{\"categories\":true,\"tags\":true}},\"tagName\":\"div\",\"displayLayout\":{\"type\":\"flex\",\"columns\":3,\"shrinkColumns\":true},\"dimensions\":{\"widthType\":\"fill\"},\"collection\":\"woocommerce/product-collection/cross-sells\",\"hideControls\":[\"filterable\"],\"queryContextIncludes\":[\"collection\"],\"__privatePreviewState\":{\"isPreview\":true,\"previewMessage\":\"Actual products will vary depending on the page being viewed.\"}} -->\n<div class=\"wp-block-woocommerce-product-collection\"><!-- wp:heading {\"textAlign\":\"left\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"1rem\"}}}} -->\n<h2 class=\"wp-block-heading has-text-align-left\" style=\"margin-bottom:1rem\">You may be interested in&hellip;</h2>\n\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {\"showSaleBadge\":false,\"imageSizing\":\"thumbnail\",\"isDescendentOfQueryLoop\":true} -->\n<!-- wp:woocommerce/product-sale-badge {\"align\":\"right\"} /-->\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0.75rem\",\"top\":\"0\"}},\"typography\":{\"lineHeight\":\"1.4\"}},\"fontSize\":\"medium\",\"__woocommerceNamespace\":\"woocommerce/product-collection/product-title\"} /-->\n\n<!-- wp:woocommerce/product-price {\"isDescendentOfQueryLoop\":true,\"textAlign\":\"center\",\"fontSize\":\"small\"} /-->\n\n<!-- wp:woocommerce/product-button {\"textAlign\":\"center\",\"isDescendentOfQueryLoop\":true,\"fontSize\":\"small\"} /-->\n<!-- /wp:woocommerce/product-template --></div>\n<!-- /wp:woocommerce/product-collection --></div>\n\n<!-- /wp:woocommerce/cart-items-block -->\n\n<!-- wp:woocommerce/cart-totals-block -->\n<div class=\"wp-block-woocommerce-cart-totals-block\"><!-- wp:woocommerce/cart-order-summary-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-block\"><!-- wp:woocommerce/cart-order-summary-heading-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-heading-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-heading-block -->\n\n<!-- wp:woocommerce/cart-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/cart-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/cart-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-fee-block -->\n\n<!-- wp:woocommerce/cart-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-discount-block -->\n\n<!-- wp:woocommerce/cart-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/cart-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/cart-order-summary-block -->\n\n<!-- wp:woocommerce/cart-express-payment-block -->\n<div class=\"wp-block-woocommerce-cart-express-payment-block\"></div>\n<!-- /wp:woocommerce/cart-express-payment-block -->\n\n<!-- wp:woocommerce/proceed-to-checkout-block -->\n<div class=\"wp-block-woocommerce-proceed-to-checkout-block\"></div>\n<!-- /wp:woocommerce/proceed-to-checkout-block -->\n\n<!-- wp:woocommerce/cart-accepted-payment-methods-block -->\n<div class=\"wp-block-woocommerce-cart-accepted-payment-methods-block\"></div>\n<!-- /wp:woocommerce/cart-accepted-payment-methods-block --></div>\n<!-- /wp:woocommerce/cart-totals-block --></div>\n<!-- /wp:woocommerce/filled-cart-block -->\n\n<!-- wp:woocommerce/empty-cart-block -->\n<div class=\"wp-block-woocommerce-empty-cart-block\"><!-- wp:heading {\"textAlign\":\"center\",\"className\":\"with-empty-cart-icon wc-block-cart__empty-cart__title\"} -->\n<h2 class=\"wp-block-heading has-text-align-center with-empty-cart-icon wc-block-cart__empty-cart__title\">Your cart is currently empty!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator {\"className\":\"is-style-dots\"} -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity is-style-dots\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"textAlign\":\"center\"} -->\n<h2 class=\"wp-block-heading has-text-align-center\">New in store</h2>\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-new {\"columns\":4,\"rows\":1} /--></div>\n<!-- /wp:woocommerce/empty-cart-block --></div>\n<!-- /wp:woocommerce/cart -->','Carrinho','','inherit','closed','closed','','7-revision-v1','','','2026-04-25 19:38:55','2026-04-25 22:38:55','',7,'http://localhost:8080/?p=29',0,'revision','',0),
(30,0,'2026-04-25 19:39:16','2026-04-25 22:39:16','<!-- wp:woocommerce/checkout -->\n<div class=\"wp-block-woocommerce-checkout alignwide wc-block-checkout is-loading\"><!-- wp:woocommerce/checkout-fields-block -->\n<div class=\"wp-block-woocommerce-checkout-fields-block\"><!-- wp:woocommerce/checkout-express-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-express-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-express-payment-block -->\n\n<!-- wp:woocommerce/checkout-contact-information-block -->\n<div class=\"wp-block-woocommerce-checkout-contact-information-block\"></div>\n<!-- /wp:woocommerce/checkout-contact-information-block -->\n\n<!-- wp:woocommerce/checkout-shipping-method-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-method-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-method-block -->\n\n<!-- wp:woocommerce/checkout-pickup-options-block -->\n<div class=\"wp-block-woocommerce-checkout-pickup-options-block\"></div>\n<!-- /wp:woocommerce/checkout-pickup-options-block -->\n\n<!-- wp:woocommerce/checkout-shipping-address-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-address-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-address-block -->\n\n<!-- wp:woocommerce/checkout-billing-address-block -->\n<div class=\"wp-block-woocommerce-checkout-billing-address-block\"></div>\n<!-- /wp:woocommerce/checkout-billing-address-block -->\n\n<!-- wp:woocommerce/checkout-shipping-methods-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-methods-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-methods-block -->\n\n<!-- wp:woocommerce/checkout-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-payment-block -->\n\n<!-- wp:woocommerce/checkout-additional-information-block -->\n<div class=\"wp-block-woocommerce-checkout-additional-information-block\"></div>\n<!-- /wp:woocommerce/checkout-additional-information-block -->\n\n<!-- wp:woocommerce/checkout-order-note-block -->\n<div class=\"wp-block-woocommerce-checkout-order-note-block\"></div>\n<!-- /wp:woocommerce/checkout-order-note-block -->\n\n<!-- wp:woocommerce/checkout-terms-block -->\n<div class=\"wp-block-woocommerce-checkout-terms-block\"></div>\n<!-- /wp:woocommerce/checkout-terms-block -->\n\n<!-- wp:woocommerce/checkout-actions-block -->\n<div class=\"wp-block-woocommerce-checkout-actions-block\"></div>\n<!-- /wp:woocommerce/checkout-actions-block --></div>\n<!-- /wp:woocommerce/checkout-fields-block -->\n\n<!-- wp:woocommerce/checkout-totals-block -->\n<div class=\"wp-block-woocommerce-checkout-totals-block\"><!-- wp:woocommerce/checkout-order-summary-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-block\"><!-- wp:woocommerce/checkout-order-summary-cart-items-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-cart-items-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-cart-items-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-fee-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-discount-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/checkout-order-summary-block --></div>\n<!-- /wp:woocommerce/checkout-totals-block --></div>\n<!-- /wp:woocommerce/checkout -->','Finalizar Compra','','inherit','closed','closed','','8-revision-v1','','','2026-04-25 19:39:16','2026-04-25 22:39:16','',8,'http://localhost:8080/?p=30',0,'revision','',0),
(31,0,'2026-04-25 19:39:36','2026-04-25 22:39:36','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','Minha Conta','','inherit','closed','closed','','9-revision-v1','','','2026-04-25 19:39:36','2026-04-25 22:39:36','',9,'http://localhost:8080/?p=31',0,'revision','',0),
(32,0,'2026-04-25 19:41:12','2026-04-25 22:41:12','','Logo Pijamas','','inherit','open','closed','','logo-pijamas','','','2026-04-25 19:41:12','2026-04-25 22:41:12','',0,'http://localhost:8080/wp-content/uploads/2026/04/logo-2.png',0,'attachment','image/png',0),
(33,0,'2026-04-25 21:10:24','2026-04-26 00:10:24','','Logo Pijamas','','inherit','open','closed','','logo-pijamas-2','','','2026-04-25 21:10:24','2026-04-26 00:10:24','',0,'http://localhost:8080/wp-content/uploads/2026/04/logo-3.png',0,'attachment','image/png',0),
(34,0,'2026-04-25 21:11:04','2026-04-26 00:11:04','','Categoria Pijamas','','inherit','open','closed','','categoria-pijamas-3','','','2026-04-25 21:11:04','2026-04-26 00:11:04','',0,'http://localhost:8080/wp-content/uploads/2026/04/categoria-pijamas.png',0,'attachment','image/png',0),
(35,1,'2026-04-25 21:15:22','2026-04-26 00:15:22','','Order &ndash; abril 25, 2026 @ 09:15 PM','','wc-checkout-draft','open','closed','wc_order_DC4Me7OFsDV3a','pedido-26-de-april-de-2026-as-0015','','','2026-04-25 21:15:22','2026-04-26 00:15:22','',0,'http://localhost:8080/?post_type=shop_order&p=35',0,'shop_order','',0),
(36,0,'2026-04-25 21:26:19','2026-04-26 00:26:19','','Loja','','inherit','closed','closed','','6-revision-v1','','','2026-04-25 21:26:19','2026-04-26 00:26:19','',6,'http://localhost:8080/?p=36',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(12,2,0),
(12,16,0),
(14,2,0),
(14,16,0),
(16,2,0),
(16,16,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,1),
(2,2,'product_type','',0,3),
(3,3,'product_type','',0,0),
(4,4,'product_type','',0,0),
(5,5,'product_type','',0,0),
(6,6,'product_visibility','',0,0),
(7,7,'product_visibility','',0,0),
(8,8,'product_visibility','',0,0),
(9,9,'product_visibility','',0,0),
(10,10,'product_visibility','',0,0),
(11,11,'product_visibility','',0,0),
(12,12,'product_visibility','',0,0),
(13,13,'product_visibility','',0,0),
(14,14,'product_visibility','',0,0),
(15,15,'product_cat','',0,0),
(16,16,'product_cat','Pijamas confortáveis para toda a família',0,3);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
INSERT INTO `wp_termmeta` VALUES
(1,16,'thumbnail_id','34'),
(2,16,'product_count_product_cat','3');
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'simple','simple',0),
(3,'grouped','grouped',0),
(4,'variable','variable',0),
(5,'external','external',0),
(6,'exclude-from-search','exclude-from-search',0),
(7,'exclude-from-catalog','exclude-from-catalog',0),
(8,'featured','featured',0),
(9,'outofstock','outofstock',0),
(10,'rated-1','rated-1',0),
(11,'rated-2','rated-2',0),
(12,'rated-3','rated-3',0),
(13,'rated-4','rated-4',0),
(14,'rated-5','rated-5',0),
(15,'Uncategorized','uncategorized',0),
(16,'Pijamas','pijamas',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'admin','$P$BifYU/DlekNrLEU2k8r6n.Qy3MHMA/1','admin','murillodantondlc@gmail.com','http://localhost:8080','2026-04-25 20:45:40','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `actioned_text` varchar(255) NOT NULL,
  `nonce_action` varchar(255) DEFAULT NULL,
  `nonce_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `content_data` longtext DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `source` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) NOT NULL DEFAULT '',
  `image` varchar(200) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_notes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_category_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_category_lookup` VALUES
(16,16);
/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_customer_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_download_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_download_log` WRITE;
/*!40000 ALTER TABLE `wp_wc_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_download_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_coupon_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_order_coupon_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_item_id`,`order_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_product_date` (`customer_id`,`product_id`,`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_order_product_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_paid` datetime DEFAULT '0000-00-00 00:00:00',
  `date_completed` datetime DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`),
  KEY `idx_date_paid_status_parent` (`date_paid`,`status`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_order_stats` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_tax_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_order_tax_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_product_attributes_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_attributes_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_attributes_lookup` (
  `product_id` bigint(20) NOT NULL,
  `product_or_parent_id` bigint(20) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `is_variation_attribute` tinyint(1) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_or_parent_id`,`term_id`,`product_id`,`taxonomy`),
  KEY `is_variation_attribute_term_id` (`is_variation_attribute`,`term_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_attributes_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_product_attributes_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_product_download_directories`
--

DROP TABLE IF EXISTS `wp_wc_product_download_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_download_directories` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_download_directories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_product_download_directories` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_download_directories` DISABLE KEYS */;
INSERT INTO `wp_wc_product_download_directories` VALUES
(1,'file:///var/www/html/wp-content/uploads/woocommerce_uploads/',1),
(2,'http://localhost:8080/wp-content/uploads/woocommerce_uploads/',1);
/*!40000 ALTER TABLE `wp_wc_product_download_directories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) DEFAULT '',
  `global_unique_id` varchar(100) DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) DEFAULT 'taxable',
  `tax_class` varchar(100) DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`),
  KEY `sku` (`sku`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_product_meta_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_product_meta_lookup` VALUES
(14,'','',0,0,35.0000,35.0000,1,9,'instock',0,0.00,1,'taxable','');
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_rate_limits`
--

DROP TABLE IF EXISTS `wp_wc_rate_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_rate_limits` (
  `rate_limit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rate_limit_key` varchar(200) NOT NULL,
  `rate_limit_expiry` bigint(20) unsigned NOT NULL,
  `rate_limit_remaining` smallint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rate_limit_id`),
  UNIQUE KEY `rate_limit_key` (`rate_limit_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_rate_limits`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_rate_limits` WRITE;
/*!40000 ALTER TABLE `wp_wc_rate_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_rate_limits` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_reserved_stock`
--

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_reserved_stock`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_reserved_stock` WRITE;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;
INSERT INTO `wp_wc_tax_rate_classes` VALUES
(1,'Reduced rate','reduced-rate'),
(2,'Zero rate','zero-rate');
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text NOT NULL,
  `secret` text NOT NULL,
  `topic` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_webhooks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_wc_webhooks` WRITE;
/*!40000 ALTER TABLE `wp_wc_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_webhooks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `permissions` varchar(10) NOT NULL,
  `consumer_key` char(64) NOT NULL,
  `consumer_secret` char(43) NOT NULL,
  `nonces` longtext DEFAULT NULL,
  `truncated_key` char(7) NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` varchar(200) DEFAULT NULL,
  `attribute_type` varchar(20) NOT NULL,
  `attribute_orderby` varchar(20) NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`),
  KEY `idx_user_email` (`user_email`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_downloadable_product_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `context` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_log` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_order_itemmeta` VALUES
(1,1,'_product_id','14'),
(2,1,'_variation_id','0'),
(3,1,'_qty','1'),
(4,1,'_tax_class',''),
(5,1,'_line_subtotal','35'),
(6,1,'_line_subtotal_tax','0'),
(7,1,'_line_total','35'),
(8,1,'_line_tax','0'),
(9,1,'_line_tax_data','a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}'),
(10,2,'method_id','flat_rate'),
(11,2,'instance_id','1'),
(12,2,'cost','5'),
(13,2,'total_tax','0'),
(14,2,'taxes','a:1:{s:5:\"total\";a:0:{}}'),
(15,2,'Items','Pijama Azul &times; 1'),
(16,3,'_product_id','14'),
(17,3,'_variation_id','0'),
(18,3,'_qty','1'),
(19,3,'_tax_class',''),
(20,3,'_line_subtotal','35'),
(21,3,'_line_subtotal_tax','0'),
(22,3,'_line_total','35'),
(23,3,'_line_tax','0'),
(24,3,'_line_tax_data','a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}'),
(31,5,'method_id','flat_rate'),
(32,5,'instance_id','1'),
(33,5,'cost','5'),
(34,5,'total_tax','0'),
(35,5,'taxes','a:1:{s:5:\"total\";a:0:{}}'),
(36,5,'Itens','Pijama Azul &times; 1'),
(37,3,'_reduced_stock','1'),
(38,6,'_product_id','14'),
(39,6,'_variation_id','0'),
(40,6,'_qty','1'),
(41,6,'_tax_class',''),
(42,6,'_line_subtotal','35'),
(43,6,'_line_subtotal_tax','0'),
(44,6,'_line_total','35'),
(45,6,'_line_tax','0'),
(46,6,'_line_tax_data','a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}'),
(47,7,'method_id','flat_rate'),
(48,7,'instance_id','1'),
(49,7,'cost','5'),
(50,7,'total_tax','0'),
(51,7,'taxes','a:1:{s:5:\"total\";a:0:{}}'),
(52,7,'Itens','Pijama Azul &times; 1');
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_order_items` VALUES
(1,'Pijama Azul','line_item',21),
(2,'Frete fixo','shipping',21),
(3,'Pijama Azul','line_item',22),
(5,'Frete fixo','shipping',22),
(6,'Pijama Azul','line_item',35),
(7,'Frete fixo','shipping',35);
/*!40000 ALTER TABLE `wp_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokenmeta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_payment_tokenmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) NOT NULL,
  `token` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_payment_tokens` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`),
  KEY `session_expiry` (`session_expiry`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_sessions` VALUES
(1,'t_8d53a78dbc05c04eee9d8895f24731','a:9:{s:8:\"customer\";s:932:\"a:28:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:8:\"Murillo \";s:9:\"last_name\";s:6:\"Danton\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:25:\"murillodanton@hotmail.com\";s:7:\"address\";s:20:\"Rua sete de setembro\";s:9:\"address_1\";s:20:\"Rua sete de setembro\";s:9:\"address_2\";s:4:\"Casa\";s:4:\"city\";s:12:\"Paraisopolis\";s:5:\"state\";s:2:\"MG\";s:8:\"postcode\";s:9:\"37660-000\";s:7:\"country\";s:2:\"BR\";s:19:\"shipping_first_name\";s:8:\"Murillo \";s:18:\"shipping_last_name\";s:6:\"Danton\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:20:\"Rua sete de setembro\";s:18:\"shipping_address_1\";s:20:\"Rua sete de setembro\";s:18:\"shipping_address_2\";s:4:\"Casa\";s:13:\"shipping_city\";s:12:\"Paraisopolis\";s:14:\"shipping_state\";s:2:\"MG\";s:17:\"shipping_postcode\";s:9:\"37660-000\";s:16:\"shipping_country\";s:2:\"BR\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";s:21:\"chosen_payment_method\";s:3:\"cod\";s:22:\"shipping_for_package_0\";s:459:\"a:2:{s:12:\"package_hash\";s:40:\"wc_ship_beeba625fe9fc4faddb04d3533a0352c\";s:5:\"rates\";a:1:{s:11:\"flat_rate:1\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:11:\"flat_rate:1\";s:9:\"method_id\";s:9:\"flat_rate\";s:11:\"instance_id\";i:1;s:5:\"label\";s:10:\"Frete fixo\";s:4:\"cost\";s:1:\"5\";s:5:\"taxes\";a:0:{}s:10:\"tax_status\";s:4:\"none\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Itens\";s:21:\"Pijama Azul &times; 1\";}}}}\";s:25:\"previous_shipping_methods\";s:39:\"a:1:{i:0;a:1:{i:0;s:11:\"flat_rate:1\";}}\";s:23:\"chosen_shipping_methods\";s:29:\"a:1:{i:0;s:11:\"flat_rate:1\";}\";s:22:\"shipping_method_counts\";s:14:\"a:1:{i:0;i:1;}\";s:11:\"cart_totals\";s:393:\"a:15:{s:8:\"subtotal\";s:2:\"35\";s:12:\"subtotal_tax\";d:0;s:14:\"shipping_total\";s:1:\"5\";s:12:\"shipping_tax\";d:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:2:\"35\";s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:5:\"40.00\";s:9:\"total_tax\";d:0;}\";s:4:\"cart\";s:410:\"a:1:{s:32:\"aab3238922bcc25a6f606eb525ffdc56\";a:11:{s:3:\"key\";s:32:\"aab3238922bcc25a6f606eb525ffdc56\";s:10:\"product_id\";i:14;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:35;s:17:\"line_subtotal_tax\";d:0;s:10:\"line_total\";d:35;s:8:\"line_tax\";d:0;}}\";s:21:\"store_api_draft_order\";i:35;}',1777327960);
/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `zone_id` (`zone_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_locations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_shipping_zone_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_locations` VALUES
(1,1,'BR','country');
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`),
  KEY `zone_id` (`zone_id`),
  KEY `method_id` (`method_id`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_methods`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_shipping_zone_methods` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_methods` VALUES
(1,1,'flat_rate',1,1);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `zone_order_id` (`zone_order`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zones`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_shipping_zones` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zones` VALUES
(1,'Brasil',0);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rate_locations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(8) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-26  0:28:30
