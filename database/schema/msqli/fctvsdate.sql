CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fctvsdate` AS select `fctvanquissession`.`dimDate` AS `dimDate`,`fctvanquissession`.`dimProfile` AS `dimProfile`,sum(`fctvanquissession`.`Visits`) AS `Visits`,sum(`fctvanquissession`.`Visitors`) AS `Visitors`,sum(`fctvanquissession`.`NewVisits`) AS `NewVisits`,sum(`fctvanquissession`.`Bounces`) AS `Bounces`,sum(`fctvanquissession`.`TimeOnSite`) AS `TimeOnSite`,sum(`fctvanquissession`.`OrganicSearches`) AS `OrganicSearches`,sum(`fctvanquissession`.`GoalStartsAll`) AS `GoalStartsAll`,sum(`fctvanquissession`.`GoalCompletionsAll`) AS `GoalCompletionsAll`,sum(`fctvanquissession`.`GoalAbandonsAll`) AS `GoalAbandonsAll`,sum(`fctvanquissession`.`GoalValueAll`) AS `GoalValueAll`,sum(`fctvanquissession`.`Entrances`) AS `Entrances`,sum(`fctvanquissession`.`Pageviews`) AS `Pageviews`,sum(`fctvanquissession`.`UniquePageviews`) AS `UniquePageviews`,sum(`fctvanquissession`.`TimeOnPage`) AS `TimeOnPage`,sum(`fctvanquissession`.`Exits`) AS `Exits`,sum(`fctvanquissession`.`PageLoadTime`) AS `PageLoadTime`,sum(`fctvanquissession`.`PageLoadSample`) AS `PageLoadSample`,sum(`fctvanquissession`.`DomainLookupTime`) AS `DomainLookupTime`,sum(`fctvanquissession`.`PageDownloadTime`) AS `PageDownloadTime`,sum(`fctvanquissession`.`RedirectionTime`) AS `RedirectionTime`,sum(`fctvanquissession`.`ServerConnectionTime`) AS `ServerConnectionTime`,sum(`fctvanquissession`.`ServerResponseTime`) AS `ServerResponseTime`,sum(`fctvanquissession`.`SpeedMetricsSample`) AS `SpeedMetricsSample` from `fctvanquissession` group by `fctvanquissession`.`dimDate`,`fctvanquissession`.`dimProfile`