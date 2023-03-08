-- Create USER PLSQL block

declare
  tableexists integer;
begin
  select count(*) into tableexists from all_tables where table_name='CUSTOMER' and owner='APPS';
  if (tableexists = 0) then
    DBMS_OUTPUT.put_line('New table to be created.');
  else
     DBMS_OUTPUT.put_line('Deleting existing tables');
     execute immediate 'DROP table APPS.CUSTOMER';
  end if;
end;
/
--------------------------------------------------------
--  DDL for Table Customer
--------------------------------------------------------
CREATE TABLE apps.Customer
   (CUSTOMER_ID NUMBER(30), 
   Name VARCHAR2(20), 
   Age NUMBER(20), 
   Country VARCHAR2(20), 
   Designation VARCHAR2(20)
   );   
--------------------------------------------------------
--  DDL for Index Customer_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX Customer_PK ON apps.Customer (CUSTOMER_ID) ;
  
--------------------------------------------------------
--  Constraints for Table Customer
--------------------------------------------------------
  
  ALTER TABLE apps.Customer ADD CONSTRAINT Customer_PK PRIMARY KEY (CUSTOMER_ID)  ENABLE;
  
  ALTER TABLE apps.Customer MODIFY (CUSTOMER_ID NOT NULL ENABLE);
  
  Insert into apps.Customer values(1,'Smith',31,'Sweden','Senior Developer');
  
  Insert into apps.Customer values(2,'Nio',40,'Norway','Architect');
  
  Insert into apps.Customer values(3,'Morvious',45,'Ireland','Senior Manager');
  
  Insert into apps.Customer values(4,'Trinity',38,'Japan','Architect');

