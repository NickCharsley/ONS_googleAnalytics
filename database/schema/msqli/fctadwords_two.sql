CREATE TABLE `fctadwords_two` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimAdwords_two` int(11) NOT NULL,
  `Impressions` varchar(45) DEFAULT NULL,
  `AdClicks` varchar(45) DEFAULT NULL,
  `AdCost` varchar(45) DEFAULT NULL,
  `CPM` varchar(45) DEFAULT NULL,
  `CPC` varchar(45) DEFAULT NULL,
  `CTR` varchar(45) DEFAULT NULL,
  `CostPerTransaction` varchar(45) DEFAULT NULL,
  `CostPerGoalConversion` varchar(45) DEFAULT NULL,
  `CostPerConversion` varchar(45) DEFAULT NULL,
  `RPC` varchar(45) DEFAULT NULL,
  `ROI` varchar(45) DEFAULT NULL,
  `Margin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fctAdwords_two_dimDate_idx` (`dimDate`),
  KEY `fk_fctAdwords_two_dimAdwords_two_idx` (`dimAdwords_two`),
  CONSTRAINT `fk_fctAdwords_two_dimAdwords_two` FOREIGN KEY (`dimAdwords_two`) REFERENCES `dimadwords_two` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctAdwords_two_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1