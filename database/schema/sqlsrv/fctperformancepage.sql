CREATE TABLE "DBO"."fctperformancepage" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimTraffic" int NOT NULL,
  "dimPagePath" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),




  CONSTRAINT "fk_fctPerformancePage_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformancePage_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformancePage_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctPerformancePage_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
