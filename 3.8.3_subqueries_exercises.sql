SELECT CONCAT(first_name, ' ', last_name) AS Name
FROM employees
WHERE emp_no IN (
SELECT emp_no FROM employees WHERE
hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010')
);


SELECT title FROM titles
WHERE emp_no IN (
SELECT emp_no FROM employees WHERE
first_name = 'Aamod'
);


SELECT COUNT(*) FROM employees
WHERE emp_no NOT IN (
SELECT emp_no FROM dept_emp WHERE
to_date = '9999-01-01');


SELECT first_name, last_name FROM employees 
WHERE emp_no IN (
SELECT emp_no FROM dept_manager
WHERE to_date = '9999-01-01'
) AND gender = 'F';

 
SELECT first_name, last_name, salaries.salary FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no IN (
SELECT emp_no FROM salaries WHERE salary > 
(SELECT AVG(salary) FROM salaries) AND to_date = '9999-01-01')
AND salaries.to_date = '9999-01-01';

SELECT first_name, last_name, salaries.salary FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no IN (
SELECT emp_no FROM salaries WHERE salary > (SELECT MAX(salary) - STDDEV(salary) FROM salaries))
AND salaries.to_date = '9999-01-01';