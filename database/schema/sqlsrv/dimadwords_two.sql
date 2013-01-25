CREATE TABLE "DBO"."dimadwords_two" (
  "ID" int NOT NULL IDENTITY,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdDistributionNetwork" varchar(45) DEFAULT NULL,
  "AdMatchType" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  "AdwordsCustomerID" varchar(45) DEFAULT NULL,
  "AdwordsCampaignID" varchar(45) DEFAULT NULL,
  "AdwordsAdGroupID" varchar(45) DEFAULT NULL,
  "AdwordsCreativeID" varchar(45) DEFAULT NULL,
  "AdwordsCriteriaID" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) 
GO


GO
