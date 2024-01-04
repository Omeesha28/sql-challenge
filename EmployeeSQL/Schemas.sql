-- Drop table if exists
DROP TABLE titles;

-- Create new table
CREATE TABLE titles (
    title_id VARCHAR (6) NOT NULL,
	title VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id)
);

SELECT * FROM titles;

-- Drop table if exists
DROP TABLE employees;

-- Create new table
CREATE TABLE employees (
    emp_no INT NOT NULL,
	emp_title_id VARCHAR(6) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR (2) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT * FROM employees;

-- Drop table if exists
DROP TABLE departments;

-- Create new table
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

-- Drop table if exists
Drop TABLE dept_manager;

-- Create new table
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_manager;

-- Drop table if exists
DROP TABLE dept_emp;

-- Create new table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_emp;

-- Drop table if exists
DROP TABLE salaries;

-- Create new table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
	salary INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;

