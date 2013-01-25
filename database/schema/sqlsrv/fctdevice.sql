CREATE TABLE "DBO"."fctdevice" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimHour" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimGeo" int NOT NULL,
  "dimPlatform" int NOT NULL,
  "dimSystem" int NOT NULL,
  "dimNetwork" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),








  CONSTRAINT "fk_fctDevice_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimGeo" FOREIGN KEY ("dimGeo") REFERENCES "dimgeo" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimHour" FOREIGN KEY ("dimHour") REFERENCES "dimhour" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimNetwork" FOREIGN KEY ("dimNetwork") REFERENCES "dimnetwork" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimPlatform" FOREIGN KEY ("dimPlatform") REFERENCES "dimplatform" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimSystem" FOREIGN KEY ("dimSystem") REFERENCES "dimsystem" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctDevice_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
