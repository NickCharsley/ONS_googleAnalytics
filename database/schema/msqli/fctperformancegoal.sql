CREATE TABLE `fctperformancegoal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimTraffic` int(11) NOT NULL,
  `dimGoal` int(11) NOT NULL,
  `GoalCompletions` int(11) NOT NULL DEFAULT '0',
  `GoalConversionRate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_fctPerformanceGoal_dimDate` (`dimDate`),
  KEY `fk_fctPerformanceGoal_dimProfile` (`dimProfile`),
  KEY `fk_fctPerformanceGoal_dimTraffic` (`dimTraffic`),
  KEY `fk_fctPerformanceGoal_dimGoal` (`dimGoal`),
  CONSTRAINT `fk_fctPerformanceGoal_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformanceGoal_dimGoal` FOREIGN KEY (`dimGoal`) REFERENCES `dimgoal` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformanceGoal_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctPerformanceGoal_dimTraffic` FOREIGN KEY (`dimTraffic`) REFERENCES `dimtraffic` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1