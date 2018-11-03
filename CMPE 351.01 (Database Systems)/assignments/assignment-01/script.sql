-- MySQL Script generated by MySQL Workbench
-- Sun Oct 28 18:05:21 2018
-- Model: New Model    Version: 1.0
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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLOYEE` (
  `Ssn` INT NOT NULL AUTO_INCREMENT,
  `Fname` VARCHAR(15) NOT NULL,
  `Minit` CHAR NULL,
  `Lname` VARCHAR(15) NOT NULL,
  `Bdate` DATE NULL,
  `Address` VARCHAR(30) NULL,
  `Sex` CHAR NULL,
  `Salary` DECIMAL(10,2) NULL,
  `Super_ssn` INT NULL,
  PRIMARY KEY (`Ssn`),
  UNIQUE INDEX `Ssn_UNIQUE` (`Ssn` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_EMPLOYEE1_idx` (`Super_ssn` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_EMPLOYEE1`
    FOREIGN KEY (`Super_ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTMENT` (
  `Dnumber` INT NOT NULL AUTO_INCREMENT,
  `Dname` VARCHAR(45) NOT NULL,
  `Mgr_start_date` DATE NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE INDEX `Dnumber_UNIQUE` (`Dnumber` ASC) VISIBLE,
  UNIQUE INDEX `Dname_UNIQUE` (`Dname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPT_LOCATIONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPT_LOCATIONS` (
  `Dnumber` INT NOT NULL AUTO_INCREMENT,
  `Dlocation` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Dnumber`, `Dlocation`),
  UNIQUE INDEX `Dnumber_UNIQUE` (`Dnumber` ASC) VISIBLE,
  UNIQUE INDEX `Dlocation_UNIQUE` (`Dlocation` ASC) VISIBLE,
  CONSTRAINT `fk_DEPT_LOCATIONS_DEPARTMENT`
    FOREIGN KEY (`Dnumber`)
    REFERENCES `mydb`.`DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROJECT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROJECT` (
  `Pnumber` INT NOT NULL AUTO_INCREMENT,
  `Pname` VARCHAR(15) NOT NULL,
  `Plocation` VARCHAR(15) NULL,
  `Dnum` INT NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE INDEX `Pnumber_UNIQUE` (`Pnumber` ASC) VISIBLE,
  UNIQUE INDEX `Pname_UNIQUE` (`Pname` ASC) VISIBLE,
  INDEX `fk_PROJECT_DEPARTMENT1_idx` (`Dnum` ASC) VISIBLE,
  CONSTRAINT `fk_PROJECT_DEPARTMENT1`
    FOREIGN KEY (`Dnum`)
    REFERENCES `mydb`.`DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPENDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPENDENT` (
  `Dependent_name` VARCHAR(15) NOT NULL,
  `Sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Relationship` VARCHAR(8) NULL,
  `EMPLOYEE_Ssn` INT NOT NULL,
  PRIMARY KEY (`Dependent_name`, `EMPLOYEE_Ssn`),
  UNIQUE INDEX `Dependent_name_UNIQUE` (`Dependent_name` ASC) VISIBLE,
  INDEX `fk_DEPENDENT_EMPLOYEE1_idx` (`EMPLOYEE_Ssn` ASC) VISIBLE,
  CONSTRAINT `fk_DEPENDENT_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_Ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPENDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPENDENT` (
  `Dependent_name` VARCHAR(15) NOT NULL,
  `Sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Relationship` VARCHAR(8) NULL,
  `EMPLOYEE_Ssn` INT NOT NULL,
  PRIMARY KEY (`Dependent_name`, `EMPLOYEE_Ssn`),
  UNIQUE INDEX `Dependent_name_UNIQUE` (`Dependent_name` ASC) VISIBLE,
  INDEX `fk_DEPENDENT_EMPLOYEE1_idx` (`EMPLOYEE_Ssn` ASC) VISIBLE,
  CONSTRAINT `fk_DEPENDENT_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_Ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_HAS_E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_HAS_E` (
  `EMPLOYEE_Ssn` INT NOT NULL,
  `DEPARTMENT_Dnumber` INT NOT NULL,
  INDEX `fk_EMPLOYEE_has_DEPARTMENT_DEPARTMENT1_idx` (`DEPARTMENT_Dnumber` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_has_DEPARTMENT_EMPLOYEE1_idx` (`EMPLOYEE_Ssn` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_has_DEPARTMENT_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_Ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_DEPARTMENT_DEPARTMENT1`
    FOREIGN KEY (`DEPARTMENT_Dnumber`)
    REFERENCES `mydb`.`DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WORKS_ON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WORKS_ON` (
  `Essn` INT NOT NULL,
  `Pno` INT NOT NULL,
  `Hours` DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (`Essn`, `Pno`),
  INDEX `fk_EMPLOYEE_has_PROJECT_PROJECT2_idx` (`Pno` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_has_PROJECT_EMPLOYEE2_idx` (`Essn` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_has_PROJECT_EMPLOYEE2`
    FOREIGN KEY (`Essn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_PROJECT_PROJECT2`
    FOREIGN KEY (`Pno`)
    REFERENCES `mydb`.`PROJECT` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
