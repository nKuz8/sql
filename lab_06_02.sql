SET SERVEROUTPUT ON;
DECLARE 
  TYPE dep_names_type IS TABLE OF
    departments%ROWTYPE
    INDEX BY PLS_INTEGER;
  dep_names dep_names_type;
BEGIN
  for i IN 1..10 LOOP
    SELECT * INTO dep_names(i) FROM departments WHERE department_id = i*10; 
  END LOOP;
  
  FOR i IN 1..10 LOOP
    dbms_output.put_line('DEPARTMENT Number: ' || dep_names(i).department_id );
    dbms_output.put_line('Department Name: ' || dep_names(i).department_name);
    dbms_output.put_line('Manager Id: ' || dep_names(i).manager_id);
    dbms_output.put_line('Location Id: ' || dep_names(i).location_id);
    dbms_output.put_line('');
  END LOOP;  
  
END;
/