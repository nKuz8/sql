SET SERVEROUTPUT ON;
DECLARE
  star_count NUMBER;
  star_print VARCHAR2(20);

BEGIN 
  SELECT ROUND(salary/1000) INTO star_count FROM emp WHERE employee_id = 176;
  
  FOR i IN 1..star_count LOOP
    star_print := star_print || '*';
  END LOOP;
  
  UPDATE emp SET stars = star_print WHERE employee_id = 176;
END;
/