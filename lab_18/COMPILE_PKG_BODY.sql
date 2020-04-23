create or replace
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
  
  PROCEDURE make(prog_type VARCHAR2, prog_name VARCHAR2) IS
    v_warn_value   VARCHAR2(200);
    v_compile_stmt VARCHAR2(200) := 
    'ALTER '|| prog_type|| ' ' || prog_name ||' COMPILE';
  BEGIN
    v_warn_value := DBMS_WARNING.GET_WARNING_SETTING_STRING;
    DBMS_OUTPUT.PUT_LINE('Current warning settings: '|| 
      v_warn_value);
    DBMS_WARNING.ADD_WARNING_SETTING_CAT(
      'PERFORMANCE', 'DISABLE', 'SESSION');
    DBMS_OUTPUT.PUT_LINE('Modified warning settings: '|| 
      DBMS_WARNING.GET_WARNING_SETTING_STRING);
    EXECUTE IMMEDIATE v_compile_stmt;
    DBMS_WARNING.SET_WARNING_SETTING_STRING(v_warn_value, 'SESSION');
    DBMS_OUTPUT.PUT_LINE('Restored warning settings: '|| 
      DBMS_WARNING.GET_WARNING_SETTING_STRING);
  END make;  
    
END COMPILE_PKG;
