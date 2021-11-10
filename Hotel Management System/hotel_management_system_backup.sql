-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_management_system
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `bookingId` int NOT NULL,
  `bookedFrom` datetime DEFAULT NULL,
  `bookedTo` datetime DEFAULT NULL,
  `roomId` int NOT NULL,
  `customerId` int NOT NULL,
  `bookingType` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  KEY `roomId` (`roomId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `Room` (`RoomID`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,'2021-02-21 00:00:00','2021-02-26 00:00:00',122,3,'Online'),(2,'2021-03-05 00:00:00','2021-03-07 00:00:00',126,5,'Cash'),(3,'2021-04-21 00:00:00','2021-04-29 00:00:00',125,2,'Cash'),(4,'2021-07-12 00:00:00','2021-07-15 00:00:00',123,4,'Online');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `ID` int NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Eva','Nwanya','apt 105',62680,'eva@gmail.com'),(2,'Ena','Sanya','apt 104',54321,'ena@gmail.com'),(3,'Emu','Rick','apt 103',53107,'emu@gmail.com'),(4,'Ela','Del','apt 102',89709,'ela@gmail.com'),(5,'Era','Neya','apt 108',62690,'era@gmail.com'),(6,'Elop','Jule','apt 109',626650,'elop@gmail.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `CustomersBookedViaCash`
--

DROP TABLE IF EXISTS `CustomersBookedViaCash`;
/*!50001 DROP VIEW IF EXISTS `CustomersBookedViaCash`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomersBookedViaCash` AS SELECT 
 1 AS `Booking Id`,
 1 AS `Booking From Date`,
 1 AS `Booking End Date`,
 1 AS `Payment Method`,
 1 AS `Room Type`,
 1 AS `Room Name`,
 1 AS `Price`,
 1 AS `Name`,
 1 AS `Contact Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food` (
  `FoodID` int NOT NULL,
  `FoodName` varchar(40) DEFAULT NULL,
  `FoodType` varchar(10) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES (121,'burger','meat',1,100),(122,'chicken','meat',1,200),(123,'vegetarian','veg',1,300),(124,'sandwitch','non_veg',0,400),(125,'coke','drinks',1,550),(126,'rice','drinks',0,450);
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `FoodBill`
--

DROP TABLE IF EXISTS `FoodBill`;
/*!50001 DROP VIEW IF EXISTS `FoodBill`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `FoodBill` AS SELECT 
 1 AS `OrderID`,
 1 AS `First Name`,
 1 AS `Last Name`,
 1 AS `Address`,
 1 AS `Quantity`,
 1 AS `Food Name`,
 1 AS `Price`,
 1 AS `Total Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HR`
--

DROP TABLE IF EXISTS `HR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HR` (
  `EmpID` int NOT NULL,
  `EmpName` varchar(10) DEFAULT NULL,
  `EmpAge` int DEFAULT NULL,
  `EmpContact` int DEFAULT NULL,
  `EmpAddress` varchar(40) DEFAULT NULL,
  `EmpDesignation` varchar(40) DEFAULT NULL,
  `EmpDept` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HR`
--

LOCK TABLES `HR` WRITE;
/*!40000 ALTER TABLE `HR` DISABLE KEYS */;
INSERT INTO `HR` VALUES (212,'Eva',20,62680,'apt 105','manager','management'),(213,'Ena',21,54321,'apt 104','employee','office'),(214,'Emu',22,53107,'apt 103','waiter','resturant'),(215,'Ela',23,89709,'apt 102','house_keeper','cleaning'),(216,'Era',24,62690,'apt 108','cook','food'),(217,'Elop',25,626650,'apt 109','cleaner','cleaning');
/*!40000 ALTER TABLE `HR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderId` int NOT NULL,
  `customerId` int NOT NULL,
  `foodId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `customerId` (`customerId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`ID`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `Food` (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,6,122,3),(2,3,126,1),(3,5,125,12);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `RoomID` int NOT NULL,
  `RoomType` varchar(10) DEFAULT NULL,
  `price_per_day` int DEFAULT NULL,
  `RoomName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (121,'small',450,'single'),(122,'medium',550,'double'),(123,'big',650,'quad'),(124,'small',450,'single'),(125,'medium',550,'double'),(126,'big',650,'quad');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Services` (
  `ServiceProviderId` int NOT NULL,
  `ServiceType` varchar(10) DEFAULT NULL,
  `ServiceName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ServiceProviderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` VALUES (1,'General','Laundry'),(2,'General','Food Delivery'),(3,'Management','Pressing'),(4,'Medical','First Aid'),(5,'IT','WiFi Management');
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services_Received`
--

DROP TABLE IF EXISTS `Services_Received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Services_Received` (
  `Id` int NOT NULL,
  `serviceId` int NOT NULL,
  `employeeId` int NOT NULL,
  `serviceProvidedOn` datetime DEFAULT NULL,
  `billedAmount` float NOT NULL,
  `customerId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `serviceId` (`serviceId`),
  KEY `employeeId` (`employeeId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `Services_Received_ibfk_1` FOREIGN KEY (`serviceId`) REFERENCES `Services` (`ServiceProviderId`),
  CONSTRAINT `Services_Received_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `HR` (`EmpID`),
  CONSTRAINT `Services_Received_ibfk_3` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services_Received`
--

LOCK TABLES `Services_Received` WRITE;
/*!40000 ALTER TABLE `Services_Received` DISABLE KEYS */;
INSERT INTO `Services_Received` VALUES (1,5,215,'2021-05-06 00:00:00',300,6),(2,2,217,'2021-02-06 00:00:00',150,5),(3,1,213,'2021-09-22 00:00:00',15,2),(4,5,214,'2021-06-06 00:00:00',200,4);
/*!40000 ALTER TABLE `Services_Received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `CustomersBookedViaCash`
--

/*!50001 DROP VIEW IF EXISTS `CustomersBookedViaCash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rishav1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomersBookedViaCash` AS select `Booking`.`bookingId` AS `Booking Id`,`Booking`.`bookedFrom` AS `Booking From Date`,`Booking`.`bookedTo` AS `Booking End Date`,`Booking`.`bookingType` AS `Payment Method`,`Room`.`RoomType` AS `Room Type`,`Room`.`RoomName` AS `Room Name`,`Room`.`price_per_day` AS `Price`,concat(`Customer`.`fname`,' ',`Customer`.`lname`) AS `Name`,`Customer`.`phone` AS `Contact Number` from ((`Booking` join `Customer` on((`Booking`.`customerId` = `Customer`.`ID`))) join `Room` on((`Booking`.`roomId` = `Room`.`RoomID`))) where (`Booking`.`bookingType` = 'Cash') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FoodBill`
--

/*!50001 DROP VIEW IF EXISTS `FoodBill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rishav1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `FoodBill` AS select `Orders`.`OrderId` AS `OrderID`,`Customer`.`fname` AS `First Name`,`Customer`.`lname` AS `Last Name`,`Customer`.`address` AS `Address`,`Orders`.`quantity` AS `Quantity`,`Food`.`FoodName` AS `Food Name`,`Food`.`price` AS `Price`,(`Orders`.`quantity` * `Food`.`price`) AS `Total Amount` from ((`Orders` join `Customer` on((`Orders`.`customerId` = `Customer`.`ID`))) join `Food` on((`Orders`.`foodId` = `Food`.`FoodID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 18:56:52
