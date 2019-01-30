CREATE USER HRDEMO IDENTIFIED BY welcome1 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER HRDEMO QUOTA UNLIMITED ON USERS;

grant CREATE SESSION to HRDEMO;
grant all privileges on HR.DEPARTMENTS to HRDEMO;
grant all privileges on HR.COUNTRIES to HRDEMO;
grant all privileges on HR.EMPLOYEES to HRDEMO;
grant all privileges on HR.JOB_HISTORY to HRDEMO;
grant all privileges on HR.JOBS to HRDEMO;
grant all privileges on HR.LOCATIONS to HRDEMO;
grant all privileges on HR.REGIONS to HRDEMO;