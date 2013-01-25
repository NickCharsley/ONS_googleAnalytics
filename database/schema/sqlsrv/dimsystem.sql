CREATE TABLE "DBO"."dimsystem" (
  "ID" int NOT NULL IDENTITY,
  "FlashVersion" varchar(45) NOT NULL,
  "JavaEnabled" varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  "ScreenColors" varchar(45) NOT NULL,
  "ScreenResolution" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "indx_dimSystem" ON [dbo].[dimsystem] ("FlashVersion","JavaEnabled","Language","ScreenColors","ScreenResolution")

GO
