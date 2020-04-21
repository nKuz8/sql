SET SERVEROUTPUT ON;
--CREATE OR REPLACE DIRECTORY UTL_FILE AS 'C:\Users';
--GRANT READ, WRITE ON UTL_FILE TO public;
execute employee_report('UTL_FILE', 'sal_rep.txt');