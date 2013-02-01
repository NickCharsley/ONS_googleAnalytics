CREATE TABLE "DBO"."fctperformance" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimTraffic" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Goal1Starts" int NOT NULL DEFAULT '0',
  "Goal1Completions" int NOT NULL DEFAULT '0',
  "Goal1Abandons" int NOT NULL DEFAULT '0',
  "Goal6Starts" int NOT NULL DEFAULT '0',
  "Goal6Completions" int NOT NULL DEFAULT '0',
  "Goal6AbandonsAll" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "Impressions" varchar(45) DEFAULT NULL,
  "AdClicks" varchar(45) DEFAULT NULL,
  "AdCost" varchar(45) DEFAULT NULL,
  "CPM" varchar(45) DEFAULT NULL,
  "CPC" varchar(45) DEFAULT NULL,
  "CTR" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),



  CONSTRAINT "fk_fctPerformance_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformance_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformance_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
