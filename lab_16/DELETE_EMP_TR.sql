CREATE OR REPLACE
TRIGGER DELETE_EMP_TR
BEFORE DELETE ON EMPLOYEES
BEGIN
  IF (TO_CHAR(SYSDATE,'DY') NOT IN ('SAT','SUN')) OR
       (TO_CHAR(SYSDATE,'HH24') 
        BETWEEN '09' AND '18') THEN
    RAISE_APPLICATION_ERROR(-20201, '������ ������� �������� � ������� �����'); 
  END IF;  
END;

