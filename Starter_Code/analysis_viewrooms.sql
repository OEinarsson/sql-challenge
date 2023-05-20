-- List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW emplyee_details AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

SELECT *
FROM emplyee_details

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
CREATE VIEW hires_from_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

CREATE VIEW manager_details AS
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d on dm.dept_no = d.dept_no
JOIN employees e on dm.emp_no = e.emp_no;

SELECT *
FROM manager_details

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points

CREATE VIEW department_by_employee AS
SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, first_name
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no

SELECT *
FROM department_by_employee
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

CREATE VIEW hercules_B AS
SElECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
CREATE VIEW sales_team AS
SELECT e.emp_no, e.last_name, first_name
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_no = 'd007'

select *
FROM departments;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

CREATE VIEW sales_development_teams AS
SELECT e.emp_no, e.last_name, first_name,d.dept_name
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_no = 'd007' or d.dept_no = 'd005'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
CREATE VIEW last_name_counts AS
SELECT last_name, COUNT(last_name) as total
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

