CREATE OR REPLACE
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