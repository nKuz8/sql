create or replace
PACKAGE TEST_PKG AS

  TYPE emp_table_type IS TABLE OF employees%ROWTYPE INDEX BY PLS_INTEGER;

  PROCEDURE GET_EMPLOYEES(deptid IN VARCHAR2, emp_table IN OUT emp_table_type);

END TEST_PKG;
