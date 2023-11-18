-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: Rechnungsdatenbank
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
  `Kundennummer` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` char(60) NOT NULL,
  `Nachname` char(60) NOT NULL,
  `Strasse` char(40) NOT NULL,
  `Hausnummer` int(11) NOT NULL,
  `PLZ` int(11) NOT NULL,
  `Ort` char(40) NOT NULL,
  PRIMARY KEY (`Kundennummer`)
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
  `Artikelnummer` int(11) NOT NULL AUTO_INCREMENT,
  `Produktname` char(60) NOT NULL,
  `Preis` double NOT NULL,
  PRIMARY KEY (`Artikelnummer`)
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
  `Rechnungsnummer` int(11) NOT NULL AUTO_INCREMENT,
  `Rechnungsdatum` date NOT NULL,
  PRIMARY KEY (`Rechnungsnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rechnung`
--

LOCK TABLES `Rechnung` WRITE;
/*!40000 ALTER TABLE `Rechnung` DISABLE KEYS */;
INSERT INTO `Rechnung` VALUES (1,'2023-10-01'),(2,'2023-10-03'),(3,'2023-10-03'),(4,'2023-10-05'),(5,'2023-10-10'),(6,'2023-10-13'),(7,'2023-10-13'),(8,'2023-10-20'),(9,'2023-10-25'),(10,'2023-10-27'),(11,'2023-10-30');
/*!40000 ALTER TABLE `Rechnung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kauft`
--

DROP TABLE IF EXISTS `kauft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kauft` (
  `Kundennummer` int(11) NOT NULL,
  `Rechnungsnummer` int(11) NOT NULL,
  `Artikelnummer` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL,
  PRIMARY KEY (`Kundennummer`,`Rechnungsnummer`,`Artikelnummer`),
  KEY `Rechnungsnummer` (`Rechnungsnummer`),
  KEY `Artikelnummer` (`Artikelnummer`),
  CONSTRAINT `kauft_ibfk_1` FOREIGN KEY (`Kundennummer`) REFERENCES `Kunde` (`Kundennummer`),
  CONSTRAINT `kauft_ibfk_2` FOREIGN KEY (`Rechnungsnummer`) REFERENCES `Rechnung` (`Rechnungsnummer`),
  CONSTRAINT `kauft_ibfk_3` FOREIGN KEY (`Artikelnummer`) REFERENCES `Produkt` (`Artikelnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kauft`
--

LOCK TABLES `kauft` WRITE;
/*!40000 ALTER TABLE `kauft` DISABLE KEYS */;
INSERT INTO `kauft` VALUES (1,1,1,2),(1,1,2,4),(1,1,3,1),(1,1,4,3),(1,1,5,1),(1,1,6,1),(1,1,7,1),(1,1,8,1),(1,1,18,2),(1,6,19,4),(1,6,20,2),(1,6,21,2),(1,6,22,3),(2,5,10,3),(2,5,11,4),(2,5,12,6),(2,5,13,7),(2,5,18,5),(2,9,1,4),(2,9,2,4),(2,9,3,2),(2,9,4,3),(2,9,5,1),(2,9,6,1),(2,9,7,1),(2,9,8,1),(2,9,9,3),(2,9,10,2),(2,9,11,4),(2,9,12,2),(2,9,13,2),(2,9,14,3),(2,9,15,3),(2,9,16,1),(2,9,17,2),(2,9,18,6),(3,2,1,1),(3,2,4,4),(3,2,5,3),(3,2,6,2),(4,3,6,1),(4,3,10,1),(4,3,11,2),(4,3,12,1),(4,3,13,1),(4,3,14,1),(4,3,17,5),(4,3,18,3),(4,8,1,3),(4,8,2,2),(4,8,14,2),(4,11,3,5),(4,11,8,3),(4,11,11,2),(4,11,13,1),(4,11,15,4),(5,7,3,2),(5,7,4,4),(5,10,1,5),(5,10,6,6),(5,10,10,7),(5,10,13,8),(5,10,19,1),(5,10,21,2),(6,4,1,3),(6,4,2,4),(6,4,3,2),(6,4,4,3),(6,4,5,2),(6,4,6,1),(6,4,9,2),(6,4,15,3);
/*!40000 ALTER TABLE `kauft` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 16:53:54
