CREATE TABLE "DBO"."fctvsecommerce" (
  "ID" int NOT NULL IDENTITY,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimEcommerce" int NOT NULL,
  "dimVanquisSession" int NOT NULL,
  "ItemQuantity" int NOT NULL,
  PRIMARY KEY ("ID"),




  CONSTRAINT "fk_fctvsEcommerce_dimVanquisSession" FOREIGN KEY ("dimVanquisSession") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsEcommerce_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsEcommerce_dimEcommerce" FOREIGN KEY ("dimEcommerce") REFERENCES "dimecommerce" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_fctvsEcommerce_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION
) 
GO


GO
