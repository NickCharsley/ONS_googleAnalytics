CREATE TABLE `fctvspagetracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimHostname` int(11) NOT NULL,
  `dimVisitor` int(11) NOT NULL,
  `dimPageDepth` int(11) NOT NULL,
  `dimLandingPagePath` int(11) NOT NULL,
  `dimSecondPagePath` int(11) NOT NULL,
  `dimPagePath` int(11) NOT NULL,
  `dimNextPagePath` int(11) NOT NULL,
  `dimPreviousPagePath` int(11) NOT NULL,
  `dimExitPagePath` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
  `Entrances` int(11) NOT NULL,
  `Pageviews` int(11) NOT NULL,
  `UniquePageviews` int(11) NOT NULL,
  `TimeOnPage` int(11) NOT NULL,
  `Exits` int(11) NOT NULL,
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `GoalStartsAll` int(11) NOT NULL DEFAULT '0',
  `GoalAbandonsAll` int(11) NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsPageTracking_dimVanquisSession` (`dimVanquisSession`),
  KEY `fk_fctvsPageTracking_dimDate` (`dimDate`),
  KEY `fk_fctvsPageTracking_dimExitPagePath` (`dimExitPagePath`),
  KEY `fk_fctvsPageTracking_dimHostname` (`dimHostname`),
  KEY `fk_fctvsPageTracking_dimLandingPagePath` (`dimLandingPagePath`),
  KEY `fk_fctvsPageTracking_dimNextPagePath` (`dimNextPagePath`),
  KEY `fk_fctvsPageTracking_dimPageDepth` (`dimPageDepth`),
  KEY `fk_fctvsPageTracking_dimPagePath` (`dimPagePath`),
  KEY `fk_fctvsPageTracking_dimPreviousPagePath` (`dimPreviousPagePath`),
  KEY `fk_fctvsPageTracking_dimProfile` (`dimProfile`),
  KEY `fk_fctvsPageTracking_dimSecondPagePath` (`dimSecondPagePath`),
  KEY `fk_fctvsPageTracking_dimVisitor` (`dimVisitor`),
  CONSTRAINT `fk_fctvsPageTracking_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimExitPagePath` FOREIGN KEY (`dimExitPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimHostname` FOREIGN KEY (`dimHostname`) REFERENCES `dimhostname` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimLandingPagePath` FOREIGN KEY (`dimLandingPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimNextPagePath` FOREIGN KEY (`dimNextPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimPageDepth` FOREIGN KEY (`dimPageDepth`) REFERENCES `dimpagedepth` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimPagePath` FOREIGN KEY (`dimPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimPreviousPagePath` FOREIGN KEY (`dimPreviousPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimSecondPagePath` FOREIGN KEY (`dimSecondPagePath`) REFERENCES `dimpagepath` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsPageTracking_dimVisitor` FOREIGN KEY (`dimVisitor`) REFERENCES `dimvisitor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1