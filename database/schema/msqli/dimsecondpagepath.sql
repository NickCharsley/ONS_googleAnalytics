CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dimsecondpagepath` AS select `dimpagepath`.`ID` AS `ID`,`dimpagepath`.`PagePath` AS `SecondPagePath` from `dimpagepath`