CREATE TABLE `dimhour` (
  `ID` int(11) NOT NULL,
  `Hour` varchar(2) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1