CREATE TABLE `fctvstraffic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimTraffic` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `NewVisits` int(11) NOT NULL DEFAULT '0',
  `Bounces` int(11) NOT NULL DEFAULT '0',
  `TimeOnPage` int(11) NOT NULL DEFAULT '0',
  `OrganicSearches` int(11) NOT NULL DEFAULT '0',
  `Pageviews` int(11) NOT NULL DEFAULT '0',
  `UniquePageviews` int(11) NOT NULL DEFAULT '0',
  `TimeOnSite` int(11) NOT NULL DEFAULT '0',
  `Goal1Completions` int(11) NOT NULL DEFAULT '0',
  `Goal1Starts` int(11) NOT NULL DEFAULT '0',
  `Goal2Completions` int(11) NOT NULL DEFAULT '0',
  `Goal2Starts` int(11) NOT NULL DEFAULT '0',
  `Goal3Completions` int(11) NOT NULL DEFAULT '0',
  `Goal3Starts` int(11) NOT NULL DEFAULT '0',
  `Goal4Completions` int(11) NOT NULL DEFAULT '0',
  `Goal4Starts` int(11) NOT NULL DEFAULT '0',
  `Goal6Completions` int(11) NOT NULL DEFAULT '0',
  `Goal6Starts` int(11) NOT NULL DEFAULT '0',
  `Goal7Completions` int(11) NOT NULL DEFAULT '0',
  `Goal7Starts` int(11) NOT NULL DEFAULT '0',
  `Goal8Completions` int(11) NOT NULL DEFAULT '0',
  `Goal8Starts` int(11) NOT NULL DEFAULT '0',
  `Goal9Completions` int(11) NOT NULL DEFAULT '0',
  `Goal9Starts` int(11) NOT NULL DEFAULT '0',
  `Goal10Completions` int(11) NOT NULL DEFAULT '0',
  `Goal10Starts` int(11) NOT NULL DEFAULT '0',
  `Goal11Completions` int(11) NOT NULL DEFAULT '0',
  `Goal11Starts` int(11) NOT NULL DEFAULT '0',
  `Goal12Completions` int(11) NOT NULL DEFAULT '0',
  `Goal12Starts` int(11) NOT NULL DEFAULT '0',
  `Goal13Completions` int(11) NOT NULL DEFAULT '0',
  `Goal13Starts` int(11) NOT NULL DEFAULT '0',
  `Goal14Completions` int(11) NOT NULL DEFAULT '0',
  `Goal14Starts` int(11) NOT NULL DEFAULT '0',
  `Goal15Completions` int(11) NOT NULL DEFAULT '0',
  `Goal15Starts` int(11) NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `GoalStartsAll` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsTraffic_dimVanquisSession` (`dimVanquisSession`),
  KEY `fk_fctvsTraffic_dimDate` (`dimDate`),
  KEY `fk_fctvsTraffic_dimProfile` (`dimProfile`),
  KEY `fk_fctvsTraffic_dimTraffic` (`dimTraffic`),
  CONSTRAINT `fk_fctvsTraffic_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsTraffic_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsTraffic_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsTraffic_dimTraffic` FOREIGN KEY (`dimTraffic`) REFERENCES `dimtraffic` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1