create or replace
PROCEDURE ADD_JOB
( p_job_id IN VARCHAR2
, p_job_name IN VARCHAR2
) AS
BEGIN
  INSERT INTO jobs (job_id, job_title) VALUES (p_job_id, p_job_name);
END ADD_JOB;
