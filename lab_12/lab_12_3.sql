SET SERVEROUTPUT ON;

EXECUTE emp_pkg.add_employee('James', 'Bond', 15);
EXECUTE emp_pkg.init_departments;
EXECUTE emp_pkg.add_employee('James', 'Bond', 15);