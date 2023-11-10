-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: dblittlelemon
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date DEFAULT NULL,
  `TableNumber` int DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE KEY `BookingID_UNIQUE` (`BookingID`),
  KEY `CustomerID_idx` (`Customer_ID`),
  CONSTRAINT `Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `Customers` (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,'2023-12-15',5,1),(2,'2022-11-12',3,3),(3,'2023-12-12',2,2),(4,'2023-12-14',2,1),(6,'2023-12-12',3,3);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerId` int NOT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `CustomerContact` varchar(45) DEFAULT NULL,
  `CustomerEmail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `CustomerEmail_UNIQUE` (`CustomerEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Ben','9187888999','ben@gmail.com'),(2,'Greg','9187886775','greg@gmail.com'),(3,'Jeff','6198987000','jeff@gmail.com'),(4,'Shely','8584153627','shelly@gmail.com'),(5,'Stanley','3624176767','stanley@gmail.com');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `DeliveryID` int NOT NULL,
  `DeliveryStatus` varchar(45) DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,'In Transit','2023-10-16'),(2,'In Transit','2023-10-17'),(3,'Completed','2022-12-14'),(4,'In Transit','2023-06-27'),(5,'In Transit','2023-09-08');
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` int NOT NULL,
  `MenuName` varchar(45) DEFAULT NULL,
  `MenuItemsID` int DEFAULT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `MenuItemsID_idx` (`MenuItemsID`),
  CONSTRAINT `menu_items_id` FOREIGN KEY (`MenuItemsID`) REFERENCES `MenusItems` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,'Entree',1,'Chicken Parmeseana'),(2,'Entree',2,'Spaghetti With Meatballs'),(3,'Entree',3,'Pizza'),(4,'Entree',4,'Salmon'),(5,'Entree',5,'Pasta');
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenusItems`
--

DROP TABLE IF EXISTS `MenusItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenusItems` (
  `menu_item_id` int NOT NULL,
  `CourseName` varchar(45) DEFAULT NULL,
  `StarterName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_item_id`),
  UNIQUE KEY `menu_item_id_UNIQUE` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenusItems`
--

LOCK TABLES `MenusItems` WRITE;
/*!40000 ALTER TABLE `MenusItems` DISABLE KEYS */;
INSERT INTO `MenusItems` VALUES (1,'Chicken Parmeseana','Salad'),(2,'Sapaghetti With Meatballs','Soup'),(3,'Pizza','Breadsticks'),(4,'Salmon','Rice'),(5,'Pasta','Salad');
/*!40000 ALTER TABLE `MenusItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderId` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderQuantity` int DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  `DeliveryID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `DeliveryID_idx` (`DeliveryID`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `MenuID_idx` (`MenuID`),
  CONSTRAINT `CustomerId` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerId`),
  CONSTRAINT `DeliveryID` FOREIGN KEY (`DeliveryID`) REFERENCES `Delivery` (`DeliveryID`),
  CONSTRAINT `MenuID` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2023-10-14',5,65,1,1,1),(3,'2022-12-10',10,130,3,3,3),(4,'2023-06-26',7,80,4,4,4),(5,'2023-09-05',4,50,5,5,5);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderQuantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL,
  `StaffName` varchar(45) DEFAULT NULL,
  `StaffRole` varchar(45) DEFAULT NULL,
  `StaffSalary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Herschel Walker','Server',50000),(2,'James Hyde','Supervisor',75000),(3,'Hank Green','Manager',100000),(4,'Andrew Geffen','Host',50000),(5,'Sarah Marshall','Server',50000);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dblittlelemon'
--

--
-- Dumping routines for database 'dblittlelemon'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `AddBooking`(IN Booking_ID INT, CustomerID INT, Table_Number INT, Booking_Date DATE)
BEGIN
    INSERT INTO Bookings (BookingID, Customer_ID, TableNumber, BookingDate)
    VALUES (Booking_ID, CustomerID, Table_Number, Booking_Date);
    
    SELECT 'New Booking Added' AS Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `AddValidBooking`(IN Booking_Date DATE, IN Table_Number INT)
BEGIN
	DECLARE bookingCount INT;
		

		START TRANSACTION;
		

		SELECT COUNT(*) INTO bookingCount
		FROM Bookings
		WHERE BookingDate = Booking_Date AND TableNumber = Table_Number;
		
		IF bookingCount > 0 THEN
			ROLLBACK;
			SELECT 'Table is already booked on the specified date. Booking canceled.' AS Result;
		ELSE
			INSERT INTO Bookings (BookingDate, TableNumber) VALUES (Booking_Date, Table_Number);
			COMMIT;
			SELECT 'Booking successful. Table reserved for the specified date.' AS Result;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `CancelBooking`(IN Booking_ID INT)
BEGIN
 
    DELETE FROM Bookings
    WHERE BookingId = Booking_ID;
    
    SELECT concat('Booking ', Booking_ID, ' cancelled') AS Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `CancelOrder`(IN orderIdToDelete INT)
BEGIN
    DECLARE orderExists INT;
    SELECT COUNT(*) INTO orderExists FROM Orders WHERE OrderID = orderIdToDelete;
    IF orderExists > 0 THEN
        DELETE FROM Orders WHERE OrderID = orderIdToDelete;
        SELECT CONCAT('Order ID ', orderIdToDelete, ' has been canceled.') AS Result;
    ELSE
        SELECT 'Order not found. No action taken.' AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `CheckBooking`(IN BookingDate DATE, IN TableNumber INT)
BEGIN
    DECLARE bookingCount INT;
    DECLARE Booking_status VARCHAR(50);

    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNumber = tableNumber;

    IF (@bookingCount > 0) THEN
        SET Booking_status = 'Table is already booked.';
    ELSE
        SET Booking_status = 'Table is available.';
    END IF;

    SELECT Booking_status AS 'Booking Status';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(OrderQuantity) AS max_quantity_in_order FROM Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone`@`%` PROCEDURE `UpdateBooking`(IN Booking_ID INT, IN Booking_Date DATE)
BEGIN
   
    UPDATE Bookings
    SET BookingDate = Booking_Date
    WHERE BookingID = Booking_ID;
    
    SELECT CONCAT('Booking ', Booking_ID, ' updated.') AS Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`capstone`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderId` AS `OrderID`,`orders`.`OrderQuantity` AS `OrderQuantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`OrderQuantity` > 2) */;
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

-- Dump completed on 2023-11-09 17:00:25
