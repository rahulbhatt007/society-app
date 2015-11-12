CREATE DATABASE  IF NOT EXISTS `society` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `society`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: society
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `address3` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='address details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposity_history`
--

DROP TABLE IF EXISTS `deposity_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposity_history` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `deposit_amount` double DEFAULT NULL,
  `penalty_amount` double DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `loan_id_idx` (`loan_id`),
  CONSTRAINT `loan_id` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='deposity history details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposity_history`
--

LOCK TABLES `deposity_history` WRITE;
/*!40000 ALTER TABLE `deposity_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposity_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_rates`
--

DROP TABLE IF EXISTS `interest_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_rates` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` float NOT NULL,
  `create_date` datetime NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='interest rate details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_rates`
--

LOCK TABLES `interest_rates` WRITE;
/*!40000 ALTER TABLE `interest_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `interest_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `active` binary(0) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `remamount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_member_id_idx` (`memberid`),
  CONSTRAINT `loan_member_id` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2m_member_loan`
--

DROP TABLE IF EXISTS `m2m_member_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2m_member_loan` (
  `memberid` int(11) NOT NULL,
  `memberrefid1` int(11) NOT NULL,
  `loanid` int(11) NOT NULL,
  `memberrefid2` int(11) NOT NULL,
  PRIMARY KEY (`loanid`),
  KEY `m2m_member_id_idx` (`memberid`),
  KEY `m2m_loan_id_idx` (`loanid`),
  KEY `m2m_member_ref_id1_idx` (`memberrefid1`),
  KEY `m2m_member_ref_id2_idx` (`memberrefid2`),
  CONSTRAINT `m2m_loan_id` FOREIGN KEY (`loanid`) REFERENCES `loan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `m2m_member_id` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `m2m_member_ref_id1` FOREIGN KEY (`memberrefid1`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `m2m_member_ref_id2` FOREIGN KEY (`memberrefid2`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2m_member_loan`
--

LOCK TABLES `m2m_member_loan` WRITE;
/*!40000 ALTER TABLE `m2m_member_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2m_member_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `addressid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `member_address_id_idx` (`addressid`),
  CONSTRAINT `member_address_id` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='member details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_expense`
--

DROP TABLE IF EXISTS `society_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_expense` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='society expense details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_expense`
--

LOCK TABLES `society_expense` WRITE;
/*!40000 ALTER TABLE `society_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_expense` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-12 21:27:50
