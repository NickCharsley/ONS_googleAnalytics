CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dimtransaction` AS select `dimecommerce`.`ID` AS `ID`,`dimecommerce`.`TransactionId` AS `TransactionId`,`dimecommerce`.`Affiliation` AS `Affiliation`,`dimecommerce`.`VisitsToTransaction` AS `VisitsToTransaction`,`dimecommerce`.`DaysToTransaction` AS `DaysToTransaction` from `dimecommerce`