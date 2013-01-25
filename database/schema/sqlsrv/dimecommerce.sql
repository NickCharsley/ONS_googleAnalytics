CREATE TABLE "DBO"."dimecommerce" (
  "ID" int NOT NULL IDENTITY,
  "TransactionId" varchar(70) NOT NULL,
  "Affiliation" varchar(70) DEFAULT NULL,
  "VisitsToTransaction" int DEFAULT NULL,
  "DaysToTransaction" int DEFAULT NULL,
  "ProductSku" varchar(70) DEFAULT NULL,
  "ProductName" varchar(70) DEFAULT NULL,
  "ProductCategory" varchar(70) DEFAULT NULL,
  PRIMARY KEY ("ID")
) 
GO


GO
