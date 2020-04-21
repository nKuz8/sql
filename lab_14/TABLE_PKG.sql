CREATE OR REPLACE
PACKAGE TABLE_PKG AS

  PROCEDURE make(table_name VARCHAR2, col_specs VARCHAR2);
	
  PROCEDURE add_row(table_name VARCHAR2, val VARCHAR2,
 cols VARCHAR2 := NULL);
	
  PROCEDURE upd_row(table_name VARCHAR2, val VARCHAR2,
  conditions VARCHAR2 := NULL);
	
  PROCEDURE del_row(table_name VARCHAR2,
 conditions VARCHAR2 := NULL);
	
  PROCEDURE remove(table_name VARCHAR2);

END TABLE_PKG;