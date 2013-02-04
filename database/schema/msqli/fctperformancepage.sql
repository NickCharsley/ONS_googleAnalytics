CREATE TABLE `fctperformancepage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimTraffic` int(11) NOT NULL,
  `dimPagePath` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fctPerformancePage_dimDate` (`dimDate`),
  KEY `fk_fctPerformancePage_dimProfile` (`dimProfile`),
  KEY `fk_fctPerformancePage_dimTraffic` (`dimTraffic`),
  KEY `fk_fctPerformancePage_dimPagePath` (`dimPagePath`),
  CONSTRAINT `fk_fctPerformancePage_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformancePage_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformancePage_dimTraffic` FOREIGN KEY (`dimTraffic`) REFERENCES `dimtraffic` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformancePage_dimPagePath` FOREIGN KEY (`dimPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3755 DEFAULT CHARSET=latin1