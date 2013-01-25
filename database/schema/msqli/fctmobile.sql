CREATE TABLE `fctmobile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimMobile` int(11) NOT NULL,
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
  UNIQUE KEY `indx_dimMobile` (`dimDate`,`dimProfile`,`dimMobile`),
  KEY `fk_fctMobile_dimDate_idx` (`dimDate`),
  KEY `fk_fctMobile_dimProfile_idx` (`dimProfile`),
  KEY `fk_fctMobile_dimMobile_idx` (`dimMobile`),
  CONSTRAINT `fk_fctMobile_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctMobile_dimMobile` FOREIGN KEY (`dimMobile`) REFERENCES `dimmobile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctMobile_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1