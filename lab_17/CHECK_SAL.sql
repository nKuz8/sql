CREATE OR REPLACE
PROCEDURE CHECK_SAL
( p_job_id IN VARCHAR2
, sal IN NUMBER
) AS
  min_sal jobs.min_salary%TYPE := jobs_pkg.get_minsalary(p_job_id);
  max_sal jobs.max_salary%TYPE := jobs_pkg.get_maxsalary(p_job_id);
BEGIN
   
   IF sal NOT BETWEEN min_sal AND max_sal THEN
    RAISE_APPLICATION_ERROR(-20200, 'Неверный оклад ' || sal || '. Оклад для должности с типом ' || p_job_id || ' должен быть от ' || min_sal || ' до ' || max_sal);
   ELSE NULL;
   END IF;
   
END CHECK_SAL;