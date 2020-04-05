VARIABLE b_salary NUMBER
VARIABLE b_job_id VARCHAR2(20)

EXECUTE GET_EMPLOYEE(120, :b_salary, :b_job_id)

PRINT  b_job_id b_salary
