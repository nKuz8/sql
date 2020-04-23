create or replace
TRIGGER UPD_MINSALARY_TR
BEFORE UPDATE ON JOBS
FOR EACH ROW 
BEGIN
  emp_pkg.set_salary(:NEW.job_id, :NEW.min_salary);
END;  

