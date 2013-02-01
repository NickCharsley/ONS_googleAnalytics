CREATE TABLE `dimnetwork` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NetworkDomain` varchar(45) NOT NULL,
  `NetworkLocation` varchar(512) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_dimNetwork` (`NetworkDomain`,`NetworkLocation`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=latin1