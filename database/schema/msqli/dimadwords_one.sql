CREATE TABLE `dimadwords_one` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdGroup` varchar(45) DEFAULT NULL,
  `AdSlot` varchar(45) DEFAULT NULL,
  `AdSlotPosition` varchar(45) DEFAULT NULL,
  `AdPlacementDomain` varchar(45) DEFAULT NULL,
  `AdPlacementUrl` varchar(2048) DEFAULT NULL,
  `AdTargetingOption` varchar(45) DEFAULT NULL,
  `AdDestinationUrl` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1