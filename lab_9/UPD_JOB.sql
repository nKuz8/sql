create or replace
PROCEDURE UPD_JOB
( p_job_id IN VARCHAR2
, p_new_job_title IN VARCHAR2
) AS
  e_no_rows_updated EXCEPTION;
BEGIN
  UPDATE jobs SET job_title = p_new_job_title WHERE job_id = p_job_id;
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE e_no_rows_updated;
  END IF;  
  
EXCEPTION
  WHEN e_no_rows_updated THEN
    dbms_output.put_line('No such job found');
END UPD_JOB;
