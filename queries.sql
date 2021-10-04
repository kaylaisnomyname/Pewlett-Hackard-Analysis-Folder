-- 2 hyphens : comment in pgAdmin
-- one comment to capture all tables, instead of one for each table
-- --------------------------------------------
-- Creating tables for PH-EmployeeDB
create table departments (
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

create table dept_manager(
dept_no varchar(4) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no),
	primary key(emp_no, dept_no)
);

create table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no varchar(5) not null,
	from_date date  not null,
	to_date date not null,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
--	primary key (emp_no)
);

create table titles(
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees(emp_no)
);

-- Query for confirmation
SELECT * FROM dept_emp;

-- drop an existing table
DROP TABLE dept_emp CASCADE;


-- determin retirement eligibility: conditions
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- 1952~1955 : 90398
-- 1952: 21209
-- 1953,54,55 : 22857, 23228,23104

-- more conditions :
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- :(41830) return first_name last_names, total 41830 rows

-- use COUNT()
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- :return count = 41830 

-- create new table to hold results
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- confirm the results is hold in a new table:
SELECT * FROM retirement_info;
