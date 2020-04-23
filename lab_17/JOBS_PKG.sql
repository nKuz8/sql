CREATE OR REPLACE
PACKAGE JOBS_PKG AS

  PROCEDURE initialize;
	
  FUNCTION get_minsalary(jobid VARCHAR2) RETURN NUMBER;
	
  FUNCTION get_maxsalary(jobid VARCHAR2) RETURN NUMBER;
	
  PROCEDURE set_minsalary(jobid VARCHAR2,min_salary NUMBER);
	
  PROCEDURE set_maxsalary(jobid VARCHAR2,max_salary NUMBER); 

END JOBS_PKG;