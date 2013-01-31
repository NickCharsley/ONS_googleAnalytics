CREATE TABLE "DBO"."fctvsvisitor" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "dimDaysSinceLastVisit" int NOT NULL,
  "dimVanquisSession" int NOT NULL,
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





  CONSTRAINT "fk_fctvsVisitor_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsVisitor_dimDaysSinceLastVisit" FOREIGN KEY ("dimDaysSinceLastVisit") REFERENCES "dimdaysince" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsVisitor_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsVisitor_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsVisitor_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
