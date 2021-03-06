CREATE TABLE `fctloanhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimProfile` int(11) NOT NULL,
  `dimDate` int(11) NOT NULL,
  `dimHostName` int(11) NOT NULL,
  `dimNetwork` int(11) NOT NULL,
  `dimVisitor` int(11) NOT NULL,
  `dimSession` int(11) NOT NULL,
  `dimGeo` int(11) NOT NULL,
  `dimSystem` int(11) NOT NULL,
  `dimPlatform` int(11) NOT NULL,
  `dimLandingPagePath` int(11) NOT NULL,
  `dimMobile` int(11) NOT NULL,
  `Visitors` int(11) NOT NULL DEFAULT '0',
  `NewVisits` int(11) NOT NULL DEFAULT '0',
  `Bounces` int(11) NOT NULL DEFAULT '0',
  `OrganicSearches` int(11) NOT NULL DEFAULT '0',
  `Entrances` int(11) NOT NULL DEFAULT '0',
  `Pageviews` int(11) NOT NULL DEFAULT '0',
  `UniquePageviews` int(11) NOT NULL DEFAULT '0',
  `TimeOnPage` float NOT NULL DEFAULT '0',
  `Exits` int(11) NOT NULL DEFAULT '0',
  `TimeOnSite` int(11) NOT NULL DEFAULT '0',
  `Visits` int(11) NOT NULL DEFAULT '0',
  `GoalStartsAll` int(11) NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `GoalAbandonsAll` int(11) NOT NULL DEFAULT '0',
  `GoalValueAll` float NOT NULL DEFAULT '0',
  `Goal1Starts` int(11) NOT NULL DEFAULT '0',
  `Goal1Completions` int(11) NOT NULL DEFAULT '0',
  `Goal1Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal1Value` float NOT NULL DEFAULT '0',
  `Goal2Starts` int(11) NOT NULL DEFAULT '0',
  `Goal2Completions` int(11) NOT NULL DEFAULT '0',
  `Goal2Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal2Value` float NOT NULL DEFAULT '0',
  `Goal3Starts` int(11) NOT NULL DEFAULT '0',
  `Goal3Completions` int(11) NOT NULL DEFAULT '0',
  `Goal3Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal3Value` float NOT NULL DEFAULT '0',
  `Goal4Starts` int(11) NOT NULL DEFAULT '0',
  `Goal4Completions` int(11) NOT NULL DEFAULT '0',
  `Goal4Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal4Value` float NOT NULL DEFAULT '0',
  `Goal5Starts` int(11) NOT NULL DEFAULT '0',
  `Goal5Completions` int(11) NOT NULL DEFAULT '0',
  `Goal5Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal5Value` float NOT NULL DEFAULT '0',
  `Goal6Starts` int(11) NOT NULL DEFAULT '0',
  `Goal6Completions` int(11) NOT NULL DEFAULT '0',
  `Goal6Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal6Value` float NOT NULL DEFAULT '0',
  `Goal7Starts` int(11) NOT NULL DEFAULT '0',
  `Goal7Completions` int(11) NOT NULL DEFAULT '0',
  `Goal7Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal7Value` float NOT NULL DEFAULT '0',
  `Goal8Starts` int(11) NOT NULL DEFAULT '0',
  `Goal8Completions` int(11) NOT NULL DEFAULT '0',
  `Goal8Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal8Value` float NOT NULL DEFAULT '0',
  `Goal9Starts` int(11) NOT NULL DEFAULT '0',
  `Goal9Completions` int(11) NOT NULL DEFAULT '0',
  `Goal9Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal9Value` float NOT NULL DEFAULT '0',
  `Goal10Starts` int(11) NOT NULL DEFAULT '0',
  `Goal10Completions` int(11) NOT NULL DEFAULT '0',
  `Goal10Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal10Value` float NOT NULL DEFAULT '0',
  `Goal11Starts` int(11) NOT NULL DEFAULT '0',
  `Goal11Completions` int(11) NOT NULL DEFAULT '0',
  `Goal11Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal11Value` float NOT NULL DEFAULT '0',
  `Goal12Starts` int(11) NOT NULL DEFAULT '0',
  `Goal12Completions` int(11) NOT NULL DEFAULT '0',
  `Goal12Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal12Value` float NOT NULL DEFAULT '0',
  `Goal13Starts` int(11) NOT NULL DEFAULT '0',
  `Goal13Completions` int(11) NOT NULL DEFAULT '0',
  `Goal13Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal13Value` float NOT NULL DEFAULT '0',
  `Goal14Starts` int(11) NOT NULL DEFAULT '0',
  `Goal14Completions` int(11) NOT NULL DEFAULT '0',
  `Goal14Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal14Value` float NOT NULL DEFAULT '0',
  `Goal15Starts` int(11) NOT NULL DEFAULT '0',
  `Goal15Completions` int(11) NOT NULL DEFAULT '0',
  `Goal15Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal15Value` float NOT NULL DEFAULT '0',
  `Goal16Starts` int(11) NOT NULL DEFAULT '0',
  `Goal16Completions` int(11) NOT NULL DEFAULT '0',
  `Goal16Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal16Value` float NOT NULL DEFAULT '0',
  `Goal17Starts` int(11) NOT NULL DEFAULT '0',
  `Goal17Completions` int(11) NOT NULL DEFAULT '0',
  `Goal17Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal17Value` float NOT NULL DEFAULT '0',
  `Goal18Starts` int(11) NOT NULL DEFAULT '0',
  `Goal18Completions` int(11) NOT NULL DEFAULT '0',
  `Goal18Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal18Value` float NOT NULL DEFAULT '0',
  `Goal19Starts` int(11) NOT NULL DEFAULT '0',
  `Goal19Completions` int(11) NOT NULL DEFAULT '0',
  `Goal19Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal19Value` float NOT NULL DEFAULT '0',
  `Goal20Starts` int(11) NOT NULL DEFAULT '0',
  `Goal20Completions` int(11) NOT NULL DEFAULT '0',
  `Goal20Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal20Value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fkt_idx` (`dimDate`),
  KEY `fctloanhistory_dimProfile_idx` (`dimProfile`),
  KEY `fk_fctloanhistory_dimLandingPagePath_idx` (`dimLandingPagePath`),
  KEY `fk_fctloanhistory_dimVisitors_idx` (`dimVisitor`),
  KEY `fk_fctloanhistory_dimSession_idx` (`dimSession`),
  KEY `fk_fctloanhistory_dimNetwork_idx` (`dimNetwork`),
  KEY `fk_fctloanhistory_dimHostname_idx` (`dimHostName`),
  KEY `fk_fctloanhistory_dimSystem_idx` (`dimSystem`),
  KEY `fk_fctloanhistory_dimPlatform_idx` (`dimPlatform`),
  KEY `fk_fctloanhistory_dimGeo_idx` (`dimGeo`),
  KEY `fk_fctloanhistory_dimMobile_idx` (`dimMobile`),
  CONSTRAINT `fk_fctloanhistory_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimGeo` FOREIGN KEY (`dimGeo`) REFERENCES `dimgeo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimHostname` FOREIGN KEY (`dimHostName`) REFERENCES `dimhostname` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimLandingPage` FOREIGN KEY (`dimLandingPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimMobile` FOREIGN KEY (`dimMobile`) REFERENCES `dimmobile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimNetwork` FOREIGN KEY (`dimNetwork`) REFERENCES `dimnetwork` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimPlatform` FOREIGN KEY (`dimPlatform`) REFERENCES `dimplatform` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimSession` FOREIGN KEY (`dimSession`) REFERENCES `dimsession` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimSystem` FOREIGN KEY (`dimSystem`) REFERENCES `dimsystem` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctloanhistory_dimVisitor` FOREIGN KEY (`dimVisitor`) REFERENCES `dimvisitor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=latin1