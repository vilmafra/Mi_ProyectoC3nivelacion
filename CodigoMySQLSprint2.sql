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
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroInventario` (
  `CodigoProducto` INT NOT NULL,
  `NombreProducto` VARCHAR(45) NOT NULL,
  `PrecioProducto` INT NOT NULL,
  `CantidadInicialProducto` INT NOT NULL,
  `CantidadDisponibleProducto` INT NOT NULL,
  `Proveedor` VARCHAR(45) NOT NULL,
  `AgregarProducto` VARCHAR(45) NULL,
  `EliminarProducto` VARCHAR(45) NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`CodigoProducto`),
  INDEX `fk_RegistroInventario_Administrador_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroInventario_Administrador`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroCompras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroCompras` (
  `NumeroCompra` INT NOT NULL,
  `FechaCompra` DATE NOT NULL,
  `NumeroFactura` INT NOT NULL,
  `NombreProducto` VARCHAR(45) NOT NULL,
  `ProductoAgotado` VARCHAR(45) NOT NULL,
  `Proveedor` VARCHAR(45) NOT NULL,
  `ContactoProveedor` INT NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  `CantidadCompra` INT NULL,
  PRIMARY KEY (`NumeroCompra`),
  INDEX `fk_RegistroCompras_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroCompras_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroVentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroVentas` (
  `CodigoProducto` INT NOT NULL,
  `NombreProducto` VARCHAR(45) NOT NULL,
  `CantidadProductoDisponible` INT NOT NULL,
  `CantidadProductoVendido` INT NOT NULL,
  `NombreCliente` VARCHAR(45) NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`CodigoProducto`),
  INDEX `fk_RegistroVentas_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroVentas_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroProveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroProveedores` (
  `NitProveedor` INT NOT NULL,
  `NombreProveedor` VARCHAR(45) NOT NULL,
  `TelefonoProveedor` INT NOT NULL,
  `DireccionProveedor` VARCHAR(45) NOT NULL,
  `EmailProveedor` VARCHAR(45) NOT NULL,
  `InsumoQueProvee` VARCHAR(45) NOT NULL,
  `RegistrarProducto` VARCHAR(45) NULL,
  `EliminarProducto` VARCHAR(45) NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`NitProveedor`),
  INDEX `fk_RegistroProveedores_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroProveedores_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroClientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroClientes` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `DireccionCliente` VARCHAR(45) NOT NULL,
  `CiudadCliente` VARCHAR(45) NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_RegistroClientes_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroClientes_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
