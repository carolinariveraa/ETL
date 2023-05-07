-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema nypd_crime
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`borough`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`borough` (
  `borough` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`borough`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ny_demographics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ny_demographics` (
  `population` INT NULL,
  `borough` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`borough`),
  CONSTRAINT `fk_ny_demographics_borough1`
    FOREIGN KEY (`borough`)
    REFERENCES `mydb`.`borough` (`borough`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ny_housing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ny_housing` (
  `median_asking_rent` FLOAT NULL,
  `median_recorded_sales_price` FLOAT NULL,
  `borough` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`borough`),
  CONSTRAINT `fk_ny_housing_borough1`
    FOREIGN KEY (`borough`)
    REFERENCES `mydb`.`borough` (`borough`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ny_crimes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ny_crimes` (
  `borough` VARCHAR(200) NOT NULL,
  `complaint` VARCHAR(200) NULL,
  `date` VARCHAR(200) NULL,
  `offence_level` VARCHAR(200) NULL,
  `georeference` VARCHAR(300) NULL,
  `year` VARCHAR(100) NULL,
  `month` VARCHAR(50) NULL,
  PRIMARY KEY (`borough`),
  INDEX `fk_ny_crimes_borough1_idx` (`borough` ASC) VISIBLE,
  CONSTRAINT `fk_ny_crimes_borough1`
    FOREIGN KEY (`borough`)
    REFERENCES `mydb`.`borough` (`borough`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
