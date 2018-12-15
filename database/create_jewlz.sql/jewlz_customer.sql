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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Customer ID always starts with ‘1’. ',
  `Customer_First_Name` text COMMENT 'Given name for the customer. This is driven by customer input. ',
  `Customer_Last_Name` text COMMENT 'Surname name for the customer. This is driven by customer input. ',
  `Password` text NOT NULL COMMENT 'Customer password. Plans to encrypt this in the future. ',
  `Customer_Email_Address` text NOT NULL COMMENT 'Email address. Driven by user input. ',
  `Customer_Phone_Number` text COMMENT 'Customer phone number. ',
  `Customer_Street_Address` text COMMENT 'Shipping address.',
  `Customer_City` text COMMENT 'Customer City (US only for now). ',
  `Customer_State` varchar(3) DEFAULT NULL COMMENT 'Customer State. This must be a two character stated code (upper-case) to match for shipping costs. ',
  `Customer_Zip` int(11) DEFAULT NULL COMMENT 'Customer zip code. ',
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10001,'Goraud','Sharpe','cxheesad3','gsharpe0@japanpost.jp','(303) 8018142','4710 Corscot Place','Littleton','CO',80126),(10002,'Ronny','Lawey','abcabc123','rlawey1@weather.com','(302) 2977840','99363 Kenwood Parkway','Wilmington','DE',19886),(10003,'Drucy','McGillecole','sdlljq3nr','dmcgillecole2@hc360.com','(414) 2892128','5114 Paget Lane','Milwaukee','WI',53263),(10004,'Jewell','Giff','qi3ur29jh4wtb','jgiff3@mlb.com','(205) 9020053','984 Maple Terrace','Birmingham','AL',35290),(10005,'Hallie','Basili',' iweFUGIW4TKTGJF','hbasili4@walmart.com','(240) 4076537','5438 Fisk Junction','Silver Spring','MD',20918),(10006,'Cordie','Scotfurth','NBuue84j','cscotfurth5@usnews.com','(713) 4356930','3 La Follette Junction','Pasadena','TX',77505),(10007,'Jahzeel','Atwood','adfhui','jesse@live.com','(714) 7701799','4212 Blair Court','Hardin','MO',64035),(10008,'Donatienne','Dermott','DAGjiladgj','singh@verizon.net','(628) 5815827','1259 Upton Avenue','Westbrook','ME',40923),(10009,'Servaas','Acquati','234JDKjl','euice@live.com','(598) 6580459','2024 Hanifan Lane','Dunwoody','GA',30338),(10010,'Sylvi','Simon','adj421','afifi@icloud.com','(931) 2823729','155 Kelly Street','Gastonia','NC',28052),(10011,'Zsiga','Daube','JKlj425','jsnover@live.com','(377) 6790729','4648 Waterview Lane','Pena Blanca','NM',87041),(10012,'Adonis','Ramsay','dlajf4','fraser@optonline.net','(248) 5254405','1049 Fincham Road','San Diego','CA',82103),(10013,'Porfastr','Sierkert','223tjlk','caronni@att.net','(527) 9001858','2643 Tetrick Road','Fort Myers','FL',33901),(10014,'Alexei','McNee','2JKL4d','jesse@outlook.com','(273) 7768676','1711 Oak Lane','Hume','MO',64752),(10015,'Castor','Ola','idlsajfl23','leocharre@me.com','(340) 6788712','486 Tori Lane','Salt Lake City','UT',84116),(10016,'Jaksa','Chowdhury','jJLKi33','alhajj@yahoo.com','(630) 9180833','4302 Amethyst Drive','Adrian','MI',49221),(10017,'Abel','Keller','Password','boein@hotmail.com','(327) 3594970','4137 Brookside Drive','Birmingham','AL',35209),(10018,'Photina','Brankovic','pa55w0rd','avalon@yahoo.ca','(218) 962-0306','1446 Longview Avenue','New York','NY',10004),(10019,'Cezar','Osmund','frwekljgar','keijser@aol.com','(777) 306-0607','626 South Border Ave.','Riverdale','GA',30274),(10020,'Lea','Hadi','galjr32','chlim@aol.com','(282) 488-2823','77 Alton St. ','Lincolnton','NC',28092),(10021,'Soraya','Torbjorn','3245jdfag','fwiles@msn.com','(862) 890-1405','68 Amerige St. ','New Bern','NC',28560),(10022,'Mpho','Erna','jal4223','conteb@msn.com','(674) 611-5460','199 Sierra Rd.','Newington','CT',61141),(10023,'Marilenna','Blaanid','fjlg4532','khris@yahoo.com','(656) 501-9126','19 Saxon Street ','Morristown','NJ',79603),(10024,'Su','Berhtoald','jkgal8472','mleary@me.com','(304) 498-8284','490 Country Lane','Peoria','IL',61604),(10025,'Niksa','Vera','jdagh42','wiseb@me.com','(577) 660-9587','788 Olive Drive ','Barkersfield','CA',93306);
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

-- Dump completed on 2018-12-04 10:43:34
