CREATE DATABASE  IF NOT EXISTS `ailearninggame` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ailearninggame`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: ailearninggame
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `tblanimal`
--

DROP TABLE IF EXISTS `tblanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanimal` (
  `animalID` int(11) NOT NULL AUTO_INCREMENT,
  `dna` longtext NOT NULL,
  `isAlive` tinyint(1) NOT NULL,
  `mutated` tinyint(1) NOT NULL,
  `generationNo` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `survivability` float DEFAULT NULL,
  `fk_tblGender` int(11) NOT NULL,
  `fk_tblAnimalSpecies` int(11) NOT NULL,
  `fk_tblAnimalLifestyle` int(11) NOT NULL,
  `fk_tblAnimalStatus` int(11) DEFAULT NULL,
  `fk_tblParents` int(11) DEFAULT NULL,
  PRIMARY KEY (`animalID`),
  KEY `fk_tblAnimal_table11_idx` (`fk_tblParents`),
  KEY `fk_tblAnimal_tblGender1_idx` (`fk_tblGender`),
  KEY `fk_tblAnimal_tblAnimalSpecies1_idx` (`fk_tblAnimalSpecies`),
  KEY `fk_tblAnimal_tblAnimalLifestyle1_idx` (`fk_tblAnimalLifestyle`),
  KEY `fk_tblAnimal_tblAnimalStatus1_idx` (`fk_tblAnimalStatus`),
  CONSTRAINT `fk_tblAnimal_table11` FOREIGN KEY (`fk_tblParents`) REFERENCES `tblparents` (`parentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblAnimalLifestyle1` FOREIGN KEY (`fk_tblAnimalLifestyle`) REFERENCES `tblanimallifestyle` (`animalLifestyleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblAnimalSpecies1` FOREIGN KEY (`fk_tblAnimalSpecies`) REFERENCES `tblanimalspecies` (`animalSpeciesID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblAnimalStatus1` FOREIGN KEY (`fk_tblAnimalStatus`) REFERENCES `tblanimalstatus` (`animalStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblGender1` FOREIGN KEY (`fk_tblGender`) REFERENCES `tblgender` (`genderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanimal`
--

LOCK TABLES `tblanimal` WRITE;
/*!40000 ALTER TABLE `tblanimal` DISABLE KEYS */;
INSERT INTO `tblanimal` VALUES (1,'',1,0,0,0,1,1,1,1,2,NULL);
/*!40000 ALTER TABLE `tblanimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblanimalclass`
--

DROP TABLE IF EXISTS `tblanimalclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanimalclass` (
  `animalClassID` int(11) NOT NULL AUTO_INCREMENT,
  `animalClass` varchar(45) NOT NULL,
  PRIMARY KEY (`animalClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanimalclass`
--

LOCK TABLES `tblanimalclass` WRITE;
/*!40000 ALTER TABLE `tblanimalclass` DISABLE KEYS */;
INSERT INTO `tblanimalclass` VALUES (1,'Mammals'),(2,'Fish'),(3,'Birds'),(4,'Amphibians'),(5,'Reptiles'),(6,'Arthropods');
/*!40000 ALTER TABLE `tblanimalclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblanimallifestyle`
--

DROP TABLE IF EXISTS `tblanimallifestyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanimallifestyle` (
  `animalLifestyleID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_tblBuilding` int(11) NOT NULL,
  `fk_tblFood` int(11) NOT NULL,
  PRIMARY KEY (`animalLifestyleID`),
  KEY `fk_tblAnimalLifestyle_tblBuilding1_idx` (`fk_tblBuilding`),
  KEY `fk_tblAnimalLifestyle_tblFood1_idx` (`fk_tblFood`),
  CONSTRAINT `fk_tblAnimalLifestyle_tblBuilding1` FOREIGN KEY (`fk_tblBuilding`) REFERENCES `tblbuilding` (`buildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimalLifestyle_tblFood1` FOREIGN KEY (`fk_tblFood`) REFERENCES `tblfood` (`foodID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanimallifestyle`
--

LOCK TABLES `tblanimallifestyle` WRITE;
/*!40000 ALTER TABLE `tblanimallifestyle` DISABLE KEYS */;
INSERT INTO `tblanimallifestyle` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,3,1),(10,3,2),(11,3,3),(12,3,4),(13,4,1),(14,4,2),(15,4,3),(16,4,4),(17,5,1),(18,5,2),(19,5,3),(20,5,4),(21,6,1),(22,6,2),(23,6,3),(24,6,4),(25,7,1),(26,7,2),(27,7,3),(28,7,4),(29,8,1),(30,8,2),(31,8,3),(32,8,4),(33,9,1),(34,9,2),(35,9,3),(36,9,4);
/*!40000 ALTER TABLE `tblanimallifestyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblanimalspecies`
--

DROP TABLE IF EXISTS `tblanimalspecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanimalspecies` (
  `animalSpeciesID` int(11) NOT NULL AUTO_INCREMENT,
  `animalSpecies` varchar(45) NOT NULL,
  `fk_tblAnimalClass` int(11) NOT NULL,
  PRIMARY KEY (`animalSpeciesID`),
  KEY `fk_tblAnimalSpecies_tblAnimalClass1_idx` (`fk_tblAnimalClass`),
  CONSTRAINT `fk_tblAnimalSpecies_tblAnimalClass1` FOREIGN KEY (`fk_tblAnimalClass`) REFERENCES `tblanimalclass` (`animalClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanimalspecies`
--

LOCK TABLES `tblanimalspecies` WRITE;
/*!40000 ALTER TABLE `tblanimalspecies` DISABLE KEYS */;
INSERT INTO `tblanimalspecies` VALUES (1,'Cow',1);
/*!40000 ALTER TABLE `tblanimalspecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblanimalstatus`
--

DROP TABLE IF EXISTS `tblanimalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanimalstatus` (
  `animalStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `animalStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`animalStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanimalstatus`
--

LOCK TABLES `tblanimalstatus` WRITE;
/*!40000 ALTER TABLE `tblanimalstatus` DISABLE KEYS */;
INSERT INTO `tblanimalstatus` VALUES (1,'Newborn'),(2,'Normal'),(3,'Dead'),(4,'Sick'),(5,'Poisoned');
/*!40000 ALTER TABLE `tblanimalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblansweredquestions`
--

DROP TABLE IF EXISTS `tblansweredquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblansweredquestions` (
  `fk_tblAnswers` int(11) NOT NULL,
  `fk_tblGameRound` int(11) NOT NULL,
  KEY `fk_tblAnsweredQuestions_tblAnswers1_idx` (`fk_tblAnswers`),
  KEY `fk_tblAnsweredQuestions_tblGameRound1_idx` (`fk_tblGameRound`),
  CONSTRAINT `fk_tblAnsweredQuestions_tblAnswers1` FOREIGN KEY (`fk_tblAnswers`) REFERENCES `tblanswers` (`answerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnsweredQuestions_tblGameRound1` FOREIGN KEY (`fk_tblGameRound`) REFERENCES `tblgameround` (`gameRoundID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblansweredquestions`
--

LOCK TABLES `tblansweredquestions` WRITE;
/*!40000 ALTER TABLE `tblansweredquestions` DISABLE KEYS */;
INSERT INTO `tblansweredquestions` VALUES (2,1);
/*!40000 ALTER TABLE `tblansweredquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblanswers`
--

DROP TABLE IF EXISTS `tblanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanswers` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(100) NOT NULL,
  `isCorrectAnswer` tinyint(1) NOT NULL,
  `description` longtext,
  `fk_tblQuestion` int(11) NOT NULL,
  PRIMARY KEY (`answerID`),
  KEY `fk_tblAnswers_tblQuestion1_idx` (`fk_tblQuestion`),
  CONSTRAINT `fk_tblAnswers_tblQuestion1` FOREIGN KEY (`fk_tblQuestion`) REFERENCES `tblquestion` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanswers`
--

LOCK TABLES `tblanswers` WRITE;
/*!40000 ALTER TABLE `tblanswers` DISABLE KEYS */;
INSERT INTO `tblanswers` VALUES (1,'Selection of DNA from parents.',0,'',1),(2,'Alteration of the original values in the DNA.',1,'',1),(3,'It is the same as the fitness function.',0,'',1);
/*!40000 ALTER TABLE `tblanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbuilding`
--

DROP TABLE IF EXISTS `tblbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbuilding` (
  `buildingID` int(11) NOT NULL AUTO_INCREMENT,
  `buildingName` varchar(255) NOT NULL,
  PRIMARY KEY (`buildingID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbuilding`
--

LOCK TABLES `tblbuilding` WRITE;
/*!40000 ALTER TABLE `tblbuilding` DISABLE KEYS */;
INSERT INTO `tblbuilding` VALUES (1,'Research center'),(2,'Sleeping cabins'),(3,'Water Tower'),(4,'Farm'),(5,'Animal Habitat: Forest'),(6,'Animal Habitat: Lake'),(7,'Animal Habitat: River'),(8,'Animal Habitat: Mountain'),(9,'Animal Habitat: Grass');
/*!40000 ALTER TABLE `tblbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldisaster`
--

DROP TABLE IF EXISTS `tbldisaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldisaster` (
  `disasterID` int(11) NOT NULL AUTO_INCREMENT,
  `disasterType` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`disasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldisaster`
--

LOCK TABLES `tbldisaster` WRITE;
/*!40000 ALTER TABLE `tbldisaster` DISABLE KEYS */;
INSERT INTO `tbldisaster` VALUES (1,'Forest fire','A raging forest fire threatening to burn down the forest.'),(2,'Poison gas','Poisonous gas leaks from the ground, corrupting the environment.'),(3,'Dead animals','Dead and rotten animals corrupts the environment.');
/*!40000 ALTER TABLE `tbldisaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfood`
--

DROP TABLE IF EXISTS `tblfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfood` (
  `foodID` int(11) NOT NULL AUTO_INCREMENT,
  `food` varchar(45) NOT NULL,
  PRIMARY KEY (`foodID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfood`
--

LOCK TABLES `tblfood` WRITE;
/*!40000 ALTER TABLE `tblfood` DISABLE KEYS */;
INSERT INTO `tblfood` VALUES (1,'Plant'),(2,'Meat'),(3,'Human food'),(4,'Insect');
/*!40000 ALTER TABLE `tblfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgameround`
--

DROP TABLE IF EXISTS `tblgameround`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgameround` (
  `gameRoundID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_tblPlayer` int(11) NOT NULL,
  `gameRoundNo` int(11) NOT NULL,
  `noInGameDays` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`gameRoundID`),
  KEY `fk_tblGameRound_tblPlayer1_idx` (`fk_tblPlayer`),
  CONSTRAINT `fk_tblGameRound_tblPlayer1` FOREIGN KEY (`fk_tblPlayer`) REFERENCES `tblplayer` (`playerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgameround`
--

LOCK TABLES `tblgameround` WRITE;
/*!40000 ALTER TABLE `tblgameround` DISABLE KEYS */;
INSERT INTO `tblgameround` VALUES (1,1,1,0,0);
/*!40000 ALTER TABLE `tblgameround` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Lucas`@`%`*/ /*!50003 TRIGGER `AiLearningGame`.`TBLGAMEROUND_AFTER_INSERT` 
AFTER INSERT ON `tblGameRound`
FOR EACH ROW 
BEGIN 
    -- insert new entry into tblLog
    CALL InsertNewGameLogEntry(new.gameRoundID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tblgender`
--

DROP TABLE IF EXISTS `tblgender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgender` (
  `genderID` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`genderID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgender`
--

LOCK TABLES `tblgender` WRITE;
/*!40000 ALTER TABLE `tblgender` DISABLE KEYS */;
INSERT INTO `tblgender` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `tblgender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllog`
--

DROP TABLE IF EXISTS `tbllog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllog` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `logDate` datetime NOT NULL,
  `logEvent` varchar(45) NOT NULL,
  `fk_tblLogType` int(11) NOT NULL,
  `fk_tblGameRound` int(11) NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `fk_tblLog_tblLogType1_idx` (`fk_tblLogType`),
  KEY `fk_tblLog_tblGameRound1_idx` (`fk_tblGameRound`),
  CONSTRAINT `fk_tblLog_tblGameRound1` FOREIGN KEY (`fk_tblGameRound`) REFERENCES `tblgameround` (`gameRoundID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblLog_tblLogType1` FOREIGN KEY (`fk_tblLogType`) REFERENCES `tbllogtype` (`logTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllog`
--

LOCK TABLES `tbllog` WRITE;
/*!40000 ALTER TABLE `tbllog` DISABLE KEYS */;
INSERT INTO `tbllog` VALUES (1,'2015-04-21 23:46:53','Player started a new game.',1,1);
/*!40000 ALTER TABLE `tbllog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllogtype`
--

DROP TABLE IF EXISTS `tbllogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllogtype` (
  `logTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `logType` varchar(45) NOT NULL,
  PRIMARY KEY (`logTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllogtype`
--

LOCK TABLES `tbllogtype` WRITE;
/*!40000 ALTER TABLE `tbllogtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblownedanimals`
--

DROP TABLE IF EXISTS `tblownedanimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblownedanimals` (
  `ownedAnimalsID` int(11) NOT NULL AUTO_INCREMENT,
  `noOfAnimalsOwned` int(11) NOT NULL,
  `fk_tblAnimal` int(11) NOT NULL,
  `fk_tblGameRound` int(11) NOT NULL,
  PRIMARY KEY (`ownedAnimalsID`),
  UNIQUE KEY `fk_tblAnimal_UNIQUE` (`fk_tblAnimal`),
  KEY `fk_tblOwnedAnimals_tblAnimal1_idx` (`fk_tblAnimal`),
  KEY `fk_tblOwnedAnimals_tblGameRound1_idx` (`fk_tblGameRound`),
  CONSTRAINT `fk_tblOwnedAnimals_tblAnimal1` FOREIGN KEY (`fk_tblAnimal`) REFERENCES `tblanimal` (`animalID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedAnimals_tblGameRound1` FOREIGN KEY (`fk_tblGameRound`) REFERENCES `tblgameround` (`gameRoundID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblownedanimals`
--

LOCK TABLES `tblownedanimals` WRITE;
/*!40000 ALTER TABLE `tblownedanimals` DISABLE KEYS */;
INSERT INTO `tblownedanimals` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `tblownedanimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblownedbuildings`
--

DROP TABLE IF EXISTS `tblownedbuildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblownedbuildings` (
  `ownedBuildingsID` int(11) NOT NULL AUTO_INCREMENT,
  `noOfBuildingsOwned` int(11) NOT NULL,
  `fk_tblBuilding` int(11) NOT NULL,
  `fk_tblGameRound` int(11) NOT NULL,
  PRIMARY KEY (`ownedBuildingsID`),
  UNIQUE KEY `fk_tblBuilding_UNIQUE` (`fk_tblBuilding`),
  KEY `fk_tblOwnedBuildings_tblBuilding1_idx` (`fk_tblBuilding`),
  KEY `fk_tblOwnedBuildings_tblGameRound1_idx` (`fk_tblGameRound`),
  CONSTRAINT `fk_tblOwnedBuildings_tblBuilding1` FOREIGN KEY (`fk_tblBuilding`) REFERENCES `tblbuilding` (`buildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedBuildings_tblGameRound1` FOREIGN KEY (`fk_tblGameRound`) REFERENCES `tblgameround` (`gameRoundID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblownedbuildings`
--

LOCK TABLES `tblownedbuildings` WRITE;
/*!40000 ALTER TABLE `tblownedbuildings` DISABLE KEYS */;
INSERT INTO `tblownedbuildings` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `tblownedbuildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblownedfood`
--

DROP TABLE IF EXISTS `tblownedfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblownedfood` (
  `ownedFoodID` int(11) NOT NULL AUTO_INCREMENT,
  `noOfFoodOwned` int(11) NOT NULL,
  `fk_tblFood` int(11) NOT NULL,
  `fk_tblGameRound` int(11) NOT NULL,
  PRIMARY KEY (`ownedFoodID`),
  UNIQUE KEY `fk_tblFood_UNIQUE` (`fk_tblFood`),
  KEY `fk_tblOwnedFood_tblFood1_idx` (`fk_tblFood`),
  KEY `fk_tblOwnedFood_tblGameRound1_idx` (`fk_tblGameRound`),
  CONSTRAINT `fk_tblOwnedFood_tblFood1` FOREIGN KEY (`fk_tblFood`) REFERENCES `tblfood` (`foodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedFood_tblGameRound1` FOREIGN KEY (`fk_tblGameRound`) REFERENCES `tblgameround` (`gameRoundID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblownedfood`
--

LOCK TABLES `tblownedfood` WRITE;
/*!40000 ALTER TABLE `tblownedfood` DISABLE KEYS */;
INSERT INTO `tblownedfood` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1);
/*!40000 ALTER TABLE `tblownedfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblparents`
--

DROP TABLE IF EXISTS `tblparents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblparents` (
  `parentID` int(11) NOT NULL AUTO_INCREMENT,
  `father` int(11) NOT NULL,
  `mother` int(11) NOT NULL,
  PRIMARY KEY (`parentID`),
  UNIQUE KEY `tblAnimal_animalID_UNIQUE` (`father`),
  UNIQUE KEY `mother_UNIQUE` (`mother`),
  KEY `fk_table1_tblAnimal_idx` (`father`),
  KEY `fk_tblParents_tblAnimal1_idx` (`mother`),
  CONSTRAINT `fk_table1_tblAnimal` FOREIGN KEY (`father`) REFERENCES `tblanimal` (`animalID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblParents_tblAnimal1` FOREIGN KEY (`mother`) REFERENCES `tblanimal` (`animalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblparents`
--

LOCK TABLES `tblparents` WRITE;
/*!40000 ALTER TABLE `tblparents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblparents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblplayer`
--

DROP TABLE IF EXISTS `tblplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblplayer` (
  `playerID` int(11) NOT NULL AUTO_INCREMENT,
  `studNo` varchar(45) DEFAULT NULL,
  `registrationDate` datetime NOT NULL,
  `password` longtext,
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `studNo_UNIQUE` (`studNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblplayer`
--

LOCK TABLES `tblplayer` WRITE;
/*!40000 ALTER TABLE `tblplayer` DISABLE KEYS */;
INSERT INTO `tblplayer` VALUES (1,'130533','2015-04-21 23:46:53','pwd');
/*!40000 ALTER TABLE `tblplayer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Lucas`@`%`*/ /*!50003 TRIGGER `AiLearningGame`.`TBLPLAYER_AFTER_INSERT` 
AFTER INSERT ON `AiLearningGame`.`tblplayer` 
FOR EACH ROW 
BEGIN 
	-- insert a new gameround for this player
	INSERT INTO `AiLearningGame`.`tblgameround` VALUES (
		null,
		new.`playerID`, -- fk_tblPlayer
		1, -- game round
		0, -- no. in game days
		0 -- score for this game round
	);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tblquest`
--

DROP TABLE IF EXISTS `tblquest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquest` (
  `questID` int(11) NOT NULL AUTO_INCREMENT,
  `missionDescription` longtext NOT NULL,
  `noOfRewards` int(11) NOT NULL,
  PRIMARY KEY (`questID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquest`
--

LOCK TABLES `tblquest` WRITE;
/*!40000 ALTER TABLE `tblquest` DISABLE KEYS */;
INSERT INTO `tblquest` VALUES (1,'QuestText',1);
/*!40000 ALTER TABLE `tblquest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblquestion`
--

DROP TABLE IF EXISTS `tblquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquestion` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquestion`
--

LOCK TABLES `tblquestion` WRITE;
/*!40000 ALTER TABLE `tblquestion` DISABLE KEYS */;
INSERT INTO `tblquestion` VALUES (1,'What is mutation?',10);
/*!40000 ALTER TABLE `tblquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreward`
--

DROP TABLE IF EXISTS `tblreward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreward` (
  `resourceID` int(11) NOT NULL,
  `fk_tblQuest` int(11) NOT NULL,
  `fk_tblRewardType` int(11) NOT NULL,
  KEY `fk_tblReward_tblQuest1_idx` (`fk_tblQuest`),
  KEY `fk_tblReward_tblRewardType1_idx` (`fk_tblRewardType`),
  CONSTRAINT `fk_tblReward_tblQuest1` FOREIGN KEY (`fk_tblQuest`) REFERENCES `tblquest` (`questID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblReward_tblRewardType1` FOREIGN KEY (`fk_tblRewardType`) REFERENCES `tblrewardtype` (`rewardTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreward`
--

LOCK TABLES `tblreward` WRITE;
/*!40000 ALTER TABLE `tblreward` DISABLE KEYS */;
INSERT INTO `tblreward` VALUES (1,1,1);
/*!40000 ALTER TABLE `tblreward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrewardtype`
--

DROP TABLE IF EXISTS `tblrewardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrewardtype` (
  `rewardTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `rewardType` varchar(100) NOT NULL,
  PRIMARY KEY (`rewardTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrewardtype`
--

LOCK TABLES `tblrewardtype` WRITE;
/*!40000 ALTER TABLE `tblrewardtype` DISABLE KEYS */;
INSERT INTO `tblrewardtype` VALUES (1,'Research center'),(2,'Sleeping cabins'),(3,'Water Tower'),(4,'Farm'),(5,'Animal Habitat: Forest'),(6,'Animal Habitat: Lake'),(7,'Animal Habitat: River'),(8,'Animal Habitat: Mountain'),(9,'Animal Habitat: Grass'),(16,'Plant'),(17,'Meat'),(18,'Human food'),(19,'Insect');
/*!40000 ALTER TABLE `tblrewardtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ailearninggame'
--

--
-- Dumping routines for database 'ailearninggame'
--
/*!50003 DROP FUNCTION IF EXISTS `IncomeLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` FUNCTION `IncomeLevel`( monthly_value INT ) RETURNS varchar(20) CHARSET utf8
BEGIN

   DECLARE income_level varchar(20);

   IF monthly_value <= 4000 THEN
      SET income_level = 'Low Income';

   ELSEIF monthly_value > 4000 AND monthly_value <= 7000 THEN
      SET income_level = 'Avg Income';

   ELSE
      SET income_level = 'High Income';

   END IF;

   RETURN income_level;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIntoLogTypeIfEmpty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` PROCEDURE `InsertIntoLogTypeIfEmpty`()
BEGIN
   
   DECLARE rowCount INT;
   
   SET rowCount = (SELECT COUNT(*) FROM `AiLearningGame`.`tbllogtype`);
   
	IF (rowCount = 0) THEN
		INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
			null,
			"New Game Round Started!"
		);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIntoTblLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` PROCEDURE `InsertIntoTblLogType`()
BEGIN

	-- check if tblLogType is empty
	SELECT IsTblLogTypeEmpty();

	-- new game should be first entry....
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"New Game Round Started!"
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Game Over!"
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Game Round Continued."
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Exited Game."
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Disaster Strikes"
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Question Answered"
	);

	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Quest completed"
	);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertNewGameLogEntry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` PROCEDURE `InsertNewGameLogEntry`(IN fk_tblGameRound INT)
BEGIN

	INSERT INTO `ailearninggame`.`tbllog` VALUES (
		null,
		NOW(), -- inserts todays date
		"Player started a new game.", -- description of the event that occurred
		1, -- fk_tblLogType: new game started
		fk_tblGameRound -- foreign key to tblGameRound
	);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertResourcesForNewGameRound` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` PROCEDURE `InsertResourcesForNewGameRound`(IN fk_tblGameRound INT)
BEGIN


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IsTblLogTypeEmpty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lucas`@`%` PROCEDURE `IsTblLogTypeEmpty`()
BEGIN
   -- variable for no. of rows in tbllogtype
   DECLARE rowCount INT;
   -- set value based on rows retrieved
   SELECT COUNT(*) 
   INTO rowCount
   FROM `AiLearningGame`.`tbllogtype`;
   
   -- if there is no data in tbllogtype, insert some data
	IF (rowCount = 0) THEN
		SELECT InsertIntoTblLogType();
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-21 23:49:34
