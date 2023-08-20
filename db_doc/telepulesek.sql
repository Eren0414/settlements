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
  (2, 'Fejér'),
  (3, 'Jász-Nagykun-Szolnok'),
  (4, 'Tolna'), 
  (5, 'Baranya'),
  (6, 'Nógrád'), 
  (7, 'Vas'),
  (8, 'Gyõr-Moson-Sopron'), 
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

INSERT INTO settlements
  (settlement, countyId, zipcode, population)
  VALUES
  ('Cegléd', 1, 2700, 35334),
  ('Cece', 2, 7013, 2630),
  ('Szolnok', 3, 5000, 71285),
  ('Tolna', 4, 7130, 12184),
  ('Pécs', 5, 7600, 158942),
  ('Dejtár', 6, 2649, 1332),
  ('Eger', 7, 3300, 56696),
  ('Edve', 8, 9343, 144),
  ('Maglóca', 9, 9169, 104),
  ('Bácsalmás', 10, 6430, 6389),
  ('Lasztonya', 11, 8887, 86),
  ('Lengyeltóti', 12, 8693, 3451),
  ('Ács', 13, 2941, 6944),
  ('Adorjánháza', 14, 8497, 342),
  ('Nádudvar', 15, 4181, 9260),
  ('Nagyfüged', 16, 3282, 2751),
  ('Doboz', 17, 5624, 4000),
  ('Szeged', 18, 6720, 162860),
  ('Miskolc', 19, 3500, 175701);


SELECT * FROM countys;
SELECT * FROM settlements;
  
