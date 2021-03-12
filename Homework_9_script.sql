--Create a view to view employees with their titles and salaries
CREATE VIEW employees AS 
	SELECT e.emp_no, t.title, e.birth_date, e.first_name, e.last_name, e.sex, 
	e.hire_date, s.salary
	FROM "Employees" AS e
		INNER JOIN "Titles" AS t ON e.emp_title = t.title_id
		INNER JOIN "Salaries" AS s ON e.emp_no = s.emp_no

SELECT * FROM employees

-- 1.  List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT emp_no, first_name, last_name, sex, salary 
FROM employees
ORDER BY emp_no

-- 2.  List first name, last name, and 
-- hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date

-- 3.  List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Departments" AS d
	INNER JOIN "Dept_Manager" AS dm INNER JOIN "Employees" AS e 
		ON dm.emp_no = e.emp_no ON d.dept_no = dm.dept_no
ORDER BY d.dept_no

-- 4.  List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Employees" AS e
	INNER JOIN "Dept_Emp" AS de INNER JOIN "Departments" AS d
		ON de.dept_no = d.dept_no ON e.emp_no = de.emp_no
ORDER BY d.dept_name, e.emp_no

-- 5.  List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Departments" AS d
	INNER JOIN "Dept_Emp" AS de INNER JOIN "Employees" AS e 
		ON de.emp_no = e.emp_no ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no

-- 7.  List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name.
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Departments" AS d
	INNER JOIN "Dept_Emp" AS de INNER JOIN "Employees" AS e 
		ON de.emp_no = e.emp_no ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name, e.emp_no

-- 8.  In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency_of_last_name
FROM employees
GROUP BY last_name
ORDER BY frequency_of_last_name Desc