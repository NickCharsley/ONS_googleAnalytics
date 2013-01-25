CREATE TABLE `dimgoal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimProfile` int(11) NOT NULL,
  `GoalNumber` int(11) NOT NULL,
  `GoalLabel` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dimEvent_indx` (`dimProfile`,`GoalNumber`,`GoalLabel`),
  KEY `fk_dimGoal_dimProfile_idx` (`dimProfile`),
  CONSTRAINT `fk_dimGoal_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1