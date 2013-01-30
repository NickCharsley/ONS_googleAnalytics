CREATE TABLE "DBO"."dimalltraffic" (
  "ID" int NOT NULL IDENTITY,
  "Campaign" varchar(45) DEFAULT NULL,
  "Source" varchar(45) DEFAULT NULL,
  "Keyword" varchar(512) DEFAULT NULL,
  "SocialNetwork" varchar(45) DEFAULT NULL,
  "HasSocialSourceReferral" varchar(45) DEFAULT NULL,
  "ReferralPath" varchar(512) DEFAULT NULL,
  "Medium" varchar(45) DEFAULT NULL,
  "adContent" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) 
GO


GO
