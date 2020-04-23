CREATE OR REPLACE
PACKAGE BODY JOBS_PKG AS

  TYPE jobs_tabtype IS TABLE OF jobs%ROWTYPE INDEX BY JOBS.JOB_ID%TYPE;
  
  jobstab jobs_tabtype;  

  PROCEDURE initialize AS
    CURSOR get_jobs IS  
      SELECT * FROM jobs;
  BEGIN
    FOR job IN get_jobs LOOP
      jobstab(job.job_id) := job;
    END LOOP;
  END initialize;

  FUNCTION get_minsalary(jobid VARCHAR2) RETURN NUMBER AS
  BEGIN
    RETURN jobstab(jobid).min_salary;
  END get_minsalary;

  FUNCTION get_maxsalary(jobid VARCHAR2) RETURN NUMBER AS
  BEGIN
    RETURN jobstab(jobid).max_salary;
  END get_maxsalary;

  PROCEDURE set_minsalary(jobid VARCHAR2,min_salary NUMBER) AS
  BEGIN
    jobstab(jobid).min_salary := min_salary;
  END set_minsalary;

  PROCEDURE set_maxsalary(jobid VARCHAR2,max_salary NUMBER) AS
  BEGIN
    jobstab(jobid).max_salary := max_salary;
  END set_maxsalary;

END JOBS_PKG;