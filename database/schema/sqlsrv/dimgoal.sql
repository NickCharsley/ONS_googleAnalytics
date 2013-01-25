CREATE TABLE "DBO"."dimgoal" (
  "ID" int NOT NULL IDENTITY,
  "dimProfile" int NOT NULL,
  "GoalNumber" int NOT NULL,
  "GoalLabel" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  

  CONSTRAINT "fk_dimGoal_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO

CREATE UNIQUE INDEX "dimEvent_indx" ON [dbo].[dimgoal] ("dimProfile","GoalNumber","GoalLabel")

GO
