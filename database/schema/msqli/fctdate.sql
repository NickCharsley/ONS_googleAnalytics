CREATE TABLE `fctdate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `Visitors` int(11) NOT NULL DEFAULT '0',
  `NewVisits` int(11) NOT NULL DEFAULT '0',
  `Bounces` int(11) NOT NULL DEFAULT '0',
  `TimeOnSite` float NOT NULL DEFAULT '0',
  `OrganicSearches` int(11) NOT NULL DEFAULT '0',
  `GoalStartsAll` int(11) NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `GoalAbandonsAll` int(11) NOT NULL DEFAULT '0',
  `GoalValueAll` float NOT NULL DEFAULT '0',
  `Entrances` int(11) NOT NULL DEFAULT '0',
  `Pageviews` int(11) NOT NULL DEFAULT '0',
  `UniquePageviews` int(11) NOT NULL DEFAULT '0',
  `TimeOnPage` float NOT NULL DEFAULT '0',
  `Exits` int(11) NOT NULL DEFAULT '0',
  `Impressions` int(11) NOT NULL DEFAULT '0',
  `AdClicks` int(11) NOT NULL DEFAULT '0',
  `AdCost` float NOT NULL DEFAULT '0',
  `Goal1Completions` int(11) NOT NULL DEFAULT '0',
  `Goal2Completions` int(11) NOT NULL DEFAULT '0',
  `Goal3Completions` int(11) NOT NULL DEFAULT '0',
  `Goal4Completions` int(11) NOT NULL DEFAULT '0',
  `Goal5Completions` int(11) NOT NULL DEFAULT '0',
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
  `Goal16Completions` int(11) NOT NULL DEFAULT '0',
  `Goal17Completions` int(11) NOT NULL DEFAULT '0',
  `Goal18Completions` int(11) NOT NULL DEFAULT '0',
  `Goal19Completions` int(11) NOT NULL DEFAULT '0',
  `Goal20Completions` int(11) NOT NULL DEFAULT '0',
  `Goal1Starts` int(11) NOT NULL DEFAULT '0',
  `Goal2Starts` int(11) NOT NULL DEFAULT '0',
  `Goal3Starts` int(11) NOT NULL DEFAULT '0',
  `Goal4Starts` int(11) NOT NULL DEFAULT '0',
  `Goal5Starts` int(11) NOT NULL DEFAULT '0',
  `Goal6Starts` int(11) NOT NULL DEFAULT '0',
  `Goal7Starts` int(11) NOT NULL DEFAULT '0',
  `Goal8Starts` int(11) NOT NULL DEFAULT '0',
  `Goal9Starts` int(11) NOT NULL DEFAULT '0',
  `Goal10Starts` int(11) NOT NULL DEFAULT '0',
  `Goal11Starts` int(11) NOT NULL DEFAULT '0',
  `Goal12Starts` int(11) NOT NULL DEFAULT '0',
  `Goal13Starts` int(11) NOT NULL DEFAULT '0',
  `Goal14Starts` int(11) NOT NULL DEFAULT '0',
  `Goal15Starts` int(11) NOT NULL DEFAULT '0',
  `Goal16Starts` int(11) NOT NULL DEFAULT '0',
  `Goal17Starts` int(11) NOT NULL DEFAULT '0',
  `Goal18Starts` int(11) NOT NULL DEFAULT '0',
  `Goal19Starts` int(11) NOT NULL DEFAULT '0',
  `Goal20Starts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_dimDate` (`dimDate`,`dimProfile`),
  KEY `fk_fctDate_dimDate_idx` (`dimDate`),
  KEY `fk_fctDate_dimProfile_idx` (`dimProfile`),
  CONSTRAINT `fk_fctDate_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctDate_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5599 DEFAULT CHARSET=latin1