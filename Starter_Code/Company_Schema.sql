DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no varchar PRIMARY KEY NOT NULL,
	dept_name varchar
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	title_id varchar(10) PRIMARY KEY NOT NULL,
	title varchar(50)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no SERIAL PRIMARY KEY NOT NULL,
	emp_title varchar,
	birth_date date NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	sex varchar(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)	
);

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no varchar,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no varchar,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

