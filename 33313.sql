-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: Order_Managment
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

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
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `Name` varchar(50) NOT NULL,
  `Category_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES ('Cricket',1),('Swimming',2),('Cricket',3),('Football',4),('Basketball',5),('Badminton',6),('Long Tennis',7),('Water Polo',8);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Email_id` varchar(30) DEFAULT NULL,
  `Phone_no` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Society` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Aditya','Challo@gmail.com','465798','1989-08-08','Sameer','Nasik','Maharastra'),(2,'Omkar','Omkar@gmail.com','741852','2000-12-30','RaneNagar','Pune','Maharastra'),(3,'Prathamesh','pratham@gmail.com','123456','1999-02-19','Kotharud','Nasik','Maharastra'),(4,'Atharva','Joshi@gmail.com','789132','1999-12-30','NDA gate','Pune','Maharastra'),(5,'Dev','Dev@gmail.com','963852','1999-12-20','ShivajiNagar','Pune','Maharastra');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Details`
--

DROP TABLE IF EXISTS `Order_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Details` (
  `Order_ID` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Product_Name` varchar(50) NOT NULL,
  `Product_Cost` int(11) NOT NULL,
  `Product_Quantity` int(11) NOT NULL,
  `Total_Cost` int(11) NOT NULL,
  KEY `Order_Details` (`Order_ID`),
  KEY `Product` (`Product_id`),
  KEY `Customer` (`Customer_id`),
  CONSTRAINT `Order_Details_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_Details_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_Details_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `Record_Of_Order` (`Order_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_Details_ibfk_4` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_Details_ibfk_5` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_Details_ibfk_6` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Details`
--

LOCK TABLES `Order_Details` WRITE;
/*!40000 ALTER TABLE `Order_Details` DISABLE KEYS */;
INSERT INTO `Order_Details` VALUES (1,3,3,'Swimming Costume',999,2,0),(1,3,3,'Swimming Costume',999,2,1998);
/*!40000 ALTER TABLE `Order_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Rate` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `Category_id` (`Category_id`),
  CONSTRAINT `Category_id` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Armspad',1200,5,2),(3,'Swimming Costume',999,7,2),(4,'Goggles',499,10,2),(5,'Ball',20,50,3),(6,'Bat',200,10,3);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Record_Of_Order`
--

DROP TABLE IF EXISTS `Record_Of_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Record_Of_Order` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_id`),
  CONSTRAINT `Record_Of_Order_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Record_Of_Order`
--

LOCK TABLES `Record_Of_Order` WRITE;
/*!40000 ALTER TABLE `Record_Of_Order` DISABLE KEYS */;
INSERT INTO `Record_Of_Order` VALUES (1,3,'2019-07-23','Kotharud Nasik Maharastra');
/*!40000 ALTER TABLE `Record_Of_Order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-24  8:24:36
