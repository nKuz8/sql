CREATE OR REPLACE
FUNCTION VALID_DEPID
( p_deptid IN NUMBER
) RETURN BOOLEAN AS
v_dep_id departments.department_id%TYPE;
BEGIN
  SELECT department_id INTO v_dep_id FROM departments WHERE department_id = p_deptid;
  RETURN TRUE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;
END VALID_DEPID;