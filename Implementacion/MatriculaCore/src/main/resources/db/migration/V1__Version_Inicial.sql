-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema matriculadb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema matriculadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `matriculadb` DEFAULT CHARACTER SET utf8 ;
USE `matriculadb` ;

-- -----------------------------------------------------
-- Table `matriculadb`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `matriculadb`.`curso` ;

CREATE TABLE IF NOT EXISTS `matriculadb`.`curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `codigo` VARCHAR(50) NULL,
  `creditos` INT NULL,
  `requisitos` VARCHAR(100) NULL,
  `ciclo` INT NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
