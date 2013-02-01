CREATE TABLE `dimevent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventCategory` varchar(70) NOT NULL,
  `EventAction` varchar(70) NOT NULL,
  `EventLabel` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dimEvent_indx` (`EventCategory`,`EventAction`,`EventLabel`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1