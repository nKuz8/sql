CREATE OR REPLACE
PACKAGE BODY TABLE_PKG AS

  PROCEDURE make(table_name VARCHAR2, col_specs VARCHAR2) AS
  BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE '||table_name||' (' || col_specs || ')';
  END make;

  PROCEDURE add_row(table_name VARCHAR2, val VARCHAR2,
 cols VARCHAR2 := NULL) AS
  BEGIN
    EXECUTE IMMEDIATE 'INSERT INTO '||table_name||'('|| cols || ') VALUES (' || val || ')';
  END add_row;

  PROCEDURE upd_row(table_name VARCHAR2, val VARCHAR2,
  conditions VARCHAR2 := NULL) AS
  BEGIN
    EXECUTE IMMEDIATE 'UPDATE '|| table_name || ' SET ' || val || 'WHERE ' || conditions;
  END upd_row;

  PROCEDURE del_row(table_name VARCHAR2,
 conditions VARCHAR2 := NULL) AS
  BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM ' || table_name || ' WHERE ' || conditions;
  END del_row;

  PROCEDURE remove(table_name VARCHAR2) AS
    v_cur_id INTEGER;
  BEGIN
    v_cur_id := dbms_sql.open_cursor;
    dbms_sql.parse(v_cur_id, 'DROP TABLE ' || table_name, dbms_sql.native);
    dbms_sql.close_cursor(v_cur_id);
  END remove;

END TABLE_PKG;