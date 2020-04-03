SET SERVEROUTPUT ON;

DECLARE
  v_deptno NUMBER(3) := 50;
  
  CURSOR c_cursor_emp IS
    SELECT    last_name, salary, manager_id
    FROM      employees
    WHERE department_id = v_deptno;
  
  l_name employees.last_name%type;
  slry   employees.salary%type;
  mng_id employees.manager_id%type;
    
BEGIN 
  OPEN c_cursor_emp;
  LOOP
    FETCH c_cursor_emp INTO l_name, slry, mng_id;
    EXIT WHEN c_cursor_emp%NOTFOUND;
    IF slry < 5000 AND mng_id IN (101, 124)
      THEN
        dbms_output.put_line(l_name || ' Due for a rase');
      ELSE
        dbms_output.put_line(l_name || ' Not Due for a rase'); 
    END IF;
  END LOOP;
END;
/
  