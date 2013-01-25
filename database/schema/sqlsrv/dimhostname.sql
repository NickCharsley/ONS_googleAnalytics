CREATE TABLE "DBO"."dimhostname" (
  "ID" int NOT NULL IDENTITY,
  "Hostname" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "indx_dimHostName" ON [dbo].[dimhostname] ("Hostname")

GO
