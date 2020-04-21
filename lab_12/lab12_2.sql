SET SERVEROUTPUT ON;
EXECUTE emp_pkg.print_employee(emp_pkg.get_employee(100));
EXECUTE emp_pkg.print_employee(emp_pkg.get_employee('Joplin'));