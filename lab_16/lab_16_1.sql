SET SERVEROUTPUT ON;

EXECUTE emp_pkg.add_employee('Eleanor', 'Bel', 30);
UPDATE employees SET salary = 2000 WHERE employee_id = 115;
UPDATE employees SET job_id = 'HR_REP' WHERE employee_id = 115;
UPDATE employees SET salary = 2800 WHERE employee_id = 115;