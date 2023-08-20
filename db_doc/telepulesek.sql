CREATE DATABASE settlements
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

CREATE TABLE settlements.countys (
  id INT(11) NOT NULL AUTO_INCREMENT,
  countyName VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB;

CREATE TABLE settlements.settlements (
  id INT(11) NOT NULL AUTO_INCREMENT,
  settlement VARCHAR(255) NOT NULL,
  countyId INT(11) NOT NULL,
  zipcode INT(11) NOT NULL,
  population INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB;

INSERT INTO countys
  (id, countyName)
  VALUES
  (1, 'Pest'), 
  (2, 'Fej�r'),
  (3, 'J�sz-Nagykun-Szolnok'),
  (4, 'Tolna'), 
  (5, 'Baranya'),
  (6, 'N�gr�d'), 
  (7, 'Vas'),
  (8, 'Gy�r-Moson-Sopron'), 
  (9, 'Szabolcs-Szatm�r-Bereg'),
  (10, 'B�cs-Kiskun'),
  (11, 'Zala'), 
  (12, 'Somogy'),
  (13, 'Kom�rom-Esztergom'), 
  (14, 'Veszpr�m'),
  (15, 'Hadj�-Bihar'), 
  (16, 'Heves'), 
  (17, 'B�k�s'), 
  (18, 'Csongr�d-Csan�d'), 
  (19, 'Borsod-Aba�j-Zempl�n');

INSERT INTO settlements
  (settlement, countyId, zipcode, population)
  VALUES
  ('Cegl�d', 1, 2700, 35334),
  ('Cece', 2, 7013, 2630),
  ('Szolnok', 3, 5000, 71285),
  ('Tolna', 4, 7130, 12184),
  ('P�cs', 5, 7600, 158942),
  ('Dejt�r', 6, 2649, 1332),
  ('Eger', 7, 3300, 56696),
  ('Edve', 8, 9343, 144),
  ('Magl�ca', 9, 9169, 104),
  ('B�csalm�s', 10, 6430, 6389),
  ('Lasztonya', 11, 8887, 86),
  ('Lengyelt�ti', 12, 8693, 3451),
  ('�cs', 13, 2941, 6944),
  ('Adorj�nh�za', 14, 8497, 342),
  ('N�dudvar', 15, 4181, 9260),
  ('Nagyf�ged', 16, 3282, 2751),
  ('Doboz', 17, 5624, 4000),
  ('Szeged', 18, 6720, 162860),
  ('Miskolc', 19, 3500, 175701);


SELECT * FROM countys;
SELECT * FROM settlements;
  
