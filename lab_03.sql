DECLARE
  b_basic_percent NUMBER := 45;
  b_pf_percent NUMBER := 12;
  
  v_fname VARCHAR2(15);
  v_emp_sal NUMBER(10);

BEGIN
  SELECT FIRST_NAME, SALARY
  INTO   v_fname, v_emp_sal
  FROM   EMPLOYEES
  WHERE EMPLOYEE_ID = 110;
  
  dbms_output.put_line('YOUR SAlARY IS: ' || v_emp_sal);
  dbms_output.put_line('YOUR CONTRIBUTION TOWARDS PF: ' ||
  v_emp_sal*b_basic_percent/100*b_pf_percent/100);
END;  