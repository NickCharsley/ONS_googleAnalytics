CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dimnextpagepath` AS select `dimpagepath`.`ID` AS `ID`,`dimpagepath`.`PagePath` AS `NextPagePath` from `dimpagepath`