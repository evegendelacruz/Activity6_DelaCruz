-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: airport_ticket_system
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_id` int NOT NULL,
  `airport_name` varchar(45) NOT NULL,
  `airport_city` varchar(45) NOT NULL,
  `airport_country` varchar(45) NOT NULL,
  `passenger_id` int NOT NULL,
  PRIMARY KEY (`airport_id`),
  KEY `passenger_id_idx` (`passenger_id`),
  CONSTRAINT `passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (100,'Springfield International Airport','Springfield','USA',1),(102,'Metropolis Global Airport','Metropolis','USA',2),(103,'Gotham City Airport','Gotham','USA',3),(104,'Star City Regional Airport','Star City','USA',4),(105,'Central City Airport','Central City','USA',5),(106,'Smallville Airfield','Smallville','USA',6),(107,'Riverdale National Airport','Riverdale','USA',7),(108,'Hill Valley Airport','Hill Valley','USA',8),(109,'Bedford Falls Airport','Bedford Falls','USA',9),(110,'Sunnydale International Airport','Sunnydale','USA',10);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL,
  `flight_number` int NOT NULL,
  `flight_airline` varchar(45) NOT NULL,
  `flight_departureTime` timestamp(6) NOT NULL,
  `flight_arrivalTime` timestamp(6) NOT NULL,
  `flight_status` varchar(45) NOT NULL,
  `passenger_id` int NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `passenger_id2_idx` (`passenger_id`),
  KEY `airport_id_idx` (`airport_id`),
  CONSTRAINT `airport_id` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `passenger_id2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (201,1111,'American Airlines','2024-06-15 00:00:00.000000','2024-06-15 02:00:00.000000','On Time',1,100),(202,1112,'Delta Airlines','2024-06-15 01:30:00.000000','2024-06-15 03:30:00.000000','Delayed',2,102),(203,1113,'United Airlines','2024-06-15 03:45:00.000000','2024-06-15 05:45:00.000000','On Time',3,103),(204,1114,'Southwest Airlines','2024-06-15 05:15:00.000000','2024-06-15 07:15:00.000000','Canceled',4,104),(205,1115,'JetBlue Airways','2024-06-15 07:30:00.000000','2024-06-15 09:30:00.000000','On Time',5,105),(206,1116,'American Airlines','2024-06-15 09:45:00.000000','2024-06-15 11:45:00.000000','On Time',6,106),(207,1117,'Delta Airlines','2024-06-15 12:00:00.000000','2024-06-15 14:00:00.000000','On Time',7,107),(208,1118,'United Airlines','2024-06-15 13:15:00.000000','2024-06-15 15:15:00.000000','On Time',8,108),(209,1119,'Southwest Airlines','2024-06-15 14:30:00.000000','2024-06-15 16:30:00.000000','On Time',9,109),(210,1110,'JetBlue Airways','2024-06-15 15:45:00.000000','2024-06-15 17:45:00.000000','Delayed',10,110);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `passenger_name` varchar(45) NOT NULL,
  `passenger_gender` varchar(45) NOT NULL,
  `passenger_address` varchar(45) NOT NULL,
  `passenger_conInfo` bigint NOT NULL,
  `passenger_passportNo` bigint NOT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'John Doe','M','123 Main St, Springfield',9123456701,12345678),(2,'Jane Smith','F','456 Oak St, Metropolis',9123456702,23456789),(3,'Alice Johnson','F','789 Pine St, Gotham',9123456703,34567890),(4,'Bob Brown','M','101 Maple St, Star City',9123456704,45678901),(5,'Charlie Davis','M','202 Birch St, Central City',9123456705,56789012),(6,'Diana Evans','F','303 Cedar St, Smallville',9123456706,67890123),(7,'Edward Green','M','404 Elm St, Riverdale',9123456707,78901234),(8,'Fiona Harris','F','505 Willow St, Hill Valley',9123456708,89012345),(9,'George King','M','606 Fir St, Bedford Falls',9123456709,90123456),(10,'Hannah Lewis','F','707 Ash St, Sunnydale',9123456710,11234567);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `payment_status` varchar(45) NOT NULL,
  `payment_amount` int NOT NULL,
  `payment_date` date NOT NULL,
  `passenger_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `passenger_id3_idx` (`passenger_id`),
  CONSTRAINT `passenger_id3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (11,'Credit Card','Completed',1500,'2024-06-01',1),(12,'PayPal',' Pending',2000,'2024-06-02',2),(13,'Debit Card','Completed',1200,'2024-06-03',3),(14,'Bank Transfer','Failed',1800,'2024-06-04',4),(15,'Credit Card','Completed',2500,'2024-06-05',5),(16,'PayPal','Pending',1300,'2024-06-06',6),(17,'Debit Card','Completed',1600,'2024-06-07',7),(18,'Bank Transfer','Completed',2200,'2024-06-08',8),(19,'Credit Card','Completed',1700,'2024-06-09',9),(20,'Credit Card','Completed',2000,'2024-06-10',10);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `ticket_seatNo.` int NOT NULL,
  `ticket_class` varchar(45) NOT NULL,
  `ticket_bookingDate` datetime(6) NOT NULL,
  `ticket_price` int NOT NULL,
  `flight_id` int NOT NULL,
  `passenger_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `passenger_id1_idx` (`passenger_id`),
  CONSTRAINT `passenger_id1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (401,1,'Economy','2024-06-10 00:00:00.000000',1500,201,1),(402,2,'Business','2024-06-10 00:00:00.000000',2000,202,2),(403,3,'Economy','2024-06-10 00:00:00.000000',1200,203,3),(404,4,'First Class','2024-06-10 00:00:00.000000',1800,204,4),(405,5,'Economy','2024-06-10 00:00:00.000000',2500,205,5),(406,6,'Business','2024-06-10 00:00:00.000000',1300,206,6),(407,7,'Economy','2024-06-10 00:00:00.000000',1600,207,7),(408,8,'First Class','2024-06-10 00:00:00.000000',2200,208,8),(409,9,'Economy','2024-06-10 00:00:00.000000',1700,209,9),(410,10,'Business','2024-06-10 00:00:00.000000',2000,210,10);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'airport_ticket_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 21:58:13
