CREATE TABLE "DBO"."dimdate" (
  "ID" int NOT NULL,
  "Date" date DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  "Year" char(4) DEFAULT NULL,
  "Month" char(2) DEFAULT NULL,
  "Week" char(2) DEFAULT NULL,
  "Day" char(2) DEFAULT NULL,
  "DayOfWeek" char(2) DEFAULT NULL,
  "MonthName" varchar(15) DEFAULT NULL,
  "DayOfWeekName" varchar(15) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "Date_UNIQUE" ON [dbo].[dimdate] ("Date")

GO
