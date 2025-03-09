-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: greenspotgrocer
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Vendor` varchar(90) NOT NULL,
  `Cost` decimal(4,2) NOT NULL,
  `PurchaseDate` date NOT NULL,
  `Quantity` varchar(45) NOT NULL,
  `ItemIDOrder` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Products_idx` (`ItemIDOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Bennet Farms, Rt. 17 Evansville, IL 55446',2.35,'2022-02-01','25',1000),(2,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678',0.69,'2022-02-02','40',1100),(3,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678',0.59,'2022-02-10','40',1222),(4,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678',1.75,'2022-02-10','10',1223),(5,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678',0.65,'2022-02-10','30',1224),(6,'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567',1.29,'2022-02-12','25',2000),(7,'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567',2.19,'2022-02-12','20',2001),(8,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678',1.80,'2022-02-15','10',1223);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  `ItemType` varchar(45) NOT NULL,
  `Unit` varchar(45) NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1000,'Bennet Farm free-range eggs','Dairy','dozen','d12'),(1100,'Freshness White beans','Canned','12 ounce can','a2'),(1222,'Freshness Green beans','Canned','12 ounce can','a3'),(1223,'Freshness Green beans','Canned','36 oz can','a7'),(1224,'Freshness Wax beans','Canned','12 ounce can','a3'),(2000,'Ruby\'s Kale','Produce','bunch','p12'),(2001,'Ruby\'s Organic Kale','Produce','bunch','po2');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `Customer` int DEFAULT NULL,
  `SellDate` date NOT NULL,
  `Price` decimal(4,2) NOT NULL,
  `Quantity` int NOT NULL,
  `ItemIDSale` int NOT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_Sales_Products1_idx` (`ItemIDSale`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,198765,'2022-02-02',5.49,2,1000),(2,NULL,'2022-02-02',3.99,2,2000),(3,202900,'2022-02-02',1.49,2,1100),(4,196777,'2022-02-04',5.99,2,1000),(5,198765,'2022-02-07',1.49,8,1100),(6,277177,'2022-02-11',5.49,4,1000),(7,111000,'2022-02-12',1.29,4,1222),(8,198765,'2022-02-13',3.49,12,1223),(9,100988,'2022-02-13',6.99,8,2001),(10,202900,'2022-02-14',6.99,5,2001),(11,111000,'2022-02-15',3.99,1,2000),(12,NULL,'2022-02-11',1.49,12,1100),(13,NULL,'2022-02-12',1.55,10,1224);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `StockID` int NOT NULL AUTO_INCREMENT,
  `QuantityOnHand` int NOT NULL,
  `ItemIDStock` int NOT NULL,
  PRIMARY KEY (`StockID`),
  KEY `fk_Stock_Products1_idx` (`ItemIDStock`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,29,1000),(2,27,1000),(3,3,2000),(4,13,1100),(5,53,1100),(6,25,1000),(7,45,1100),(8,59,1222),(9,12,1223),(10,31,1224),(11,21,1000),(12,41,1100),(13,47,1222),(14,23,1224),(15,28,2000),(16,20,2001),(17,7,1223),(18,19,2001),(19,7,2001),(20,17,1223),(21,26,2000);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 17:26:57
