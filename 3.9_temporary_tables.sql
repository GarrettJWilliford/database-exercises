
use bayes_822;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

ALTER TABLE employees_with_departments
ADD full_name VARCHAR(30); 


SELECT * FROM employees_with_departments;

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

CREATE TEMPORARY TABLE payment AS 
SELECT CAST((amount * 100) AS SIGNED) as cents FROM sakila.payment;

SELECT * FROM payment;

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP TABLE emp_score;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


CREATE TEMPORARY TABLE emp_score AS
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS Name, dept_name, STDDEV(salary) as s
/*(
 WHEN STDDEV(salary) <> 0 THEN (
((salary - AVG(salary)) / (STDDEV(salary) + .001)))
ELSE 0
END AS z_score) AS zscore */
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.salaries USING(emp_no)
JOIN employees.departments USING(dept_no)
GROUP BY Name, dept_name, emp_no;

UPDATE emp_no
SET 
IF STDDEV(s) <> 0 
THEN zscore = ((s - AVG(s)) / (STDDEV(s))
ELSE zscore = 0;


SELECT * FROM emp_score;
