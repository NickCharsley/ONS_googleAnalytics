CREATE TABLE `dimhostname` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hostname` varchar(512) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_dimHostName` (`Hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1