CREATE TABLE "DBO"."fctvstraffic" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimTraffic" int NOT NULL,
  "dimVanquisSession" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnPage" int NOT NULL DEFAULT '0',
  "OrganicSearches" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "TimeOnSite" int NOT NULL DEFAULT '0',
  "Goal1Completions" int NOT NULL DEFAULT '0',
  "Goal1Starts" int NOT NULL DEFAULT '0',
  "Goal2Completions" int NOT NULL DEFAULT '0',
  "Goal2Starts" int NOT NULL DEFAULT '0',
  "Goal3Completions" int NOT NULL DEFAULT '0',
  "Goal3Starts" int NOT NULL DEFAULT '0',
  "Goal4Completions" int NOT NULL DEFAULT '0',
  "Goal4Starts" int NOT NULL DEFAULT '0',
  "Goal6Completions" int NOT NULL DEFAULT '0',
  "Goal6Starts" int NOT NULL DEFAULT '0',
  "Goal7Completions" int NOT NULL DEFAULT '0',
  "Goal7Starts" int NOT NULL DEFAULT '0',
  "Goal8Completions" int NOT NULL DEFAULT '0',
  "Goal8Starts" int NOT NULL DEFAULT '0',
  "Goal9Completions" int NOT NULL DEFAULT '0',
  "Goal9Starts" int NOT NULL DEFAULT '0',
  "Goal10Completions" int NOT NULL DEFAULT '0',
  "Goal10Starts" int NOT NULL DEFAULT '0',
  "Goal11Completions" int NOT NULL DEFAULT '0',
  "Goal11Starts" int NOT NULL DEFAULT '0',
  "Goal12Completions" int NOT NULL DEFAULT '0',
  "Goal12Starts" int NOT NULL DEFAULT '0',
  "Goal13Completions" int NOT NULL DEFAULT '0',
  "Goal13Starts" int NOT NULL DEFAULT '0',
  "Goal14Completions" int NOT NULL DEFAULT '0',
  "Goal14Starts" int NOT NULL DEFAULT '0',
  "Goal15Completions" int NOT NULL DEFAULT '0',
  "Goal15Starts" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),




  CONSTRAINT "fk_fctvsTraffic_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsTraffic_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsTraffic_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsTraffic_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
