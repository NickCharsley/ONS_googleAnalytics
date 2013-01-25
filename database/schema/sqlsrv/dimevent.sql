CREATE TABLE "DBO"."dimevent" (
  "ID" int NOT NULL IDENTITY,
  "EventCategory" varchar(70) NOT NULL,
  "EventAction" varchar(70) NOT NULL,
  "EventLabel" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  ) 
GO

CREATE UNIQUE INDEX "dimEvent_indx" ON [dbo].[dimevent] ("EventCategory","EventAction","EventLabel")

GO
