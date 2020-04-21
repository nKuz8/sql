CREATE OR REPLACE
FUNCTION GET_JOB
( p_job_id IN VARCHAR2
) RETURN VARCHAR2 AS
title jobs.job_title%TYPE;
BEGIN
  SELECT job_title INTO title FROM jobs WHERE job_id = p_job_id;
  RETURN title;
END GET_JOB;