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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL COMMENT 'Order ID is used to group all items (records) for an order. Order ID does not constitute a PK by itself. ',
  `Order_Date` datetime NOT NULL COMMENT 'The date the order was SUBMITTED. ',
  `Order_Status` text NOT NULL COMMENT 'Current status of the order. ‘Open’ means that ‘Submit order’ has not yet been clicked. ',
  `Product_ID` int(11) NOT NULL COMMENT 'The FK for the product being purchased. ',
  `Order_Total` double DEFAULT NULL COMMENT 'The order total. Note: this is duplicated for each product record on an order. ',
  `Product_Quantity` int(11) NOT NULL COMMENT 'The number of exact items on the order. For example, some customers may order two wedding rings…..',
  `Customer_Choice_Name_Engraving` text COMMENT 'Engraving based on user input.',
  `Customer_Choice_Birthstone_ID` text COMMENT 'Birthstone selection based on user input. ',
  `Customer_Choice_Charm_ID_1` text COMMENT 'Charm selection based on user input. ',
  `Customer_Choice_Charm_ID_2` text COMMENT 'Charm selection based on user input. ',
  `Customer_Choice_Charm_ID_3` text COMMENT 'Charm selection based on user input. ',
  `Customer_Choice_Charm_ID_4` text COMMENT 'Charm selection based on user input. ',
  `Customer_ID` int(11) NOT NULL COMMENT 'Customer making the purchase. ',
  PRIMARY KEY (`Order_ID`,`Product_ID`,`Customer_ID`),
  KEY `Product_ID_idx` (`Product_ID`),
  KEY `Customer_ID_idx` (`Customer_ID`),
  CONSTRAINT `Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `Product_ID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 10:43:59
