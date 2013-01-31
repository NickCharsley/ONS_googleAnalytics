CREATE TABLE `dimgeo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Continent` varchar(45) NOT NULL,
  `SubContinent` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dimGeo_indx` (`Latitude`,`Longitude`,`City`,`Country`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1