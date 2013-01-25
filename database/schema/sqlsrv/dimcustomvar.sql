CREATE TABLE "DBO"."dimcustomvar" (
  "ID" int NOT NULL IDENTITY,
  "CustomVarName" varchar(70) NOT NULL,
  "CustomVarValue" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "dimCustomVar_indx" ON [dbo].[dimcustomvar] ("CustomVarName","CustomVarValue")

GO
