CREATE TABLE `dimpagepath` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PagePath` varchar(4096) NOT NULL,
  `PageType` varchar(45) NOT NULL DEFAULT 'Unknown',
  `HasShortcode` int(11) NOT NULL DEFAULT '0',
  `Shortcode` varchar(1024) DEFAULT NULL,
  `hasURN` int(11) NOT NULL DEFAULT '0',
  `URN` varchar(24) DEFAULT NULL,
  `FormType` varchar(45) DEFAULT NULL,
  `ApplicationProgress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2893 DEFAULT CHARSET=latin1