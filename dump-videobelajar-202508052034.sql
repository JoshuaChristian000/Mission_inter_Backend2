-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: videobelajar
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `kategori_kelas`
--

DROP TABLE IF EXISTS `kategori_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_kelas` (
  `Kategori_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Kategori_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_kelas`
--

LOCK TABLES `kategori_kelas` WRITE;
/*!40000 ALTER TABLE `kategori_kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas` (
  `Kelas_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title_Kelas` varchar(255) DEFAULT NULL,
  `Deskripsi` text,
  `Price` decimal(10,2) DEFAULT NULL,
  `Kategori_ID` int(11) DEFAULT NULL,
  `Review_ID` int(11) DEFAULT NULL,
  `Tutor_ID` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Kelas_ID`),
  KEY `Kategori_ID` (`Kategori_ID`),
  KEY `Review_ID` (`Review_ID`),
  KEY `Tutor_ID` (`Tutor_ID`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`Kategori_ID`) REFERENCES `kategori_kelas` (`Kategori_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`Review_ID`) REFERENCES `review` (`Review_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `kelas_ibfk_3` FOREIGN KEY (`Tutor_ID`) REFERENCES `tutor` (`Tutor_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas_saya`
--

DROP TABLE IF EXISTS `kelas_saya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas_saya` (
  `Kelas_Saya_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Kelas_ID` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Kelas_Saya_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Kelas_ID` (`Kelas_ID`),
  CONSTRAINT `kelas_saya_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kelas_saya_ibfk_2` FOREIGN KEY (`Kelas_ID`) REFERENCES `kelas` (`Kelas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas_saya`
--

LOCK TABLES `kelas_saya` WRITE;
/*!40000 ALTER TABLE `kelas_saya` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas_saya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `Material_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Modul_ID` int(11) DEFAULT NULL,
  `Video` varchar(255) DEFAULT NULL,
  `Quiz` text,
  `Rangkuman` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Material_ID`),
  KEY `Modul_ID` (`Modul_ID`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`Modul_ID`) REFERENCES `modul_kelas` (`Modul_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul_kelas`
--

DROP TABLE IF EXISTS `modul_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modul_kelas` (
  `Modul_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kelas_ID` int(11) DEFAULT NULL,
  `Judul_Modul` varchar(255) DEFAULT NULL,
  `Deskripsi` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Modul_ID`),
  KEY `Kelas_ID` (`Kelas_ID`),
  CONSTRAINT `modul_kelas_ibfk_1` FOREIGN KEY (`Kelas_ID`) REFERENCES `kelas` (`Kelas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul_kelas`
--

LOCK TABLES `modul_kelas` WRITE;
/*!40000 ALTER TABLE `modul_kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Kelas_ID` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Kelas_ID` (`Kelas_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Kelas_ID`) REFERENCES `kelas` (`Kelas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `Pembayaran_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Order_ID` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pembayaran_ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pretest`
--

DROP TABLE IF EXISTS `pretest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pretest` (
  `Pretest_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kelas_ID` int(11) DEFAULT NULL,
  `Judul` varchar(255) DEFAULT NULL,
  `Pertanyaan` text,
  `Opsi_A` varchar(255) DEFAULT NULL,
  `Opsi_B` varchar(255) DEFAULT NULL,
  `Opsi_C` varchar(255) DEFAULT NULL,
  `Opsi_D` varchar(255) DEFAULT NULL,
  `Jawaban_Benar` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pretest_ID`),
  KEY `Kelas_ID` (`Kelas_ID`),
  CONSTRAINT `pretest_ibfk_1` FOREIGN KEY (`Kelas_ID`) REFERENCES `kelas` (`Kelas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pretest`
--

LOCK TABLES `pretest` WRITE;
/*!40000 ALTER TABLE `pretest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pretest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `Alumni` varchar(100) DEFAULT NULL,
  `Deskripsi` text,
  `Rating` decimal(2,1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Review_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `Tutor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name_Tutor` varchar(100) DEFAULT NULL,
  `Bio` text,
  `Keahlian` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Tutor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'videobelajar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 20:34:37
