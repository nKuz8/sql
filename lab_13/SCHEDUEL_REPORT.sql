create or replace
PROCEDURE SCHEDUEL_REPORT
( interval IN VARCHAR2
, minutes IN NUMBER DEFAULT 10
) AS
  plsql_block VARCHAR2(200) :=
'BEGIN'||
' EMPLOYEE_REPORT(''UTL_FILE'','||
'''sal_rptXX_''||to_char(sysdate,''HH24-MI-SS'')||''.txt'');'||
'END;';

BEGIN
  dbms_scheduler.create_job(job_name=>'EMPSAL_REP', 
                            job_type=>'PLSQL_BLOCK',
                            job_action=> plsql_block, 
                            start_date => SYSTIMESTAMP,
                            repeat_interval => interval,
                            end_date => SYSTIMESTAMP + minutes/(24*60),
                            enabled => true
                            );
   dbms_scheduler.run_job('EMPSAL_REP');                         
END SCHEDUEL_REPORT;
