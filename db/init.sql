-- -----------------------------------------------------
--  Airportbase
-- -----------------------------------------------------

-- -----------------------------------------------------
--  DDL to create database if not exists
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS airportbase;
-- -----------------------------------------------------
--  Connect to create database
-- -----------------------------------------------------

USE airportbase;

-- -----------------------------------------------------
--  DDL to drop tables if exist
-- -----------------------------------------------------

DROP TABLE IF EXISTS `DEPARTMENT`, `GROUNDSTAFF`, `CREW`, `RANK`, `FLIGHT`, `AIRPORT`, `AIRLINE`, `FLIGHTSTAFF`, `PLANE`, `PLANETYPE`, `GATE`, `SALARYGRADE`, `BAGGAGE`, `COUNTRY`, `CITY`, `PASSENGERLIST`, `PERSON`, `STAFF`, `PASSPORT` CASCADE;


-- -----------------------------------------------------
--  DDL for Table DEPARTMENT
-- -----------------------------------------------------

  CREATE TABLE `DEPARTMENT` 
   (	`DEPARTMENTID` NUMERIC, 
	`ACRONYM` VARCHAR(20), 
	`NAME` VARCHAR(255)
   ) ;
-- -----------------------------------------------------
--  DDL for Table GROUNDSTAFF
-- -----------------------------------------------------

  CREATE TABLE `GROUNDSTAFF` 
   (	`PERSONID` NUMERIC, 
	`DEPARTMENTID` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table CREW
-- -----------------------------------------------------

  CREATE TABLE `CREW` 
   (	`FLIGHTID` NUMERIC, 
	`PERSONID` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table RANK
-- -----------------------------------------------------

  CREATE TABLE `RANK` 
   (	`RANKID` NUMERIC, 
	`ACRONYM` VARCHAR(20), 
	`NAME` VARCHAR(255)
   ) ;
-- -----------------------------------------------------
--  DDL for Table FLIGHT
-- -----------------------------------------------------

  CREATE TABLE `FLIGHT` 
   (	`FLIGHTID` NUMERIC, 
	`PLANEID` NUMERIC, 
	`GATEID` NUMERIC, 
	`AIRPORTDEPARTURE` NUMERIC, 
	`AIRPORTDESTINATION` NUMERIC, 
	`DEPARTURETIME` TIMESTAMP (6), 
	`FLIGHTNUMBER` VARCHAR(6), 
	`DURATION` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table AIRPORT
-- -----------------------------------------------------

  CREATE TABLE `AIRPORT` 
   (	`AIRPORTID` NUMERIC, 
	`ACRONYM` VARCHAR(20), 
	`NAME` VARCHAR(255), 
	`GMTDEVIATION` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table AIRLINE
-- -----------------------------------------------------

  CREATE TABLE `AIRLINE` 
   (	`AIRLINEID` NUMERIC, 
	`ACRONYM` VARCHAR(20), 
	`NAME` VARCHAR(255), 
	`ADDRESS` VARCHAR(255)
   ) ;
-- -----------------------------------------------------
--  DDL for Table FLIGHTSTAFF
-- -----------------------------------------------------

  CREATE TABLE `FLIGHTSTAFF` 
   (	`PERSONID` NUMERIC, 
	`RANKID` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table PLANE
-- -----------------------------------------------------

  CREATE TABLE `PLANE` 
   (	`PLANEID` NUMERIC, 
	`AIRLINEID` NUMERIC, 
	`PLANETYPEID` NUMERIC, 
	`FIRSTUSE` DATE, 
	`TOTALFLIGHTHOURS` NUMERIC, 
	`FLIGHTHOURSSINCELASTSERVICE` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table PLANETYPE
-- -----------------------------------------------------

  CREATE TABLE `PLANETYPE` 
   (	`PLANETYPEID` NUMERIC, 
	`NAME` VARCHAR(255), 
	`HOURSPERSERVICE` NUMERIC, 
	`MAXFLIGHTLENGTH` NUMERIC, 
	`MAXLOADING` NUMERIC, 
	`CONSUMPTION` NUMERIC, 
	`NUMBEROFSEATS` NUMERIC
   ) ;
-- -----------------------------------------------------
--  DDL for Table GATE
-- -----------------------------------------------------

  CREATE TABLE `GATE` 
   (	`GATEID` NUMERIC, 
	`AIRPORTID` NUMERIC, 
	`ACRONYM` VARCHAR(20), 
	`TERMINAL` VARCHAR(20)
   ) ;
-- -----------------------------------------------------
--  DDL for Table SALARYGRADE
-- -----------------------------------------------------

  CREATE TABLE `SALARYGRADE` 
   (	`SALARYGRADEID` NUMERIC, 
	`MONTHLYSALARY` NUMERIC(7,2)
   ) ;
-- -----------------------------------------------------
--  DDL for Table BAGGAGE
-- -----------------------------------------------------

  CREATE TABLE `BAGGAGE` 
   (	`BAGGAGEID` NUMERIC, 
	`PERSONID` NUMERIC, 
	`FLIGHTID` NUMERIC, 
	`WEIGHT` NUMERIC(5,1)
   ) ;
-- -----------------------------------------------------
--  DDL for Table COUNTRY
-- -----------------------------------------------------

  CREATE TABLE `COUNTRY` 
   (	`COUNTRYID` NUMERIC, 
	`COUNTRYINDICATOR` VARCHAR(20), 
	`NAME` VARCHAR(255)
   ) ;
-- -----------------------------------------------------
--  DDL for Table CITY
-- -----------------------------------------------------

  CREATE TABLE `CITY` 
   (	`POSTALCODE` NUMERIC, 
	`COUNTRYID` NUMERIC, 
	`NAME` VARCHAR(255)
   ) ;
-- -----------------------------------------------------
--  DDL for Table PASSENGERLIST
-- -----------------------------------------------------

  CREATE TABLE `PASSENGERLIST` 
   (	`FLIGHTID` NUMERIC, 
	`PERSONID` NUMERIC, 
	`SEATNUMBER` VARCHAR(20)
   ) ;
-- -----------------------------------------------------
--  DDL for Table PERSON
-- -----------------------------------------------------

  CREATE TABLE `PERSON` 
   (	`PERSONID` NUMERIC, 
	`GIVENNAME` VARCHAR(255), 
	`FAMILYNAME` VARCHAR(255), 
	`DATEOFBIRTH` DATE
   ) ;
-- -----------------------------------------------------
--  DDL for Table STAFF
-- -----------------------------------------------------

  CREATE TABLE `STAFF` 
   (	`PERSONID` NUMERIC, 
	`POSTALCODE` NUMERIC, 
	`SALARYGRADEID` NUMERIC, 
	`INSURANCENUMBER` CHAR(4), 
	`ADDRESS` VARCHAR(255), 
	`EMPLOYEENUMBER` VARCHAR(20)
   ) ;
-- -----------------------------------------------------
--  DDL for Table PASSPORT
-- -----------------------------------------------------

  CREATE TABLE `PASSPORT` 
   (	`PASSPORTID` NUMERIC, 
	`PERSONID` NUMERIC, 
	`COUNTRYID` NUMERIC, 
	`PASSPORTNUMBER` VARCHAR(20)
   ) ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040324
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040324` ON `DEPARTMENT` (`DEPARTMENTID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040322
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040322` ON `GROUNDSTAFF` (`PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040344
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040344` ON `CREW` (`FLIGHTID`, `PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040360
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040360` ON `RANK` (`RANKID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040338
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040338` ON `FLIGHT` (`FLIGHTID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040346
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040346` ON `AIRPORT` (`AIRPORTID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040326
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040326` ON `AIRLINE` (`AIRLINEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040319
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040319` ON `FLIGHTSTAFF` (`PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040332
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040332` ON `PLANE` (`PLANEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040328
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040328` ON `PLANETYPE` (`PLANETYPEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040363
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040363` ON `GATE` (`GATEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040316
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040316` ON `SALARYGRADE` (`SALARYGRADEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040352
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040352` ON `BAGGAGE` (`BAGGAGEID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040354
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040354` ON `COUNTRY` (`COUNTRYID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040314
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040314` ON `CITY` (`POSTALCODE`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040341
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040341` ON `PASSENGERLIST` (`FLIGHTID`, `PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040307
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040307` ON `PERSON` (`PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040311
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040311` ON `STAFF` (`PERSONID`) 
  ;
-- -----------------------------------------------------
--  DDL for Index SYS_C0040358
-- -----------------------------------------------------

  CREATE UNIQUE INDEX `SYS_C0040358` ON `PASSPORT` (`PASSPORTID`) 
  ;
-- -----------------------------------------------------
--  Constraints for Table DEPARTMENT
-- -----------------------------------------------------

  
 
  ALTER TABLE `DEPARTMENT` ADD PRIMARY KEY (`DEPARTMENTID`) ;
-- -----------------------------------------------------
--  Constraints for Table GROUNDSTAFF
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `GROUNDSTAFF` ADD PRIMARY KEY (`PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table CREW
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `CREW` ADD PRIMARY KEY (`FLIGHTID`, `PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table RANK
-- -----------------------------------------------------

  
 
  ALTER TABLE `RANK` ADD PRIMARY KEY (`RANKID`) ;
-- -----------------------------------------------------
--  Constraints for Table FLIGHT
-- -----------------------------------------------------

  
 
  
 
  
 
  
 
  
 
  ALTER TABLE `FLIGHT` ADD PRIMARY KEY (`FLIGHTID`) ;
-- -----------------------------------------------------
--  Constraints for Table AIRPORT
-- -----------------------------------------------------

  
 
  ALTER TABLE `AIRPORT` ADD PRIMARY KEY (`AIRPORTID`) ;
-- -----------------------------------------------------
--  Constraints for Table AIRLINE
-- -----------------------------------------------------

  
 
  ALTER TABLE `AIRLINE` ADD PRIMARY KEY (`AIRLINEID`) ;
-- -----------------------------------------------------
--  Constraints for Table FLIGHTSTAFF
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `FLIGHTSTAFF` ADD PRIMARY KEY (`PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table PLANE
-- -----------------------------------------------------

  
 
  
 
  
 
  ALTER TABLE `PLANE` ADD PRIMARY KEY (`PLANEID`) ;
-- -----------------------------------------------------
--  Constraints for Table PLANETYPE
-- -----------------------------------------------------

  
 
  ALTER TABLE `PLANETYPE` ADD PRIMARY KEY (`PLANETYPEID`) ;
-- -----------------------------------------------------
--  Constraints for Table GATE
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `GATE` ADD PRIMARY KEY (`GATEID`) ;
-- -----------------------------------------------------
--  Constraints for Table SALARYGRADE
-- -----------------------------------------------------

  
 
  ALTER TABLE `SALARYGRADE` ADD PRIMARY KEY (`SALARYGRADEID`) ;
-- -----------------------------------------------------
--  Constraints for Table BAGGAGE
-- -----------------------------------------------------

  
 
  
 
  
 
  ALTER TABLE `BAGGAGE` ADD PRIMARY KEY (`BAGGAGEID`) ;
-- -----------------------------------------------------
--  Constraints for Table COUNTRY
-- -----------------------------------------------------

  
 
  ALTER TABLE `COUNTRY` ADD PRIMARY KEY (`COUNTRYID`) ;
-- -----------------------------------------------------
--  Constraints for Table CITY
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `CITY` ADD PRIMARY KEY (`POSTALCODE`) ;
-- -----------------------------------------------------
--  Constraints for Table PASSENGERLIST
-- -----------------------------------------------------

  
 
  
 
  ALTER TABLE `PASSENGERLIST` ADD PRIMARY KEY (`FLIGHTID`, `PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table PERSON
-- -----------------------------------------------------

  
 
  ALTER TABLE `PERSON` ADD PRIMARY KEY (`PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table STAFF
-- -----------------------------------------------------

  
 
  
 
  
 
  ALTER TABLE `STAFF` ADD PRIMARY KEY (`PERSONID`) ;
-- -----------------------------------------------------
--  Constraints for Table PASSPORT
-- -----------------------------------------------------

  
 
  
 
  
 
  ALTER TABLE `PASSPORT` ADD PRIMARY KEY (`PASSPORTID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table GROUNDSTAFF
-- -----------------------------------------------------

  ALTER TABLE `GROUNDSTAFF` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `STAFF` (`PERSONID`) ;
 
  ALTER TABLE `GROUNDSTAFF` ADD FOREIGN KEY (`DEPARTMENTID`)
	  REFERENCES `DEPARTMENT` (`DEPARTMENTID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table CREW
-- -----------------------------------------------------

  ALTER TABLE `CREW` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `FLIGHTSTAFF` (`PERSONID`) ;
 
  ALTER TABLE `CREW` ADD FOREIGN KEY (`FLIGHTID`)
	  REFERENCES `FLIGHT` (`FLIGHTID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table FLIGHT
-- -----------------------------------------------------

  ALTER TABLE `FLIGHT` ADD FOREIGN KEY (`PLANEID`)
	  REFERENCES `PLANE` (`PLANEID`) ;
 
  ALTER TABLE `FLIGHT` ADD FOREIGN KEY (`AIRPORTDEPARTURE`)
	  REFERENCES `AIRPORT` (`AIRPORTID`) ;
 
  ALTER TABLE `FLIGHT` ADD FOREIGN KEY (`AIRPORTDESTINATION`)
	  REFERENCES `AIRPORT` (`AIRPORTID`) ;
 
  ALTER TABLE `FLIGHT` ADD FOREIGN KEY (`GATEID`)
	  REFERENCES `GATE` (`GATEID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table FLIGHTSTAFF
-- -----------------------------------------------------

  ALTER TABLE `FLIGHTSTAFF` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `STAFF` (`PERSONID`) ;
 
  ALTER TABLE `FLIGHTSTAFF` ADD FOREIGN KEY (`RANKID`)
	  REFERENCES `RANK` (`RANKID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table PLANE
-- -----------------------------------------------------

  ALTER TABLE `PLANE` ADD FOREIGN KEY (`AIRLINEID`)
	  REFERENCES `AIRLINE` (`AIRLINEID`) ;
 
  ALTER TABLE `PLANE` ADD FOREIGN KEY (`PLANETYPEID`)
	  REFERENCES `PLANETYPE` (`PLANETYPEID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table GATE
-- -----------------------------------------------------

  ALTER TABLE `GATE` ADD FOREIGN KEY (`AIRPORTID`)
	  REFERENCES `AIRPORT` (`AIRPORTID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table BAGGAGE
-- -----------------------------------------------------

  ALTER TABLE `BAGGAGE` ADD FOREIGN KEY (`FLIGHTID`, `PERSONID`)
	  REFERENCES `PASSENGERLIST` (`FLIGHTID`, `PERSONID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table CITY
-- -----------------------------------------------------

  ALTER TABLE `CITY` ADD FOREIGN KEY (`COUNTRYID`)
	  REFERENCES `COUNTRY` (`COUNTRYID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table PASSENGERLIST
-- -----------------------------------------------------

  ALTER TABLE `PASSENGERLIST` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `PERSON` (`PERSONID`) ;
 
  ALTER TABLE `PASSENGERLIST` ADD FOREIGN KEY (`FLIGHTID`)
	  REFERENCES `FLIGHT` (`FLIGHTID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table STAFF
-- -----------------------------------------------------

  ALTER TABLE `STAFF` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `PERSON` (`PERSONID`) ;
 
  ALTER TABLE `STAFF` ADD FOREIGN KEY (`POSTALCODE`)
	  REFERENCES `CITY` (`POSTALCODE`) ;
 
  ALTER TABLE `STAFF` ADD FOREIGN KEY (`SALARYGRADEID`)
	  REFERENCES `SALARYGRADE` (`SALARYGRADEID`) ;
-- -----------------------------------------------------
--  Ref Constraints for Table PASSPORT
-- -----------------------------------------------------

  ALTER TABLE `PASSPORT` ADD FOREIGN KEY (`PERSONID`)
	  REFERENCES `PERSON` (`PERSONID`) ;
 
  ALTER TABLE `PASSPORT` ADD FOREIGN KEY (`COUNTRYID`)
	  REFERENCES `COUNTRY` (`COUNTRYID`) ;








-- -----------------------------------------------------
--  INSERTs for AIRPORTBASE
-- -----------------------------------------------------

Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (1,'Harald','Wahl',str_to_date('01.01.1970','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (33,'Alexander','Neubauer',str_to_date('01.01.2000','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (64,'Jack','Millhouse',str_to_date('01.03.1950','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (65,'Hans','Klauber',str_to_date('01.03.1951','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (66,'Fritz','Neckam',str_to_date('01.03.1952','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (67,'Georg','Hagmann',str_to_date('01.03.1953','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (68,'Andrea','Brandstetter',str_to_date('01.03.1954','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (69,'Phil','Niedermayr',str_to_date('01.03.1955','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (70,'Martin','Hartlauer',str_to_date('01.03.1956','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (71,'Martina','Saturn',str_to_date('01.03.1957','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (72,'Michael','Newer',str_to_date('01.03.1958','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (73,'Sebastian','Donever',str_to_date('01.03.1959','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (74,'Rene','Bäcker',str_to_date('01.03.1960','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (75,'Eric','Mode',str_to_date('01.03.1961','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (76,'Nadine','Balz',str_to_date('01.03.1962','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (77,'Basti','Muster',str_to_date('01.03.1963','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (78,'Carina','Quer',str_to_date('01.03.1964','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (79,'Verena','Sack',str_to_date('01.03.1965','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (80,'Klaus','Nachbar',str_to_date('01.03.1966','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (81,'Lukas','Mill',str_to_date('01.03.1967','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (82,'Thomas','House',str_to_date('01.03.1968','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (83,'Markus','Grey',str_to_date('01.03.1969','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (84,'Theodor','Simpsons',str_to_date('01.03.1970','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (85,'Hannes','Mil',str_to_date('01.03.1971','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (86,'Johannes','Tief',str_to_date('01.03.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (87,'Matthias','Wall',str_to_date('01.03.1973','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (88,'Roman','Street',str_to_date('01.03.1974','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (89,'Christoph','Mob',str_to_date('01.03.1975','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (90,'Stefan','Austria',str_to_date('01.03.1976','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (91,'Max','Lustenau',str_to_date('01.03.1977','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (92,'Miriam','Rapid',str_to_date('01.03.1978','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (93,'Katrin','Innsbruck',str_to_date('01.03.1979','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (94,'Rene','Riedinger',str_to_date('05.12.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (95,'Abel','Achatz',str_to_date('05.10.1968','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (96,'Adalbero','Ackerl',str_to_date('07.09.1975','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (97,'Abraham','Aichelberger',str_to_date('12.08.1960','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (98,'Adam','Altmann',str_to_date('29.12.1955','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (99,'Adamo','Ammer',str_to_date('31.01.1955','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (100,'Adolfo','Angerhofer',str_to_date('27.03.1944','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (101,'Adrian','Anzengruber',str_to_date('15.04.1930','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (102,'Adriano','Aschauer',str_to_date('17.12.1933','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (103,'Adrianus','Aschl',str_to_date('19.07.1990','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (104,'Adrianos','Augeneder',str_to_date('05.05.1995','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (105,'Alain','Auinger',str_to_date('11.09.1962','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (106,'Alajos','Aumayr',str_to_date('22.10.1944','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (107,'Alan','Jäger',str_to_date('06.06.1979','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (108,'Kai','Jaut',str_to_date('07.09.1980','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (109,'Swen','Janus',str_to_date('02.08.1999','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (110,'Rafael','Leuven',str_to_date('04.02.1970','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (111,'Raffaele','van Lusignon',str_to_date('05.03.1971','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (112,'Raffaelo','van Marc',str_to_date('06.09.1967','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (113,'Raffaello','van Picquigny',str_to_date('22.10.1969','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (114,'Raimund','van Saint-Omer',str_to_date('21.02.2000','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (115,'Rainer','Wallis',str_to_date('24.03.2002','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (116,'Ebony','Gruber',str_to_date('10.06.1998','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (117,'Edda','Waldner',str_to_date('11.05.1999','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (118,'Edwina','Mueller',str_to_date('21.11.1984','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (119,'Eika','Sommer',str_to_date('01.01.1975','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (120,'Eila','Bauer',str_to_date('12.12.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (121,'Eileen','Hallstroem',str_to_date('01.11.1941','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (122,'Karoline','Zack',str_to_date('15.06.1992','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (123,'Kassandra','Gehmeier',str_to_date('09.08.1993','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (124,'Katalin','Scheumbauer',str_to_date('12.02.1995','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (125,'Micky','Maus',str_to_date('01.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (126,'Minni','Maus',str_to_date('02.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (127,'Pluto','Hund',str_to_date('03.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (128,'Donald','Duck',str_to_date('04.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (129,'Dagobert','Duck',str_to_date('05.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (130,'Tick','Duck',str_to_date('06.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (131,'Trick','Duck',str_to_date('07.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (132,'Track','Duck',str_to_date('08.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (133,'Goofy','Muster',str_to_date('09.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (134,'Daniel','Düsentrieb',str_to_date('10.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (135,'Krachbumm','Ente',str_to_date('11.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (136,'Max','Mustermann',str_to_date('12.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (137,'Karlo','Kater',str_to_date('13.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (138,'KJ','Kater',str_to_date('14.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (139,'Gustav','Duck',str_to_date('15.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (140,'Martin','Luttkus',str_to_date('16.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (141,'Max','Luttkus',str_to_date('17.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (142,'Rene','Luttkus',str_to_date('18.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (143,'Philipp','Luttkus',str_to_date('19.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (144,'Jakob','Luttkus',str_to_date('20.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (145,'Stefan','Luttkus',str_to_date('21.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (146,'Michael','Luttkus',str_to_date('22.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (147,'Jana','Luttkus',str_to_date('23.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (148,'Sigrun','Luttkus',str_to_date('24.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (149,'Ana','Luttkus',str_to_date('25.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (150,'Nikolaus','Luttkus',str_to_date('26.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (151,'Christoph','Luttkus',str_to_date('27.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (152,'Dominik','Luttkus',str_to_date('28.02.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (153,'Andreas','Luttkus',str_to_date('01.03.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (154,'Elisabeth','Luttkus',str_to_date('02.03.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (2,'Christian','Kaufmann',str_to_date('02.02.1971','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (5,'Herbert','Maier',str_to_date('02.03.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (4,'Christa','Mayer',str_to_date('25.03.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (3,'Alexander','Mense',str_to_date('14.12.1969','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (6,'Chistine','Bauer',str_to_date('03.12.1981','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (7,'Christoph','Hoffmann',str_to_date('03.07.1979','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (8,'Markus','Seifert',str_to_date('13.05.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (9,'Daniela','Klaus',str_to_date('12.04.1977','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (10,'Birgit','Schmidt',str_to_date('23.12.1978','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (11,'Jutta','Kneidinger',str_to_date('01.07.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (12,'Helmut','Kofler',str_to_date('15.07.1979','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (13,'Herwig','Mann',str_to_date('09.12.1981','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (14,'Friedrich','Meier',str_to_date('06.07.1965','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (15,'Emilia','Bauer',str_to_date('22.05.1977','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (16,'Doris','Schmied',str_to_date('14.03.1982','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (17,'Doris','Schleier',str_to_date('14.02.1967','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (18,'Daniel','Hammer',str_to_date('03.05.1982','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (19,'Sabine','Kroll',str_to_date('11.01.1974','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (20,'Margit','Schlager',str_to_date('05.02.1976','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (21,'Gabriela','Burgstaller',str_to_date('03.05.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (22,'Gabriele','Hofer',str_to_date('14.07.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (23,'Karin','Sohn',str_to_date('03.09.1965','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (24,'Klaus','Böhm',str_to_date('04.04.1981','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (25,'Jürgen','Hofer',str_to_date('23.02.1977','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (26,'Hermann','Grün',str_to_date('16.08.1973','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (27,'Elisabeth','Vatter',str_to_date('15.03.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (28,'Siglinde','Berg',str_to_date('15.02.1974','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (29,'Siegfired','Berger',str_to_date('04.01.1973','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (30,'Franz','Herr',str_to_date('21.12.1973','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (31,'Johann','Schuster',str_to_date('05.06.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (32,'Birgit','Gabriel',str_to_date('05.04.1972','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (174,'Rene','Kernegger',str_to_date('18.10.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (175,'Franz','Kernegger',str_to_date('18.10.1965','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (176,'Andrea','Kernegger',str_to_date('13.03.1969','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (177,'Kevin','Kernegger',str_to_date('14.09.1990','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (178,'Marco','Kernegger',str_to_date('26.07.1996','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (179,'Karin','Popp',str_to_date('25.05.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (180,'Sabine','Popp',str_to_date('22.06.1990','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (181,'Christian','Popp',str_to_date('05.09.2000','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (182,'Ludwig','Popp',str_to_date('10.09.1959','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (183,'Christine','Popp',str_to_date('13.06.1959','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (184,'Pascal','Stoegerer',str_to_date('18.02.1989','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (185,'Stefanie','Stoegerer',str_to_date('16.03.1988','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (186,'Markus','Zenz',str_to_date('06.01.1989','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (187,'Alexander','Schwarz',str_to_date('29.07.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (188,'Herbert','Brunner',str_to_date('05.11.1986','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (189,'Alexander','Osou',str_to_date('11.03.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (190,'Bernd','Steinberger',str_to_date('11.01.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (191,'Nina','Student',str_to_date('05.08.1985','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (192,'Maria','Zweng',str_to_date('08.09.1929','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (193,'Karl','Zweng',str_to_date('02.03.1922','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (194,'Anton','Kernegger',str_to_date('02.05.1941','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (195,'Erna','Kernegger',str_to_date('03.03.1949','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (196,'Marlene','Lupert',str_to_date('12.02.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (197,'Gamperl','Matthias',str_to_date('19.06.1987','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (198,'Andreas','Ebner',str_to_date('31.03.1988','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (200,'Moritz','Kaufmann',str_to_date('11.09.2002','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (300,'Jürgen','Hofbauer',str_to_date('10.11.1994','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (301,'Philipp','Pernerstorfer',str_to_date('02.11.1995','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (302,'Alex','Mai',str_to_date('10.04.1995','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (303,'Barney','Stinson',str_to_date('10.12.1986','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (304,'Locke','Jamson',str_to_date('12.08.1984','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (305,'Gray','Fullbuster',str_to_date('06.11.1992','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (306,'Ezio','Auditore',str_to_date('15.07.1989','%d.%m.%Y'));
Insert into PERSON (PERSONID,GIVENNAME,FAMILYNAME,DATEOFBIRTH) values (307,'Natsu','Dragneel',str_to_date('04.01.1994','%d.%m.%Y'));




Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('43','AUT','Österreich');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('41','CH','Schweiz');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('371','LV','Lettland');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('370','LT','Litauen');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('49','GER','Deutschland');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('34','ESP','Spanien');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('244','AND','Andorra');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('45','DEN','Dänemark');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('33','FRA','Frankreich');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('679','FJI','Fidschi');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('4175','LIE','Lichtenstein');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('352','LUX','Luxemburg');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('44','GBR','Großbritannien');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('36','HUN','Ungarn');
Insert into COUNTRY (COUNTRYID,COUNTRYINDICATOR,NAME) values ('81','JPN','Japan');




Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1010','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1020','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1030','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1040','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1050','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1060','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1070','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1080','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1090','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1100','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1110','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1120','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1130','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1140','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1150','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1160','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1170','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1180','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1190','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1200','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1210','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1220','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1230','43','Wien');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2020','43','Hollabrunn');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2000','43','Stockerau');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('82100','49','München');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10115','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2100','43','Korneuburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2003','43','Leitzersdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2011','43','Sierndorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2102','43','Bisamberg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2104','43','Spillern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2130','43','Mistelbach');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2136','43','Laa');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2230','43','Gänserndorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2413','43','Berg bei Wolfsthal');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3970','43','Weitra');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3950','43','Gmünd');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2423','43','Deutsch Jahrndorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2460','43','Bruck an der Leitha');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2462','43','Wilfleinsdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2474','43','Gattendorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2491','43','Neufeld an der Leitha');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('7301','43','Deutschkreutz');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('7304','43','Großwarasdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10179','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10189','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10199','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10122','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10225','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10235','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10295','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('10286','49','Berlin');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3000','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3001','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3002','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3024','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3020','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3010','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3003','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3019','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3004','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3013','41','Bern');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1134','370','Vilnius');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3922','43','Gr.Schoenau');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4321','45','Paris');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1067','49','Dresden');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1239','36','Budapest');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1299','41','Genf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('28001','34','Madrid');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('1778','45','Kopenhagen');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('8001','34','Barcelona');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2880','43','Kirchberg am Wechsel');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2722','43','Winzendorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2632','43','Wimpassing');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4813','43','Altmünster');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4810','43','Gmunden');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4812','43','Pinsdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4814','43','Neukirchen');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('4840','43','Vöcklabruck');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('44135','49','Dortmund');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('6430','43','Ötztal Bahnhof');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('6200','33','Nizza');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('38428','34','Rosas');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2410','43','Hainburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2201','43','Gerasdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2404','43','Petronell');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('5020','43','Salzburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('5023','43','Salzburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('5026','43','Salzburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2023','43','Nappersdorf');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('3730','43','Eggenburg');
Insert into CITY (POSTALCODE,COUNTRYID,NAME) values ('2051','43','Zellerndorf');




Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('10','1423.75');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('11','1523.87');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('12','1623.23');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('13','1792.1');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('14','1899.51');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('15','1973.92');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('16','2000');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('17','2200');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('18','2460.05');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('19','2721.21');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('20','2945.88');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('21','3023.91');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('22','3345.11');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('23','3721.71');
Insert into SALARYGRADE (SALARYGRADEID,MONTHLYSALARY) values ('24','3912.97');




Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('100','1','43','2019283658');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('102','2','43','2019253650');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('107','13','43','2019223650');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('108','15','43','2015223652');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('114','10','43','2015223650');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('117','17','43','2012223650');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1120','64','49','2019299999');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1121','65','49','2019299998');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1122','66','49','2019299997');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1123','67','49','2019299996');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1124','68','49','2019299995');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1125','69','49','2019299994');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1126','70','49','2019299993');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1127','71','49','2019299992');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1128','72','49','2019299991');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1129','73','49','2019299990');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1130','74','49','2019299989');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1131','75','49','2019299988');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1132','76','49','2019299987');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1133','77','49','2019299986');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1134','78','49','2019299985');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1135','79','43','2019299984');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1136','80','43','2019299983');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1137','81','43','2019299982');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1138','82','43','2019299981');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1139','83','43','2019299980');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1140','84','43','2019299979');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1141','85','43','2019299978');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1142','86','43','2019299977');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1143','87','43','2019299976');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1144','88','43','2019299975');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1145','89','43','2019299974');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1146','90','43','2019299973');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1147','91','43','2019299972');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1148','92','43','2019299971');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1149','93','43','2019299970');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1150','94','43','2019283659');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1151','95','43','2019283665');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1152','96','43','2019283666');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1153','97','43','2019283667');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1154','98','43','2019283668');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1155','99','43','2019283669');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1156','100','43','2019283670');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1157','101','43','2019283671');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1158','102','43','2019283672');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1159','103','43','2019283673');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1160','104','49','2019283674');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1161','105','49','2019283675');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1162','106','49','2019283676');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1163','107','49','2019283677');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1164','108','49','2019283678');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1165','109','49','2019283679');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1166','110','49','2019283680');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1167','111','49','2019283681');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1168','112','49','2019283682');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1169','113','49','2019283683');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1170','114','49','2019283684');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1171','115','41','2019283685');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1172','116','41','2019283686');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1173','117','41','2019283687');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1174','118','41','2019283688');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1175','119','41','2019283689');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1176','120','41','2019283690');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1177','121','41','2019283691');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1178','122','41','2019283692');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1179','123','41','2019283693');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1180','124','41','2019283694');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1181','125','371','8415842561');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1182','126','371','8415842562');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1183','127','371','8415842563');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1184','128','371','8415842564');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1185','129','371','8415842565');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1186','130','371','8415842566');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1187','131','371','8415842567');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1188','132','371','8415842568');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1189','133','371','8415842569');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1190','134','371','8415842570');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1191','135','371','8415842571');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1192','136','371','8415842572');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1193','137','371','8415842573');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1194','138','371','8415842574');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1195','139','371','8415842575');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1196','140','370','8415842576');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1197','141','370','8415842577');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1198','142','370','8415842578');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1199','143','370','8415842579');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1200','144','370','8415842580');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1201','145','370','8415842581');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1202','146','370','8415842582');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1203','147','370','8415842583');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1204','148','370','8415842584');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1205','149','370','8415842585');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1206','150','370','8415842586');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1207','151','370','8415842587');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1208','152','370','8415842588');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1209','153','370','8415842589');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1210','154','370','8415842590');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1218','174','43','9000000001');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1219','175','43','9000000002');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1220','176','43','9000000003');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1221','177','43','9000000004');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1222','178','43','9000000005');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1223','179','43','9000000006');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1224','180','43','9000000007');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1225','181','43','9000000008');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1226','182','43','9000000009');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1227','183','43','9000000010');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1228','184','43','9000000011');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1229','185','43','9000000012');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1230','186','43','9000000013');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1231','187','43','9000000014');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1232','188','43','9000000015');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1233','189','43','9000000016');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1234','190','43','9000000017');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1235','191','43','9000000018');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1236','192','43','9000000019');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1237','193','43','9000000020');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1238','194','43','9000000021');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1239','195','43','9000000022');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1240','196','36','9000000023');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1241','197','43','9000000024');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('1242','198','36','9000000025');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('2000','5','43','3019293393');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('106','6','49','2019253650');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('2001','5','33','458745221554');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('6582','12','4175','54841544');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('6142','19','33','45781588');
Insert into PASSPORT (PASSPORTID,PERSONID,COUNTRYID,PASSPORTNUMBER) values ('165','200','43','451111245');




Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('14','1030','12','3456','Landstraßer Hauptstraße 28','231');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('4','1020','18','4875','Taborstr 22, Stg 2','54');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('1','1210','21','1425','Jedlersdorfer Str 98','23');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('2','1130','23','9052','Costenobleg 2 Stg 7 ','44');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('3','1100','24','4875','Stöhrg 9','10');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('13','1020','10','758 ','Darwing 21 ','100');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('24','1200','13','1758','Kunzg 6-8, Stg 1','60');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('27','1010','19','2345','Am Graben 5','2024');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('93','2100','16','1001','Adresse 1','1001');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('92','2000','16','1002','Adresse 2','1002');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('91','2003','16','1003','Adresse 3','1003');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('90','2020','16','1004','Adresse 4','1004');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('89','2011','16','1005','Adresse 5','1005');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('88','2102','16','1006','Adresse 6','1006');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('87','2104','16','1007','Adresse 7','1007');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('86','2130','16','1008','Adresse 8','1008');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('85','2136','16','1009','Adresse 9','1009');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('84','2230','16','1010','Adresse 10','1010');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('123','2413','17','9912','Hauptstr 13','652435');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('115','10225','19','6274','Duerrwienstr 38','546334126');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('116','2460','17','4599','Weidlingau 230','546334127');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('117','7301','16','4598','Oberpullendorf 2','546334128');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('121','3000','15','2412','Matrestr 44','546334131');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('124','3004','16','1197','Switzerland 69','546334132');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('114','3013','23','1457','Bern 99','546334133');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('150','1134','23','2445','Pracherg 4','65128');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('151','1134','24','2446','Pracherg 4','65129');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('152','1134','15','2447','Lenaustr 15','65130');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('153','1134','15','2448','Badg 5','65131');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('154','1134','15','2449','Spitalg 4','65132');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('174','2880','13','2680','Baumthal 34','9001');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('179','2722','18','3334','Römerweg 300','9002');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('184','2880','17','4540','Tratten 19','9003');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('186','2632','15','5982','Hauptstrasse 85','9004');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('303','1220','24','1111','Langenloiserstraße 7','5783491286');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('305','1230','22','3333','Palmaygasse 5','5823061192');
Insert into STAFF (PERSONID,POSTALCODE,SALARYGRADEID,INSURANCENUMBER,ADDRESS,EMPLOYEENUMBER) values ('307','1220','18','5555','Ufergasse 16','10494');




Insert into `RANK` (RANKID,ACRONYM,NAME) values ('100','Cp','Chefpilot');
Insert into `RANK` (RANKID,ACRONYM,NAME) values ('110','Co','Co-Pilot');
Insert into `RANK` (RANKID,ACRONYM,NAME) values ('105','Pl','Pilot');
Insert into `RANK` (RANKID,ACRONYM,NAME) values ('210','Bp','Bordpersonal');
Insert into `RANK` (RANKID,ACRONYM,NAME) values ('501','Tr','Trainee');




Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('2','110');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('3','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('27','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('4','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('93','100');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('92','110');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('91','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('90','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('89','501');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('88','100');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('87','110');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('86','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('85','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('84','501');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('121','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('115','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('116','501');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('124','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('117','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('114','100');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('123','110');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('150','100');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('151','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('152','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('153','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('154','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('174','100');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('179','110');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('184','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('186','210');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('303','105');
Insert into FLIGHTSTAFF (PERSONID,RANKID) values ('307','210');




Insert into DEPARTMENT (DEPARTMENTID,ACRONYM,NAME) values ('101','Dir','Flughafendirektion');
Insert into DEPARTMENT (DEPARTMENTID,ACRONYM,NAME) values ('121','To','Tower');
Insert into DEPARTMENT (DEPARTMENTID,ACRONYM,NAME) values ('141','Si','Flughafensicherheit');
Insert into DEPARTMENT (DEPARTMENTID,ACRONYM,NAME) values ('161','Gp','Gepäckdienst');




Insert into GROUNDSTAFF (PERSONID,DEPARTMENTID) values ('1','101');
Insert into GROUNDSTAFF (PERSONID,DEPARTMENTID) values ('13','121');
Insert into GROUNDSTAFF (PERSONID,DEPARTMENTID) values ('14','161');
Insert into GROUNDSTAFF (PERSONID,DEPARTMENTID) values ('24','161');




Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('10','AUA','Austrian Airlines','Office Park 2, P.O. Box 100');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('15','LH','Lufthansa','Mariahilfer Str 123');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('400','EK','Emirates','Dubai');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('119','HG','FlyNiki','Office Park 1, Top B03');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('120','LA','Lauda Air','Landstrasse Haupstrasse 45-90');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('121','AAW','Austrian Arrow','Kärntnerstrasse 33-38');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('122','AF','Air France','45, rue de Paris, 95 747 Roissy CDG Cedex');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('136','SKY','Sky Europe','Ivanská cesta 26, P.O.Box 24, 820 01 Bratislava 21, Slovakia');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('145','AC','Air Canada','7373 Cote Vertu West, St. Laurent, Quebec');
Insert into AIRLINE (AIRLINEID,ACRONYM,NAME,ADDRESS) values ('300','AB','Air Berlin','Berlin');




Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('50','Boeing 747-300','650','12400','68700','14400','450');
Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('154','A320-200','670','5700','77000','27000','150');
Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('161','Airbus A 319','500','13000','70000','16500','129');
Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('162','Fokker 100','820','10500','55200','12300','122');
Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('155','Sud Aviation Caravelle 6','700','2650','25000','9000','10');
Insert into PLANETYPE (PLANETYPEID,NAME,HOURSPERSERVICE,MAXFLIGHTLENGTH,MAXLOADING,CONSUMPTION,NUMBEROFSEATS) values ('171','Boeing 737-700','500','6100','69400','2420','150');




Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('12','10','50',str_to_date('15.02.1999','%d.%m.%Y'),'17520','17300');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('18','15','50',str_to_date('24.07.2001','%d.%m.%Y'),'15427','15420');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('156','119','154',str_to_date('30.06.1998','%d.%m.%Y'),'18223','17800');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('157','119','154',str_to_date('15.03.1999','%d.%m.%Y'),'13289','13280');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('168','120','161',str_to_date('29.03.2003','%d.%m.%Y'),'13211','13000');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('169','121','162',str_to_date('01.05.2004','%d.%m.%Y'),'9999','9159');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('170','122','155',str_to_date('21.10.1966','%d.%m.%Y'),'12000','12000');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('171','122','155',str_to_date('22.10.1966','%d.%m.%Y'),'11800','11000');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('191','136','171',str_to_date('03.07.2005','%d.%m.%Y'),'18000','17250');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('192','136','171',str_to_date('02.05.2004','%d.%m.%Y'),'23500','23000');
Insert into PLANE (PLANEID,AIRLINEID,PLANETYPEID,FIRSTUSE,TOTALFLIGHTHOURS,FLIGHTHOURSSINCELASTSERVICE) values ('193','136','162',str_to_date('07.05.2004','%d.%m.%Y'),'20012','20000');




Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('1','VIE','Wien-Schwechat','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('10','JFK','JFK Airport New York','-5');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('115','MAD','Madrid Borajas','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('116','AMS','Amsterdam Flughafen Schipol','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('117','ORY','Paris Orly','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('118','HER','Heraklion','2');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('119','HAM','Hamburg Airport','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('120','PMI','Palma de Mallorca','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('121','BCN','Barcelona','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('122','FCO','Rom Fivmicino','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('123','TXL','Berlin Texel','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('125','SYD','Sydney','10');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('126','MEL','Melbourne','10');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('127','BIO','Bilbao','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('128','CDG','Paris Charles de Gaulle','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('132','ATH','Athen','1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('134','BTS','Bratislava','0');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('135','DUB','Dublin','-1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('136','PRG','Prag','0');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('137','MAN','Manchester','-1');
Insert into AIRPORT (AIRPORTID,ACRONYM,NAME,GMTDEVIATION) values ('323','ARN','Stockholm-Arlanda','-1');




Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('1','1','Gate 10','Terminal 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('14','10','Gate 22','Terminal B2');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('119','115','Gate 1','Terminal Madrid 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('120','116','Gate 1','Terminal Amsterdam 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('121','117','Gate 1','Terminal Paris 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('122','118','Gate 1','Terminal Athen 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('123','119','Gate 1','Terminal Hamburg 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('124','120','Gate 1','Terminal Mallorca 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('125','121','Gate 1','Terminal Barcelona 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('126','122','Gate 1','Terminal Rom 1');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('127','127','Gate 1','Terminal A Barcelona');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('128','128','Gate A','Terminal 1 Paris');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('136','132','Gate 1','Terminal A Athen');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('141','116','Gate 1','Terminal 1 Amsterdam');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('142','134','Gate 1','Terminal1 Bratislava');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('143','135','Gate 1','Terminal 1 Dublin');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('144','137','Gate 1','Terminal1 Manchester');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('145','136','Gate 1','Terminal 1 Prag');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('155','127','Gate 2','Terminal A Barcelona');
Insert into GATE (GATEID,AIRPORTID,ACRONYM,TERMINAL) values ('705','323','Gate 5','Stockholm Arlanda');




Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('1','12','1','1','10','OS1467','8',str_to_date('21.10.2007 18:35:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('16','156','119','115','120','AB4741','1',str_to_date('28.10.2007 17:30:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('17','156','120','121','116','AB9264','4',str_to_date('28.12.2015 11:10:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('18','157','121','117','122','HG8515','4',str_to_date('29.10.2007 08:45:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('19','157','122','118','119','AB8041','4',str_to_date('30.10.2007 14:30:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('20','168','1','123','125','OS9423','20',str_to_date('09.12.2007 20:00:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('23','169','123','119','126','OS7511','23',str_to_date('10.12.2015 07:00:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('24','170','127','127','128','AF3012','2',str_to_date('21.11.2007 19:49:39','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('25','170','128','128','127','AF3013','2',str_to_date('21.11.2007 19:49:41','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('26','170','155','127','128','AF2566','2',str_to_date('21.11.2007 20:49:43','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('27','170','128','116','127','AF2567','2',str_to_date('21.11.2007 19:49:46','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('40','12','1','1','10','OS1468','8',str_to_date('08.12.2015 16:51:53','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('33','191','136','132','116','NE3312','1',str_to_date('31.10.2020 07:15:55','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('37','192','127','116','1','NE3123','3',str_to_date('28.12.2015 18:30:00','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('38','192','145','136','137','NE3343','1',str_to_date('30.10.2020 07:08:20','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('39','191','142','134','135','NE3323','2',str_to_date('31.10.2020 07:09:50','%d.%m.%Y %H:%i:%s'));
Insert into FLIGHT (FLIGHTID,PLANEID,GATEID,AIRPORTDEPARTURE,AIRPORTDESTINATION,FLIGHTNUMBER,DURATION,DEPARTURETIME) values ('45','192','705','1','323','OS3133','2',str_to_date('08.11.2015 00:00:00','%d.%m.%Y %H:%i:%s'));




Insert into CREW (FLIGHTID,PERSONID) values ('1','2');
Insert into CREW (FLIGHTID,PERSONID) values ('1','3');
Insert into CREW (FLIGHTID,PERSONID) values ('1','4');
Insert into CREW (FLIGHTID,PERSONID) values ('16','89');
Insert into CREW (FLIGHTID,PERSONID) values ('16','90');
Insert into CREW (FLIGHTID,PERSONID) values ('16','91');
Insert into CREW (FLIGHTID,PERSONID) values ('16','92');
Insert into CREW (FLIGHTID,PERSONID) values ('16','93');
Insert into CREW (FLIGHTID,PERSONID) values ('17','84');
Insert into CREW (FLIGHTID,PERSONID) values ('17','85');
Insert into CREW (FLIGHTID,PERSONID) values ('17','86');
Insert into CREW (FLIGHTID,PERSONID) values ('17','87');
Insert into CREW (FLIGHTID,PERSONID) values ('17','88');
Insert into CREW (FLIGHTID,PERSONID) values ('18','89');
Insert into CREW (FLIGHTID,PERSONID) values ('18','90');
Insert into CREW (FLIGHTID,PERSONID) values ('18','92');
Insert into CREW (FLIGHTID,PERSONID) values ('19','84');
Insert into CREW (FLIGHTID,PERSONID) values ('19','85');
Insert into CREW (FLIGHTID,PERSONID) values ('19','86');
Insert into CREW (FLIGHTID,PERSONID) values ('19','92');
Insert into CREW (FLIGHTID,PERSONID) values ('19','114');
Insert into CREW (FLIGHTID,PERSONID) values ('20','114');
Insert into CREW (FLIGHTID,PERSONID) values ('20','117');
Insert into CREW (FLIGHTID,PERSONID) values ('20','123');
Insert into CREW (FLIGHTID,PERSONID) values ('20','124');
Insert into CREW (FLIGHTID,PERSONID) values ('23','115');
Insert into CREW (FLIGHTID,PERSONID) values ('23','116');
Insert into CREW (FLIGHTID,PERSONID) values ('23','117');
Insert into CREW (FLIGHTID,PERSONID) values ('23','121');
Insert into CREW (FLIGHTID,PERSONID) values ('24','150');
Insert into CREW (FLIGHTID,PERSONID) values ('24','151');
Insert into CREW (FLIGHTID,PERSONID) values ('24','152');
Insert into CREW (FLIGHTID,PERSONID) values ('24','153');
Insert into CREW (FLIGHTID,PERSONID) values ('24','154');
Insert into CREW (FLIGHTID,PERSONID) values ('25','150');
Insert into CREW (FLIGHTID,PERSONID) values ('25','151');
Insert into CREW (FLIGHTID,PERSONID) values ('25','152');
Insert into CREW (FLIGHTID,PERSONID) values ('25','153');
Insert into CREW (FLIGHTID,PERSONID) values ('25','154');
Insert into CREW (FLIGHTID,PERSONID) values ('26','150');
Insert into CREW (FLIGHTID,PERSONID) values ('26','151');
Insert into CREW (FLIGHTID,PERSONID) values ('26','152');
Insert into CREW (FLIGHTID,PERSONID) values ('26','153');
Insert into CREW (FLIGHTID,PERSONID) values ('26','154');
Insert into CREW (FLIGHTID,PERSONID) values ('27','150');
Insert into CREW (FLIGHTID,PERSONID) values ('27','151');
Insert into CREW (FLIGHTID,PERSONID) values ('27','152');
Insert into CREW (FLIGHTID,PERSONID) values ('27','153');
Insert into CREW (FLIGHTID,PERSONID) values ('27','154');
Insert into CREW (FLIGHTID,PERSONID) values ('33','174');
Insert into CREW (FLIGHTID,PERSONID) values ('33','179');
Insert into CREW (FLIGHTID,PERSONID) values ('33','184');
Insert into CREW (FLIGHTID,PERSONID) values ('33','186');
Insert into CREW (FLIGHTID,PERSONID) values ('38','174');
Insert into CREW (FLIGHTID,PERSONID) values ('38','179');
Insert into CREW (FLIGHTID,PERSONID) values ('38','184');
Insert into CREW (FLIGHTID,PERSONID) values ('38','186');




Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('1','5','12A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('1','6','14C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('1','12','1B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('1','19','10B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('16','64','1');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('16','65','2');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('16','66','3');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('16','67','4');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('16','68','5');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('17','69','6');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('17','66','7');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('17','71','8');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('17','72','9');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('17','73','10');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('23','103','212C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('23','102','217B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('23','101','5A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('23','100','12D');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('23','99','307');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('20','98','77C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('20','96','111A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('20','95','209B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('20','94','301C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('20','108','11D');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','125','22');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','125','22');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','125','22');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','125','22');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','126','23');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','126','23');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','126','23');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','126','23');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','127','24');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','127','24');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','127','24');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','127','24');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','128','25');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','128','25');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','128','25');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','67','25');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','129','26');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','129','26');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','129','26');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','129','26');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','130','27');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','130','27');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','130','27');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','130','27');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','131','28');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','131','28');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','131','28');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','131','28');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','132','29');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','132','29');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','132','29');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','65','29');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','133','30');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','133','30');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','133','30');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','133','30');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','136','31');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('25','136','31');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('26','136','31');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','136','31');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','6','12');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','12','13');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('24','102','18');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('33','175','1A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('33','176','1B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('33','177','1C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('33','178','2A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('33','196','5B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('38','182','1A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('38','183','1B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('38','181','1C');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('38','180','2A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('38','191','5B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('27','200','1');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('45','300','6A');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('45','301','6B');
Insert into PASSENGERLIST (FLIGHTID,PERSONID,SEATNUMBER) values ('45','302','6C');




Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('1','5','1','13');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('2','5','1','5');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('3','6','1','15');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('4','6','1','10');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('5','12','1','22');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('6','12','1','28');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('7','19','1','19.5');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('8','6','24','17');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('9','6','24','23');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('10','6','24','7');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('11','12','24','15');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('12','102','24','14');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('13','102','24','8');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('14','300','45','10');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('15','300','45','9');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('16','301','45','20');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('17','301','45','5');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('18','302','45','14');
Insert into BAGGAGE (BAGGAGEID,PERSONID,FLIGHTID,WEIGHT) values ('19','302','45','12');

COMMIT;

-- CREATE VIEW FlightDetails
CREATE VIEW FlightDetails AS
SELECT 
    FLIGHT.FLIGHTNUMBER, 
    dep.NAME AS AIRPORTDEPARTURE, 
    dest.NAME AS AIRPORTDESTINATION, 
    g.TERMINAL, 
    g.ACRONYM AS GATE,
    DATE_FORMAT(FLIGHT.DEPARTURETIME, '%Y-%m-%dT%TZ') AS DEPARTURETIME 
FROM FLIGHT
LEFT JOIN AIRPORT dep ON dep.AIRPORTID = FLIGHT.AIRPORTDEPARTURE
LEFT JOIN AIRPORT dest ON dest.AIRPORTID = FLIGHT.AIRPORTDESTINATION
LEFT JOIN GATE g ON g.GATEID = FLIGHT.GATEID;