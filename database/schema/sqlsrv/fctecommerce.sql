CREATE TABLE "DBO"."fctecommerce" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimEcommerce" int NOT NULL,
  "ItemQuantity" int NOT NULL,
  PRIMARY KEY ("ID"),
  



  CONSTRAINT "fk_fctEcommerce_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctEcommerce_dimEcommerce" FOREIGN KEY ("dimEcommerce") REFERENCES "dimecommerce" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctEcommerce_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO

CREATE UNIQUE INDEX "indx_fctEcommerce" ON [dbo].[fctecommerce] ("dimDate","dimProfile","dimEcommerce")

GO
