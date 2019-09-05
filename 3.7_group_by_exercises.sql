use employees;

SELECT DISTINCT title FROM titles;

SELECT last_name, COUNT(*) FROM employees WHERE last_name LIKE ('E%') 
AND last_name LIKE ('%e')
GROUP BY last_name;

SELECT last_name FROM employees WHERE last_name LIKE ('%q%') 
AND last_name NOT LIKE ('%Qu%')
GROUP BY last_name;

SELECT last_name, COUNT(*) FROM employees WHERE last_name LIKE ('%q%') 
AND last_name NOT LIKE ('%Qu%')
GROUP BY last_name;

SELECT gender, COUNT(*) FROM employees WHERE (first_name = 'Irena' 
OR first_name = 'Vidya' OR first_name = 'Maya')
GROUP BY gender;



SELECT 
CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), 
'_', SUBSTRING(birth_date, 6, 2), SUBSTRING(birth_date, 3, 2)) AS user_name, COUNT(*) as count
FROM employees
GROUP BY user_name
order by count desc;

