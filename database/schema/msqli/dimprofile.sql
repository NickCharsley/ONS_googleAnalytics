CREATE TABLE `dimprofile` (
  `ID` int(11) NOT NULL,
  `ProfileName` varchar(45) NOT NULL DEFAULT 'Unknown',
  `WebPropertyID` varchar(45) NOT NULL,
  `Currency` varchar(45) NOT NULL,
  `WebsiteURL` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1