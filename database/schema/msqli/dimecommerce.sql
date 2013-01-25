CREATE TABLE `dimecommerce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionId` varchar(70) NOT NULL,
  `Affiliation` varchar(70) DEFAULT NULL,
  `VisitsToTransaction` int(11) DEFAULT NULL,
  `DaysToTransaction` int(11) DEFAULT NULL,
  `ProductSku` varchar(70) DEFAULT NULL,
  `ProductName` varchar(70) DEFAULT NULL,
  `ProductCategory` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1