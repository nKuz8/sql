SET SERVEROUTPUT ON;
VARIABLE b_basic_percent NUMBER;
VARIABLE b_pf_percent NUMBER;
DECLARE
  v_today DATE DEFAULT sysdate;
  v_tomorrow DATE;
BEGIN
  v_tomorrow := v_today + 1; 
  dbms_output.put_line('Hello, world!');
  dbms_output.put_line('TODAY IS: '|| v_today);
  dbms_output.put_line('TOMORROW IS: '|| v_tomorrow);  
  :b_basic_percent := 45;
  :b_pf_percent := 12;
END;
/
print b_pf_percent;
print b_basic_percent;