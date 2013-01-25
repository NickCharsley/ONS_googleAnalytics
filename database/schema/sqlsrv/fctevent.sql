CREATE TABLE "DBO"."fctevent" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimEvent" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  "totalEvents" int NOT NULL DEFAULT '0',
  "uniqueEvents" int NOT NULL DEFAULT '0',
  "eventValue" int NOT NULL DEFAULT '0',
  "visitsWithEvent" int NOT NULL DEFAULT '0',
  "eventsPerVisitWithEvent" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  



  CONSTRAINT "fk_fctEvent_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctEvent_dimEvent" FOREIGN KEY ("dimEvent") REFERENCES "dimevent" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctEvent_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO

CREATE UNIQUE INDEX "indx_dimEvent" ON [dbo].[fctevent] ("dimDate","dimProfile","dimEvent")

GO
