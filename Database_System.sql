-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mangata_Gallo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mangata_Gallo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mangata_Gallo` DEFAULT CHARACTER SET utf8 ;
USE `Mangata_Gallo` ;

-- -----------------------------------------------------
-- Table `Mangata_Gallo`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_Gallo`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` INT NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_Gallo`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_Gallo`.`Products` (
  `ProductID` INT NOT NULL,
  `Category` VARCHAR(255) NOT NULL,
  `SubCategory` VARCHAR(255) NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_Gallo`.`Ships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_Gallo`.`Ships` (
  `ShipID` INT NOT NULL,
  `ShipDate` DATETIME NOT NULL,
  `ShipMode` VARCHAR(255) NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`ShipID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_Gallo`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_Gallo`.`Address` (
  `AddressID` INT NOT NULL,
  `City` VARCHAR(255) NOT NULL,
  `State` VARCHAR(255) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_Gallo`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_Gallo`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `TotalCost` INT NOT NULL,
  `ProductPrice` DECIMAL(8,2) NOT NULL,
  `Discount` DECIMAL(3,0) NOT NULL,
  `ShippingCost` DECIMAL(8,2) NOT NULL,
  `OrderPriority` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ShipID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `ProductID_fk_idx` (`ProductID` ASC) VISIBLE,
  INDEX `ShipID_fk_idx` (`ShipID` ASC) VISIBLE,
  INDEX `AddressID_fk_idx` (`AddressID` ASC) VISIBLE,
  INDEX `CustomerID_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `ProductID_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Mangata_Gallo`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ShipID_fk`
    FOREIGN KEY (`ShipID`)
    REFERENCES `Mangata_Gallo`.`Ships` (`ShipID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `AddressID_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `Mangata_Gallo`.`Address` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Mangata_Gallo`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
