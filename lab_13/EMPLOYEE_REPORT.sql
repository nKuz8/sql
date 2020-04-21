create or replace
PROCEDURE EMPLOYEE_REPORT
( dir IN VARCHAR2
, filename IN VARCHAR2)
AS
  f UTL_FILE.FILE_TYPE;
  CURSOR average IS
  SELECT department_id, AVG(salary) as salary
  FROM employees
  GROUP BY department_id
  ORDER BY department_id;
  
  CURSOR emps(deptid employees.department_id%TYPE, avgsal employees.salary%TYPE) IS
  SELECT last_name, department_id, salary
  FROM employees
  WHERE department_id = deptid AND salary > avgsal;
BEGIN
  f := utl_file.fopen(dir, filename, 'w');
  utl_file.put_line(f, 'Employees who earn more than average salary:');
  utl_file.new_line(f);
  utl_file.put_line(f, 'REPORT GENERATED ON ' || SYSDATE);
  
  FOR av_rec IN average LOOP
    FOR emps_rec IN emps(av_rec.department_id, av_rec.salary) LOOP
      utl_file.put_line(f, emps_rec.last_name || ' ' || emps_rec.department_id || ' $' || emps_rec.salary);
  END LOOP;
  END LOOP;
  
  utl_file.put_line(f, '*** END OF REPORT ***');
  utl_file.fclose(f);
END EMPLOYEE_REPORT;
