CREATE TABLE `fctvsecommerce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dimDate` int(11) NOT NULL,
  `dimProfile` int(11) NOT NULL,
  `dimEcommerce` int(11) NOT NULL,
  `dimVanquisSession` int(11) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fctvsEcommerce_dimVanquisSession` (`dimVanquisSession`),
  KEY `fk_fctvsEcommerce_dimDate` (`dimDate`),
  KEY `fk_fctvsEcommerce_dimEcommerce` (`dimEcommerce`),
  KEY `fk_fctvsEcommerce_dimProfile` (`dimProfile`),
  CONSTRAINT `fk_fctvsEcommerce_dimDate` FOREIGN KEY (`dimDate`) REFERENCES `dimdate` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEcommerce_dimEcommerce` FOREIGN KEY (`dimEcommerce`) REFERENCES `dimecommerce` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEcommerce_dimProfile` FOREIGN KEY (`dimProfile`) REFERENCES `dimprofile` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fctvsEcommerce_dimVanquisSession` FOREIGN KEY (`dimVanquisSession`) REFERENCES `dimcustomvar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1