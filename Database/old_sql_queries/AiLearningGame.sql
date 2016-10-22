-- MySQL Script generated by MySQL Workbench
-- 04/01/15 16:42:32
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema AiLearningGame
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AiLearningGame` ;

-- -----------------------------------------------------
-- Schema AiLearningGame
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AiLearningGame` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `AiLearningGame` ;

-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblPlayer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblPlayer` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblPlayer` (
  `playerID` INT NULL AUTO_INCREMENT,
  `studNo` VARCHAR(45) NULL,
  `registrationDate` DATETIME NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`playerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblLogType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblLogType` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblLogType` (
  `logTypeID` INT NULL AUTO_INCREMENT,
  `logType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`logTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblGameRound`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblGameRound` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblGameRound` (
  `gameRoundID` INT NULL AUTO_INCREMENT,
  `fk_tblPlayer` INT NOT NULL,
  `gameRoundNo` INT NOT NULL,
  `noInGameDays` INT NOT NULL,
  `score` INT NULL,
  PRIMARY KEY (`gameRoundID`),
  INDEX `fk_tblGameRound_tblPlayer1_idx` (`fk_tblPlayer` ASC),
  CONSTRAINT `fk_tblGameRound_tblPlayer1`
    FOREIGN KEY (`fk_tblPlayer`)
    REFERENCES `AiLearningGame`.`tblPlayer` (`playerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblLog` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblLog` (
  `logID` INT NULL AUTO_INCREMENT,
  `logDate` DATETIME NOT NULL,
  `logEvent` VARCHAR(45) NOT NULL,
  `fk_tblLogType` INT NOT NULL,
  `fk_tblGameRound` INT NOT NULL,
  PRIMARY KEY (`logID`),
  INDEX `fk_tblLog_tblLogType1_idx` (`fk_tblLogType` ASC),
  INDEX `fk_tblLog_tblGameRound1_idx` (`fk_tblGameRound` ASC),
  CONSTRAINT `fk_tblLog_tblLogType1`
    FOREIGN KEY (`fk_tblLogType`)
    REFERENCES `AiLearningGame`.`tblLogType` (`logTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblLog_tblGameRound1`
    FOREIGN KEY (`fk_tblGameRound`)
    REFERENCES `AiLearningGame`.`tblGameRound` (`gameRoundID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblGender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblGender` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblGender` (
  `genderID` INT NULL AUTO_INCREMENT,
  `gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblQuest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblQuest` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblQuest` (
  `questID` INT NULL AUTO_INCREMENT,
  `missionDescription` LONGTEXT NOT NULL,
  `noOfRewards` INT NOT NULL,
  PRIMARY KEY (`questID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblRewardType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblRewardType` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblRewardType` (
  `rewardTypeID` INT NULL AUTO_INCREMENT,
  `rewardType` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`rewardTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblReward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblReward` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblReward` (
  `resourceID` INT NOT NULL,
  `fk_tblQuest` INT NOT NULL,
  `fk_tblRewardType` INT NOT NULL,
  INDEX `fk_tblReward_tblQuest1_idx` (`fk_tblQuest` ASC),
  INDEX `fk_tblReward_tblRewardType1_idx` (`fk_tblRewardType` ASC),
  CONSTRAINT `fk_tblReward_tblQuest1`
    FOREIGN KEY (`fk_tblQuest`)
    REFERENCES `AiLearningGame`.`tblQuest` (`questID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblReward_tblRewardType1`
    FOREIGN KEY (`fk_tblRewardType`)
    REFERENCES `AiLearningGame`.`tblRewardType` (`rewardTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblParents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblParents` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblParents` (
  `parentID` INT NULL AUTO_INCREMENT,
  `father` INT NOT NULL,
  `mother` INT NOT NULL,
  PRIMARY KEY (`parentID`),
  INDEX `fk_table1_tblAnimal_idx` (`father` ASC),
  UNIQUE INDEX `tblAnimal_animalID_UNIQUE` (`father` ASC),
  INDEX `fk_tblParents_tblAnimal1_idx` (`mother` ASC),
  UNIQUE INDEX `mother_UNIQUE` (`mother` ASC),
  CONSTRAINT `fk_table1_tblAnimal`
    FOREIGN KEY (`father`)
    REFERENCES `AiLearningGame`.`tblAnimal` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblParents_tblAnimal1`
    FOREIGN KEY (`mother`)
    REFERENCES `AiLearningGame`.`tblAnimal` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblAnimalClass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblAnimalClass` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblAnimalClass` (
  `animalClassID` INT NULL AUTO_INCREMENT,
  `animalClass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`animalClassID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblFood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblFood` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblFood` (
  `foodID` INT NULL AUTO_INCREMENT,
  `food` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`foodID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblBuilding`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblBuilding` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblBuilding` (
  `buildingID` INT NULL AUTO_INCREMENT,
  `buildingName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`buildingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblAnimal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblAnimal` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblAnimal` (
  `animalID` INT NULL AUTO_INCREMENT,
  `dna` LONGTEXT NOT NULL,
  `isAlive` TINYINT(1) NOT NULL,
  `mutated` TINYINT(1) NOT NULL,
  `generationNo` INT NOT NULL,
  `age` INT NOT NULL,
  `survability` FLOAT NULL,
  `fk_tblGender` INT NOT NULL,
  `fk_tblParents` INT NULL,
  `fk_tblAnimalClass` INT NULL,
  `fk_tblFood` INT NULL,
  `fk_tblBuilding` INT NOT NULL,
  PRIMARY KEY (`animalID`),
  INDEX `fk_tblAnimal_table11_idx` (`fk_tblParents` ASC),
  INDEX `fk_tblAnimal_tblRace1_idx` (`fk_tblAnimalClass` ASC),
  INDEX `fk_tblAnimal_tblGender1_idx` (`fk_tblGender` ASC),
  INDEX `fk_tblAnimal_tblFood1_idx` (`fk_tblFood` ASC),
  INDEX `fk_tblAnimal_tblBuilding1_idx` (`fk_tblBuilding` ASC),
  CONSTRAINT `fk_tblAnimal_table11`
    FOREIGN KEY (`fk_tblParents`)
    REFERENCES `AiLearningGame`.`tblParents` (`parentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblRace1`
    FOREIGN KEY (`fk_tblAnimalClass`)
    REFERENCES `AiLearningGame`.`tblAnimalClass` (`animalClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblGender1`
    FOREIGN KEY (`fk_tblGender`)
    REFERENCES `AiLearningGame`.`tblGender` (`genderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblFood1`
    FOREIGN KEY (`fk_tblFood`)
    REFERENCES `AiLearningGame`.`tblFood` (`foodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnimal_tblBuilding1`
    FOREIGN KEY (`fk_tblBuilding`)
    REFERENCES `AiLearningGame`.`tblBuilding` (`buildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblDisaster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblDisaster` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblDisaster` (
  `disasterID` INT NULL AUTO_INCREMENT,
  `disasterType` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`disasterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblQuestion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblQuestion` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblQuestion` (
  `questionID` INT NULL AUTO_INCREMENT,
  `question` LONGTEXT NOT NULL,
  `score` INT NULL,
  PRIMARY KEY (`questionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblAnswers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblAnswers` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblAnswers` (
  `answerID` INT NULL AUTO_INCREMENT,
  `answer` VARCHAR(100) NOT NULL,
  `isCorrectAnswer` TINYINT(1) NOT NULL,
  `description` LONGTEXT NULL,
  `fk_tblQuestion` INT NOT NULL,
  PRIMARY KEY (`answerID`),
  INDEX `fk_tblAnswers_tblQuestion1_idx` (`fk_tblQuestion` ASC),
  CONSTRAINT `fk_tblAnswers_tblQuestion1`
    FOREIGN KEY (`fk_tblQuestion`)
    REFERENCES `AiLearningGame`.`tblQuestion` (`questionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblAnsweredQuestions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblAnsweredQuestions` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblAnsweredQuestions` (
  `fk_tblAnswers` INT NOT NULL,
  `fk_tblGameRound` INT NOT NULL,
  INDEX `fk_tblAnsweredQuestions_tblAnswers1_idx` (`fk_tblAnswers` ASC),
  INDEX `fk_tblAnsweredQuestions_tblGameRound1_idx` (`fk_tblGameRound` ASC),
  CONSTRAINT `fk_tblAnsweredQuestions_tblAnswers1`
    FOREIGN KEY (`fk_tblAnswers`)
    REFERENCES `AiLearningGame`.`tblAnswers` (`answerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblAnsweredQuestions_tblGameRound1`
    FOREIGN KEY (`fk_tblGameRound`)
    REFERENCES `AiLearningGame`.`tblGameRound` (`gameRoundID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblOwnedBuildings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblOwnedBuildings` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblOwnedBuildings` (
  `ownedBuildingsID` INT NULL AUTO_INCREMENT,
  `noOfBuildingsOwned` INT NOT NULL,
  `fk_tblBuilding` INT NOT NULL,
  `fk_tblGameRound` INT NOT NULL,
  PRIMARY KEY (`ownedBuildingsID`),
  INDEX `fk_tblOwnedBuildings_tblBuilding1_idx` (`fk_tblBuilding` ASC),
  UNIQUE INDEX `fk_tblBuilding_UNIQUE` (`fk_tblBuilding` ASC),
  INDEX `fk_tblOwnedBuildings_tblGameRound1_idx` (`fk_tblGameRound` ASC),
  CONSTRAINT `fk_tblOwnedBuildings_tblBuilding1`
    FOREIGN KEY (`fk_tblBuilding`)
    REFERENCES `AiLearningGame`.`tblBuilding` (`buildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedBuildings_tblGameRound1`
    FOREIGN KEY (`fk_tblGameRound`)
    REFERENCES `AiLearningGame`.`tblGameRound` (`gameRoundID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblOwnedAnimals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblOwnedAnimals` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblOwnedAnimals` (
  `ownedAnimalsID` INT NULL AUTO_INCREMENT,
  `noOfAnimalsOwned` INT NOT NULL,
  `fk_tblAnimal` INT NOT NULL,
  `fk_tblGameRound` INT NOT NULL,
  PRIMARY KEY (`ownedAnimalsID`),
  INDEX `fk_tblOwnedAnimals_tblAnimal1_idx` (`fk_tblAnimal` ASC),
  UNIQUE INDEX `fk_tblAnimal_UNIQUE` (`fk_tblAnimal` ASC),
  INDEX `fk_tblOwnedAnimals_tblGameRound1_idx` (`fk_tblGameRound` ASC),
  CONSTRAINT `fk_tblOwnedAnimals_tblAnimal1`
    FOREIGN KEY (`fk_tblAnimal`)
    REFERENCES `AiLearningGame`.`tblAnimal` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedAnimals_tblGameRound1`
    FOREIGN KEY (`fk_tblGameRound`)
    REFERENCES `AiLearningGame`.`tblGameRound` (`gameRoundID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AiLearningGame`.`tblOwnedFood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AiLearningGame`.`tblOwnedFood` ;

CREATE TABLE IF NOT EXISTS `AiLearningGame`.`tblOwnedFood` (
  `ownedFoodID` INT NULL AUTO_INCREMENT,
  `noOfFoodOwned` INT NOT NULL,
  `fk_tblFood` INT NOT NULL,
  `fk_tblGameRound` INT NOT NULL,
  PRIMARY KEY (`ownedFoodID`),
  INDEX `fk_tblOwnedFood_tblFood1_idx` (`fk_tblFood` ASC),
  UNIQUE INDEX `fk_tblFood_UNIQUE` (`fk_tblFood` ASC),
  INDEX `fk_tblOwnedFood_tblGameRound1_idx` (`fk_tblGameRound` ASC),
  CONSTRAINT `fk_tblOwnedFood_tblFood1`
    FOREIGN KEY (`fk_tblFood`)
    REFERENCES `AiLearningGame`.`tblFood` (`foodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOwnedFood_tblGameRound1`
    FOREIGN KEY (`fk_tblGameRound`)
    REFERENCES `AiLearningGame`.`tblGameRound` (`gameRoundID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
