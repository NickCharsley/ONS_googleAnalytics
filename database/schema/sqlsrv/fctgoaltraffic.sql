CREATE TABLE "DBO"."fctgoaltraffic" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimTraffic" int NOT NULL,
  "dimGoal" int NOT NULL,
  "GoalCompletions" int NOT NULL DEFAULT '0',
  "GoalStarts" int NOT NULL DEFAULT '0',
  "GoalAbandons" int NOT NULL DEFAULT '0',
  "GoalValue" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),




  CONSTRAINT "fk_fctGoalTraffic_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctGoalTraffic_dimGoal" FOREIGN KEY ("dimGoal") REFERENCES "dimgoal" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctGoalTraffic_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctGoalTraffic_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
