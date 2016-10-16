-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: meixi1
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `earlywarning`
--

DROP TABLE IF EXISTS `earlywarning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earlywarning` (
  `ewid` int(11) NOT NULL,
  `ewRecently` date NOT NULL,
  `ewProspective` int(11) NOT NULL,
  `ewPeriod` int(11) NOT NULL,
  `epid` int(11) NOT NULL,
  PRIMARY KEY (`ewid`),
  KEY `epid_idx` (`epid`),
  CONSTRAINT `epid` FOREIGN KEY (`epid`) REFERENCES `equipment` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earlywarning`
--

LOCK TABLES `earlywarning` WRITE;
/*!40000 ALTER TABLE `earlywarning` DISABLE KEYS */;
INSERT INTO `earlywarning` VALUES (1,'2016-08-16',3,30,1);
/*!40000 ALTER TABLE `earlywarning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `eid` int(11) NOT NULL,
  `eName` varchar(45) NOT NULL,
  `etid` int(11) NOT NULL,
  `otid` int(11) NOT NULL,
  PRIMARY KEY (`eid`),
  CONSTRAINT `etid` FOREIGN KEY (`eid`) REFERENCES `equipmenttype` (`etid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'采样机',1,1);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipmenttype`
--

DROP TABLE IF EXISTS `equipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipmenttype` (
  `etid` int(11) NOT NULL,
  `etName` varchar(45) NOT NULL,
  PRIMARY KEY (`etid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipmenttype`
--

LOCK TABLES `equipmenttype` WRITE;
/*!40000 ALTER TABLE `equipmenttype` DISABLE KEYS */;
INSERT INTO `equipmenttype` VALUES (1,'机械');
/*!40000 ALTER TABLE `equipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainconsume`
--

DROP TABLE IF EXISTS `maintainconsume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainconsume` (
  `mcid` int(11) NOT NULL,
  `mcMaterial` varchar(45) NOT NULL,
  `mcNumber` int(11) NOT NULL,
  `mrid` int(11) NOT NULL,
  PRIMARY KEY (`mcid`),
  KEY `mrid_idx` (`mrid`),
  CONSTRAINT `mrid` FOREIGN KEY (`mrid`) REFERENCES `maintainrecord` (`mrid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainconsume`
--

LOCK TABLES `maintainconsume` WRITE;
/*!40000 ALTER TABLE `maintainconsume` DISABLE KEYS */;
INSERT INTO `maintainconsume` VALUES (1,'电线',1,1);
/*!40000 ALTER TABLE `maintainconsume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintaindetails`
--

DROP TABLE IF EXISTS `maintaindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintaindetails` (
  `mdid` int(11) NOT NULL,
  `mdContents` varchar(255) NOT NULL,
  `mpid` int(11) NOT NULL,
  `mrid` int(11) NOT NULL,
  PRIMARY KEY (`mdid`),
  KEY `mpid_idx` (`mpid`),
  KEY `mrid_idx` (`mrid`),
  CONSTRAINT `mpidmd` FOREIGN KEY (`mpid`) REFERENCES `maintainproject` (`mpid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mridmd` FOREIGN KEY (`mrid`) REFERENCES `maintainrecord` (`mrid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintaindetails`
--

LOCK TABLES `maintaindetails` WRITE;
/*!40000 ALTER TABLE `maintaindetails` DISABLE KEYS */;
INSERT INTO `maintaindetails` VALUES (1,'线路老化',1,1);
/*!40000 ALTER TABLE `maintaindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainproject`
--

DROP TABLE IF EXISTS `maintainproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainproject` (
  `mpid` int(11) NOT NULL,
  `mpName` varchar(45) NOT NULL,
  `etid` int(11) NOT NULL,
  PRIMARY KEY (`mpid`),
  KEY `etid_idx` (`etid`),
  CONSTRAINT `etidmp` FOREIGN KEY (`etid`) REFERENCES `equipmenttype` (`etid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainproject`
--

LOCK TABLES `maintainproject` WRITE;
/*!40000 ALTER TABLE `maintainproject` DISABLE KEYS */;
INSERT INTO `maintainproject` VALUES (1,'紧固接线',1);
/*!40000 ALTER TABLE `maintainproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainrecord`
--

DROP TABLE IF EXISTS `maintainrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainrecord` (
  `mrid` int(11) NOT NULL,
  `mrEmployee` varchar(45) NOT NULL,
  `mrTime` date NOT NULL,
  `mrIsnormal` varchar(45) NOT NULL,
  `epid` int(11) NOT NULL,
  PRIMARY KEY (`mrid`),
  KEY `epidmr_idx` (`epid`),
  CONSTRAINT `epidmr` FOREIGN KEY (`epid`) REFERENCES `equipment` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainrecord`
--

LOCK TABLES `maintainrecord` WRITE;
/*!40000 ALTER TABLE `maintainrecord` DISABLE KEYS */;
INSERT INTO `maintainrecord` VALUES (1,'张三','2016-08-16','正常',1);
/*!40000 ALTER TABLE `maintainrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-16 22:22:06
