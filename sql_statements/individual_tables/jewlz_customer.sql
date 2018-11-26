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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `Customer_ID` int(11) DEFAULT NULL,
  `Customer_First_Name` text,
  `Customer_Last_Name` text,
  `Password` text,
  `Customer_Email_Address` text,
  `Customer_Phone_Number` text,
  `Customer_Street_Address` text,
  `Customer_City` text,
  `Customer_State` text,
  `Customer_Zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10001,'Goraud','Sharpe','cxheesad3','gsharpe0@japanpost.jp','(303) 8018142','4710 Corscot Place','Littleton','CO',80126),(10002,'Ronny','Lawey','abcabc123','rlawey1@weather.com','(302) 2977840','99363 Kenwood Parkway','Wilmington','DE',19886),(10003,'Drucy','McGillecole','sdlljq3nr','dmcgillecole2@hc360.com','(414) 2892128','5114 Paget Lane','Milwaukee','WI',53263),(10004,'Jewell','Giff','qi3ur29jh4wtb','jgiff3@mlb.com','(205) 9020053','984 Maple Terrace','Birmingham','AL',35290),(10005,'Hallie','Basili',' iweFUGIW4TKTGJF','hbasili4@walmart.com','(240) 4076537','5438 Fisk Junction','Silver Spring','MD',20918),(10006,'Cordie','Scotfurth','NBuue84j','cscotfurth5@usnews.com','(713) 4356930','3 La Follette Junction','Pasadena','TX',77505);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 14:39:00
