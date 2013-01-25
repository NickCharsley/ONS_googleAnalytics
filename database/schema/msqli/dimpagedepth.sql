CREATE TABLE `dimpagedepth` (
  `ID` int(11) NOT NULL,
  `PageDepth` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PageDepth_UNIQUE` (`PageDepth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1