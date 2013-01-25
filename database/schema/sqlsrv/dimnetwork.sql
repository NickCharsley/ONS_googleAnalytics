CREATE TABLE "DBO"."dimnetwork" (
  "ID" int NOT NULL IDENTITY,
  "NetworkDomain" varchar(45) NOT NULL,
  "NetworkLocation" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "indx_dimNetwork" ON [dbo].[dimnetwork] ("NetworkDomain","NetworkLocation")

GO
