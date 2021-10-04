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
	dept_no varchar(4) not null,
	emp_no int not null,
	from_date date  not null,
	to_date date not null,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
);

create table titles(
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
);

-- Query for confirmation
SELECT * FROM departments;