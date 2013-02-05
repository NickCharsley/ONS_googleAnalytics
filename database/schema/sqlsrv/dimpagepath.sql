CREATE TABLE "DBO"."dimpagepath" (
  "ID" int NOT NULL IDENTITY,
  "PagePath" varchar(4096) NOT NULL,
  "PageType" varchar(45) NOT NULL DEFAULT 'Unknown',
  "HasShortcode" int NOT NULL DEFAULT '0',
  "Shortcode" varchar(1024) DEFAULT NULL,
  "hasURN" int NOT NULL DEFAULT '0',
  "URN" varchar(24) DEFAULT NULL,
  "FormType" varchar(45) DEFAULT NULL,
  "ApplicationProgress" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) 
GO


GO
