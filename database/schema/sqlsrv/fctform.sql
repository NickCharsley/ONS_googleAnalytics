CREATE TABLE "DBO"."fctform" (
  "ID" int NOT NULL IDENTITY,
  "dimProfile" int NOT NULL,
  "dimDate" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "dimSession" int NOT NULL,
  "dimPagePath" int NOT NULL,
  "dimHostName" int NOT NULL,
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "OrganicSearches" int NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  "TimeOnSite" int NOT NULL DEFAULT '0',
  "Visits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  






  CONSTRAINT "fk_fctForm_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctForm_dimHostName" FOREIGN KEY ("dimHostName") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctForm_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctForm_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctForm_dimSession" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctForm_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO

CREATE UNIQUE INDEX "indx_fctForm" ON [dbo].[fctform] ("dimProfile","dimDate","dimVisitor","dimSession","dimPagePath","dimHostName")

GO
