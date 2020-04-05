create or replace
PROCEDURE DEL_JOB
( p_job_id IN VARCHAR2
) AS
  
  e_not_found EXCEPTION;
BEGIN
  DELETE FROM jobs WHERE job_id = p_job_id;
  IF SQL%ROWCOUNT = 0 THEN
    RAISE e_not_found;
  END IF; 

EXCEPTION
  WHEN e_not_found THEN
    dbms_output.put_line('Err: no job found!');
END DEL_JOB;
