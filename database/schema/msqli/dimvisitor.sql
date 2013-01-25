CREATE TABLE `dimvisitor` (
  `ID` int(11) NOT NULL,
  `VisitCount` int(11) DEFAULT NULL,
  `VisitorType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `indx_VisitCount` (`VisitCount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1