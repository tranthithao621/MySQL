-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pm_project
-- ------------------------------------------------------
-- Server version	5.5.57-log

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
-- Table structure for table `application_source`
--

DROP TABLE IF EXISTS `application_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_source` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_code` varchar(45) NOT NULL,
  `app_description` text,
  `app_name` varchar(100) NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_source`
--

LOCK TABLES `application_source` WRITE;
/*!40000 ALTER TABLE `application_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_code` varchar(10) NOT NULL,
  `category_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_option_code` varchar(45) NOT NULL,
  `choice_option_text` varchar(45) NOT NULL,
  `choice_cre8_uid` int(11) NOT NULL,
  `choice_cre8_ts` datetime DEFAULT NULL,
  `choice_lst_updt_uid` int(11) DEFAULT NULL,
  `choice_lst_updt_ts` datetime DEFAULT NULL,
  `choice_type_choice_type_id` int(11) NOT NULL,
  PRIMARY KEY (`choice_id`,`choice_type_choice_type_id`),
  KEY `fk_choice_choice_type1_idx` (`choice_type_choice_type_id`),
  CONSTRAINT `fk_choice_choice_type1` FOREIGN KEY (`choice_type_choice_type_id`) REFERENCES `choice_type` (`choice_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice_type`
--

DROP TABLE IF EXISTS `choice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice_type` (
  `choice_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_type_code` varchar(45) NOT NULL,
  `choice_type_description` varchar(45) DEFAULT NULL,
  `choice_type_cre8_uid` int(11) NOT NULL,
  `choice_type_cre8_ts` datetime NOT NULL,
  `choice_type_lst_updt_uid` int(11) DEFAULT NULL,
  `choice_type_lst_updt_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`choice_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice_type`
--

LOCK TABLES `choice_type` WRITE;
/*!40000 ALTER TABLE `choice_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `choice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_size` varchar(10) NOT NULL,
  `image_alit_tag` text,
  `image_active_online` tinyint(4) DEFAULT NULL,
  `image_primary` int(11) DEFAULT NULL,
  `image_status` int(11) DEFAULT NULL,
  `image_cre8_ts` datetime DEFAULT NULL,
  `image_created_date` date DEFAULT NULL,
  `image_last_modified` varchar(45) DEFAULT NULL,
  `image_url` text,
  `image_cre8_uid` int(11) DEFAULT NULL,
  `image_lst_updt_uid` int(11) DEFAULT NULL,
  `image_lst_updt_ts` datetime DEFAULT NULL,
  `choice_choice_id` int(11) NOT NULL,
  `choice_choice_type_choice_type_id` int(11) NOT NULL,
  `application_source_app_id` int(11) NOT NULL,
  `category_category_id` int(11) NOT NULL,
  `category_category_name` varchar(100) NOT NULL,
  `image_source_image_source_id` int(11) NOT NULL,
  PRIMARY KEY (`image_id`,`choice_choice_id`,`choice_choice_type_choice_type_id`,`application_source_app_id`,`category_category_id`,`category_category_name`,`image_source_image_source_id`),
  KEY `fk_image_choice1_idx` (`choice_choice_id`,`choice_choice_type_choice_type_id`),
  KEY `fk_image_application_source1_idx` (`application_source_app_id`),
  KEY `fk_image_category1_idx` (`category_category_id`,`category_category_name`),
  KEY `fk_image_image_source1_idx` (`image_source_image_source_id`),
  CONSTRAINT `fk_image_choice1` FOREIGN KEY (`choice_choice_id`) REFERENCES `choice` (`choice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_application_source1` FOREIGN KEY (`application_source_app_id`) REFERENCES `application_source` (`app_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_category1` FOREIGN KEY (`category_category_id`, `category_category_name`) REFERENCES `category` (`category_id`, `category_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_image_source1` FOREIGN KEY (`image_source_image_source_id`) REFERENCES `image_source` (`image_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_source`
--

DROP TABLE IF EXISTS `image_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_source` (
  `image_source_id` int(11) NOT NULL,
  `image_source_code` varchar(10) NOT NULL,
  `image_source_description` text,
  `image_source_name` varchar(100) NOT NULL,
  PRIMARY KEY (`image_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_source`
--

LOCK TABLES `image_source` WRITE;
/*!40000 ALTER TABLE `image_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pm_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-19 14:53:10
