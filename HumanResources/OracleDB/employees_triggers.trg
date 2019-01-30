CREATE OR REPLACE TRIGGER HR.SECURE_EMPLOYEES 
    BEFORE INSERT OR UPDATE OR DELETE ON HR.EMPLOYEES 
    FOR EACH ROW 
BEGIN
  secure_dml;
END secure_employees; 
/



CREATE OR REPLACE TRIGGER HR.UPDATE_JOB_HISTORY 
    AFTER UPDATE OF JOB_ID, DEPARTMENT_ID ON HR.EMPLOYEES 
    FOR EACH ROW 
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END; 
/
