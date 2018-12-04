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

--
-- Table structure for table `charm`
--

DROP TABLE IF EXISTS `charm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charm` (
  `Charm_ID` int(11) NOT NULL COMMENT 'First record is the default value used by the java model when rendering drop down options.',
  `Charm` text NOT NULL COMMENT 'The English name of the charm that is rendered in the drop down options. ',
  `Charm_Price` double NOT NULL COMMENT 'The price of the add-on charm in USD. ',
  PRIMARY KEY (`Charm_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charm`
--

LOCK TABLES `charm` WRITE;
/*!40000 ALTER TABLE `charm` DISABLE KEYS */;
INSERT INTO `charm` VALUES (1,'None',0),(2,'Star',5),(3,'Blue Bead',5),(4,'Red Bead',5),(5,'Starbuck\'s Cup',5),(6,'Puppy',5),(7,'Handgun',5),(8,'Crystal',10);
/*!40000 ALTER TABLE `charm` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Order ID is used to group all items (records) for an order. Order ID does not constitute a PK by itself. ',
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

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (30001,'2018-11-20 00:00:00','Complete',20001,325.45,2,'Jenny','','1','4','2','6',10001),(30001,'2018-11-18 00:00:00','Complete',20005,325.45,1,'Alice','','3','','','',10001),(30001,'2018-11-18 00:00:00','Complete',20009,325.45,1,'Baby Jessica','3','','','','',10001),(30002,'2018-11-18 00:00:00','Open',20015,282.95,1,'Natasha','','','','','',10005),(30003,'2018-11-18 00:00:00','Open',20039,55,1,'','','','','','',10006),(30004,'2018-11-18 00:00:00','Open',20051,175,1,'','','','','','',10002),(30005,'2017-10-01 00:00:00','Complete',20052,340,1,'','','','','','',10002),(30005,'2017-10-01 00:00:00','Complete',20070,340,3,'','','','','','',10002),(30006,'2017-10-02 00:00:00','Complete',20001,92.95,1,'Paul','','3','3','','',10001),(30007,'2017-10-02 00:00:00','Complete',20006,85.45,1,'Erik','','8','7','','',10005),(30008,'2018-03-31 00:00:00','Complete',20015,560,1,'Lyndsay','','','','','',10007),(30008,'2018-03-31 00:00:00','Complete',20016,560,1,'Savitri','','','','','',10007),(30009,'2018-07-13 00:00:00','Complete',20055,370.45,1,'','','','','','',10008),(30009,'2018-07-13 00:00:00','Complete',20061,370.45,1,'','','','','','',10008),(30010,'2018-10-16 00:00:00','Complete',20059,220.45,1,'','','','','','',10009),(30011,'2018-01-31 00:00:00','Complete',20029,622.5,1,'Alesander','','','','','',10010),(30011,'2018-01-31 00:00:00','Complete',20049,622.5,1,'','','','','','',10010),(30012,'2018-10-03 00:00:00','Complete',20024,340,1,'Saburo','','','','','',10011),(30012,'2018-10-03 00:00:00','Complete',20059,222.5,1,'','','','','','',10011),(30012,'2018-10-03 00:00:00','Complete',20067,340,1,'','','','','','',10011),(30013,'2018-08-19 00:00:00','Complete',20009,72.95,1,'Yuval','5','2','','','',10012),(30014,'2018-06-01 00:00:00','Complete',20030,432.95,1,'','','','','','',10013),(30015,'2018-03-25 00:00:00','Complete',20064,275.95,1,'','','','','','',10013),(30016,'2018-02-14 00:00:00','Complete',20024,985,1,'Sture','','','','','',10014),(30016,'2018-02-14 00:00:00','Complete',20025,985,1,'Fintan','','','','','',10014),(30016,'2018-02-14 00:00:00','Complete',20037,985,1,'Magda','','','','','',10014),(30017,'2018-08-02 00:00:00','Complete',20034,432.95,1,'','','','','','',10015),(30018,'2018-01-16 00:00:00','Complete',20032,432.95,1,'Elisabeth','','','','','',10016),(30019,'2018-03-22 00:00:00','Complete',20009,72.95,1,'','10','4','','','',10017),(30020,'2018-04-02 00:00:00','Complete',20057,310,2,'','','','','','',10018),(30021,'2018-05-13 00:00:00','Complete',20052,172.95,1,'','','','','','',10015),(30022,'2018-06-27 00:00:00','Complete',20050,3007.95,16,'','','','','','',10019),(30023,'2018-08-09 00:00:00','Complete',20058,160,1,'','','','','','',10010),(30024,'2018-02-20 00:00:00','Complete',20010,711,1,'Lutfi','6','4','8','8','1',10020),(30024,'2018-04-22 00:00:00','Complete',20012,711,1,'Jaycob','1','8','1','7','1',10020),(30024,'2018-10-09 00:00:00','Complete',20013,711,1,'Jonas','8','5','1','6','7',10020),(30024,'2018-07-12 00:00:00','Complete',20014,711,1,'Esi','1','3','6','4','3',10020),(30024,'2018-01-31 00:00:00','Complete',20043,711,3,'','','','','','',10020),(30024,'2018-05-22 00:00:00','Complete',20061,711,1,'','','','','','',10020),(30024,'2018-07-11 00:00:00','Complete',20074,711,2,'','','','','','',10020);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (20001,'Mother\'s Bracelet','A bracelet for your mom.','Gold','Bracelet','Women','gold_mothers_bracelet.png','7 inch',100,30,75,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20002,'Mother\'s Bracelet','A bracelet for your mom.','Silver','Bracelet','Women','silver_mothers_bracelet.png','7 inch',100,30,75,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20003,'Mother\'s Bracelet','A bracelet for your mom.','Gold','Bracelet','Women','gold_mothers_bracelet.png','8.5 inch',100,30,75,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20004,'Mother\'s Bracelet','A bracelet for your mom.','Silver','Bracelet','Women','silver_mothers_bracelet.png','8.5 inch',100,30,75,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20005,'Grandmother\'s Bracelet','A bracelet for your mom\'s mom.','Gold','Bracelet','Women','gold_grandmothers_bracelet.png','7 inch',100,25,62.5,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20006,'Grandmother\'s Bracelet','A bracelet for your mom\'s mom.','Silver','Bracelet','Women','silver_grandmothers_bracelet.png','7 inch',100,25,62.5,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20007,'Grandmother\'s Bracelet','A bracelet for your mom\'s mom.','Gold','Bracelet','Women','gold_grandmothers_bracelet.png','8.5 inch',100,25,62.5,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20008,'Grandmother\'s Bracelet','A bracelet for your mom\'s mom.','Silver','Bracelet','Women','silver_grandmothers_bracelet.png','8.5 inch',100,25,62.5,'Custom engraving, up to 4 custom charms.',1,0,1,1,1,1),(20009,'Christening Bracelet','A tiny, tiny bracelet.','Gold','Bracelet','Baby','baby_bracelets.png','Small',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20010,'Christening Bracelet','A tiny, tiny bracelet.','Rose Gold','Bracelet','Baby','baby_bracelets.png','Small',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20011,'Christening Bracelet','A tiny, tiny bracelet.','Silver','Bracelet','Baby','baby_bracelets.png','Small',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20012,'Christening Bracelet','A tiny, tiny bracelet.','Gold','Bracelet','Baby','baby_bracelets.png','Medium',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20013,'Christening Bracelet','A tiny, tiny bracelet.','Rose Gold','Bracelet','Baby','baby_bracelets.png','Medium',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20014,'Christening Bracelet','A tiny, tiny bracelet.','Silver','Bracelet','Baby','baby_bracelets.png','Medium',100,22,55,'Custom engraving.',1,1,0,0,0,0),(20015,'Wedding Band','Do not lose this....','Gold','Ring','Men','mens_gold_wedding_band.png','7',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20016,'Wedding Band','Do not lose this....','White Gold','Ring','Men','mens_white_gold_wedding_band.png','7',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20017,'Wedding Band','Do not lose this....','Silver','Ring','Men','mens_silver_wedding_band.png','7',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20018,'Wedding Band','Do not lose this....','Gold','Ring','Men','mens_gold_wedding_band.png','8',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20019,'Wedding Band','Do not lose this....','White Gold','Ring','Men','mens_white_gold_wedding_band.png','8',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20020,'Wedding Band','Do not lose this....','Silver','Ring','Men','mens_silver_wedding_band.png','8',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20021,'Wedding Band','Do not lose this....','Gold','Ring','Men','mens_gold_wedding_band.png','9',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20022,'Wedding Band','Do not lose this....','White Gold','Ring','Men','mens_white_gold_wedding_band.png','9',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20023,'Wedding Band','Do not lose this....','Silver','Ring','Men','mens_silver_wedding_band.png','9',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20024,'Wedding Band','Do not lose this....','Gold','Ring','Men','mens_gold_wedding_band.png','10',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20025,'Wedding Band','Do not lose this....','White Gold','Ring','Men','mens_white_gold_wedding_band.png','10',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20026,'Wedding Band','Do not lose this....','Silver','Ring','Men','mens_silver_wedding_band.png','10',100,110,275,'Custom engraving.',1,0,0,0,0,0),(20027,'Wedding Ring','She will probably say yes if you get her this.','Gold','Ring','Women','womens_gold_wedding_ring.png','5',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20028,'Wedding Ring','She will probably say yes if you get her this.','White Gold','Ring','Women','womens_wgold_wedding_ring.png','5',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20029,'Wedding Ring','She will probably say yes if you get her this.','Silver','Ring','Women','womens_silver_wedding_ring.png','5',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20030,'Wedding Ring','She will probably say yes if you get her this.','Gold','Ring','Women','womens_gold_wedding_ring.png','6',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20031,'Wedding Ring','She will probably say yes if you get her this.','White Gold','Ring','Women','womens_wgold_wedding_ring.png','6',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20032,'Wedding Ring','She will probably say yes if you get her this.','Silver','Ring','Women','womens_silver_wedding_ring.png','6',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20033,'Wedding Ring','She will probably say yes if you get her this.','Gold','Ring','Women','womens_gold_wedding_ring.png','7',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20034,'Wedding Ring','She will probably say yes if you get her this.','White Gold','Ring','Women','womens_wgold_wedding_ring.png','7',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20035,'Wedding Ring','She will probably say yes if you get her this.','Silver','Ring','Women','womens_silver_wedding_ring.png','7',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20036,'Wedding Ring','She will probably say yes if you get her this.','Gold','Ring','Women','womens_gold_wedding_ring.png','8',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20037,'Wedding Ring','She will probably say yes if you get her this.','White Gold','Ring','Women','womens_wgold_wedding_ring.png','8',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20038,'Wedding Ring','She will probably say yes if you get her this.','Silver','Ring','Women','womens_silver_wedding_ring.png','8',100,170,425,'Custom engraving.',1,0,0,0,0,0),(20039,'Stud Earrings','Nothing says stud like studs.','Silver','Earrings','Men','mens_silver_stud_earrings.png','One Size',100,18,45,'None.',0,0,0,0,0,0),(20040,'Stud Earrings','Nothing says stud like studs.','Gold','Earrings','Men','mens_gold_stud_earrings.png','One Size',100,18,45,'None.',0,0,0,0,0,0),(20041,'Stud Earrings','Nothing says stud like studs.','Black','Earrings','Men','mens_black_stud_earrings.png','One Size',100,18,45,'None.',0,0,0,0,0,0),(20042,'Stud Earrings','Very practical.','Silver','Earrings','Women','womens_silver_stud_earrings.png','One Size',100,19.8,49.5,'None.',0,0,0,0,0,0),(20043,'Stud Earrings','Very practical.','Gold','Earrings','Women','womens_gold_stud_earrings.png','One Size',100,19.8,49.5,'None.',0,0,0,0,0,0),(20044,'Stud Earrings','Very practical.','Pink','Earrings','Women','pink_stud_earrings.png','One Size',100,19.8,49.5,'None.',0,0,0,0,0,0),(20045,'Hoop Ear Rings','Also double as bracelets.','Silver','Earrings','Women','silver_hoops.png','One Size',100,24.2,60.5,'None.',0,0,0,0,0,0),(20046,'Hoop Ear Rings','Also double as bracelets.','Gold','Earrings','Women','gold_hoops.png','One Size',100,24.2,60.5,'None.',0,0,0,0,0,0),(20047,'Hoop Ear Rings','Also double as bracelets.','Rose Gold','Earrings','Women','pink_hoops.png','One Size',100,24.2,60.5,'None.',0,0,0,0,0,0),(20048,'Pendant Set','For the glamorous ladies.','Gold','Set','Women','gold_pendent_set.png','One Size',100,75,187.5,'None.',0,0,0,0,0,0),(20049,'Pendant Set','For the glamorous ladies.','Silver','Set','Women','silver_pendant_set.png','One Size',100,75,187.5,'None.',0,0,0,0,0,0),(20050,'Pearl Set','For royalty.','White','Set','Women','pearl_set.png','One Size',100,75,187.5,'None.',0,0,0,0,0,0),(20051,'Pendant Necklace','I won\'t let go, Jack.','Gold','Necklace','Women','gold_pendant_necklace.png','16 inches',100,66,165,'None.',0,0,0,0,0,0),(20052,'Pendant Necklace','I won\'t let go, Jack.','Gold','Necklace','Women','gold_pendant_necklace.png','18 inches',100,66,165,'None.',0,0,0,0,0,0),(20053,'Pendant Necklace','I won\'t let go, Jack.','Gold','Necklace','Women','gold_pendant_necklace.png','20 inches',100,66,165,'None.',0,0,0,0,0,0),(20054,'Pendant Necklace','I won\'t let go, Jack.','Gold','Necklace','Women','gold_pendant_necklace.png','22 inches',100,66,165,'None.',0,0,0,0,0,0),(20055,'Pendant Necklace','I won\'t let go, Jack.','Silver','Necklace','Women','silver_pendant_necklace.png','16 inches',100,60,150,'None.',0,0,0,0,0,0),(20056,'Pendant Necklace','I won\'t let go, Jack.','Silver','Necklace','Women','silver_pendant_necklace.png','18 inches',100,60,150,'None.',0,0,0,0,0,0),(20057,'Pendant Necklace','I won\'t let go, Jack.','Silver','Necklace','Women','silver_pendant_necklace.png','20 inches',100,60,150,'None.',0,0,0,0,0,0),(20058,'Pendant Necklace','I won\'t let go, Jack.','Silver','Necklace','Women','silver_pendant_necklace.png','22 inches',100,60,150,'None.',0,0,0,0,0,0),(20059,'Pearl Necklace','Impress your friends!','Pearl','Necklace','Women','pearl_necklace.png','16 inches',100,85,212.5,'None.',0,0,0,0,0,0),(20060,'Pearl Necklace','Impress your friends!','Pearl','Necklace','Women','pearl_necklace.png','18 inches',100,85,212.5,'None.',0,0,0,0,0,0),(20061,'Pearl Necklace','Impress your friends!','Pearl','Necklace','Women','pearl_necklace.png','20 inches',100,85,212.5,'None.',0,0,0,0,0,0),(20062,'Pearl Necklace','Impress your friends!','Pearl','Necklace','Women','pearl_necklace.png','22 inches',100,85,212.5,'None.',0,0,0,0,0,0),(20063,'Crystal Necklace','For people who like astrology.','Crystal','Necklace','Women','crystal_necklace.png','16 inches',100,100,250,'None.',0,0,0,0,0,0),(20064,'Crystal Necklace','For people who like astrology.','Crystal','Necklace','Women','crystal_necklace.png','18 inches',100,100,250,'None.',0,0,0,0,0,0),(20065,'Crystal Necklace','For people who like astrology.','Crystal','Necklace','Women','crystal_necklace.png','20 inches',100,100,250,'None.',0,0,0,0,0,0),(20066,'Crystal Necklace','For people who like astrology.','Crystal','Necklace','Women','crystal_necklace.png','22 inches',100,100,250,'None.',0,0,0,0,0,0),(20067,'Owl Pendant Necklace','This thing\'s a hoot.','Owl','Everyday','Women','owl_pendant_necklace.png','16 inches',100,22,55,'None.',0,0,0,0,0,0),(20068,'Owl Pendant Necklace','This thing\'s a hoot.','Owl','Everyday','Women','owl_pendant_necklace.png','18 inches',100,22,55,'None.',0,0,0,0,0,0),(20069,'Owl Pendant Necklace','This thing\'s a hoot.','Owl','Everyday','Women','owl_pendant_necklace.png','20 inches',100,22,55,'None.',0,0,0,0,0,0),(20070,'Owl Pendant Necklace','This thing\'s a hoot.','Owl','Everyday','Women','owl_pendant_necklace.png','22 inches',100,22,55,'None.',0,0,0,0,0,0),(20071,'Rose Stud Earings','For confused teenagers.','Rose','Everyday','Women','rose_ear_rings.png','One Size',3,10,25,'None.',0,0,0,0,0,0),(20072,'Cat Ring','It won\'t bring Tuffy back, but it\'s a good idea anyway.','Silver','Everyday','Women','cat_ring.png','5',100,11,27.5,'None.',0,0,0,0,0,0),(20073,'Cat Ring','It won\'t bring Tuffy back, but it\'s a good idea anyway.','Silver','Everyday','Women','cat_ring.png','6',100,11,27.5,'None.',0,0,0,0,0,0),(20074,'Cat Ring','It won\'t bring Tuffy back, but it\'s a good idea anyway.','Silver','Everyday','Women','cat_ring.png','7',100,11,27.5,'None.',0,0,0,0,0,0),(20075,'Cat Ring','It won\'t bring Tuffy back, but it\'s a good idea anyway.','Silver','Everyday','Women','cat_ring.png','8',100,11,27.5,'None.',0,0,0,0,0,0),(20076,'Silver Bangles','Serve chilled, with white wine and pain killers.','Silver','Everyday','Women','silver_bangle.png','One Size',0,44,110,'None.',0,0,0,0,0,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_costs`
--

DROP TABLE IF EXISTS `shipping_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_costs` (
  `Shipping_Code_ID` int(11) NOT NULL COMMENT 'Shipping ID. Used a generated PK because cannot ensure state codes will be unique if we expand beyond the US. ',
  `State_Code` varchar(3) NOT NULL COMMENT 'State code to match with customer state. 2 characters, uppercase. ',
  `Shipping_Cost` double NOT NULL COMMENT 'Cost of shipping am order to this state. ',
  PRIMARY KEY (`Shipping_Code_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_costs`
--

LOCK TABLES `shipping_costs` WRITE;
/*!40000 ALTER TABLE `shipping_costs` DISABLE KEYS */;
INSERT INTO `shipping_costs` VALUES (1,' AL',7.95),(2,' AK',25),(3,' AZ',7.95),(4,' AR',7.95),(5,' CA',7.95),(6,' CO',7.95),(7,' CT',7.95),(8,' DE',10),(9,' FL',7.95),(10,' GA',7.95),(11,' HI',75),(12,' ID',7.95),(13,' IL',7.95),(14,' IN',7.95),(15,' IA',7.95),(16,' KS',7.95),(17,' KY',7.95),(18,' LA',7.95),(19,' ME',7.95),(20,' MD',7.95),(21,' MA',7.95),(22,' MI',7.95),(23,' MN',10),(24,' MS',10),(25,' MO',10),(26,' MT',10),(27,' NE',10),(28,' NV',10),(29,' NH',10),(30,' NJ',10),(31,' NM',10),(32,' NY',10),(33,' NC',10),(34,' ND',10),(35,' OH',10),(36,' OK',10),(37,' OR',10),(38,' PA',10),(39,' RI',10),(40,' SC',10),(41,' SD',10),(42,' TN',10),(43,' TX',10),(44,' UT',7.95),(45,' VT',7.95),(46,' VA',7.95),(47,' WA',7.95),(48,' WV',7.95),(49,' WI',7.95),(50,' WY',7.95);
/*!40000 ALTER TABLE `shipping_costs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 11:24:16
