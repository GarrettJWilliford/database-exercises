use employees;
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS 'name' FROM employees WHERE last_name LIKE ('E%') AND last_name LIKE ('%e');

SELECT CONCAT(first_name, ' ', last_name) as 'name',
(DATEDIFF(CURDATE(), hire_date)) AS 'days worked'
FROM employees WHERE hire_date LIKE ('199%') 
AND birth_date LIKE ('%-12-25')
ORDER BY birth_date ASC, hire_date DESC;


SELECT MAX(salary) AS 'Biggest salary', 
MIN(salary) AS 'Smallest Salary' FROM salaries;

SELECT 
CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), 
'_', SUBSTRING(birth_date, 6, 2), SUBSTRING(birth_date, 3, 2))
first_name, last_name, birth_date FROM employees;
