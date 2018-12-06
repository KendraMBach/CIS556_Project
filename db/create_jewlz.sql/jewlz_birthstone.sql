CREATE DATABASE  IF NOT EXISTS `jewlz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `jewlz`;
-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: jewlz
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `birthstone`
--

DROP TABLE IF EXISTS `birthstone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `birthstone` (
  `Birthstone_ID` int(11) NOT NULL COMMENT 'First record is the default value used by the java model when rendering drop down options.',
  `Birthstone` text NOT NULL COMMENT 'The English name of the birthstone. ',
  `Month` text NOT NULL COMMENT 'The English month for the birthstone. We do allow duplicates for inventory expansion purposes. ',
  `Birthstone_Cost` double NOT NULL COMMENT 'The cost of the birthstone in USD. ',
  PRIMARY KEY (`Birthstone_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birthstone`
--

LOCK TABLES `birthstone` WRITE;
/*!40000 ALTER TABLE `birthstone` DISABLE KEYS */;
INSERT INTO `birthstone` VALUES (1,'None','None',0),(2,' Garnet','January ',5),(3,' Amethyst','February ',5),(4,' Aquamarine','March ',5),(5,' White Topaz','April ',5),(6,' Lab Created Emerald','May ',5),(7,' Lab Created Alexandrite','June ',5),(8,' Lab Created Ruby','July ',5),(9,' Peridot','August ',5),(10,' Lab Created Sapphire','September ',5),(11,' Lab Created Opal','October ',5),(12,' Citrine','November ',5),(13,' Blue Topaz','December ',5);
/*!40000 ALTER TABLE `birthstone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 10:43:35
