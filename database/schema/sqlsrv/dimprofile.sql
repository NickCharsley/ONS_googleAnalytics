CREATE TABLE "DBO"."dimprofile" (
  "ID" int NOT NULL,
  "ProfileName" varchar(45) NOT NULL DEFAULT 'Unknown',
  "WebPropertyID" varchar(45) NOT NULL,
  "Currency" varchar(45) NOT NULL,
  "WebsiteURL" varchar(45) NOT NULL,
  "Type" varchar(45) NOT NULL,
  "hidden" smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID")
) 
GO


GO
