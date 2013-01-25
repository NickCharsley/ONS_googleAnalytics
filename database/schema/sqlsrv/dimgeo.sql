CREATE TABLE "DBO"."dimgeo" (
  "ID" int NOT NULL IDENTITY,
  "Latitude" decimal(9,6) NOT NULL,
  "Longitude" decimal(9,6) NOT NULL,
  "City" varchar(45) NOT NULL,
  "Country" varchar(45) NOT NULL,
  "Continent" varchar(45) NOT NULL,
  "SubContinent" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "dimGeo_indx" ON [dbo].[dimgeo] ("Latitude","Longitude","City","Country")

GO
