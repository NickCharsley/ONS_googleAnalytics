CREATE TABLE "DBO"."dimdaysince" (
  "ID" int NOT NULL,
  "Days" int DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "Days_UNIQUE" ON [dbo].[dimdaysince] ("Days")

GO
