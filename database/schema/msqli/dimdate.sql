CREATE TABLE `dimdate` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  `Month` char(2) DEFAULT NULL,
  `Week` char(2) DEFAULT NULL,
  `Day` char(2) DEFAULT NULL,
  `DayOfWeek` char(2) DEFAULT NULL,
  `MonthName` varchar(15) DEFAULT NULL,
  `DayOfWeekName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Date_UNIQUE` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1