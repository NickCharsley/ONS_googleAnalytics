CREATE TABLE `fctadwords_one` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimAdwords_one` int(11) NOT NULL,
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
  KEY `fk_fctAdwords_one_dimAdwords_one` (`dimAdwords_one`),
  KEY `fk_fctAdwords_one_dimDate` (`dimDate`),
  KEY `fk_fctAdwords_one_dimProfile` (`dimProfile`),
  CONSTRAINT `fk_fctAdwords_one_dimAdwords_one` FOREIGN KEY (`dimAdwords_one`) REFERENCES `dimadwords_one` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctAdwords_one_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctAdwords_one_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1