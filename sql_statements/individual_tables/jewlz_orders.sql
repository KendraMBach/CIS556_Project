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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Order_Date` text NOT NULL,
  `Order_Status` text NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Product_Retail_Price` double NOT NULL,
  `Product_Quantity` int(11) NOT NULL,
  `Customer_Choice_Name_Engraving` text,
  `Customer_Choice_Birthstone_ID` text,
  `Customer_Choice_Charm_ID_1` text,
  `Customer_Choice_Charm_ID_2` text,
  `Customer_Choice_Charm_ID_3` text,
  `Customer_Choice_Charm_ID_4` text,
  `Customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`,`Product_ID`,`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (30001,'11/20/2018','Complete',20001,27.5,1,'Jenny','','1','4','2','6',10001),(30001,'11/18/2018','Complete',20005,27.5,1,'Alice','','3','','','',10001),(30001,'11/18/2018','Complete',20009,22,1,'Baby Jessica','3','','','','',10001),(30002,'11/18/2018','Open',20015,110,1,'Natasha','','','','','',10005),(30003,'11/18/2018','Open',20039,18,1,'','','','','','',10006),(30004,'11/18/2018','Open',20051,66,1,'','','','','','',10002);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 14:39:01
