--------------------------------------------------------
--  DDL for Table DEMO_TABLE1
--------------------------------------------------------

  CREATE TABLE "DEMO"."DEMO_TABLE1" 
   (	"CUSTOMER_ID" NUMBER(30,0), 
	"COLUMN2" VARCHAR2(20 BYTE), 
	"COLUMN3" VARCHAR2(20 BYTE), 
	"COLUMN4" VARCHAR2(20 BYTE), 
	"COLUMN5" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Index DEMO_TABLE1_PK
--------------------------------------------------------
/
  CREATE UNIQUE INDEX "DEMO"."DEMO_TABLE1_PK" ON "DEMO"."DEMO_TABLE1" ("CUSTOMER_ID") ;
--------------------------------------------------------
--  Constraints for Table DEMO_TABLE1
--------------------------------------------------------

  ALTER TABLE "DEMO"."DEMO_TABLE1" ADD CONSTRAINT "DEMO_TABLE1_PK" PRIMARY KEY ("CUSTOMER_ID")  ENABLE;
  /
  ALTER TABLE "DEMO"."DEMO_TABLE1" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);

   /
--------------------------------------------------------
--  DDL for Table DEMO_TABLE2
--------------------------------------------------------

  CREATE TABLE "DEMO"."DEMO_TABLE2" 
   (	"PK" NUMBER(30,0), 
	"DATA1" VARCHAR2(20 BYTE), 
	"DATA2" VARCHAR2(20 BYTE), 
	"DATA3" VARCHAR2(20 BYTE), 
	"DATA4" VARCHAR2(20 BYTE), 
	"DATA5" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index DEMO_TABLE2_PK
--------------------------------------------------------
/
  CREATE UNIQUE INDEX "DEMO"."DEMO_TABLE2_PK" ON "DEMO"."DEMO_TABLE2" ("PK") ;
--------------------------------------------------------
--  Constraints for Table DEMO_TABLE2
--------------------------------------------------------
/
  ALTER TABLE "DEMO"."DEMO_TABLE2" ADD CONSTRAINT "DEMO_TABLE2_PK" PRIMARY KEY ("PK") ENABLE;
  /
  ALTER TABLE "DEMO"."DEMO_TABLE2" MODIFY ("PK" NOT NULL ENABLE);
