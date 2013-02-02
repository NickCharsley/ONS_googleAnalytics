CREATE TABLE "DBO"."fctperformancegoal" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimHour" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimTraffic" int NOT NULL,
  "dimGoal" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "GoalCompletions" int NOT NULL DEFAULT '0',
  "GoalConversionRate" float NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),





  CONSTRAINT "fk_fctPerformanceGoal_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformanceGoal_dimHour" FOREIGN KEY ("dimHour") REFERENCES "dimhour" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformanceGoal_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformanceGoal_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformanceGoal_dimGoal" FOREIGN KEY ("dimGoal") REFERENCES "dimgoal" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
