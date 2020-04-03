SET SERVEROUTPUT ON;

DECLARE
  e_childhood_exists EXCEPTION;
  PRAGMA EXCEPTION_INIT
  (e_childhood_exists, -02292);
    
BEGIN
  DELETE FROM departments
  WHERE department_id = 40;
    
EXCEPTION
  WHEN e_childhood_exists THEN
    dbms_output.put_line('Cannot delete this dapsrtment. There are employees in this department');

END;
/