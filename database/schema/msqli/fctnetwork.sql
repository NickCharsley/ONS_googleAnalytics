CREATE TABLE `fctnetwork` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimNetwork` int(11) NOT NULL,
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
  UNIQUE KEY `indx_dimNetwork` (`dimDate`,`dimProfile`,`dimNetwork`),
  KEY `fk_fctNetwork_dimDate_idx` (`dimDate`),
  KEY `fk_fctNetwork_dimProfile_idx` (`dimProfile`),
  KEY `fk_fctNetwork_dimNetwork_idx` (`dimNetwork`),
  CONSTRAINT `fk_fctNetwork_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctNetwork_dimNetwork` FOREIGN KEY (`dimNetwork`) REFERENCES `dimnetwork` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctNetwork_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1