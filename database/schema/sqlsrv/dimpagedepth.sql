CREATE TABLE "DBO"."dimpagedepth" (
  "ID" int NOT NULL,
  "PageDepth" int DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "PageDepth_UNIQUE" ON [dbo].[dimpagedepth] ("PageDepth")

GO
