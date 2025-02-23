-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: parks_and_recreation
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Dumping data for table `employee_demographics`
--

LOCK TABLES `employee_demographics` WRITE;
/*!40000 ALTER TABLE `employee_demographics` DISABLE KEYS */;
INSERT INTO `employee_demographics` VALUES (1,'Leslie','Knope',44,'Female','1979-09-25'),(3,'Tom','Haverford',36,'Male','1987-03-04'),(4,'April','Ludgate',29,'Female','1994-03-27'),(5,'Jerry','Gergich',61,'Male','1962-08-28'),(6,'Donna','Meagle',46,'Female','1977-07-30'),(7,'Ann','Perkins',35,'Female','1988-12-01'),(8,'Chris','Traeger',43,'Male','1980-11-11'),(9,'Ben','Wyatt',38,'Male','1985-07-26'),(10,'Andy','Dwyer',34,'Male','1989-03-25'),(11,'Mark','Brendanawicz',40,'Male','1983-06-14'),(12,'Craig','Middlebrooks',37,'Male','1986-07-27');
/*!40000 ALTER TABLE `employee_demographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee_salary`
--

LOCK TABLES `employee_salary` WRITE;
/*!40000 ALTER TABLE `employee_salary` DISABLE KEYS */;
INSERT INTO `employee_salary` VALUES (1,'Leslie','Knope','Deputy Director of Parks and Recreation',75000,1),(2,'Ron','Swanson','Director of Parks and Recreation',70000,1),(3,'Tom','Haverford','Entrepreneur',50000,1),(4,'April','Ludgate','Assistant to the Director of Parks and Recreation',25000,1),(5,'Jerry','Gergich','Office Manager',50000,1),(6,'Donna','Meagle','Office Manager',60000,1),(7,'Ann','Perkins','Nurse',55000,4),(8,'Chris','Traeger','City Manager',90000,3),(9,'Ben','Wyatt','State Auditor',70000,6),(10,'Andy','Dwyer','Shoe Shiner and Musician',20000,NULL),(11,'Mark','Brendanawicz','City Planner',57000,3),(12,'Craig','Middlebrooks','Parks Director',65000,1);
/*!40000 ALTER TABLE `employee_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parks_departments`
--

LOCK TABLES `parks_departments` WRITE;
/*!40000 ALTER TABLE `parks_departments` DISABLE KEYS */;
INSERT INTO `parks_departments` VALUES (1,'Parks and Recreation'),(2,'Animal Control'),(3,'Public Works'),(4,'Healthcare'),(5,'Library'),(6,'Finance');
/*!40000 ALTER TABLE `parks_departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-23 17:42:39
