CREATE TABLE `dimcustomvar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomVarName` varchar(70) NOT NULL,
  `CustomVarValue` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dimCustomVar_indx` (`CustomVarName`,`CustomVarValue`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1