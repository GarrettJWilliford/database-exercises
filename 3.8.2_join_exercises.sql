use employees;

SELECT departments.dept_name, 
CONCAT(employees.first_name, ' ', employees.last_name) AS fullname
 FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
AND dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name ASC;

SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name)
AS fullname
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no AND employees.gender = 'F'
AND dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name ASC;

SELECT titles.title, COUNT(*) as count FROM employees
JOIN titles ON employees.emp_no = titles.emp_no AND titles.to_date = '9999-01-01'
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = 'd009' 
AND dept_emp.to_date = '9999-01-01'
GROUP BY titles.title;


SELECT departments.dept_name, 
CONCAT(employees.first_name, ' ', employees.last_name) AS fullname,
salaries.salary
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
AND dept_manager.to_date = '9999-01-01'
JOIN salaries ON dept_manager.emp_no = salaries.emp_no 
AND salaries.to_date = '9999-01-01'
ORDER BY departments.dept_name ASC;


SELECT departments.dept_no, departments.dept_name, COUNT(*) AS num_employees
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no 
AND dept_emp.to_date = '9999-01-01'
GROUP BY departments.dept_no, departments.dept_name;


SELECT departments.dept_no, departments.dept_name, AVG(salaries.salary) as average_salary FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no 
AND dept_emp.to_date = '9999-01-01'
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
AND salaries.to_date = '9999-01-01'
GROUP BY departments.dept_no, departments.dept_name ASC
ORDER BY average_salary DESC
LIMIT 1;

SELECT employees.first_name, employees.last_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no 
AND dept_emp.dept_no = 'd001'
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salary DESC
LIMIT 1;

SELECT employees.first_name,  employees.last_name,
salaries.salary, departments.dept_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
AND dept_manager.to_date = '9999-01-01'
JOIN salaries ON dept_manager.emp_no = salaries.emp_no 
AND salaries.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;

