CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dimcustomvar2` AS select `dimcustomvar`.`ID` AS `ID`,`dimcustomvar`.`CustomVarName` AS `CustomVarName2`,`dimcustomvar`.`CustomVarValue` AS `CustomVarValue2` from `dimcustomvar`