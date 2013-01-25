CREATE TABLE "DBO"."fctcustomvar4" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimCustomVar4" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),



  CONSTRAINT "fk_fctCustomVar4_dimCustomVar4" FOREIGN KEY ("dimCustomVar4") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctCustomVar4_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctCustomVar4_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
