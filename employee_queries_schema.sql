-- Data Queries

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW emp_salaries AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no=e.emp_no;

SELECT * FROM emp_salaries;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW emp_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date; 

SELECT * FROM emp_1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW managers AS
SELECT m.dept_no, d.dept_name, e.first_name, e.last_name, m.emp_no
FROM employees AS e
INNER JOIN dept_manager AS m
ON (m.emp_no = e.emp_no)
	INNER JOIN departments as d
	ON (m.dept_no = d.dept_no);

SELECT * FROM managers; 

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW emp_dept AS
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
ON (e.emp_no = de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no = d.dept_no);

SELECT * FROM emp_dept;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW hercules AS
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

SELECT * FROM hercules;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW sales AS
SELECT dept_name, emp_no, last_name, first_name 
FROM emp_dept
WHERE dept_name = 'Sales';

SELECT * FROM sales;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_and_dev AS
SELECT dept_name, emp_no, last_name, first_name 
FROM emp_dept
WHERE dept_name = 'Sales' OR dept_name = 'Development';

SELECT * FROM sales_and_dev;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW count_last_names AS
SELECT last_name, COUNT(last_name) AS "employee_count"
FROM employees
GROUP BY last_name
ORDER BY "employee_count" DESC;

SELECT * FROM count_last_names;