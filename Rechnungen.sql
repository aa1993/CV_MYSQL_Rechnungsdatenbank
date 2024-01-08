-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: Rechnungen
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

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
-- Table structure for table `Kunde`
--

DROP TABLE IF EXISTS `Kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kunde` (
  `kundennummer` int(8) NOT NULL AUTO_INCREMENT,
  `vorname` char(60) NOT NULL,
  `nachname` char(60) NOT NULL,
  `strasse` char(40) NOT NULL,
  `hausnummer` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `ort` char(40) NOT NULL,
  PRIMARY KEY (`kundennummer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kunde`
--

LOCK TABLES `Kunde` WRITE;
/*!40000 ALTER TABLE `Kunde` DISABLE KEYS */;
INSERT INTO `Kunde` VALUES (1,'Andreas','Metzger','Krementzstr.',5,50931,'Köln'),(2,'Sandra','Schmidt','Ludwigsburger Str.',21,50739,'Köln'),(3,'Christian','Ebersbacher','Thorwaldsenstr.',12,51103,'Köln'),(4,'Brigitte','Theiss','Zehntstr.',6,51065,'Köln'),(5,'Daniela','Beich','Sigwinstr.',158,51061,'Köln'),(6,'Stefan','Hahn','Wilhelm-Schreiber-Str.',46,50827,'Köln');
/*!40000 ALTER TABLE `Kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produkt`
--

DROP TABLE IF EXISTS `Produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produkt` (
  `artikelnummer` int(8) NOT NULL AUTO_INCREMENT,
  `produktname` char(60) NOT NULL,
  `preis` double NOT NULL,
  PRIMARY KEY (`artikelnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produkt`
--

LOCK TABLES `Produkt` WRITE;
/*!40000 ALTER TABLE `Produkt` DISABLE KEYS */;
INSERT INTO `Produkt` VALUES (1,'Mehl',2.39),(2,'Milch',0.99),(3,'Eier 10er',1.69),(4,'Butter',2.15),(5,'Zucker',1.39),(6,'Salz',1.9),(7,'Paprikapulver',1.99),(8,'Pfeffer',2.49),(9,'Sahne',1.2),(10,'Tomaten',2.59),(11,'Gurken',1.35),(12,'Eisbergsalat',1.69),(13,'Zwiebel',1.59),(14,'Kartoffel',1.8),(15,'Apfel',3.49),(16,'Birnen',2.69),(17,'Bananen',1.35),(18,'Wasser',1.09),(19,'Bleistift',0.79),(20,'Radiergummi',1.03),(21,'Kugelschreiber',1.99),(22,'Heft',0.26);
/*!40000 ALTER TABLE `Produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rechnung`
--

DROP TABLE IF EXISTS `Rechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rechnung` (
  `rechnungsnummer` int(8) NOT NULL AUTO_INCREMENT,
  `kundennummer` int(8) NOT NULL,
  `rechnungsdatum` date NOT NULL,
  `bezahlt` enum('bezahlt','unbezahlt') DEFAULT NULL,
  PRIMARY KEY (`rechnungsnummer`),
  KEY `kundennummer` (`kundennummer`),
  CONSTRAINT `Rechnung_ibfk_1` FOREIGN KEY (`kundennummer`) REFERENCES `Kunde` (`kundennummer`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rechnung`
--

LOCK TABLES `Rechnung` WRITE;
/*!40000 ALTER TABLE `Rechnung` DISABLE KEYS */;
INSERT INTO `Rechnung` VALUES (1,1,'2023-10-01','unbezahlt'),(2,3,'2023-10-03','unbezahlt'),(3,4,'2023-10-03','unbezahlt'),(4,6,'2023-10-05','unbezahlt'),(5,2,'2023-10-10','unbezahlt'),(6,1,'2023-10-13','unbezahlt'),(7,5,'2023-10-13','unbezahlt'),(8,4,'2023-10-20','unbezahlt'),(9,2,'2023-10-25','unbezahlt'),(10,5,'2023-10-27','unbezahlt'),(11,4,'2023-10-30','unbezahlt');
/*!40000 ALTER TABLE `Rechnung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enthaelt`
--

DROP TABLE IF EXISTS `enthaelt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enthaelt` (
  `rechnungsnummer` int(8) NOT NULL,
  `artikelnummer` int(8) NOT NULL,
  `anzahl` int(11) NOT NULL,
  PRIMARY KEY (`rechnungsnummer`,`artikelnummer`),
  KEY `rechnungsnummer` (`rechnungsnummer`),
  KEY `artikelnummer` (`artikelnummer`),
  CONSTRAINT `enthaelt_ibfk_1` FOREIGN KEY (`rechnungsnummer`) REFERENCES `Rechnung` (`rechnungsnummer`),
  CONSTRAINT `enthaelt_ibfk_2` FOREIGN KEY (`artikelnummer`) REFERENCES `Produkt` (`artikelnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enthaelt`
--

LOCK TABLES `enthaelt` WRITE;
/*!40000 ALTER TABLE `enthaelt` DISABLE KEYS */;
INSERT INTO `enthaelt` VALUES (1,1,2),(1,2,4),(1,3,1),(1,4,3),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(1,18,2),(2,1,1),(2,4,4),(2,5,3),(2,6,2),(3,6,1),(3,10,1),(3,11,2),(3,12,1),(3,13,1),(3,14,1),(3,17,5),(3,18,3),(4,1,3),(4,2,4),(4,3,2),(4,4,3),(4,5,2),(4,6,1),(4,9,2),(4,15,3),(5,10,3),(5,11,4),(5,12,6),(5,13,7),(5,18,5),(6,19,4),(6,20,2),(6,21,2),(6,22,3),(7,3,2),(7,4,4),(8,1,3),(8,2,2),(8,14,2),(9,1,4),(9,2,4),(9,3,2),(9,4,3),(9,5,1),(9,6,1),(9,7,1),(9,8,1),(9,9,3),(9,10,2),(9,11,4),(9,12,2),(9,13,2),(9,14,3),(9,15,3),(9,16,1),(9,17,2),(9,18,6),(10,1,5),(10,6,6),(10,10,7),(10,13,8),(10,19,1),(10,21,2),(11,3,5),(11,8,3),(11,11,2),(11,13,1),(11,15,4);
/*!40000 ALTER TABLE `enthaelt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08 14:31:54
