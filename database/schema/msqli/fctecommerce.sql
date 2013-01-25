CREATE TABLE `fctecommerce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimEcommerce` int(11) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_fctEcommerce` (`dimDate`,`dimProfile`,`dimEcommerce`),
  KEY `fk_fctEcommerce_dimDate_idx` (`dimDate`),
  KEY `fk_fctEcommerce_dimProfile_idx` (`dimProfile`),
  KEY `fk_fctEcommerce_dimTransaction_idx` (`dimEcommerce`),
  CONSTRAINT `fk_fctEcommerce_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctEcommerce_dimEcommerce` FOREIGN KEY (`dimEcommerce`) REFERENCES `dimecommerce` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctEcommerce_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1