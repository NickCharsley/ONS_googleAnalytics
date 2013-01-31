CREATE TABLE "DBO"."fctvspagetracking" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimHostname" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "dimPageDepth" int NOT NULL,
  "dimLandingPagePath" int NOT NULL,
  "dimSecondPagePath" int NOT NULL,
  "dimPagePath" int NOT NULL,
  "dimNextPagePath" int NOT NULL,
  "dimPreviousPagePath" int NOT NULL,
  "dimExitPagePath" int NOT NULL,
  "dimVanquisSession" int NOT NULL,
  "Entrances" int NOT NULL,
  "Pageviews" int NOT NULL,
  "UniquePageviews" int NOT NULL,
  "TimeOnPage" int NOT NULL,
  "Exits" int NOT NULL,
  "PageLoadTime" int NOT NULL DEFAULT '0',
  "PageLoadSample" int NOT NULL DEFAULT '0',
  "DomainLookupTime" int NOT NULL DEFAULT '0',
  "PageDownloadTime" int NOT NULL DEFAULT '0',
  "RedirectionTime" int NOT NULL DEFAULT '0',
  "ServerConnectionTime" int NOT NULL DEFAULT '0',
  "ServerResponseTime" int NOT NULL DEFAULT '0',
  "SpeedMetricsSample" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),












  CONSTRAINT "fk_fctvsPageTracking_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimExitPagePath" FOREIGN KEY ("dimExitPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimHostname" FOREIGN KEY ("dimHostname") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimLandingPagePath" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimNextPagePath" FOREIGN KEY ("dimNextPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimPageDepth" FOREIGN KEY ("dimPageDepth") REFERENCES "dimpagedepth" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimPreviousPagePath" FOREIGN KEY ("dimPreviousPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimSecondPagePath" FOREIGN KEY ("dimSecondPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsPageTracking_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
