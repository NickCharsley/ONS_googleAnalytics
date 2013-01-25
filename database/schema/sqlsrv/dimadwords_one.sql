CREATE TABLE "DBO"."dimadwords_one" (
  "ID" int NOT NULL IDENTITY,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdSlot" varchar(45) DEFAULT NULL,
  "AdSlotPosition" varchar(45) DEFAULT NULL,
  "AdPlacementDomain" varchar(45) DEFAULT NULL,
  "AdPlacementUrl" varchar(2048) DEFAULT NULL,
  "AdTargetingOption" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  PRIMARY KEY ("ID")
) 
GO


GO
