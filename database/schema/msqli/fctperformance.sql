CREATE TABLE `fctperformance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimTraffic` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `Goal1Starts` int(11) NOT NULL DEFAULT '0',
  `Goal1Completions` int(11) NOT NULL DEFAULT '0',
  `Goal1Abandons` int(11) NOT NULL DEFAULT '0',
  `Goal6Starts` int(11) NOT NULL DEFAULT '0',
  `Goal6Completions` int(11) NOT NULL DEFAULT '0',
  `Goal6AbandonsAll` int(11) NOT NULL DEFAULT '0',
  `GoalStartsAll` int(11) NOT NULL DEFAULT '0',
  `GoalCompletionsAll` int(11) NOT NULL DEFAULT '0',
  `GoalAbandonsAll` int(11) NOT NULL DEFAULT '0',
  `Impressions` varchar(45) DEFAULT NULL,
  `AdClicks` varchar(45) DEFAULT NULL,
  `AdCost` varchar(45) DEFAULT NULL,
  `CPM` varchar(45) DEFAULT NULL,
  `CPC` varchar(45) DEFAULT NULL,
  `CTR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fctPerformance_dimDate` (`dimDate`),
  KEY `fk_fctPerformance_dimTraffic` (`dimTraffic`),
  KEY `fk_fctPerformance_dimProfile` (`dimProfile`),
  CONSTRAINT `fk_fctPerformance_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformance_dimTraffic` FOREIGN KEY (`dimTraffic`) REFERENCES `dimtraffic` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformance_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=latin1