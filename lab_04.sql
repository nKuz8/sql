SET SERVEROUTPUT ON;
DECLARE
  v_max_deptno NUMBER;
  v_dept_name departments.department_name%TYPE := 'Education';
  v_dept_id NUMBER;
  
BEGIN
  SELECT MAX(DEPARTMENT_ID) 
  INTO v_max_deptno
  FROM DEPARTMENTS;
  
  v_dept_id := v_max_deptno + 10;
  
  INSERT INTO departments (department_id, department_name) 
  VALUES (v_dept_id, v_dept_name);
  
  dbms_output.put_line(SQL%ROWCOUNT);
  
  UPDATE Departments
  SET location_id = 3000
  WHERE department_id = 280;
END;  
  