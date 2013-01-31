CREATE TABLE `fctvsevent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimEvent` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `Visitors` int(11) NOT NULL DEFAULT '0',
  `NewVisits` int(11) NOT NULL DEFAULT '0',
  `Bounces` int(11) NOT NULL DEFAULT '0',
  `TimeOnSite` float NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `Entrances` int(11) NOT NULL DEFAULT '0',
  `Pageviews` int(11) NOT NULL DEFAULT '0',
  `TimeOnPage` float NOT NULL DEFAULT '0',
  `Exits` int(11) NOT NULL DEFAULT '0',
  `totalEvents` int(11) NOT NULL DEFAULT '0',
  `uniqueEvents` int(11) NOT NULL DEFAULT '0',
  `eventValue` int(11) NOT NULL DEFAULT '0',
  `visitsWithEvent` int(11) NOT NULL DEFAULT '0',
  `eventsPerVisitWithEvent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsEvent_dimVanquisSession` (`dimVanquisSession`),
  KEY `fk_fctvsEvent_dimDate` (`dimDate`),
  KEY `fk_fctvsEvent_dimEvent` (`dimEvent`),
  KEY `fk_fctvsEvent_dimProfile` (`dimProfile`),
  CONSTRAINT `fk_fctvsEvent_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEvent_dimEvent` FOREIGN KEY (`dimEvent`) REFERENCES `dimevent` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEvent_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEvent_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1