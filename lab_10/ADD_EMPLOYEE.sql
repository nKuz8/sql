CREATE OR REPLACE
PROCEDURE ADD_EMPLOYEE
( p_first_name IN employees.first_name%TYPE
, p_last_name IN employees.last_name%TYPE
, p_email IN employees.email%TYPE DEFAULT 'email'
, p_job IN employees.job_id%TYPE DEFAULT 'SA_REP'
, p_mgr IN employees.manager_id%TYPE DEFAULT 145
, p_sal IN employees.salary%TYPE DEFAULT 1000
, p_comm IN employees.commission_pct%TYPE DEFAULT NULL
, p_deptid IN employees.department_id%TYPE DEFAULT 30
) AS
BEGIN
  IF valid_depid(p_deptid) THEN
    INSERT INTO employees VALUES(EMPLOYEES_SEQ.nextval, p_first_name, 
                                 p_last_name, p_email, NULL, TRUNC(SYSDATE), 
                                 p_job, p_sal, p_comm, p_mgr, p_deptid);
  ELSE 
    dbms_output.put_line('Invalid department');
  END IF;  
END ADD_EMPLOYEE;