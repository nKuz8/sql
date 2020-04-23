SET SERVEROUTPUT ON;

ALTER SESSION SET PLSQL_CODE_TYPE = 'NATIVE';

SELECT name, type, plsql_code_type AS CODE_TYPE, 
       plsql_optimize_level AS OPT_LVL
FROM   user_plsql_object_settings;

EXECUTE employee_report('UTL_FILE', 'native_salrep.txt');

ALTER SESSION SET PLSQL_CODE_TYPE = 'INTERPRETED';

ALTER SESSION SET PLSQL_WARNINGS =	'ENABLE:ALL';

EXECUTE compile_pkg.make('PACKAGE ', 'TEST_PKG');