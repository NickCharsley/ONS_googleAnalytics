CREATE TABLE `dimdaysince` (
  `ID` int(11) NOT NULL,
  `Days` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Days_UNIQUE` (`Days`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1