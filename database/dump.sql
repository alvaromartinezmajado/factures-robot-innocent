/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Linux (aarch64)
--
-- Host: invoiceplane-db    Database: invoiceplane_db
-- ------------------------------------------------------
-- Server version	10.9.8-MariaDB-1:10.9.8+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `invoiceplane_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `invoiceplane_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `invoiceplane_db`;

--
-- Table structure for table `ip_client_custom`
--

DROP TABLE IF EXISTS `ip_client_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_client_custom` (
  `client_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `client_custom_fieldid` int(11) NOT NULL,
  `client_custom_fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`client_custom_id`),
  UNIQUE KEY `client_id` (`client_id`,`client_custom_fieldid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_client_custom`
--

LOCK TABLES `ip_client_custom` WRITE;
/*!40000 ALTER TABLE `ip_client_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_client_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_client_notes`
--

DROP TABLE IF EXISTS `ip_client_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_client_notes` (
  `client_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `client_note_date` date NOT NULL,
  `client_note` longtext NOT NULL,
  PRIMARY KEY (`client_note_id`),
  KEY `client_id` (`client_id`,`client_note_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_client_notes`
--

LOCK TABLES `ip_client_notes` WRITE;
/*!40000 ALTER TABLE `ip_client_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_client_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_clients`
--

DROP TABLE IF EXISTS `ip_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_date_created` datetime NOT NULL,
  `client_date_modified` datetime NOT NULL,
  `client_name` text DEFAULT NULL,
  `client_address_1` text DEFAULT NULL,
  `client_address_2` text DEFAULT NULL,
  `client_city` text DEFAULT NULL,
  `client_state` text DEFAULT NULL,
  `client_zip` text DEFAULT NULL,
  `client_country` text DEFAULT NULL,
  `client_phone` text DEFAULT NULL,
  `client_fax` text DEFAULT NULL,
  `client_mobile` text DEFAULT NULL,
  `client_email` text DEFAULT NULL,
  `client_web` text DEFAULT NULL,
  `client_vat_id` text DEFAULT NULL,
  `client_tax_code` text DEFAULT NULL,
  `client_language` varchar(255) DEFAULT 'system',
  `client_active` int(1) NOT NULL DEFAULT 1,
  `client_surname` varchar(255) DEFAULT NULL,
  `client_avs` varchar(16) DEFAULT NULL,
  `client_insurednumber` varchar(30) DEFAULT NULL,
  `client_veka` varchar(30) DEFAULT NULL,
  `client_birthdate` date DEFAULT NULL,
  `client_gender` int(1) DEFAULT 0,
  PRIMARY KEY (`client_id`),
  KEY `client_active` (`client_active`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_clients`
--

LOCK TABLES `ip_clients` WRITE;
/*!40000 ALTER TABLE `ip_clients` DISABLE KEYS */;
INSERT INTO `ip_clients` VALUES
(89,'1330-08-07 17:51:53','1330-08-07 17:51:53','BINNAS SHINAASI ASANOVA','CALLE POETA ARTOLA 16, 11','VAT: X8519084E','València','','46021','Spain','',NULL,NULL,'','','X8519084E','X8519084E','system',1,NULL,NULL,NULL,NULL,NULL,0),
(90,'1970-01-01 00:00:00','1970-01-01 00:00:00','WBS Coding School by WBS TRAINING AG','Lorenzweg 5','VAT: DE209768248','','Berlin','12099','Germany','',NULL,NULL,'','','DE209768248','DE209768248','system',1,NULL,NULL,NULL,NULL,NULL,0),
(91,'1970-01-01 00:00:00','1970-01-01 00:00:00','Fiverr International Ltd','8 Eliezar Kaplan st.','VAT: 558327284','Tel Aviv','','6473409','','',NULL,NULL,'','','558327284','558327284','system',1,NULL,NULL,NULL,NULL,NULL,0),
(92,'7993-08-07 17:32:53','7993-08-07 17:32:53','Institut d\'Estudis Catalans','Institut d\'Estudis Catalans','Carrer del Carme, 47 - VAT: G08674327','Barcelona','Barcelona','08001','Spain','',NULL,NULL,'','','G08674327','G08674327','system',1,NULL,NULL,NULL,NULL,NULL,0),
(93,'1970-01-01 00:00:00','1970-01-01 00:00:00','KRESCO GROWTH S.L.','Carrer ANTONIO RICARDOS, 1, 4o 1a','VAT: B19340934','Barcelona','Barcelona','08027','Spain','',NULL,NULL,'','','B19340934','B19340934','system',1,NULL,NULL,NULL,NULL,NULL,0),
(94,'1970-01-01 00:00:00','1970-01-01 00:00:00','Arnau Julià Collados','C/Mallorca 540 6e 1a','','Barcelona','Barcelona','08026','Spain','',NULL,NULL,'','','',NULL,'system',1,NULL,NULL,NULL,NULL,NULL,0),
(95,'1970-01-01 00:00:00','1970-01-01 00:00:00','AulaDrupal, S.L.','Rúa Do Campo, nº 23, 1º C','VAT: B06971048','Sigueiro - Oroso','A Coruña','15888','Spain','',NULL,NULL,'','','B06971048','B06971048','system',1,NULL,NULL,NULL,NULL,NULL,0),
(96,'6320-08-07 17:19:48','1970-01-01 00:00:00','Vianet Limited','2, Liesel Court Mimosa Street','VAT: MT19744135','Pieta','','','','',NULL,NULL,'','','MT19744135','MT19744135','system',1,NULL,NULL,NULL,NULL,NULL,0),
(97,'1970-01-01 00:00:00','2025-10-01 12:46:40','Crític SCCL','Casp 43, baixos.','08010 Barcelona - VAT: F66334806','Barcelona','Catalonia','08010','Spain','',NULL,NULL,'','','F66334806','F66334806','system',1,NULL,NULL,NULL,NULL,NULL,0),
(98,'1970-01-01 00:00:00','1970-01-01 00:00:00','Playbrand SL','/ Pic de Peguera, 11 17003 de Girona','VAT: B55250922','Girona','Girona','17003','Spain','',NULL,NULL,'','','B55250922','B55250922','system',1,NULL,NULL,NULL,NULL,NULL,0),
(99,'1970-01-01 00:00:00','4404-08-07 17:41:42','Premier Recruitment International','Lapps Quay','VAT: IE4726096A','Cork','','','','',NULL,NULL,'','','IE4726096A','IE4726096A','system',1,NULL,NULL,NULL,NULL,NULL,0),
(100,'2025-08-07 21:13:21','2025-08-07 21:24:52','Garaje de Ideas SL','Calle Magallanes, 25, 2ª planta','B86426780','Madrid','','28015','ES','','','','','','B86426780','','system',1,'',NULL,NULL,NULL,'0000-00-00',0),
(101,'2025-10-01 12:20:06','2025-10-01 12:44:57','Robot Innocent SL','Carrer de Solà, 25, baixos','FINAL-PUSH-TEST','Barcelona','Catalunya','08014','España',NULL,NULL,NULL,NULL,NULL,NULL,'B66856089','system',1,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ip_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_custom_fields`
--

DROP TABLE IF EXISTS `ip_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_custom_fields` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_table` varchar(50) DEFAULT NULL,
  `custom_field_label` varchar(50) DEFAULT NULL,
  `custom_field_type` varchar(255) NOT NULL DEFAULT 'TEXT',
  `custom_field_location` int(11) DEFAULT 0,
  `custom_field_order` int(11) DEFAULT 999,
  PRIMARY KEY (`custom_field_id`),
  UNIQUE KEY `custom_field_table_2` (`custom_field_table`,`custom_field_label`),
  KEY `custom_field_table` (`custom_field_table`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_custom_fields`
--

LOCK TABLES `ip_custom_fields` WRITE;
/*!40000 ALTER TABLE `ip_custom_fields` DISABLE KEYS */;
INSERT INTO `ip_custom_fields` VALUES
(1,'ip_clients','VAT Number','TEXT',0,1);
/*!40000 ALTER TABLE `ip_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_custom_values`
--

DROP TABLE IF EXISTS `ip_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_custom_values` (
  `custom_values_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_values_field` int(11) NOT NULL,
  `custom_values_value` text NOT NULL,
  PRIMARY KEY (`custom_values_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_custom_values`
--

LOCK TABLES `ip_custom_values` WRITE;
/*!40000 ALTER TABLE `ip_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_email_templates`
--

DROP TABLE IF EXISTS `ip_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_email_templates` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_template_title` text DEFAULT NULL,
  `email_template_type` varchar(255) DEFAULT NULL,
  `email_template_body` longtext NOT NULL,
  `email_template_subject` text DEFAULT NULL,
  `email_template_from_name` text DEFAULT NULL,
  `email_template_from_email` text DEFAULT NULL,
  `email_template_cc` text DEFAULT NULL,
  `email_template_bcc` text DEFAULT NULL,
  `email_template_pdf_template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_email_templates`
--

LOCK TABLES `ip_email_templates` WRITE;
/*!40000 ALTER TABLE `ip_email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_families`
--

DROP TABLE IF EXISTS `ip_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_families` (
  `family_id` int(11) NOT NULL AUTO_INCREMENT,
  `family_name` text DEFAULT NULL,
  PRIMARY KEY (`family_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_families`
--

LOCK TABLES `ip_families` WRITE;
/*!40000 ALTER TABLE `ip_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_import_details`
--

DROP TABLE IF EXISTS `ip_import_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_import_details` (
  `import_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `import_lang_key` varchar(35) NOT NULL,
  `import_table_name` varchar(35) NOT NULL,
  `import_record_id` int(11) NOT NULL,
  PRIMARY KEY (`import_detail_id`),
  KEY `import_id` (`import_id`,`import_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_import_details`
--

LOCK TABLES `ip_import_details` WRITE;
/*!40000 ALTER TABLE `ip_import_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_import_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_imports`
--

DROP TABLE IF EXISTS `ip_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_imports` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_date` datetime NOT NULL,
  PRIMARY KEY (`import_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_imports`
--

LOCK TABLES `ip_imports` WRITE;
/*!40000 ALTER TABLE `ip_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_amounts`
--

DROP TABLE IF EXISTS `ip_invoice_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_amounts` (
  `invoice_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `invoice_sign` enum('1','-1') NOT NULL DEFAULT '1',
  `invoice_item_subtotal` decimal(20,2) DEFAULT NULL,
  `invoice_item_tax_total` decimal(20,2) DEFAULT NULL,
  `invoice_tax_total` decimal(20,2) DEFAULT NULL,
  `invoice_total` decimal(20,2) DEFAULT NULL,
  `invoice_paid` decimal(20,2) DEFAULT NULL,
  `invoice_balance` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`invoice_amount_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `invoice_paid` (`invoice_paid`,`invoice_balance`)
) ENGINE=MyISAM AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_amounts`
--

LOCK TABLES `ip_invoice_amounts` WRITE;
/*!40000 ALTER TABLE `ip_invoice_amounts` DISABLE KEYS */;
INSERT INTO `ip_invoice_amounts` VALUES
(435,435,'1',40.00,0.00,0.00,40.00,40.00,0.00),
(436,436,'1',1361.25,0.00,0.00,1361.25,1361.25,0.00),
(437,437,'1',3712.28,0.00,0.00,3712.28,3712.28,0.00),
(438,438,'1',85.00,0.00,0.00,85.00,85.00,0.00),
(439,439,'1',3717.12,0.00,0.00,3717.12,3717.12,0.00),
(440,440,'1',217.80,0.00,0.00,217.80,217.80,0.00),
(441,441,'1',907.50,0.00,0.00,907.50,907.50,0.00),
(442,442,'1',453.75,0.00,0.00,453.75,453.75,0.00),
(443,443,'1',484.00,0.00,0.00,484.00,484.00,0.00),
(444,444,'1',3082.00,0.00,0.00,3082.00,3082.00,0.00),
(445,445,'1',1512.50,0.00,0.00,1512.50,1512.50,0.00),
(446,446,'1',1512.50,0.00,0.00,1512.50,1512.50,0.00),
(447,447,'1',1210.00,0.00,0.00,1210.00,1210.00,0.00),
(448,448,'1',1361.25,0.00,0.00,1361.25,1361.25,0.00),
(449,449,'1',605.00,0.00,0.00,605.00,605.00,0.00),
(450,450,'1',605.00,0.00,0.00,605.00,605.00,0.00),
(451,451,'1',665.50,0.00,0.00,665.50,665.50,0.00),
(452,452,'1',182.75,0.00,0.00,182.75,182.75,0.00),
(453,453,'1',1210.00,0.00,0.00,1210.00,1210.00,0.00),
(454,454,'1',522.00,0.00,0.00,522.00,522.00,0.00),
(455,455,'1',4840.00,0.00,0.00,4840.00,4840.00,0.00),
(456,456,'1',3052.23,0.00,0.00,3052.23,3052.23,0.00),
(457,457,'1',606.89,0.00,0.00,606.89,606.89,0.00),
(458,458,'1',242.00,0.00,0.00,242.00,242.00,0.00),
(459,459,'1',3630.00,0.00,0.00,3630.00,3630.00,0.00),
(460,460,'1',500.00,0.00,0.00,500.00,500.00,0.00),
(461,461,'1',175.00,0.00,0.00,175.00,175.00,0.00),
(462,462,'1',7260.00,0.00,0.00,7260.00,7260.00,0.00),
(463,463,'1',3630.00,0.00,0.00,3630.00,3630.00,0.00),
(464,464,'1',180.00,0.00,0.00,180.00,180.00,0.00),
(465,465,'1',3630.00,0.00,0.00,3630.00,3630.00,0.00),
(466,466,'1',470.00,0.00,0.00,470.00,470.00,0.00),
(467,467,'1',609.84,0.00,0.00,609.84,609.84,0.00),
(468,468,'1',240.00,0.00,0.00,240.00,240.00,0.00),
(469,469,'1',3630.00,0.00,0.00,3630.00,3630.00,0.00),
(470,470,'1',3674.77,0.00,0.00,3674.77,3674.77,0.00),
(471,471,'1',204.49,0.00,0.00,204.49,204.49,0.00),
(472,472,'1',306.00,0.00,0.00,306.00,306.00,0.00),
(473,473,'1',423.50,0.00,0.00,423.50,423.50,0.00),
(474,474,'1',40.00,0.00,0.00,40.00,40.00,0.00),
(475,475,'1',3672.35,0.00,0.00,3672.35,3672.35,0.00),
(476,476,'1',18.15,0.00,0.00,18.15,18.15,0.00),
(477,477,'1',785.00,0.00,0.00,785.00,785.00,0.00),
(478,478,'1',789.60,0.00,0.00,789.60,789.60,0.00),
(479,479,'1',227.40,0.00,0.00,227.40,227.40,0.00),
(480,480,'1',100.00,0.00,0.00,100.00,100.00,0.00),
(481,481,'1',3630.00,0.00,0.00,3630.00,3630.00,0.00),
(482,482,'1',2880.00,0.00,0.00,2880.00,2880.00,0.00),
(483,483,'1',9120.00,0.00,0.00,9120.00,9120.00,0.00),
(484,484,'1',6720.00,0.00,0.00,6720.00,6720.00,0.00),
(485,485,'1',9600.00,0.00,0.00,9600.00,9600.00,0.00),
(486,486,'1',7200.00,0.00,0.00,7200.00,7200.00,0.00),
(487,487,'1',5760.00,0.00,0.00,5760.00,5760.00,0.00),
(488,488,'1',11040.00,0.00,0.00,11040.00,11040.00,0.00),
(489,489,'1',630.69,0.00,0.00,630.69,630.69,0.00),
(490,490,'1',8640.00,0.00,0.00,8640.00,8640.00,0.00),
(491,491,'1',10560.00,0.00,0.00,10560.00,10560.00,0.00),
(492,492,'1',10080.00,0.00,0.00,10080.00,10080.00,0.00),
(493,493,'1',9600.00,0.00,0.00,9600.00,9600.00,0.00),
(494,494,'1',10080.00,0.00,0.00,10080.00,10080.00,0.00),
(495,495,'1',10560.00,0.00,0.00,10560.00,10560.00,0.00),
(496,496,'1',3840.00,0.00,0.00,3840.00,3840.00,0.00),
(499,499,'1',1400.00,294.00,0.00,1694.00,0.00,1694.00),
(500,500,'1',2300.00,483.00,483.00,2783.00,0.00,2783.00),
(501,501,'1',2400.00,472.50,472.50,2872.50,0.00,2872.50);
/*!40000 ALTER TABLE `ip_invoice_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_custom`
--

DROP TABLE IF EXISTS `ip_invoice_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_custom` (
  `invoice_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `invoice_custom_fieldid` int(11) NOT NULL,
  `invoice_custom_fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`invoice_custom_id`),
  UNIQUE KEY `invoice_id` (`invoice_id`,`invoice_custom_fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_custom`
--

LOCK TABLES `ip_invoice_custom` WRITE;
/*!40000 ALTER TABLE `ip_invoice_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_invoice_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_groups`
--

DROP TABLE IF EXISTS `ip_invoice_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_groups` (
  `invoice_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_group_name` text DEFAULT NULL,
  `invoice_group_identifier_format` varchar(255) NOT NULL,
  `invoice_group_next_id` int(11) NOT NULL,
  `invoice_group_left_pad` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`invoice_group_id`),
  KEY `invoice_group_next_id` (`invoice_group_next_id`),
  KEY `invoice_group_left_pad` (`invoice_group_left_pad`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_groups`
--

LOCK TABLES `ip_invoice_groups` WRITE;
/*!40000 ALTER TABLE `ip_invoice_groups` DISABLE KEYS */;
INSERT INTO `ip_invoice_groups` VALUES
(3,'Invoice Default','{{{id}}}',2,0),
(4,'Quote Default','QUO{{{id}}}',1,0),
(5,'Factura','SERI-{{{id}}}',3,5);
/*!40000 ALTER TABLE `ip_invoice_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_item_amounts`
--

DROP TABLE IF EXISTS `ip_invoice_item_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_item_amounts` (
  `item_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_subtotal` decimal(20,2) DEFAULT NULL,
  `item_tax_total` decimal(20,2) DEFAULT NULL,
  `item_discount` decimal(20,2) DEFAULT NULL,
  `item_total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_amount_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_item_amounts`
--

LOCK TABLES `ip_invoice_item_amounts` WRITE;
/*!40000 ALTER TABLE `ip_invoice_item_amounts` DISABLE KEYS */;
INSERT INTO `ip_invoice_item_amounts` VALUES
(1,721,1400.00,294.00,0.00,1694.00);
/*!40000 ALTER TABLE `ip_invoice_item_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_items`
--

DROP TABLE IF EXISTS `ip_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL DEFAULT 0,
  `item_product_id` int(11) DEFAULT NULL,
  `item_date_added` date NOT NULL,
  `item_task_id` int(11) DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `item_description` longtext DEFAULT NULL,
  `item_quantity` decimal(10,2) NOT NULL,
  `item_price` decimal(20,2) DEFAULT NULL,
  `item_discount_amount` decimal(20,2) DEFAULT NULL,
  `item_order` int(2) NOT NULL DEFAULT 0,
  `item_is_recurring` tinyint(1) DEFAULT NULL,
  `item_product_unit` varchar(50) DEFAULT NULL,
  `item_product_unit_id` int(11) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `invoice_id` (`invoice_id`,`item_tax_rate_id`,`item_date_added`,`item_order`)
) ENGINE=MyISAM AUTO_INCREMENT=725 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_items`
--

LOCK TABLES `ip_invoice_items` WRITE;
/*!40000 ALTER TABLE `ip_invoice_items` DISABLE KEYS */;
INSERT INTO `ip_invoice_items` VALUES
(631,435,0,NULL,'2025-08-07',NULL,'PHP Software development and system / docker operations','Diagnostic and report on website downtime issue due to REAP API failure, including log analysis and identification of error intervals, and writing of the email message intented for the end client',1.00,40.00,NULL,1,NULL,NULL,NULL,NULL),
(632,436,14,NULL,'2025-08-07',NULL,'Crític','Desenvolupament per a tasques de restyling del web de CRÍTIC',3.00,375.00,NULL,1,NULL,NULL,NULL,NULL),
(633,437,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3068.00,NULL,1,NULL,NULL,NULL,NULL),
(634,438,0,NULL,'2025-08-07',NULL,'PHP Software development: Website Frontend Issue Resolution and Image Restoration','Fixing Frontend Issues in Saragrech.com: frontend alignment problems, missing testimonial images, and other sections where images are not displaying correctly',1.00,85.00,NULL,1,NULL,NULL,NULL,NULL),
(635,439,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3072.00,NULL,1,NULL,NULL,NULL,NULL),
(636,440,14,NULL,'2025-08-07',NULL,'Desarrollo web / Sistemas','clustag.com apuntado a la web antes accesible desde new.clustag.com',1.00,180.00,NULL,1,NULL,NULL,NULL,NULL),
(637,441,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1.00,1000.00,NULL,1,NULL,NULL,NULL,NULL),
(638,441,14,NULL,'2025-08-07',NULL,'Descompte comercial','Descompte comercial per col·laboració',1.00,-250.00,NULL,2,NULL,NULL,NULL,NULL),
(639,442,14,NULL,'2025-08-07',NULL,'Crític','Desenvolupament de desenvolupament web. Activitat a #43 Autologins per campanya de Telemàrqueting. \n#10 Landing de captació de fons\n#3 Baixa automàtica dels usuaris al cap de 60 dies\n\nentre d\'altres. \n\nSegons email \"Acta reunió 10/04/2025\" de roger.pbalanya@gmail.com a feina@alvaro.cat el 10 d\'abril de 2025, CAJ5cWeszWq-LcVEG3j3D=P1-F93BtYo6rywEBW6PZkw8T9VjWw.',1.00,750.00,NULL,1,NULL,NULL,NULL,NULL),
(640,442,14,NULL,'2025-08-07',NULL,'Descompte comercial','Descompte comercial per col·laboració (50%)',1.00,-375.00,NULL,2,NULL,NULL,NULL,NULL),
(641,443,14,NULL,'2025-08-07',NULL,'Revisió tècnica i redacció d\'informació amb resposta detallada a les queixes sobre el projecte Turalgi','Anàlisi tècnica individualitzada de cadascuna de les observacions del client final.\n\nElaboració de documents de resposta amb captures, codis i justificació tècnica.\n\nRedacció de taula resum d’arguments i funcions.\n\nPreparació de materials.',1.00,400.00,NULL,1,NULL,NULL,NULL,NULL),
(642,443,14,NULL,'2025-08-07',NULL,'Item','',1.00,0.00,NULL,2,NULL,NULL,NULL,NULL),
(643,444,0,NULL,'2025-08-07',NULL,'Site Optimization','Speed and Performance Optimization – WBS Coding School (09/04/2025) – project agreed upon and signed 11 april 2025\nGeneral Frontend and Server Optimization	\nElementor-Specific Performance Optimizations',1.00,3082.00,NULL,1,NULL,NULL,NULL,NULL),
(644,445,14,NULL,'2025-08-07',NULL,'Crític','Resolució de tasques de desenvolupament segons https://github.com/Metodian-com/critic-tasques/ i project management, segons message id CAJ5cWes1fv5ajjyHkBoO4Lc__nXMvTnVKnkh52A5t6U=Sarq7Q',1.00,1250.00,NULL,1,NULL,NULL,NULL,NULL),
(645,446,14,NULL,'2025-08-07',NULL,'Crític','Resolució de tasques de desenvolupament segons https://github.com/Metodian-com/critic-tasques/issues, elaboració d\'una landing per a la promoció del finançament col·lectiu d\'un local segons message id CAJ5cWes1fv5ajjyHkBoO4Lc__nXMvTnVKnkh52A5t6U=Sarq7Q',1.00,1250.00,NULL,1,NULL,NULL,NULL,NULL),
(646,447,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1.00,1000.00,NULL,1,NULL,NULL,NULL,NULL),
(647,448,14,NULL,'2025-08-07',NULL,'Crític','Tasques relacionades amb PMPro, AWS, desenvolupament PHP, durant febrer, març i abril de 2024',3.00,375.00,NULL,1,NULL,NULL,NULL,NULL),
(648,449,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1.00,1000.00,NULL,1,NULL,NULL,NULL,NULL),
(649,449,14,NULL,'2025-08-07',NULL,'Descompte comercial','Descompte comercial per col·laboració',1.00,-500.00,NULL,2,NULL,NULL,NULL,NULL),
(650,450,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1.00,1000.00,NULL,1,NULL,NULL,NULL,NULL),
(651,450,14,NULL,'2025-08-07',NULL,'Descompte comercial','Descompte comercial per col·laboració',1.00,-500.00,NULL,2,NULL,NULL,NULL,NULL),
(652,451,14,NULL,'2025-08-07',NULL,'Crític','Resolució de tasques març 2025: la incidència #32 sobre la conversió incorrecta d’apòstrofs i cometes en HTML entities dins del blade dels mòduls nous; la #31 relativa a l’alineació a la dreta de les fletxes del slider de Comunitat en vista mòbil; la #30, que demanava millorar el comportament del swiper perquè un toc a les fletxes mostrés tot un slide més; la #29, que afegia la possibilitat d\'una imatge de sobreescriptura a la miniatura del vídeo en el mòdul de portada de podcast; la #28, que resolia el problema d\'espai entre el text i la imatge del patrocinador; la #27, per limitar a la meitat del contenidor l\'amplada màxima de la imatge del patrocinador a mòbil; la #26, que incorporava el camp de títol d’episodi al mateix mòdul; la #25, que corregia l’aplicació errònia del disseny de titular a la descripció; la #24, que permetia una opció alternativa de miniatures no relacionades al mòdul de slider gran; la #23, que solucionava l’error que impedia que les relacionades saltessin a dues línies a mòbil; la #21, que afegia una propietat per marcar les relacionades com a opinió o no i canviar la forma de la foto segons el cas; la #20, que incloïa un subratllat de punts i transformava a majúscules el nom de l\'autor dins de la caixa corresponent; la #19, que restablia la visualització de la fotografia de l\'autor quan es marcava “mostrar caixa de l\'autor”; la #18, que corregia l’ús del camp de citació com a nom de l’entrevistat; la #33, que excloïa una notícia específica (ID 233123) de l’infinite scrolling en contingut tancat; i la #13, que ajustava la visualització de les fotos dels opinadors a dispositius mòbils. Totes les tasques han estat verificades i tancades en data corresponent dins del període esmentat.',1.00,750.00,NULL,1,NULL,NULL,NULL,NULL),
(653,451,14,NULL,'2025-08-07',NULL,'Descompte comercial','Descompte comercial per col·laboració',1.00,-200.00,NULL,2,NULL,NULL,NULL,NULL),
(654,452,0,NULL,'2025-08-07',NULL,'Software development','Cfenech product deduplicator logic and troubleshooting sessions needed to understand that the API needs this in their actual consumption model by Cfenech in order to achieve the business logic cfenech was seeking',1.00,85.00,NULL,1,NULL,NULL,NULL,NULL),
(655,452,0,NULL,'2025-08-07',NULL,'Software development','Troubleshooting session to identify that Kinsta was stopping the deduplication script. Troubleshooting session to identify a faulty implementation of a unwarned breaking change in Cfenech\'s 3rd party upstream API not respecting standard URL practices. Code patch was needed to adapt to the API missprocessing.',1.00,85.00,NULL,2,NULL,NULL,NULL,NULL),
(656,452,0,NULL,'2025-08-07',NULL,'Rush fee','Rush fee for troubleshooting session #2',1.00,12.75,NULL,3,NULL,NULL,NULL,NULL),
(657,453,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1.00,1000.00,NULL,1,NULL,NULL,NULL,NULL),
(658,454,0,NULL,'2025-08-07',NULL,'Software development: New interactive form for Comino Ferries','Styling and layout implementation, logic to dynamically update the pricing as seen by the end visitor, logic to chain multiple ticket purchases, integration with the current backend services (including the existing API)',1.00,320.00,NULL,1,NULL,NULL,NULL,NULL),
(659,454,0,NULL,'2025-08-07',NULL,'Software development: FAQ','Add FAQs Section underneath the booking system according to a Figma design',1.00,100.00,NULL,2,NULL,NULL,NULL,NULL),
(660,454,0,NULL,'2025-08-07',NULL,'Software development: Add another trip','Lets users add multiple trip blocks within a single booking, each with independent trip types and passenger selections, dynamically updates the total price based on selections',1.00,100.00,NULL,3,NULL,NULL,NULL,NULL),
(661,454,0,NULL,'2025-08-07',NULL,'Software development: extra petitions on 4 Dec 2025','Include a heading title before the options, select Trip & Select Passengers to be decreased in font size, image on background manual handling as fallback',1.00,45.00,NULL,4,NULL,NULL,NULL,NULL),
(662,454,0,NULL,'2025-08-07',NULL,'Software development: extra petitions on 13 Jan 2025','Remove the Bulky Item feature',1.00,15.00,NULL,5,NULL,NULL,NULL,NULL),
(663,454,0,NULL,'2025-08-07',NULL,'TRADE DISCOUNT 10%','Thank you for your continued business and apologies for the obstacles we experienced deploying these live. I hope the end client is happy with the result :)',1.00,-58.00,NULL,6,NULL,NULL,NULL,NULL),
(664,455,14,NULL,'2025-08-07',NULL,'Crític','Tasques de desenvolupament web',1.00,4000.00,NULL,1,NULL,NULL,NULL,NULL),
(665,456,14,NULL,'2025-08-07',NULL,'Crític','Desenvolupament per a tasques de restyling del web de CRÍTIC. Inclou un 20% de descompte comercial.',1.00,2400.00,NULL,1,NULL,NULL,NULL,NULL),
(666,456,14,NULL,'2025-08-07',NULL,'Crític','Tasques d\'actualització de PHP',1.00,122.50,NULL,2,NULL,NULL,NULL,NULL),
(667,457,0,NULL,'2025-08-07',NULL,'Software development','Up to 12/16/2024 software development tasks, including \"I will perform wordpress bedrock and sage\", \"I will convert your wordpress to multisite with support for multiple domains\" and \"I will develop wp cli custom commands and scripts for your wordpress\"',1.00,606.89,NULL,1,NULL,NULL,NULL,NULL),
(668,458,14,NULL,'2025-08-07',NULL,'Redacció de continguts','Cròniques octubre i novembre 2024. Comanda 24-PD-02428 de 22 de novembre de 2024.',1.00,200.00,NULL,1,NULL,NULL,NULL,NULL),
(669,459,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3000.00,NULL,1,NULL,NULL,NULL,NULL),
(670,460,0,NULL,'2025-08-07',NULL,'Software development','Refactor and complete rewriting of the Shireburn WooCommerce Integration plugin follwing object oriented programming and adding multiple efficiency and performance tweaks such as direct raw access to the database instead of using WordPress wrappers.',1.00,500.00,NULL,1,NULL,NULL,NULL,NULL),
(671,461,0,NULL,'2025-08-07',NULL,'Software development','Fix for a bevior in CFenech\'s API that was preventing WooCommerce from adding some products because an invalid quantity file was returned. Investigation finalized on 10/8/24, 8:16 PM about the external API for CFenech not returning the correct values for quantity: \"I believe I found the issue. The API is returning inconsistent values for the Quantity field across all these products. Specifically, it returns 0E-8 for several products such as SHEER 701 MNP SUBLIME, SHEER 702 DREAMSCAPE, SHEER 703 AIRYVEIL, SHEER 704 WHISPER, SHEER 705 ETHEREAL, SHEER 708 RADIANCE, and SHEER 709 SYMPHONY. Additionally, it returns -1.00000000 for SHEER 706 GENTLE GLOW, SHEER 707 LUMINESCENT, and SHEER 710 HARMONY. Both values, 0E-8 and -1.00000000, are inappropriate for a Quantity field. I\'m of course not sure at what point of the chain of entering data -> API this is happening. The code checks if quantity is greater than 0 to process the products. (…) It won\'t fix SHEER 701 MNP SUBLIME, SHEER 702 DREAMSCAPE, SHEER 703 AIRYVEIL, SHEER 704 WHISPER, SHEER 705 ETHEREAL, SHEER 708 RADIANCE, and SHEER 709 SYMPHONY though, because they return 0E-8\" On 10/14/24, 7:53 PM I said \"I suggest a standalone mini-plugin that treats all invalid quantities as 0\" to fix this. Payment approved by Matthew James Mifsud after my estimate on 10/14/24, 7:54 PM.',1.00,85.00,NULL,1,NULL,NULL,NULL,NULL),
(672,461,0,NULL,'2025-08-07',NULL,'Software development','Investigation on 10/15/24, 3:14 PM about suspected junk data in CFenech  database: \"I have my doubts about this one, I don\'t know about any process that leaves junk traces in the database, but will investigate\". On 10/15/24, 9:19 PM I said \"This is not junk data by any migration [done by us] but the WooCommerce Action Scheduler, a logger built into WooCommerce that I didn\'t know about, but I found it thanks to this investigation, and searched the internet, and saw it\'s known for flooding https://wordpress.org/support/topic/action-scheduler-flooding-mysql/\"',1.00,20.00,NULL,2,NULL,NULL,NULL,NULL),
(673,461,0,NULL,'2025-08-07',NULL,'Software development','Investigation on performance issues on CFenech. On 10/28/24, 11:17 AM suggesting Cloudflare Automatic Platform Optimization for WordPress, on 10/28/24, 11:19 AM, explaining 524 custom cloudflare timeout error and its relationship with the database timing out, on 10/28/24, 11:20 AM advising by informing that \"the wordpress is working, as evidenced by the fact that header is loading and so on. When cloudflare reaches the part that isn\'t configured to cache (products for instance) it throws an error.\" and on 10/28/24, 3:50 PM and few next messages performing various database queries and optimization strategies.',1.00,20.00,NULL,3,NULL,NULL,NULL,NULL),
(674,461,0,NULL,'2025-08-07',NULL,'Software development','Checkup of the cron jobs after the migration to Kinsta and reinstauration of the cron jobs following Kinsta\'s docs. Started on 11/6/24, 3:59 PM, suggestion plugin and queries monitoring strategies & new relic implementation around 11/7/24, 9:07 PM, implementation finished by sharing screenshots showcasing the correct outcomes in a CFenech server terminal on 11/12/24, 12:22 AM.',1.00,50.00,NULL,4,NULL,NULL,NULL,NULL),
(675,462,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Total del pagament acordat per completar el projecte Turalgi, amb el primer 50% a abonar dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. Playbrand està d’acord amb la possibilitat de subcontractar feina per avançar en les tasques necessàries. La previsió inicial era de finalitzar el projecte abans del al 31 de desembre de 2024 però gairebé segur que no serà així perquè no hi ha hagut validació de les condicions i acord a l\'enviament de la factura fins al 7 de novembre de 2024, i el pagament no es farà fins dilluns: el proveïdor intentarà enllestir la feina en aquest termini però és molt probable que no sigui possible. Funcionalment, els correus enviats a alvaro@playbrand.info i des d\'aquesta mateixa adreça en relació al projecte a interlocutors de Playbrand fins al 6 de novembre de 2024 constitueixen la totalitat de les necessitats funcionals del projecte, i no se n\'afegiran més ni es modificaran. Es requereix el justificant de transferència de cada pagament, el primer dels quals dilluns mateix. Playbrand assumeix la gestió de qualsevol interlocució amb el client final, inclosa qualsevol gestió que calgui dur a terme a causa d\'endarreriments. El projecte requereix una gestió de proveïdors sofisticada i per això es considerarà inviable i no s’executarà si no es compleixen els pagaments en els terminis establerts. Això significa l’abonament del 50% inicial el dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. La falta d\'enviament de justificants de transferència en les dates indicades comportarà la cancel·lació automàtica del projecte.',1.00,6000.00,NULL,1,NULL,NULL,NULL,NULL),
(676,463,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3000.00,NULL,1,NULL,NULL,NULL,NULL),
(677,464,0,NULL,'2025-08-07',NULL,'Software development','Multiple SaraGrech.com changes and gathering of information: investigation on why lhc481006 and others won\'t show in search, investigation on whether locality descriptions are taken from REAP or are they direct on the website, First Time Buyers Section cards tweaks according to a provided document with the copys, add the \"Learn more about our Localities\" button, add a custom Google analytics 4 compatible event in JavaScript.',1.00,180.00,NULL,1,NULL,NULL,NULL,NULL),
(678,465,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3000.00,NULL,1,NULL,NULL,NULL,NULL),
(679,466,0,NULL,'2025-08-07',NULL,'Software development','API Error and Forbidden Access Fixed, Withdrawn Products Displaying on CFenech Solved, and System Cron Jobs Implementation for cfenech.com according to \"Task Notes for Cfenech Sync Mechanism Project\"',1.00,470.00,NULL,1,NULL,NULL,NULL,NULL),
(680,467,14,NULL,'2025-08-07',NULL,'Desenvolupament','Millora del rendiment del web RCSanitaria.com',1.00,280.00,NULL,1,NULL,NULL,NULL,NULL),
(681,467,14,NULL,'2025-08-07',NULL,'Desenvolupament','Millora del rendiment del web albertopalatchi.com',1.00,280.00,NULL,2,NULL,NULL,NULL,NULL),
(682,467,14,NULL,'2025-08-07',NULL,'Descompte comercial','20% de descompte a \"Millora del rendiment del web albertopalatchi.com\"',1.00,-56.00,NULL,3,NULL,NULL,NULL,NULL),
(683,468,0,NULL,'2025-08-07',NULL,'Software development','In sarahgrech.com, the client encounters a problem that consist on browsers (Firefox, Chrome, etc) not displaying PDF floor plans on saragrech website. The issue arises from the HTTP header `x-frame-options: SAMEORIGIN` set by the server hosting the PDF. Solution to that issue as per the details explained in the document \"Notes on project to restore floor plans in saragrech.com\"',1.00,240.00,NULL,1,NULL,NULL,NULL,NULL),
(684,469,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3000.00,NULL,1,NULL,NULL,NULL,NULL),
(685,470,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3037.00,NULL,1,NULL,NULL,NULL,NULL),
(686,471,14,NULL,'2025-08-07',NULL,'Crític','Desenvolupament per a tasques de restyling del web de CRÍTIC',1.00,169.00,NULL,1,NULL,NULL,NULL,NULL),
(687,472,0,NULL,'2025-08-07',NULL,'Software Development','REAP API troubleshooting: end client warned that embeded PDFs were missing from saragech website. Upon investigating, the Frame-Options header set to SAMEORIGIN by the server hosting the PDF which is https://app.reapcrm.com/, on REAP\'s side. This header prevents the page from being embedded in an iframe on a different domain, which is why the browser is showing the \"refused to connect\" message when trying to display the PDF in a fancybox or any other iframe-based viewer.',1.00,40.00,NULL,1,NULL,NULL,NULL,NULL),
(688,472,0,NULL,'2025-08-07',NULL,'Software Development','Troubleshooting and solution of issues in saragrech.com: a property price is showing €270,000 but when we go to send the link to the client in the link the link shows a different price + the siracuse image has been changed around 1 month ago from REAP (origin API) and the change is not reflecting in the website',1.00,150.00,NULL,2,NULL,NULL,NULL,NULL),
(689,472,0,NULL,'2025-08-07',NULL,'Software development','Amend the phrase \"all featured properties\" to \"Our Exclusive & Featured Properties\" in saragrech website. Change the phrasing in the search overly to \"Our Exclusive & Featured Properties\".',1.00,40.00,NULL,3,NULL,NULL,NULL,NULL),
(690,472,0,NULL,'2025-08-07',NULL,'Software development','In sarahgrech.com, where a sentence that started with \'or call us\' showed which was in multiple places, the end client initially wanted to remove the hyper link and have \'or call us on: +35679494884 and +356 23470199\' with both numbers hyperlinked, in the same location it was: bellow the form. In order to do so, a modification in previous developer\'s ACF-based components was needed. Once this was done across the website (it was found that it was in multiple places, and easier approaches such as search and replace were unfeasible), they wanted to leave the new sentence in the placement where it was except for two pages: Go Exclusive and Contact Form, these two needed the sentence after the title instead of bellow the form.',1.00,76.00,NULL,4,NULL,NULL,NULL,NULL),
(691,473,14,NULL,'2025-08-07',NULL,'Desenvolupament Frontend','Desenvolupament web en GSAP i Tailwind',1.00,350.00,NULL,1,NULL,NULL,NULL,NULL),
(692,474,0,NULL,'2025-08-07',NULL,'PHP Software development','Modifications to stpaulschildcare.mt\'s footer to add \"Powered by Globalmark\" and changing a UI literal as requested on Aug 5, 2024, and accepted over WhatsApp',1.00,40.00,NULL,1,NULL,NULL,NULL,NULL),
(693,475,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3035.00,NULL,1,NULL,NULL,NULL,NULL),
(694,476,14,NULL,'2025-08-07',NULL,'PHP','Servizo de asesoramento en desenvolvemento en PHP co framework Drupal. Este servizo cobre todas as tarefas realizadas ata o 29 de xullo de 2024 ás 23:59 CEST, co cal o cliente está de acordo e afirma non ter ningunha queixa ao respecto.',1.00,15.00,NULL,1,NULL,NULL,NULL,NULL),
(695,477,0,NULL,'2025-08-07',NULL,'PHP Software development','Modifications to Comino Ferries WooCommerce Integration as requested on July 23, 2024, and accepted in M-ID AM6PR07MB54613131C36B9B0194ED766A84AA2',1.00,785.00,NULL,1,NULL,NULL,NULL,NULL),
(696,478,0,NULL,'2025-08-07',NULL,'PHP Software development','All tasks detailed in \"Scope of Work for Comino Ferries WooCommerce Integration\" as sent to the client in message ID CAFRDvAeYinNv9O2N7H7EsFa6i-KAT8xdXV1aXMfHrDL5m9+Z7w and accepted by the client in message ID AS1P192MB1447BBC9375E9CC0B2C2088985AD2.',1.00,749.60,NULL,1,NULL,NULL,NULL,NULL),
(697,478,0,NULL,'2025-08-07',NULL,'Technical troubleshooting session for two 404 errors','Detailed troubleshoorting conducted to understand the cause of 404 in URLs for properties with IDs SHC479859 and SA465694 in saragrech.com, including writing of an email message to inform the API developers',1.00,40.00,NULL,2,NULL,NULL,NULL,NULL),
(698,479,0,NULL,'2025-08-07',NULL,'PHP Software development','Comino Ferries WooCommerce Integration kickoff efforts in emails, meetings and SoW.',1.00,187.40,NULL,1,NULL,NULL,NULL,NULL),
(699,479,0,NULL,'2025-08-07',NULL,'CSS code','same changes that were done on the Advanced tab of Sara Grech website, apply them also on \"Search by\" overly',1.00,40.00,NULL,2,NULL,NULL,NULL,NULL),
(700,480,0,NULL,'2025-08-07',NULL,'PHP Software development','PHP / WordPress Options page with a button to manually trigger sync of agents properties, expired properties, unexpire properties and full workflow, plus changing of colors of 3 tabs, cron sync every 15 min of some of the info',1.00,100.00,NULL,1,NULL,NULL,NULL,NULL),
(701,481,14,NULL,'2025-08-07',NULL,'Contracte del 6 de febrer de 2024','Tasques realitzades segons l\'acord \"Contracte de prestació de serveis de desenvolupament\ninformàtic entre Playbrand SL i Robot Innocent SL\" firmat a Girona el 6 de febrer de 2024',1.00,3000.00,NULL,1,NULL,NULL,NULL,NULL),
(702,482,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 2/1/2025 to 28/2/2025',45.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(703,483,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/1/2025 to 31/1/2025',142.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(704,484,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/12/2024 to 31/12/2024',105.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(705,485,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/11/2024 to 30/11/2024',150.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(706,486,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/09/2024 to 30/09/2024',112.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(707,487,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/08/2024 to 31/08/2024',90.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(708,488,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/07/2024 to 31/07/2024',172.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(709,489,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Expenses for June Cloud Workshop',1.00,630.69,NULL,1,NULL,NULL,NULL,NULL),
(710,490,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/06/2024 to 30/06/2024',142.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(711,490,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Rectify invoice 2024-5',-7.50,64.00,NULL,2,NULL,NULL,NULL,NULL),
(712,491,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/05/2024 to 31/05/2024',165.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(713,491,0,NULL,'2025-08-07',NULL,'Item','',1.00,0.00,NULL,2,NULL,NULL,NULL,NULL),
(714,492,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/04/2024 to 30/04/2024',157.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(715,492,0,NULL,'2025-08-07',NULL,'Item','',1.00,0.00,NULL,2,NULL,NULL,NULL,NULL),
(716,493,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/03/2024 to 31/03/2024',150.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(717,493,0,NULL,'2025-08-07',NULL,'Item','',1.00,0.00,NULL,2,NULL,NULL,NULL,NULL),
(718,494,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/02/2024 to 29/02/2024',157.50,64.00,NULL,1,NULL,NULL,NULL,NULL),
(719,495,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 1/10/2024 to 31/10/2024',165.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(720,496,0,NULL,'2025-08-07',NULL,'Cloud Dataplane Project','Services provided for period 22/01/2024 to 31/01/2024',60.00,64.00,NULL,1,NULL,NULL,NULL,NULL),
(721,499,14,NULL,'2025-08-07',NULL,'Cooper: AWS','Configuración y troubleshooting de AWS Elastic Beanstalk para entornos de Cooper y webs del cliente.\n\nReuniones técnicas en varias ocasiones con Francisco Garde sobre operaciones en AWS (creación y gestión de instancias, RDS, migraciones de sqlite a MySQL, problemas de permisos y escalabilidad).\n\nExplicaciones por escrito sobre múltiples detalles técnicos como las  desired instances en AWS autoscaling (proporciono el comando, justificación técnica y procedimientos recomendados).\n\nSoporte en incidencias con permisos: Identificación de la jerarquía de cuentas en AWS Organizations, explicación del acceso restringido, coordinación para escalar incidencias a Garaje de Ideas (cuenta padre).\n\nGestión de certificados SSL y DNS en AWS Route 53: diagnóstico de delegaciones de zona, comunicación de problemas por permisos, creación de registros necesarios.\n\nDespliegue y troubleshooting de entornos blue/green en Elastic Beanstalk, y asistencia en la resolución de problemas con deploys automáticos (github actions + AWS CLI).\n\nIdentificación de setup y modificación autoscaling vs. single instance en contextos donde Bolt almacena assets localmente y riesgo de pérdida de datos con múltiples instancias.\n\nPreparación de scripts y automatizaciones para migraciones, gestión de desired-capacity y otros ajustes de infraestructura.\n\nDocumentación y explicación de procedimientos a compañeros/as con menor conocimiento de AWS.',28.00,50.00,NULL,1,NULL,NULL,NULL,NULL),
(722,500,14,NULL,'2025-09-11',NULL,'Cooper y Multiasistencia','Desarrollo en el script para adaptar allergodil.cz a MySQL, configuración de DNS en Route53, estimaciones de desarollo sobre Bolt, desarrollo e implementación de pipelines CI/CD con Jenkins, paso de pipelines a Jenkins Configuration as code, configuración de docker-compose y resolución de problemas técnicos en docker-compose, introducción de SonarQube en la docker network, documentación de arquitectura.\n\nCantidad y precio según lo acordado en el contrato fechado en Madrid a 31 de julio, con nombre de archivo en el envío por email que empieza por 20250722-ContratoServicios-Proveedor-RobotInnocent.',92.00,25.00,NULL,1,NULL,NULL,NULL,NULL),
(723,501,14,NULL,'2025-09-11',NULL,'Servicios de desarrollo web','Servicios de desarrollo web para la comunicación del proyecto ESS EN TRANSICIÓN en el marco del PLAN INTEGRAL DE IMPULSO A LA ECONOMÍA SOCIAL 2025',3.00,750.00,NULL,1,NULL,NULL,NULL,NULL),
(724,501,14,NULL,'2025-09-11',NULL,'Servicios de desarrollo web','Servicios de desarrollo web para la comunicación del proyecto ESS EN TRANSICIÓN en el marco del PLAN INTEGRAL DE IMPULSO A LA ECONOMÍA SOCIAL 2025',1.00,150.00,NULL,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ip_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_sumex`
--

DROP TABLE IF EXISTS `ip_invoice_sumex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_sumex` (
  `sumex_id` int(11) NOT NULL AUTO_INCREMENT,
  `sumex_invoice` int(11) NOT NULL,
  `sumex_reason` int(11) NOT NULL,
  `sumex_diagnosis` varchar(500) NOT NULL,
  `sumex_observations` varchar(500) NOT NULL,
  `sumex_treatmentstart` date NOT NULL,
  `sumex_treatmentend` date NOT NULL,
  `sumex_casedate` date NOT NULL,
  `sumex_casenumber` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`sumex_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_sumex`
--

LOCK TABLES `ip_invoice_sumex` WRITE;
/*!40000 ALTER TABLE `ip_invoice_sumex` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_invoice_sumex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoice_tax_rates`
--

DROP TABLE IF EXISTS `ip_invoice_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoice_tax_rates` (
  `invoice_tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `include_item_tax` int(1) NOT NULL DEFAULT 0,
  `invoice_tax_rate_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`invoice_tax_rate_id`),
  KEY `invoice_id` (`invoice_id`,`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoice_tax_rates`
--

LOCK TABLES `ip_invoice_tax_rates` WRITE;
/*!40000 ALTER TABLE `ip_invoice_tax_rates` DISABLE KEYS */;
INSERT INTO `ip_invoice_tax_rates` VALUES
(211,436,14,1,236.25),
(212,437,14,1,644.28),
(213,439,14,1,645.12),
(214,440,14,1,37.80),
(215,441,14,1,157.50),
(216,442,14,1,78.75),
(217,443,14,1,84.00),
(218,445,14,1,262.50),
(219,446,14,1,262.50),
(220,447,14,1,210.00),
(221,448,14,1,236.25),
(222,449,14,1,105.00),
(223,450,14,1,105.00),
(224,451,14,1,115.50),
(225,453,14,1,210.00),
(226,455,14,1,840.00),
(227,456,14,1,529.73),
(228,458,14,1,42.00),
(229,459,14,1,630.00),
(230,462,14,1,1260.00),
(231,463,14,1,630.00),
(232,465,14,1,630.00),
(233,467,14,1,105.84),
(234,469,14,1,630.00),
(235,470,14,1,637.77),
(236,471,14,1,35.49),
(237,473,14,1,73.50),
(238,475,14,1,637.35),
(239,476,14,1,3.15),
(240,481,14,1,630.00);
/*!40000 ALTER TABLE `ip_invoice_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoices`
--

DROP TABLE IF EXISTS `ip_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoices` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_group_id` int(11) NOT NULL,
  `invoice_status_id` tinyint(2) NOT NULL DEFAULT 1,
  `is_read_only` tinyint(1) DEFAULT NULL,
  `invoice_password` varchar(90) DEFAULT NULL,
  `invoice_date_created` date NOT NULL,
  `invoice_time_created` time NOT NULL DEFAULT '00:00:00',
  `invoice_date_modified` datetime NOT NULL,
  `invoice_date_due` date NOT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `invoice_discount_amount` decimal(20,2) DEFAULT NULL,
  `invoice_discount_percent` decimal(20,2) DEFAULT NULL,
  `invoice_terms` longtext NOT NULL,
  `invoice_url_key` char(32) NOT NULL,
  `payment_method` int(11) NOT NULL DEFAULT 0,
  `creditinvoice_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_url_key` (`invoice_url_key`),
  KEY `user_id` (`user_id`,`client_id`,`invoice_group_id`,`invoice_date_created`,`invoice_date_due`,`invoice_number`),
  KEY `invoice_status_id` (`invoice_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoices`
--

LOCK TABLES `ip_invoices` WRITE;
/*!40000 ALTER TABLE `ip_invoices` DISABLE KEYS */;
INSERT INTO `ip_invoices` VALUES
(435,1,96,1,4,NULL,NULL,'2024-07-12','00:00:00','1970-01-01 00:00:00','2025-09-06','A9',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','6dcfef388e83ec1f21fc72bf17400689',0,NULL),
(436,1,97,1,4,NULL,NULL,'2024-07-08','00:00:00','8800-08-07 17:20:45','2025-09-06','A8',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','9db96cc49427d141315522bdc79b5130',0,NULL),
(437,1,98,1,4,NULL,NULL,'2024-07-01','00:00:00','1970-01-01 00:00:00','2025-09-06','A7',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','5cd1732ceb447360b03096bc71f9c84f',0,NULL),
(438,1,96,1,4,NULL,NULL,'2024-06-27','00:00:00','6476-08-07 17:19:48','2025-09-06','A6',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','a66b044108d35ea825e961c69da77512',0,NULL),
(439,1,98,1,4,NULL,NULL,'2024-05-30','00:00:00','1970-01-01 00:00:00','2025-09-06','A5',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','67c8f963ba9ea36b0d8a0392a3ec1a0c',0,NULL),
(440,1,89,1,1,NULL,NULL,'2025-07-02','00:00:00','1351-08-07 17:51:53','2025-07-17','A47',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','21eab16f36b8c69690cc5cae3daeb233',0,NULL),
(441,1,92,1,1,NULL,NULL,'2025-07-02','00:00:00','5315-08-07 17:51:46','2025-07-16','A46',NULL,NULL,'<p>Al comptat per ingrés o transferència: Banc: BBVA Número de compte en format IBAN: ES1601821005380201676646 Moltes gràcies per la seva confiança.</p>','ff6c323491094f125a253d020cded2f5',0,NULL),
(442,1,97,1,1,NULL,NULL,'2025-07-02','00:00:00','4827-08-07 17:51:46','2025-07-16','A45',NULL,NULL,'<p>Al comptat o per transferència al: ES1601821005380201676646 BBVA</p>','fc814fd8a87d92bf9b60ebd870b75e59',0,NULL),
(443,1,98,1,1,NULL,NULL,'2025-07-01','00:00:00','1970-01-01 00:00:00','2025-07-15','A44',NULL,NULL,'<p data-start=\"1200\" data-end=\"1373\">Pagament al comptat o per transferència bancària a:<br data-start=\"1259\" data-end=\"1262\">IBAN: ES16 0182 1005 3802 0167 6646 (BBVA)<br data-start=\"1308\" data-end=\"1311\">Termini: 14 dies naturals a partir de l\'emissió de la factura. </p>','b16ec5ab8681b1f0a27c355224c8048b',0,NULL),
(444,1,90,1,1,NULL,NULL,'2025-07-01','00:00:00','1970-01-01 00:00:00','2025-07-15','A43',NULL,NULL,'<p>Pagament al comptat o per transferència bancària al següent compte: <br>IBAN: ES16 0182 1005 3802 0167 6646 (BBVA)<br><br>Operació subjecta a l’Impost sobre el Valor Afegit (IVA) amb inversió del subjecte passiu, d’acord amb els articles 84.1.2n i 143 de la Llei 37/1992, de l’IVA, i amb l’article 196 de la Directiva 2006/112/CE del Consell. El destinatari és una empresa establerta en un altre estat membre de la Unió Europea amb NIF-IVA vàlid inscrit al VIES. <br><br>Payment due upon receipt or via bank transfer to the following account: <br>IBAN: ES16 0182 1005 3802 0167 6646 (BBVA) <br><br>Transaction subject to VAT under the reverse charge mechanism, pursuant to Articles 84.1.2 and 143 of Spanish VAT Law 37/1992, and Article 196 of Council Directive 2006/112/EC. The recipient is a business established in another EU Member State with a valid EU VAT number (VIES registered).</p>','106a017336cb38cce10a9dc1286ec2fe',0,NULL),
(445,1,97,1,1,NULL,NULL,'2025-06-02','00:00:00','1970-01-01 00:00:00','2025-09-06','A42',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','2bb04963ae562794faf5c7a9185a3d16',0,NULL),
(446,1,97,1,1,NULL,NULL,'2025-06-02','00:00:00','1970-01-01 00:00:00','2025-09-06','A41',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','86e921388c621ae777019177e2b3698d',0,NULL),
(447,1,92,1,1,NULL,NULL,'2025-06-02','00:00:00','1970-01-01 00:00:00','2025-09-06','A40',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.','0ee2e76efd6a72c52b3afc4a2e4c8af3',0,NULL),
(448,1,97,1,4,NULL,NULL,'2024-05-15','00:00:00','1970-01-01 00:00:00','2025-09-06','A4',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','2c53399e0fc8d10b9af211a5bab31ee8',0,NULL),
(449,1,92,1,1,NULL,NULL,'2025-05-12','00:00:00','1970-01-01 00:00:00','2025-05-26','A39',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.','53fc57f8f99b678fa37c35defe34ec0b',0,NULL),
(450,1,92,1,1,NULL,NULL,'2025-04-08','00:00:00','1970-01-01 00:00:00','2025-09-06','A38',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.','f124ae49facffa1b17da985d230d8626',0,NULL),
(451,1,97,1,1,NULL,NULL,'2025-04-08','00:00:00','1970-01-01 00:00:00','2025-09-06','A37',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','a7d96c68dc09687372b3b6d691d1f23f',0,NULL),
(452,1,96,1,1,NULL,NULL,'2025-03-05','00:00:00','1970-01-01 00:00:00','2025-09-06','A36',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','d0bf7c877afabaec3fda6b208d1dd33d',0,NULL),
(453,1,92,1,1,NULL,NULL,'2025-03-05','00:00:00','1970-01-01 00:00:00','2025-03-05','A35',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.','4b9018c4907b96d65d7930f1cec617b0',0,NULL),
(454,1,96,1,1,NULL,NULL,'2025-01-14','00:00:00','1970-01-01 00:00:00','2025-09-06','A34',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','4f0112f676c97a4a94c5fdd43519f8c6',0,NULL),
(455,1,97,1,1,NULL,NULL,'2024-12-30','00:00:00','8410-08-07 17:35:55','2025-09-06','A33',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','0e23a04c5b1d96565009d1277f783166',0,NULL),
(456,1,97,1,1,NULL,NULL,'2024-12-23','00:00:00','1970-01-01 00:00:00','2025-09-06','A32',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','657fe12c16c3fd833070d0c1454d3a72',0,NULL),
(457,1,91,1,1,NULL,NULL,'2024-12-16','00:00:00','1970-01-01 00:00:00','2025-09-06','A31',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','3ce5babf85bbe4f18670fde92d7035b8',0,NULL),
(458,1,92,1,1,NULL,NULL,'2024-11-25','00:00:00','8208-08-07 17:32:53','2024-11-25','A30',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.','04513897d7b458f4867479efff074322',0,NULL),
(459,1,98,1,4,NULL,NULL,'2024-04-30','00:00:00','6828-08-07 17:14:46','2025-09-06','A3',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','b72d732a42650790e6861f9ab5af450b',0,NULL),
(460,1,96,1,1,NULL,NULL,'2024-11-19','00:00:00','1970-01-01 00:00:00','2025-09-06','A29',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','415c8dca6600edf45e2bdeea4091c81a',0,NULL),
(461,1,96,1,1,NULL,NULL,'2024-11-13','00:00:00','5565-08-07 17:31:50','2025-09-06','A28',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','793088883c38e8d0b94808e7c35809c2',0,NULL),
(462,1,98,1,1,NULL,NULL,'2024-11-07','00:00:00','1970-01-01 00:00:00','2025-09-06','A27',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','14a077074984e25bd42a61c9d2489423',0,NULL),
(463,1,98,1,1,NULL,NULL,'2024-10-27','00:00:00','1970-01-01 00:00:00','2025-09-06','A26',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','31b72265b7c70dc35ebc28af27b9dfbc',0,NULL),
(464,1,96,1,1,NULL,NULL,'2024-10-12','00:00:00','1970-01-01 00:00:00','2025-09-06','A25',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','a8b17bea97db7cdb6193469b6ef4c5bc',0,NULL),
(465,1,98,1,1,NULL,NULL,'2024-10-10','00:00:00','1970-01-01 00:00:00','2024-10-10','A24',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','3437e39138fa0a0ad5f5c08585928030',0,NULL),
(466,1,96,1,1,NULL,NULL,'2024-09-13','00:00:00','1970-01-01 00:00:00','2025-09-06','A23',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','a0d310440e6a86dc3a1272f2a9d85168',0,NULL),
(467,1,93,1,1,NULL,NULL,'2024-09-12','00:00:00','1970-01-01 00:00:00','2025-09-06','A22',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','bef85f507ff4a27a54be9539f3e53d7a',0,NULL),
(468,1,96,1,1,NULL,NULL,'2024-09-06','00:00:00','1970-01-01 00:00:00','2025-09-06','A21',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','5cb259322ec574cf2556e032114cf2f3',0,NULL),
(469,1,98,1,1,NULL,NULL,'2024-09-03','00:00:00','1970-01-01 00:00:00','2025-09-06','A20',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','3f417c4163f69ce88a7090f6416acf93',0,NULL),
(470,1,98,1,4,NULL,NULL,'2024-04-01','00:00:00','1970-01-01 00:00:00','2025-09-06','A2',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','a2c2cfa41698924989b982c24f67a49c',0,NULL),
(471,1,97,1,1,NULL,NULL,'2024-08-29','00:00:00','1970-01-01 00:00:00','2025-09-06','A19',NULL,NULL,'Al comptat o per transferència al:\n\nES1601821005380201676646\nBBVA','0b6139a399581f90902a1a2a1a68ab40',0,NULL),
(472,1,96,1,1,NULL,NULL,'2024-08-27','00:00:00','1970-01-01 00:00:00','2025-09-06','A18',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','3478babffe1d5c74955f21dfb70ef852',0,NULL),
(473,1,94,1,1,NULL,NULL,'2024-08-19','00:00:00','1970-01-01 00:00:00','2025-09-06','A17',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','9c713458f36a373ab9f20d49ae684efb',0,NULL),
(474,1,96,1,4,NULL,NULL,'2024-08-09','00:00:00','1970-01-01 00:00:00','2025-09-06','A16',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','e836c9cc7e7f4adfb221283c30994291',0,NULL),
(475,1,98,1,4,NULL,NULL,'2024-07-30','00:00:00','1970-01-01 00:00:00','2025-09-06','A15',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','fab9bcb84886398c2113a4409b229c04',0,NULL),
(476,1,95,1,4,NULL,NULL,'2024-07-30','00:00:00','1970-01-01 00:00:00','2025-09-06','A14',NULL,NULL,'Al contado por ingreso o transferencia a:\n\nES1601821005380201676646\nBBVA','9df8b9ae318a05f3604cad71fd833b38',0,NULL),
(477,1,96,1,4,NULL,NULL,'2024-07-25','00:00:00','1970-01-01 00:00:00','2025-09-06','A13',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','f129c5d5a202b9ae5fde38684a3c7ec5',0,NULL),
(478,1,96,1,4,NULL,NULL,'2024-07-22','00:00:00','1970-01-01 00:00:00','2025-09-06','A12',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','88a1430e0f9646e23a053d79be43f65c',0,NULL),
(479,1,96,1,4,NULL,NULL,'2024-07-19','00:00:00','7355-08-07 17:21:39','2025-09-06','A11',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','5edae5646d841de7d0a659c37063d280',0,NULL),
(480,1,96,1,4,NULL,NULL,'2024-07-18','00:00:00','1970-01-01 00:00:00','2025-09-06','A10',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71','e8b33f80c62aac94d382b2d4e316a8e8',0,NULL),
(481,1,98,1,4,NULL,NULL,'2024-03-07','00:00:00','1970-01-01 00:00:00','2025-09-06','A1',NULL,NULL,'','a41d141175212b609226ac0047066169',0,NULL),
(482,1,99,1,4,NULL,NULL,'2025-02-28','00:00:00','1970-01-01 00:00:00','2025-09-06','2025-2',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p><p>Bank account name: Robot Innocent SL</p><p>IBAN: ES1601821005380201676646</p>','dd95a5228acbfe6c30b91eec8e93bc30',0,NULL),
(483,1,99,1,4,NULL,NULL,'2025-02-04','00:00:00','1970-01-01 00:00:00','2025-09-06','2025-1',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p><p>Bank account name: Robot Innocent SL</p><p>IBAN: ES1601821005380201676646</p>','b0ecdca2d1ad81c11fd9b8aafd0bae3f',0,NULL),
(484,1,99,1,4,NULL,NULL,'2024-12-31','00:00:00','1970-01-01 00:00:00','2025-09-06','2024/12',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p><p>Bank account name: Robot Innocent SL</p><p>IBAN: ES1601821005380201676646</p>','e7754eaae9043aba8a02a638dc68b394',0,NULL),
(485,1,99,1,4,NULL,NULL,'2024-12-03','00:00:00','1970-01-01 00:00:00','2025-09-06','2024/11',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p><p>Bank account name: Robot Innocent SL</p><p>IBAN: ES1601821005380201676646</p>','1440076a5d38950938637d342d30a314',0,NULL),
(486,1,99,1,4,NULL,NULL,'2024-09-30','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-9',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','adb3a014fffb896b54580e80769e072d',0,NULL),
(487,1,99,1,4,NULL,NULL,'2024-09-02','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-8',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','50514f849f0f8b8c9cc2cdaa31a39eee',0,NULL),
(488,1,99,1,4,NULL,NULL,'2024-07-31','00:00:00','2335-08-07 17:22:50','2025-09-06','2024-7',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','47dac928e14e2fde541ff3edb7c41209',0,NULL),
(489,1,99,1,4,NULL,NULL,'2024-06-19','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-6A',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','5d2acd4edf005b46f68eba4c1664a8ad',0,NULL),
(490,1,99,1,4,NULL,NULL,'2024-06-30','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-6',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','9648c3fae469b989df359e946afc83ff',0,NULL),
(491,1,99,1,4,NULL,NULL,'2024-06-06','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-5',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','f179981ffcf6463d2a1e5e7ec56c1ef9',0,NULL),
(492,1,99,1,4,NULL,NULL,'2024-05-06','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-4',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','279dd737697408d3d415b687a0b19f2d',0,NULL),
(493,1,99,1,4,NULL,NULL,'2024-04-02','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-3',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','3e8a8403e7d94cd107f0b6129036bef5',0,NULL),
(494,1,99,1,4,NULL,NULL,'2024-02-29','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-2',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','59ebc1fabc5822e0279864510446e9fb',0,NULL),
(495,1,99,1,4,NULL,NULL,'2024-11-06','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-10',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','356841505df7e23adea7f5033aa5e2d4',0,NULL),
(496,1,99,1,4,NULL,NULL,'2024-02-06','00:00:00','1970-01-01 00:00:00','2025-09-06','2024-1',NULL,NULL,'<p>Operación sujeta a IVA con inversión del sujeto pasivo a realizar por el destinatario de los servicios, conforme al artículo 84, apartado 1, punto 2º, de la Ley 37/1992.</p>\n<p>Bank account name: Robot Innocent SL</p>\n<p>IBAN: ES1601821005380201676646</p>','65677c8102d085d7dc5ec6185cf53d3c',0,NULL),
(499,1,100,5,2,NULL,'','2025-08-07','21:25:03','2025-08-07 21:44:06','2025-08-22','SERI-00001',0.00,0.00,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC 	BBVA:SM\nISIN Code 	ES0113211835\nSWIFT Code 	BBVAESMMXXX\nGIIN Number 	8DGQ38.00000.LE.724 \nLEI Code 	K8MS7FD7N5Z2WQ51AZ71\n\nAl contado o por transferencia al IBAN: ES1601821005380201676646\n\nMuchas gracias por la confianza','BUXFsAp9RQa1fmbnEGzLSeig6DCjv2l5',0,NULL),
(500,1,101,5,2,NULL,NULL,'2025-09-11','00:00:00','2025-10-01 12:20:59','2025-09-26','SERI-00002',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC	BBVA:SM\nISIN Code	ES0113211835\nSWIFT Code	BBVAESMMXXX\nGIIN Number	8DGQ38.00000.LE.724\nLEI Code	K8MS7FD7N5Z2WQ51AZ71\n\nAl contado o por transferencia al IBAN: ES1601821005380201676646\n\nMuchas gracias por la confianza','uniquekey002ABCDEFGH123456789012',0,NULL),
(501,1,101,5,2,NULL,NULL,'2025-09-11','00:00:00','2025-10-01 12:22:05','2025-09-26','SERI-00003',NULL,NULL,'Al comptat per ingrés o transferència:\nBanc: BBVA\nNúmero de compte en format IBAN: ES1601821005380201676646\nMoltes gràcies per la seva confiança.\n\nIBAN number: ES1601821005380201676646\n\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\nBloomberg Code or RIC	BBVA:SM\nISIN Code	ES0113211835\nSWIFT Code	BBVAESMMXXX\nGIIN Number	8DGQ38.00000.LE.724\nLEI Code	K8MS7FD7N5Z2WQ51AZ71\n\nAl contado o por transferencia al IBAN: ES1601821005380201676646\n\nMuchas gracias por la confianza','uniquekey003ABCDEFGH123456789013',0,NULL);
/*!40000 ALTER TABLE `ip_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_invoices_recurring`
--

DROP TABLE IF EXISTS `ip_invoices_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_invoices_recurring` (
  `invoice_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `recur_start_date` date NOT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_frequency` varchar(255) NOT NULL,
  `recur_next_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_recurring_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_invoices_recurring`
--

LOCK TABLES `ip_invoices_recurring` WRITE;
/*!40000 ALTER TABLE `ip_invoices_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_invoices_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_item_lookups`
--

DROP TABLE IF EXISTS `ip_item_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_item_lookups` (
  `item_lookup_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `item_description` longtext NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_lookup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_item_lookups`
--

LOCK TABLES `ip_item_lookups` WRITE;
/*!40000 ALTER TABLE `ip_item_lookups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_item_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_login_log`
--

DROP TABLE IF EXISTS `ip_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_login_log` (
  `login_name` varchar(100) NOT NULL,
  `log_count` int(11) DEFAULT 0,
  `log_create_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_login_log`
--

LOCK TABLES `ip_login_log` WRITE;
/*!40000 ALTER TABLE `ip_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_merchant_responses`
--

DROP TABLE IF EXISTS `ip_merchant_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_merchant_responses` (
  `merchant_response_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `merchant_response_successful` tinyint(1) DEFAULT 1,
  `merchant_response_date` date NOT NULL,
  `merchant_response_driver` varchar(35) NOT NULL,
  `merchant_response` varchar(255) NOT NULL,
  `merchant_response_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`merchant_response_id`),
  KEY `merchant_response_date` (`merchant_response_date`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_merchant_responses`
--

LOCK TABLES `ip_merchant_responses` WRITE;
/*!40000 ALTER TABLE `ip_merchant_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_merchant_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_payment_custom`
--

DROP TABLE IF EXISTS `ip_payment_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_payment_custom` (
  `payment_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `payment_custom_fieldid` int(11) NOT NULL,
  `payment_custom_fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`payment_custom_id`),
  UNIQUE KEY `payment_id` (`payment_id`,`payment_custom_fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_payment_custom`
--

LOCK TABLES `ip_payment_custom` WRITE;
/*!40000 ALTER TABLE `ip_payment_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_payment_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_payment_methods`
--

DROP TABLE IF EXISTS `ip_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` text DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_payment_methods`
--

LOCK TABLES `ip_payment_methods` WRITE;
/*!40000 ALTER TABLE `ip_payment_methods` DISABLE KEYS */;
INSERT INTO `ip_payment_methods` VALUES
(1,'Cash'),
(2,'Credit Card');
/*!40000 ALTER TABLE `ip_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_payments`
--

DROP TABLE IF EXISTS `ip_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL DEFAULT 0,
  `payment_date` date NOT NULL,
  `payment_amount` decimal(20,2) DEFAULT NULL,
  `payment_note` longtext NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `payment_amount` (`payment_amount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_payments`
--

LOCK TABLES `ip_payments` WRITE;
/*!40000 ALTER TABLE `ip_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_products`
--

DROP TABLE IF EXISTS `ip_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `product_sku` text DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `product_description` longtext NOT NULL,
  `product_price` decimal(20,2) DEFAULT NULL,
  `purchase_price` decimal(20,2) DEFAULT NULL,
  `provider_name` text DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_tariff` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_products`
--

LOCK TABLES `ip_products` WRITE;
/*!40000 ALTER TABLE `ip_products` DISABLE KEYS */;
INSERT INTO `ip_products` VALUES
(201,0,'Cloud Dataplane Project','Services provided for period 2/1/2025 to 28/2/2025','Services provided for period 2/1/2025 to 28/2/2025',64.00,0.00,NULL,0,NULL,NULL),
(202,0,'Contracte del 6 de febrer de 2024','Total del pagament acordat per completar el projecte Turalgi, amb el primer 50% a abonar dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. Playbrand està d’acord amb la possibilitat de subcontractar feina per avançar en les tasques necessàries. La previsió inicial era de finalitzar el projecte abans del al 31 de desembre de 2024 però gairebé segur que no serà així perquè no hi ha hagut validació de les condicions i acord a l\'enviament de la factura fins al 7 de novembre de 2024, i el pagament no es farà fins dilluns: el proveïdor intentarà enllestir la feina en aquest termini però és molt probable que no sigui possible. Funcionalment, els correus enviats a alvaro@playbrand.info i des d\'aquesta mateixa adreça en relació al projecte a interlocutors de Playbrand fins al 6 de novembre de 2024 constitueixen la totalitat de les necessitats funcionals del projecte, i no se n\'afegiran més ni es modificaran. Es requereix el justificant de transferència de cada pagament, el primer dels quals dilluns mateix. Playbrand assumeix la gestió de qualsevol interlocució amb el client final, inclosa qualsevol gestió que calgui dur a terme a causa d\'endarreriments. El projecte requereix una gestió de proveïdors sofisticada i per això es considerarà inviable i no s’executarà si no es compleixen els pagaments en els terminis establerts. Això significa l’abonament del 50% inicial el dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. La falta d\'enviament de justificants de transferència en les dates indicades comportarà la cancel·lació automàtica del projecte.','Total del pagament acordat per completar el projecte Turalgi, amb el primer 50% a abonar dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. Playbrand està d’acord amb la possibilitat de subcontractar feina per avançar en les tasques necessàries. La previsió inicial era de finalitzar el projecte abans del al 31 de desembre de 2024 però gairebé segur que no serà així perquè no hi ha hagut validació de les condicions i acord a l\'enviament de la factura fins al 7 de novembre de 2024, i el pagament no es farà fins dilluns: el proveïdor intentarà enllestir la feina en aquest termini però és molt probable que no sigui possible. Funcionalment, els correus enviats a alvaro@playbrand.info i des d\'aquesta mateixa adreça en relació al projecte a interlocutors de Playbrand fins al 6 de novembre de 2024 constitueixen la totalitat de les necessitats funcionals del projecte, i no se n\'afegiran més ni es modificaran. Es requereix el justificant de transferència de cada pagament, el primer dels quals dilluns mateix. Playbrand assumeix la gestió de qualsevol interlocució amb el client final, inclosa qualsevol gestió que calgui dur a terme a causa d\'endarreriments. El projecte requereix una gestió de proveïdors sofisticada i per això es considerarà inviable i no s’executarà si no es compleixen els pagaments en els terminis establerts. Això significa l’abonament del 50% inicial el dilluns 11 de novembre de 2024 i el 50% restant abans del 15 de novembre de 2024. La falta d\'enviament de justificants de transferència en les dates indicades comportarà la cancel·lació automàtica del projecte.',6000.00,0.00,NULL,0,NULL,NULL),
(203,0,'Crític','Desenvolupament de desenvolupament web. Activitat a #43 Autologins per campanya de Telemàrqueting. \n#10 Landing de captació de fons\n#3 Baixa automàtica dels usuaris al cap de 60 dies\n\nentre d\'altres. \n\nSegons email \"Acta reunió 10/04/2025\" de roger.pbalanya@gmail.com a feina@alvaro.cat el 10 d\'abril de 2025, CAJ5cWeszWq-LcVEG3j3D=P1-F93BtYo6rywEBW6PZkw8T9VjWw.','Desenvolupament de desenvolupament web. Activitat a #43 Autologins per campanya de Telemàrqueting. \n#10 Landing de captació de fons\n#3 Baixa automàtica dels usuaris al cap de 60 dies\n\nentre d\'altres. \n\nSegons email \"Acta reunió 10/04/2025\" de roger.pbalanya@gmail.com a feina@alvaro.cat el 10 d\'abril de 2025, CAJ5cWeszWq-LcVEG3j3D=P1-F93BtYo6rywEBW6PZkw8T9VjWw.',750.00,0.00,NULL,0,NULL,NULL),
(204,0,'PHP Software development: Website Frontend Issue Resolution and Image Restoration','Fixing Frontend Issues in Saragrech.com: frontend alignment problems, missing testimonial images, and other sections where images are not displaying correctly','Fixing Frontend Issues in Saragrech.com: frontend alignment problems, missing testimonial images, and other sections where images are not displaying correctly',85.00,0.00,NULL,0,NULL,NULL),
(205,0,'PHP Software development and system / docker operations','Diagnostic and report on website downtime issue due to REAP API failure, including log analysis and identification of error intervals, and writing of the email message intented for the end client','Diagnostic and report on website downtime issue due to REAP API failure, including log analysis and identification of error intervals, and writing of the email message intented for the end client',40.00,0.00,NULL,0,NULL,NULL),
(206,0,'PHP Software development','Modifications to stpaulschildcare.mt\'s footer to add \"Powered by Globalmark\" and changing a UI literal as requested on Aug 5, 2024, and accepted over WhatsApp','Modifications to stpaulschildcare.mt\'s footer to add \"Powered by Globalmark\" and changing a UI literal as requested on Aug 5, 2024, and accepted over WhatsApp',40.00,0.00,NULL,0,NULL,NULL),
(207,0,'CSS code','same changes that were done on the Advanced tab of Sara Grech website, apply them also on \"Search by\" overly','same changes that were done on the Advanced tab of Sara Grech website, apply them also on \"Search by\" overly',40.00,0.00,NULL,0,NULL,NULL),
(208,0,'Technical troubleshooting session for two 404 errors','Detailed troubleshoorting conducted to understand the cause of 404 in URLs for properties with IDs SHC479859 and SA465694 in saragrech.com, including writing of an email message to inform the API developers','Detailed troubleshoorting conducted to understand the cause of 404 in URLs for properties with IDs SHC479859 and SA465694 in saragrech.com, including writing of an email message to inform the API developers',40.00,0.00,NULL,0,NULL,NULL),
(209,0,'PHP','Servizo de asesoramento en desenvolvemento en PHP co framework Drupal. Este servizo cobre todas as tarefas realizadas ata o 29 de xullo de 2024 ás 23:59 CEST, co cal o cliente está de acordo e afirma non ter ningunha queixa ao respecto.','Servizo de asesoramento en desenvolvemento en PHP co framework Drupal. Este servizo cobre todas as tarefas realizadas ata o 29 de xullo de 2024 ás 23:59 CEST, co cal o cliente está de acordo e afirma non ter ningunha queixa ao respecto.',15.00,0.00,NULL,0,NULL,NULL),
(210,0,'10% desconto comercial','Desconto comercial por colaboración e como mostra de boa vontade do provedor para agradecer a colaboración do cliente, especialmente nas cuestións de xestión da factura (10%)','Desconto comercial por colaboración e como mostra de boa vontade do provedor para agradecer a colaboración do cliente, especialmente nas cuestións de xestión da factura (10%)',-67.50,0.00,NULL,0,NULL,NULL),
(211,0,'Desenvolupament Frontend','Desenvolupament web en GSAP i Tailwind','Desenvolupament web en GSAP i Tailwind',350.00,0.00,NULL,0,NULL,NULL),
(212,0,'Software development','Troubleshooting session to identify that Kinsta was stopping the deduplication script. Troubleshooting session to identify a faulty implementation of a unwarned breaking change in Cfenech\'s 3rd party upstream API not respecting standard URL practices. Code patch was needed to adapt to the API missprocessing.','Troubleshooting session to identify that Kinsta was stopping the deduplication script. Troubleshooting session to identify a faulty implementation of a unwarned breaking change in Cfenech\'s 3rd party upstream API not respecting standard URL practices. Code patch was needed to adapt to the API missprocessing.',85.00,0.00,NULL,0,NULL,NULL),
(213,0,'Desenvolupament','Millora del rendiment del web albertopalatchi.com','Millora del rendiment del web albertopalatchi.com',280.00,0.00,NULL,0,NULL,NULL),
(214,0,'Descompte comercial','Descompte comercial per col·laboració','Descompte comercial per col·laboració',-250.00,0.00,NULL,0,NULL,NULL),
(215,0,'Redacció de continguts','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC','Tasques de redacció de continguts, reunions i assessorament en el marc de la coordinació de les filials científiques de l\'IEC',1000.00,0.00,NULL,0,NULL,NULL),
(216,0,'Software development: New interactive form for Comino Ferries','Styling and layout implementation, logic to dynamically update the pricing as seen by the end visitor, logic to chain multiple ticket purchases, integration with the current backend services (including the existing API)','Styling and layout implementation, logic to dynamically update the pricing as seen by the end visitor, logic to chain multiple ticket purchases, integration with the current backend services (including the existing API)',320.00,0.00,NULL,0,NULL,NULL),
(217,0,'Software development: FAQ','Add FAQs Section underneath the booking system according to a Figma design','Add FAQs Section underneath the booking system according to a Figma design',100.00,0.00,NULL,0,NULL,NULL),
(218,0,'Software development: Add another trip','Lets users add multiple trip blocks within a single booking, each with independent trip types and passenger selections, dynamically updates the total price based on selections','Lets users add multiple trip blocks within a single booking, each with independent trip types and passenger selections, dynamically updates the total price based on selections',100.00,0.00,NULL,0,NULL,NULL),
(219,0,'Software development: extra petitions on 4 Dec 2025','Include a heading title before the options, select Trip & Select Passengers to be decreased in font size, image on background manual handling as fallback','Include a heading title before the options, select Trip & Select Passengers to be decreased in font size, image on background manual handling as fallback',45.00,0.00,NULL,0,NULL,NULL),
(220,0,'Software development: extra petitions on 13 Jan 2025','Remove the Bulky Item feature','Remove the Bulky Item feature',15.00,0.00,NULL,0,NULL,NULL),
(221,0,'TRADE DISCOUNT 10%','Thank you for your continued business and apologies for the obstacles we experienced deploying these live. I hope the end client is happy with the result :)','Thank you for your continued business and apologies for the obstacles we experienced deploying these live. I hope the end client is happy with the result :)',-58.00,0.00,NULL,0,NULL,NULL),
(222,0,'Rush fee','Rush fee for troubleshooting session #2','Rush fee for troubleshooting session #2',12.75,0.00,NULL,0,NULL,NULL),
(223,0,'Site Optimization','Speed and Performance Optimization – WBS Coding School (09/04/2025) – project agreed upon and signed 11 april 2025\nGeneral Frontend and Server Optimization	\nElementor-Specific Performance Optimizations','Speed and Performance Optimization – WBS Coding School (09/04/2025) – project agreed upon and signed 11 april 2025\nGeneral Frontend and Server Optimization	\nElementor-Specific Performance Optimizations',3082.00,0.00,NULL,0,NULL,NULL),
(224,0,'Revisió tècnica i redacció d\'informació amb resposta detallada a les queixes sobre el projecte Turalgi','Anàlisi tècnica individualitzada de cadascuna de les observacions del client final.\n\nElaboració de documents de resposta amb captures, codis i justificació tècnica.\n\nRedacció de taula resum d’arguments i funcions.\n\nPreparació de materials.','Anàlisi tècnica individualitzada de cadascuna de les observacions del client final.\n\nElaboració de documents de resposta amb captures, codis i justificació tècnica.\n\nRedacció de taula resum d’arguments i funcions.\n\nPreparació de materials.',400.00,0.00,NULL,0,NULL,NULL),
(225,0,'Desarrollo web / Sistemas','clustag.com apuntado a la web antes accesible desde new.clustag.com','clustag.com apuntado a la web antes accesible desde new.clustag.com',180.00,0.00,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `ip_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_projects`
--

DROP TABLE IF EXISTS `ip_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_name` text DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_projects`
--

LOCK TABLES `ip_projects` WRITE;
/*!40000 ALTER TABLE `ip_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quote_amounts`
--

DROP TABLE IF EXISTS `ip_quote_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quote_amounts` (
  `quote_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `quote_item_subtotal` decimal(20,2) DEFAULT NULL,
  `quote_item_tax_total` decimal(20,2) DEFAULT NULL,
  `quote_tax_total` decimal(20,2) DEFAULT NULL,
  `quote_total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`quote_amount_id`),
  KEY `quote_id` (`quote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quote_amounts`
--

LOCK TABLES `ip_quote_amounts` WRITE;
/*!40000 ALTER TABLE `ip_quote_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quote_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quote_custom`
--

DROP TABLE IF EXISTS `ip_quote_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quote_custom` (
  `quote_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `quote_custom_fieldid` int(11) NOT NULL,
  `quote_custom_fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`quote_custom_id`),
  UNIQUE KEY `quote_id` (`quote_id`,`quote_custom_fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quote_custom`
--

LOCK TABLES `ip_quote_custom` WRITE;
/*!40000 ALTER TABLE `ip_quote_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quote_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quote_item_amounts`
--

DROP TABLE IF EXISTS `ip_quote_item_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quote_item_amounts` (
  `item_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_subtotal` decimal(20,2) DEFAULT NULL,
  `item_tax_total` decimal(20,2) DEFAULT NULL,
  `item_discount` decimal(20,2) DEFAULT NULL,
  `item_total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_amount_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quote_item_amounts`
--

LOCK TABLES `ip_quote_item_amounts` WRITE;
/*!40000 ALTER TABLE `ip_quote_item_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quote_item_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quote_items`
--

DROP TABLE IF EXISTS `ip_quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quote_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL,
  `item_product_id` int(11) DEFAULT NULL,
  `item_date_added` date NOT NULL,
  `item_name` text DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `item_quantity` decimal(20,2) DEFAULT NULL,
  `item_price` decimal(20,2) DEFAULT NULL,
  `item_discount_amount` decimal(20,2) DEFAULT NULL,
  `item_order` int(2) NOT NULL DEFAULT 0,
  `item_product_unit` varchar(50) DEFAULT NULL,
  `item_product_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `quote_id` (`quote_id`,`item_date_added`,`item_order`),
  KEY `item_tax_rate_id` (`item_tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quote_items`
--

LOCK TABLES `ip_quote_items` WRITE;
/*!40000 ALTER TABLE `ip_quote_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quote_tax_rates`
--

DROP TABLE IF EXISTS `ip_quote_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quote_tax_rates` (
  `quote_tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `include_item_tax` int(1) NOT NULL DEFAULT 0,
  `quote_tax_rate_amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`quote_tax_rate_id`),
  KEY `quote_id` (`quote_id`),
  KEY `tax_rate_id` (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quote_tax_rates`
--

LOCK TABLES `ip_quote_tax_rates` WRITE;
/*!40000 ALTER TABLE `ip_quote_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quote_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_quotes`
--

DROP TABLE IF EXISTS `ip_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_quotes` (
  `quote_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_group_id` int(11) NOT NULL,
  `quote_status_id` tinyint(2) NOT NULL DEFAULT 1,
  `quote_date_created` date NOT NULL,
  `quote_date_modified` datetime NOT NULL,
  `quote_date_expires` date NOT NULL,
  `quote_number` varchar(100) DEFAULT NULL,
  `quote_discount_amount` decimal(20,2) DEFAULT NULL,
  `quote_discount_percent` decimal(20,2) DEFAULT NULL,
  `quote_url_key` char(32) NOT NULL,
  `quote_password` varchar(90) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  PRIMARY KEY (`quote_id`),
  KEY `user_id` (`user_id`,`client_id`,`invoice_group_id`,`quote_date_created`,`quote_date_expires`,`quote_number`),
  KEY `invoice_id` (`invoice_id`),
  KEY `quote_status_id` (`quote_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_quotes`
--

LOCK TABLES `ip_quotes` WRITE;
/*!40000 ALTER TABLE `ip_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_sessions`
--

DROP TABLE IF EXISTS `ip_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ip_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_sessions`
--

LOCK TABLES `ip_sessions` WRITE;
/*!40000 ALTER TABLE `ip_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_settings`
--

DROP TABLE IF EXISTS `ip_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `setting_key` (`setting_key`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_settings`
--

LOCK TABLES `ip_settings` WRITE;
/*!40000 ALTER TABLE `ip_settings` DISABLE KEYS */;
INSERT INTO `ip_settings` VALUES
(19,'default_language','Spanish'),
(20,'date_format','d/m/Y'),
(21,'currency_symbol','€'),
(22,'currency_symbol_placement','afterspace'),
(23,'currency_code','EUR'),
(24,'invoices_due_after','15'),
(25,'quotes_expire_after','15'),
(26,'default_invoice_group','5'),
(27,'default_quote_group','4'),
(28,'thousands_separator','.'),
(29,'decimal_point',','),
(30,'cron_key','IBZsTEqGUmAH5cuz'),
(31,'tax_rate_decimal_places','2'),
(32,'pdf_invoice_template','InvoicePlane'),
(33,'pdf_invoice_template_paid','InvoicePlane - paid'),
(34,'pdf_invoice_template_overdue','InvoicePlane - overdue'),
(35,'pdf_quote_template','InvoicePlane'),
(36,'public_invoice_template','InvoicePlane_Web'),
(37,'public_quote_template','InvoicePlane_Web'),
(38,'disable_sidebar','1'),
(39,'read_only_toggle','4'),
(40,'invoice_pre_password',''),
(41,'quote_pre_password',''),
(42,'email_pdf_attachment','1'),
(43,'generate_invoice_number_for_draft','1'),
(44,'generate_quote_number_for_draft','1'),
(45,'sumex','0'),
(46,'sumex_sliptype','1'),
(47,'sumex_canton','0'),
(48,'system_theme','invoiceplane'),
(49,'default_hourly_rate','0.00'),
(50,'projects_enabled','1'),
(51,'pdf_quote_footer',''),
(52,'first_day_of_week','0'),
(53,'default_country',''),
(54,'default_list_limit','15'),
(55,'number_format','number_format_european'),
(56,'quote_overview_period','this-month'),
(57,'invoice_overview_period','this-month'),
(58,'disable_quickactions','0'),
(59,'custom_title',''),
(60,'monospace_amounts','0'),
(61,'reports_in_new_tab','0'),
(62,'show_responsive_itemlist','0'),
(63,'bcc_mails_to_admin','0'),
(64,'default_invoice_terms','Al comptat per ingrés o transferència:\r\nBanc: BBVA\r\nNúmero de compte en format IBAN: ES1601821005380201676646\r\nMoltes gràcies per la seva confiança.\r\n\r\nIBAN number: ES1601821005380201676646\r\n\r\nBank full legal name: Banco Bilbao Vizcaya Argentaria, S.A (BBVA)\r\nHeadquarters: Plaza de San Nicolás, 4, 48005. Bilbo (Bizkaia).\r\nBloomberg Code or RIC 	BBVA:SM\r\nISIN Code 	ES0113211835\r\nSWIFT Code 	BBVAESMMXXX\r\nGIIN Number 	8DGQ38.00000.LE.724 \r\nLEI Code 	K8MS7FD7N5Z2WQ51AZ71\r\n\r\nAl contado o por transferencia al IBAN: ES1601821005380201676646\r\n\r\nMuchas gracias por la confianza'),
(65,'invoice_default_payment_method',''),
(66,'mark_invoices_sent_pdf','0'),
(67,'include_zugferd','0'),
(68,'pdf_watermark','0'),
(69,'email_invoice_template',''),
(70,'email_invoice_template_paid',''),
(71,'email_invoice_template_overdue',''),
(72,'pdf_invoice_footer',''),
(73,'automatic_email_on_recur','0'),
(74,'sumex_role','0'),
(75,'sumex_place','0'),
(76,'default_quote_notes',''),
(77,'mark_quotes_sent_pdf','0'),
(78,'email_quote_template',''),
(79,'default_invoice_tax_rate',''),
(80,'default_item_tax_rate',''),
(81,'default_include_item_tax',''),
(82,'email_send_method',''),
(83,'smtp_server_address',''),
(84,'smtp_mail_from',''),
(85,'smtp_authentication','0'),
(86,'smtp_username',''),
(87,'smtp_port',''),
(88,'smtp_security',''),
(89,'smtp_verify_certs','1'),
(90,'enable_online_payments','0'),
(91,'gateway_stripe_enabled','0'),
(92,'gateway_stripe_apiKeyPublic',''),
(93,'gateway_stripe_currency','AFN'),
(94,'gateway_stripe_payment_method','');
/*!40000 ALTER TABLE `ip_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_tasks`
--

DROP TABLE IF EXISTS `ip_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `task_name` text DEFAULT NULL,
  `task_description` longtext NOT NULL,
  `task_price` decimal(20,2) DEFAULT NULL,
  `task_finish_date` date NOT NULL,
  `task_status` tinyint(1) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_tasks`
--

LOCK TABLES `ip_tasks` WRITE;
/*!40000 ALTER TABLE `ip_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_tax_rates`
--

DROP TABLE IF EXISTS `ip_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_tax_rates` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_rate_name` text DEFAULT NULL,
  `tax_rate_percent` decimal(5,2) NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_tax_rates`
--

LOCK TABLES `ip_tax_rates` WRITE;
/*!40000 ALTER TABLE `ip_tax_rates` DISABLE KEYS */;
INSERT INTO `ip_tax_rates` VALUES
(14,'Impuesto de Valor Añadido',21.00),
(15,'VAT',0.00);
/*!40000 ALTER TABLE `ip_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_units`
--

DROP TABLE IF EXISTS `ip_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) DEFAULT NULL,
  `unit_name_plrl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_units`
--

LOCK TABLES `ip_units` WRITE;
/*!40000 ALTER TABLE `ip_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_uploads`
--

DROP TABLE IF EXISTS `ip_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_uploads` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `url_key` char(32) NOT NULL,
  `file_name_original` longtext NOT NULL,
  `file_name_new` longtext NOT NULL,
  `uploaded_date` date NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_uploads`
--

LOCK TABLES `ip_uploads` WRITE;
/*!40000 ALTER TABLE `ip_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_user_clients`
--

DROP TABLE IF EXISTS `ip_user_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_user_clients` (
  `user_client_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`user_client_id`),
  KEY `user_id` (`user_id`,`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_user_clients`
--

LOCK TABLES `ip_user_clients` WRITE;
/*!40000 ALTER TABLE `ip_user_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_user_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_user_custom`
--

DROP TABLE IF EXISTS `ip_user_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_user_custom` (
  `user_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_custom_fieldid` int(11) NOT NULL,
  `user_custom_fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_custom_id`),
  UNIQUE KEY `user_id` (`user_id`,`user_custom_fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_user_custom`
--

LOCK TABLES `ip_user_custom` WRITE;
/*!40000 ALTER TABLE `ip_user_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_user_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_users`
--

DROP TABLE IF EXISTS `ip_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(1) NOT NULL DEFAULT 0,
  `user_active` tinyint(1) DEFAULT 1,
  `user_date_created` datetime NOT NULL,
  `user_date_modified` datetime NOT NULL,
  `user_language` varchar(255) DEFAULT 'system',
  `user_name` text DEFAULT NULL,
  `user_company` text DEFAULT NULL,
  `user_address_1` text DEFAULT NULL,
  `user_address_2` text DEFAULT NULL,
  `user_city` text DEFAULT NULL,
  `user_state` text DEFAULT NULL,
  `user_zip` text DEFAULT NULL,
  `user_country` text DEFAULT NULL,
  `user_phone` text DEFAULT NULL,
  `user_fax` text DEFAULT NULL,
  `user_mobile` text DEFAULT NULL,
  `user_email` text DEFAULT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_web` text DEFAULT NULL,
  `user_vat_id` text DEFAULT NULL,
  `user_tax_code` text DEFAULT NULL,
  `user_psalt` text DEFAULT NULL,
  `user_all_clients` int(1) NOT NULL DEFAULT 0,
  `user_passwordreset_token` varchar(100) DEFAULT '',
  `user_subscribernumber` varchar(40) DEFAULT NULL,
  `user_iban` varchar(34) DEFAULT NULL,
  `user_gln` bigint(13) DEFAULT NULL,
  `user_rcc` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_users`
--

LOCK TABLES `ip_users` WRITE;
/*!40000 ALTER TABLE `ip_users` DISABLE KEYS */;
INSERT INTO `ip_users` VALUES
(1,1,1,'2025-08-07 16:41:41','2025-08-07 16:41:41','system','Robot Innocent SL',NULL,'Carrer de Solà, 25, baixos','NIF B66856089 VIES ESB66856089','Barcelona','Catalunya','08014','ES','','','','feina@alvaro.cat','$2a$10$f9c0a444d6b61b4041f18u6yRxPnCvqQMjGoUqR5sACm6WBpNcKxC','',NULL,NULL,'f9c0a444d6b61b4041f184',0,'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ip_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_versions`
--

DROP TABLE IF EXISTS `ip_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_versions` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_date_applied` varchar(14) NOT NULL,
  `version_file` varchar(45) NOT NULL,
  `version_sql_errors` int(2) NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `version_date_applied` (`version_date_applied`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_versions`
--

LOCK TABLES `ip_versions` WRITE;
/*!40000 ALTER TABLE `ip_versions` DISABLE KEYS */;
INSERT INTO `ip_versions` VALUES
(1,'1754584817','000_1.0.0.sql',0),
(2,'1754584818','001_1.0.1.sql',0),
(3,'1754584818','002_1.0.2.sql',0),
(4,'1754584818','003_1.1.0.sql',0),
(5,'1754584818','004_1.1.1.sql',0),
(6,'1754584818','005_1.1.2.sql',0),
(7,'1754584818','006_1.2.0.sql',0),
(8,'1754584818','007_1.2.1.sql',0),
(9,'1754584818','008_1.3.0.sql',0),
(10,'1754584818','009_1.3.1.sql',0),
(11,'1754584818','010_1.3.2.sql',0),
(12,'1754584818','011_1.3.3.sql',0),
(13,'1754584818','012_1.4.0.sql',0),
(14,'1754584818','013_1.4.1.sql',0),
(15,'1754584818','014_1.4.2.sql',0),
(16,'1754584818','015_1.4.3.sql',0),
(17,'1754584818','016_1.4.4.sql',0),
(18,'1754584818','017_1.4.5.sql',0),
(19,'1754584818','018_1.4.6.sql',0),
(20,'1754584818','019_1.4.7.sql',0),
(21,'1754584818','020_1.4.8.sql',0),
(22,'1754584818','021_1.4.9.sql',0),
(23,'1754584818','022_1.4.10.sql',0),
(24,'1754584818','023_1.5.0.sql',0),
(25,'1754584818','024_1.5.1.sql',0),
(26,'1754584818','025_1.5.2.sql',0),
(27,'1754584818','026_1.5.3.sql',0),
(28,'1754584818','027_1.5.4.sql',0),
(29,'1754584818','028_1.5.5.sql',0),
(30,'1754584818','029_1.5.6.sql',0),
(31,'1754584818','030_1.5.7.sql',0),
(32,'1754584818','031_1.5.8.sql',0),
(33,'1754584818','032_1.5.9.sql',0),
(34,'1754584818','033_1.5.10.sql',0),
(35,'1754584818','034_1.5.11.sql',0),
(36,'1754584818','035_1.5.12.sql',0),
(37,'1754584818','036_1.6.sql',0);
/*!40000 ALTER TABLE `ip_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'invoiceplane_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-01 13:06:52
