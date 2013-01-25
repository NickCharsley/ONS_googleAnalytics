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
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "Goal1Completions" int NOT NULL DEFAULT '0',
  "Goal2Completions" int NOT NULL DEFAULT '0',
  "Goal3Completions" int NOT NULL DEFAULT '0',
  "Goal4Completions" int NOT NULL DEFAULT '0',
  "Goal5Completions" int NOT NULL DEFAULT '0',
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
  "Goal16Completions" int NOT NULL DEFAULT '0',
  "Goal17Completions" int NOT NULL DEFAULT '0',
  "Goal18Completions" int NOT NULL DEFAULT '0',
  "Goal19Completions" int NOT NULL DEFAULT '0',
  "Goal20Completions" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),












  CONSTRAINT "fk_fctvsPageTracking_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  CONSTRAINT "fk_fctvsPageTracking_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
