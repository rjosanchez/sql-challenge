-- Drop tables if they exist
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create new tables to import data
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL, 
	emp_no INT NOT NULL, 
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY, 
	emp_title_id VARCHAR(10) NOT NULL, 
	birth_date DATE,
	first_name VARCHAR(20), 
	last_name VARCHAR(20), 
	sex VARCHAR, 
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL, 
	salary INT
);

CREATE TABLE titles (
	title_id VARCHAR(10) PRIMARY KEY, 
	title VARCHAR(30)
);

-- Import data from departments.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM departments;

-- Import data from dept_emp.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_emp;

-- Import data from dept_manager.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_manager;

-- Import data from employees.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM employees;

-- Import data from salaries.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM salaries;

-- Import data from titles.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM titles;

