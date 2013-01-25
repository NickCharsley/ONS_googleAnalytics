CREATE TABLE "DBO"."dimvisitor" (
  "ID" int NOT NULL,
  "VisitCount" int DEFAULT NULL,
  "VisitorType" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "indx_VisitCount" ON [dbo].[dimvisitor] ("VisitCount")

GO
