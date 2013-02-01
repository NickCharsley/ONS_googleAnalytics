CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fctload_cashmax_base` AS select `fctcashmax`.`ID` AS `ID`,`fctcashmax`.`dimDate` AS `dimDate`,`fctcashmax`.`dimProfile` AS `dimProfile`,`fctcashmax`.`dimVanquisSession` AS `dimVanquisSession`,`fctcashmax`.`Visits` AS `Visits`,`fctcashmax`.`Bounces` AS `Bounces`,`fctcashmax`.`TimeOnSite` AS `TimeOnSite`,`fctcashmax`.`OrganicSearches` AS `OrganicSearches`,`fctcashmax`.`GoalValueAll` AS `GoalValueAll`,`fctcashmax`.`Entrances` AS `Entrances`,`fctcashmax`.`GoalStartsAll` AS `GoalStartsAll`,`fctcashmax`.`GoalCompletionsAll` AS `GoalCompletionsAll`,`fctcashmax`.`GoalAbandonsAll` AS `GoalAbandonsAll` from `fctcashmax`