CREATE OR REPLACE
PACKAGE BODY EMP_PKG AS

  FUNCTION VALID_DEPID( p_deptid IN NUMBER) RETURN BOOLEAN AS
  v_dep_id departments.department_id%TYPE;
  BEGIN
    SELECT department_id INTO v_dep_id FROM departments WHERE department_id = p_deptid;
    RETURN TRUE;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
  END VALID_DEPID;
  

  PROCEDURE GET_EMPLOYEE
( p_emp_id IN employees.employee_id%TYPE
, p_sal OUT employees.salary%TYPE
, p_job_id OUT employees.job_id%TYPE
) AS
  BEGIN
    SELECT salary, job_id INTO p_sal, p_job_id FROM employees WHERE employee_id = p_emp_id;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      dbms_output.put_line('No emp found');
  END GET_EMPLOYEE;
  

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

END EMP_PKG;