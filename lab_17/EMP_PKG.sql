create or replace
PACKAGE EMP_PKG AS

  TYPE emp_table_type IS TABLE OF 
    employees%ROWTYPE INDEX BY PLS_INTEGER;
  
  PROCEDURE ADD_EMPLOYEE
( p_first_name IN employees.first_name%TYPE
, p_last_name IN employees.last_name%TYPE
, p_email IN employees.email%TYPE DEFAULT 'email'
, p_job IN employees.job_id%TYPE DEFAULT 'SA_REP'
, p_mgr IN employees.manager_id%TYPE DEFAULT 145
, p_sal IN employees.salary%TYPE DEFAULT 1000
, p_comm IN employees.commission_pct%TYPE DEFAULT NULL
, p_deptid IN employees.department_id%TYPE DEFAULT 30
);

  PROCEDURE ADD_EMPLOYEE
( p_first_name IN employees.first_name%TYPE, 
  p_last_name IN employees.last_name%TYPE, 
  p_deptid IN employees.department_id%TYPE);
  
  PROCEDURE INIT_DEPARTMENTS;
  
  PROCEDURE GET_EMPLOYEE
( p_emp_id IN employees.employee_id%TYPE
, p_sal OUT employees.salary%TYPE
, p_job_id OUT employees.job_id%TYPE
);
  
  FUNCTION GET_EMPLOYEE(emp_id employees.employee_id%TYPE) RETURN employees%ROWTYPE;
  
  FUNCTION GET_EMPLOYEE(family_name employees.last_name%TYPE) RETURN employees%ROWTYPE;
  
  PROCEDURE GET_EMPLOYEES(dept_id employees.department_id%TYPE);
  
  PROCEDURE PRINT_EMPLOYEE(emp employees%ROWTYPE);
  
  PROCEDURE SET_SALARY(p_jobid employees.job_id%TYPE, p_newminsal jobs.min_salary%TYPE);
  
  PROCEDURE SHOW_EMPLOYEES;
  
  FUNCTION VALID_DEPID( p_deptid IN NUMBER) RETURN BOOLEAN;
  
  

END EMP_PKG;
