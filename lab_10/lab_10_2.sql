SELECT employee_id, last_name, GET_ANNUAL_COMP(salary, commission_pct) as "Annual Compensation"
FROM employees
WHERE department_id = 30;