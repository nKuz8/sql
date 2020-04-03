SET SERVEROUTPUT ON;

DECLARE
  v_ename    employees.last_name%TYPE;
  v_emp_sal  employees.salary%TYPE := 6000;
    
BEGIN
  SELECT last_name INTO v_ename FROM employees WHERE salary = v_emp_sal;
  
  INSERT INTO messages (results) 
  VALUES (v_ename || ' - ' || v_emp_sal);
    
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    INSERT INTO messages (results) VALUES ('No employee with a salary of ' || v_emp_sal);
  
  WHEN TOO_MANY_ROWS THEN
    INSERT INTO messages (results) VALUES ('More then one employee with a salary of ' || v_emp_sal);
    
  WHEN OTHERS THEN
    INSERT INTO messages (results) VALUES ('Some other errors occured');

END;
/