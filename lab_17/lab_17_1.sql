SET SERVEROUTPUT ON;

--SELECT employee_id, last_name, salary FROM employees WHERE job_id = 'IT_PROG';
--UPDATE jobs SET min_salary = min_salary + 1000 WHERE job_id = 'IT_PROG';
EXECUTE emp_pkg.add_employee(p_first_name=>'Steve', p_last_name=>'Morse', p_email=>'SMORSE', p_sal => 6500); 