CREATE TABLE `fctvscustomvar4` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimCustomVar4` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
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
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsCustomVar4_dimDate` (`dimDate`),
  KEY `fk_fctvsCustomVar4_dimCustomVar4` (`dimCustomVar4`),
  KEY `fk_fctvsCustomVar4_dimProfile` (`dimProfile`),
  KEY `fk_fctvsCustomVar4_dimVanquisSession` (`dimVanquisSession`),
  CONSTRAINT `fk_fctvsCustomVar4_dimCustomVar4` FOREIGN KEY (`dimCustomVar4`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsCustomVar4_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsCustomVar4_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsCustomVar4_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1