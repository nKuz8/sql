create or replace
PACKAGE BODY EMP_PKG AS

  TYPE valid_deps_table IS TABLE OF
    BOOLEAN INDEX BY VARCHAR2(10);
  valid_departments valid_deps_table; 
  
  FUNCTION VALID_DEPID( p_deptid IN NUMBER) RETURN BOOLEAN;
  
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
  
 PROCEDURE ADD_EMPLOYEE
( p_first_name IN employees.first_name%TYPE, 
  p_last_name IN employees.last_name%TYPE, 
  p_deptid IN employees.department_id%TYPE)
  AS
    email employees.email%TYPE;
  BEGIN
    email := SUBSTR(p_first_name, 0, 1) || SUBSTR(p_last_name, 0, 7);
    add_employee(p_first_name=>p_first_name, p_last_name=>p_last_name, p_email=>email, p_deptid=>p_deptid);
  END ADD_EMPLOYEE; 
 
  PROCEDURE INIT_DEPARTMENTS AS
    CURSOR departs IS
      SELECT department_id
      FROM departments;
    deptid NUMBER;
    next_elem NUMBER;
  BEGIN
    OPEN departs;
    LOOP
      FETCH departs INTO deptid;
      EXIT WHEN departs%NOTFOUND;
      valid_departments(deptid) := TRUE;
    END LOOP;
  END INIT_DEPARTMENTS;

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
  
  FUNCTION GET_EMPLOYEE(emp_id employees.employee_id%TYPE) RETURN employees%ROWTYPE
  IS
    emp employees%ROWTYPE;
  BEGIN
    SELECT * INTO emp FROM employees WHERE employee_id = emp_id;
    RETURN emp;
  END GET_EMPLOYEE;
  
  FUNCTION GET_EMPLOYEE(family_name employees.last_name%TYPE) RETURN employees%ROWTYPE
  IS
    emp employees%ROWTYPE;
  BEGIN
    SELECT * INTO emp FROM employees WHERE last_name = family_name;
    RETURN emp;
  END GET_EMPLOYEE;
  
  PROCEDURE PRINT_EMPLOYEE(emp employees%ROWTYPE) IS
  BEGIN
    dbms_output.put_line(emp.department_id || ' ' || emp.employee_id || ' ' || emp.first_name|| ' ' || emp.last_name || ' ' || emp.job_id || ' ' || emp.salary); 
  END PRINT_EMPLOYEE;
  
 FUNCTION VALID_DEPID(p_deptid IN NUMBER) RETURN BOOLEAN AS
    deptid NUMBER;
    BEGIN
      IF valid_departments(p_deptid) = TRUE THEN RETURN TRUE;
      ELSE RETURN FALSE;
      END IF;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END VALID_DEPID;
  
  BEGIN
    INIT_DEPARTMENTS;
  
END EMP_PKG;
