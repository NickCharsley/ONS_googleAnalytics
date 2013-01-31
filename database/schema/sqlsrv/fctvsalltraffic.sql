CREATE TABLE "DBO"."fctvsalltraffic" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimAllTraffic" int NOT NULL,
  "dimVanquisSession" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnPage" int NOT NULL DEFAULT '0',
  "TimeOnSite" int NOT NULL DEFAULT '0',
  "Goal1Completions" int NOT NULL DEFAULT '0',
  "Goal2Completions" int NOT NULL DEFAULT '0',
  "Goal3Completions" int NOT NULL DEFAULT '0',
  "Goal4Completions" int NOT NULL DEFAULT '0',
  "Goal6Completions" int NOT NULL DEFAULT '0',
  "Goal7Completions" int NOT NULL DEFAULT '0',
  "Goal8Completions" int NOT NULL DEFAULT '0',
  "Goal9Completions" int NOT NULL DEFAULT '0',
  "Goal10Completions" int NOT NULL DEFAULT '0',
  "Goal11Completions" int NOT NULL DEFAULT '0',
  "Goal12Completions" int NOT NULL DEFAULT '0',
  "Goal13Completions" int NOT NULL DEFAULT '0',
  "Goal14Completions" int NOT NULL DEFAULT '0',
  "Goal15Completions" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),




  CONSTRAINT "fk_fctvsAllTraffic_dimAllTraffic" FOREIGN KEY ("dimAllTraffic") REFERENCES "dimalltraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsAllTraffic_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsAllTraffic_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsAllTraffic_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
