CREATE OR REPLACE
PACKAGE BODY COMPILE_PKG AS
  
  FUNCTION get_type(prog_name VARCHAR2) RETURN all_source.type%TYPE IS
    prog_type user_source.type%TYPE;
    BEGIN
      SELECT type INTO prog_type FROM user_source WHERE name = prog_name AND line = 1;
      RETURN prog_type;
    EXCEPTION 
      WHEN TOO_MANY_ROWS THEN
        prog_type := 'PACKAGE';
        RETURN prog_type;
      WHEN NO_DATA_FOUND THEN
        RETURN NULL;
  END get_type;      

  PROCEDURE make(prog_name VARCHAR2) AS
    prog_type user_source.type%TYPE := get_type(prog_name);
  BEGIN
    IF prog_type IS NULL THEN
      dbms_output.put_line('Invalid program');
    ELSE 
      EXECUTE IMMEDIATE 'ALTER ' || prog_type || ' ' || prog_name || ' COMPILE';
    END IF;  
  END make;

END COMPILE_PKG;