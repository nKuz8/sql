SET SERVEROUTPUT ON;

DECLARE
  CURSOR deps IS
    SELECT department_id, department_name 
    FROM   departments
    WHERE  department_id <= 100;
  
  CURSOR emp_info (dep_id NUMBER) IS
    SELECT last_name, job_id, hire_date, salary
    FROM   employees
    WHERE  department_id = dep_id;
    
  v_current_deptno departments.department_id%TYPE;
  v_current_dname  departments.department_name%TYPE;
  v_ename          employees.last_name%TYPE;
  v_job            employees.job_id%TYPE;
  v_hiredate       employees.hire_date%TYPE;
  v_sal            employees.salary%TYPE;
    
BEGIN 
  OPEN deps;
  LOOP
    FETCH deps INTO v_current_deptno, v_current_dname;
    EXIT WHEN deps%NOTFOUND;
    dbms_output.put_line('Department Number: ' || v_current_deptno || ' Department Name: ' || v_current_dname);
    
    OPEN emp_info(v_current_deptno);
    LOOP 
      FETCH emp_info INTO v_ename, v_job, v_hiredate, v_sal;
      EXIT WHEN emp_info%NOTFOUND;
      dbms_output.put_line(v_ename || ' ' || v_job || ' ' || v_hiredate || ' ' || v_sal);
      END LOOP;
    CLOSE emp_info;  
    dbms_output.put_line('-------------------------------------------------------------');  
  END LOOP;
END;
/
  