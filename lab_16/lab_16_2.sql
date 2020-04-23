SET SERVEROUTPUT ON;

EXECUTE emp_pkg.add_employee(p_first_name=>'Eleanor', p_last_name=>'Beh', p_email=>'EBEH', p_job=>'IT_PROG', p_sal=>5000);
UPDATE employees SET salary = salary + 2000 WHERE job_id = 'IT_PROG'
UPDATE employees SET salary = 9000 WHERE first_name = 'Eleanor' AND last_name = 'Beh'
UPDATE employees SET job_id = 'ST_MAN' WHERE first_name = 'Eleanor' AND last_name = 'Beh'
DELETE FROM employees WHERE job_id = 'SA_REP' AND department_id IS NULL;