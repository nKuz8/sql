create or replace
PACKAGE BODY JOB_PACK AS

  PROCEDURE ADD_JOB(p_job_id VARCHAR2, p_job_name VARCHAR2) AS
  BEGIN
    INSERT INTO jobs (job_id, job_title) VALUES (p_job_id, p_job_name);
    NULL;
  END ADD_JOB;

  PROCEDURE UPD_JOB(p_job_id VARCHAR2, p_new_job_title VARCHAR2) AS
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

  PROCEDURE DEL_JOB(p_job_id VARCHAR2) AS
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

  FUNCTION  GET_JOB(p_job_id VARCHAR2) RETURN VARCHAR2 AS
  title jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO title FROM jobs WHERE job_id = p_job_id;
    RETURN title;
  END GET_JOB;

END JOB_PACK;
