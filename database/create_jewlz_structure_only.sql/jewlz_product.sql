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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL COMMENT 'All product IDs start with ‘2’. ',
  `Product_Name` text NOT NULL COMMENT 'The English name of the product. Note: the name spans all sizes and material options for this product class. ',
  `Product_Description` text NOT NULL COMMENT 'The English description of the product used on the website. ',
  `Product_Color` text NOT NULL COMMENT 'Color or material. ',
  `Product_Category` text NOT NULL COMMENT 'The category of product for reporting purposes and menu rendering on the website. ',
  `Gender` text NOT NULL COMMENT 'The intended gender for the product, but in 2018 you never really know…',
  `Image_Filename` text NOT NULL COMMENT 'Filename for the image. Used for rendering website. ',
  `Product_Size` text NOT NULL COMMENT 'The size, if any. ‘One Size’ should be used if there are no distinct size options for the product. ',
  `Number_In_Stock` int(11) NOT NULL COMMENT 'Current inventory levels. ',
  `Product_Base_Wholesale_Price` double NOT NULL COMMENT 'Based wholesale price. ',
  `Product_Retail_Price` double NOT NULL COMMENT 'Product selling price (displayed on the website and used when calculating order total). ',
  `Product_Option_Description` text NOT NULL COMMENT 'Description of options. ',
  `Option_Name_Engraving` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  `Option_Birthstone` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  `Option_Charm_1` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  `Option_Charm_2` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  `Option_Charm_3` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  `Option_Charm_4` int(11) NOT NULL COMMENT 'Binary signal indicating this option is available for this product. ‘1’ indicates that this option IS available.',
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 10:43:58
