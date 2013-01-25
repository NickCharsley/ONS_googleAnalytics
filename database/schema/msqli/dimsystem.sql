CREATE TABLE `dimsystem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FlashVersion` varchar(45) NOT NULL,
  `JavaEnabled` varchar(45) NOT NULL,
  `Language` varchar(45) NOT NULL,
  `ScreenColors` varchar(45) NOT NULL,
  `ScreenResolution` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_dimSystem` (`FlashVersion`,`JavaEnabled`,`Language`,`ScreenColors`,`ScreenResolution`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1