-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: COP4331
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Colors`
--

DROP TABLE IF EXISTS `Colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colors` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `UserID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colors`
--

LOCK TABLES `Colors` WRITE;
/*!40000 ALTER TABLE `Colors` DISABLE KEYS */;
INSERT INTO `Colors` VALUES (1,'Blue',1),(2,'White',1),(3,'Black',1),(4,'Magenta',1),(5,'Yellow',1),(6,'Cyan',1),(7,'Salmon',1),(8,'Chartreuse',1),(9,'Lime',1),(10,'Light Blue',1),(11,'Light Gray',1),(12,'Light Red',1),(13,'Light Green',1),(14,'Chiffon',1),(15,'Fuscia',1),(16,'Brown',1),(17,'Beige',1),(18,'Blue',3),(19,'White',3),(20,'Black',3),(21,'Gray',3),(22,'Magenta',3),(23,'Yellow',3),(24,'Cyan',3),(25,'Salmon',3),(26,'Chartreuse',3),(27,'Lime',3),(28,'Light Blue',3),(29,'Light Gray',3),(30,'Light Red',3),(31,'Light Green',3),(32,'Chiffon',3),(33,'Fuscia',3),(34,'Brown',3),(35,'Beige',3),(38,'Green',1);
/*!40000 ALTER TABLE `Colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contacts`
--

DROP TABLE IF EXISTS `Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contacts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Phone` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `UserID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
INSERT INTO `Contacts` VALUES (1,'John','Cena','407-442-1284','johncenafromwwe@yahoo.com',1),(2,'The','Rock','407-242-1687','therockwwe@gmail.com',1),(3,'David','Kim','786-555-1003','david@hotmail.com',1),(4,'LeBron','James','786-515-1054','thegoat@gmail.com',2),(5,'Frank','Garcia','407-595-1005','frank@outlook.com',2),(6,'Grace','Chen','689-555-1006','graceee9@gmail.com',3),(7,'Liam','Anderson','786-555-2001','liam.anderson66@gmail.com',1),(8,'Olivia','Rodrigo','407-111-2002','oliviarodrigowow@gmail.com',1),(9,'Orlando','Magic','407-138-2999','orlandomagic@outlook.com',1),(10,'Emma','Thomas','786-555-2004','emma.thomas@gmail.com',1),(11,'James','Hernandez','786-555-2005','james.hernandez3@hotmail.com',1),(12,'Sophia','Moore','786-555-3001','sophia.moore21@gmail.com',2),(13,'Benjamin','Clark','689-555-3002','benjamin.clark@outlook.com',2),(14,'Ava','Lewis','786-555-3003','ava.lewis@outlook.com',2),(15,'Lucas','Walker','689-555-3004','lucas.walker@yahoo.com',2),(16,'Mia','Hall','689-555-3005','mia.hall@gmail.com',2),(17,'Ethan','Young','689-575-4001','ethan.young@gmail.com',3),(18,'Isabella','Allen','786-225-4002','isabella.allen@gmail.com',3),(19,'Mason','King','786-555-4003','mason.king@gmail.com',3),(20,'Charlotte','Wright','999-555-4004','charlotte.wright@outlook.com',3),(21,'Logan','Scott','993-555-4005','logan.scott@gmail.com',3),(22,'Amelia','Green','212-555-5001','amelia.green@gmail.com',4),(23,'DJ','Khaled','313-555-5002','wethebestmusic@hotmail.com',4),(24,'Harper','Adams','414-555-5003','harper.adams@outlook.com',4),(25,'Daniel','Nelson','909-555-5004','daniel.nelson@yahoo.com',4),(26,'Ella','Carter','899-555-5005','ella.carter@gmail.com',4),(27,'Gabe','Davis','406-482-1289','gabedavisfromthebills@outlook.com',1),(28,'Tacko','Fall','406-212-1117','tackofalltall@gmail.com',1),(29,'Mariah','Carey','890-999-1111','idontwantalotforchristmas@hotmail.com',1),(30,'Bryan','Gonzalez','786-511-1000','gonzalezbryan381@gmail.com',2),(31,'Shohei','Ohtani','407-900-8921','shoheitworings@yahoo.com',2),(32,'Rodrigo','DePaul','671-213-3234','rodridepaul192@gmail.com',3),(33,'Aaron','Doradoz','729-113-2189','aarondoradoz991@gmail.com',1),(34,'Dan','Yamaoka','900-111-1215','danyamaoka@yahoo.com',4),(35,'Colin','Northward','423-139-9002','colinnorthw21@gmail.com',4);
/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Login` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Rick','Leinecker','RickL','COP4331'),(2,'Sam','Hill','SamH','Test'),(3,'Rick','Leinecker','RickL','5832a71366768098cceb7095efb774f2'),(4,'Sam','Hill','SamH','0cbc6611f5540bd0809a388dc95a615b');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-28  5:28:16
