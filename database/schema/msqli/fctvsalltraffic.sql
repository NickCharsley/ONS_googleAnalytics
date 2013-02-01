CREATE TABLE `fctvsalltraffic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimAllTraffic` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `NewVisits` int(11) NOT NULL DEFAULT '0',
  `Bounces` int(11) NOT NULL DEFAULT '0',
  `TimeOnPage` int(11) NOT NULL DEFAULT '0',
  `TimeOnSite` int(11) NOT NULL DEFAULT '0',
  `Goal1Completions` int(11) NOT NULL DEFAULT '0',
  `Goal2Completions` int(11) NOT NULL DEFAULT '0',
  `Goal3Completions` int(11) NOT NULL DEFAULT '0',
  `Goal4Completions` int(11) NOT NULL DEFAULT '0',
  `Goal6Completions` int(11) NOT NULL DEFAULT '0',
  `Goal7Completions` int(11) NOT NULL DEFAULT '0',
  `Goal8Completions` int(11) NOT NULL DEFAULT '0',
  `Goal9Completions` int(11) NOT NULL DEFAULT '0',
  `Goal10Completions` int(11) NOT NULL DEFAULT '0',
  `Goal11Completions` int(11) NOT NULL DEFAULT '0',
  `Goal12Completions` int(11) NOT NULL DEFAULT '0',
  `Goal13Completions` int(11) NOT NULL DEFAULT '0',
  `Goal14Completions` int(11) NOT NULL DEFAULT '0',
  `Goal15Completions` int(11) NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsAllTraffic_dimVanquisSession` (`dimVanquisSession`),
  KEY `fk_fctvsAllTraffic_dimDate` (`dimDate`),
  KEY `fk_fctvsAllTraffic_dimProfile` (`dimProfile`),
  KEY `fk_fctvsAllTraffic_dimAllTraffic` (`dimAllTraffic`),
  CONSTRAINT `fk_fctvsAllTraffic_dimAllTraffic` FOREIGN KEY (`dimAllTraffic`) REFERENCES `dimalltraffic` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsAllTraffic_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsAllTraffic_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsAllTraffic_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1