-- Data Analysis

-- QUESTION 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
FROM employees as emp
INNER JOIN salaries ON
salaries.emp_no=emp.emp_no

-- QUESTION 2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE DATE_PART('year',hire_date) = 1986

-- QUESTION 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, emp.last_name, emp.first_name  
FROM dept_manager
INNER JOIN departments ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees as emp ON
dept_manager.emp_no = emp.emp_no;

-- QUESTION 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees as emp
INNER JOIN dept_emp ON 
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON 
departments.dept_no = dept_emp.dept_no

-- QUESTION 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees as emp
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- QUESTION 6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN dept_emp ON 
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- QUESTION 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees AS emp
LEFT JOIN dept_emp ON 
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

-- QUESTION 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,count(last_name) AS name_count
FROM employees 
GROUP BY last_name
ORDER BY name_count DESC;