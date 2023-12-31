﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2023. 03. 30. 18:22:45
-- Server version: 5.5.5-10.4.27-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS settlements;

CREATE DATABASE IF NOT EXISTS settlements
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

--
-- Set default database
--
USE settlements;

--
-- Create table `countys`
--
CREATE TABLE IF NOT EXISTS countys (
  id INT(11) NOT NULL AUTO_INCREMENT,
  countyName VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 20,
AVG_ROW_LENGTH = 862,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `settlements`
--
CREATE TABLE IF NOT EXISTS settlements (
  id INT(11) NOT NULL AUTO_INCREMENT,
  settlement VARCHAR(255) NOT NULL,
  countyId INT(11) NOT NULL,
  zipcode INT(11) NOT NULL,
  population INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 20,
AVG_ROW_LENGTH = 862,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE settlements 
  ADD CONSTRAINT FK_settlements_countys_id FOREIGN KEY (countyId)
    REFERENCES countys(id);

-- 
-- Dumping data for table countys
--
INSERT INTO countys VALUES
(1, 'Pest'),
(2, 'Fejér'),
(3, 'Jász-Nagykun-Szolnok'),
(4, 'Tolna'),
(5, 'Baranya'),
(6, 'Nógrád'),
(7, 'Vas'),
(8, 'Győr-Moson-Sopron'),
(9, 'Szabolcs-Szatmár-Bereg'),
(10, 'Bács-Kiskun'),
(11, 'Zala'),
(12, 'Somogy'),
(13, 'Komárom-Esztergom'),
(14, 'Veszprém'),
(15, 'Hadjú-Bihar'),
(16, 'Heves'),
(17, 'Békés'),
(18, 'Csongrád-Csanád'),
(19, 'Borsod-Abaúj-Zemplén');

-- 
-- Dumping data for table settlements
--
INSERT INTO settlements VALUES
(1, 'Cegléd', 1, 2700, 35334),
(2, 'Cece', 2, 7013, 2630),
(3, 'Szolnok', 3, 5000, 71285),
(4, 'Tolna', 4, 7130, 12184),
(5, 'Pécs', 5, 7600, 158942),
(6, 'Dejtár', 6, 2649, 1332),
(7, 'Eger', 7, 3300, 56696),
(8, 'Edve', 8, 9343, 144),
(9, 'Maglóca', 9, 9169, 104),
(10, 'Bácsalmás', 10, 6430, 6389),
(11, 'Lasztonya', 11, 8887, 86),
(12, 'Lengyeltóti', 12, 8693, 3451),
(13, 'Ács', 13, 2941, 6944),
(14, 'Adorjánháza', 14, 8497, 342),
(15, 'Nádudvar', 15, 4181, 9260),
(16, 'Nagyfüged', 16, 3282, 2751),
(17, 'Doboz', 17, 5624, 4000),
(18, 'Szeged', 18, 6720, 162860),
(19, 'Miskolc', 19, 3500, 175701);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;