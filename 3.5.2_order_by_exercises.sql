use employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY last_name DESC, first_name DESC;

SELECT * FROM employees WHERE last_name LIKE ('E%');

SELECT * FROM employees WHERE hire_date LIKE ('199%');

SELECT * FROM employees WHERE birth_date LIKE ('%-12-25');

SELECT * FROM employees WHERE last_name LIKE ('%q%');

-- <<<<<<<<<<<<>>>>>>>>>>>>>

SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

SELECT * FROM employees WHERE last_name LIKE ('E%') OR last_name LIKE ('%e')
ORDER BY emp_no DESC;

SELECT * FROM employees WHERE last_name LIKE ('E%') AND last_name LIKE ('%e');

SELECT * FROM employees WHERE birth_date LIKE ('%-12-25') AND hire_date LIKE ('199%')
ORDER BY birth_date DESC, hire_date ASC;

SELECT * FROM employees WHERE last_name LIKE ('%q%') AND last_name NOT LIKE ('&qu%');
