create or replace
PACKAGE COMPILE_PKG AS

  PROCEDURE make(prog_name VARCHAR2);

  PROCEDURE make(prog_type VARCHAR2, prog_name VARCHAR2);
END COMPILE_PKG;
