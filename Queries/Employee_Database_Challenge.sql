-- Module 7 SQL Challenge : Employee_Database_Challenge
-- Deliverable 1:completed
-- Deliverable 2: completed
----------------------------------------------------------------------
drop table if exists retirement_titles;
drop table if exists unique_titles;
drop table if exists retiring_titles;

-- 1. retrieve emp_no, first_name, and last_name from Employees table
SELECT emp_no, first_name, last_name
FROM employees;

-- 2. retrieve the title, from_date, to_date from the Titles table
SELECT title, from_date, to_date
FROM titles;

-- 1 Retirement Titles Table
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;  

SELECT * FROM retirement_titles; 
-- result matched that on canvas; exported table retirement_titles; 133776 rows.

-- 2 Unique Titles Table
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC; 
	
SELECT * FROM unique_titles;
-- matched result shown on canvas, exported table unique_titles, 90398 rows
		
-- 3 Retiring Titles Table
SELECT COUNT(title) as "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC; 

SELECT * FROM retiring_titles;
-- result matched that on canvas; exported table retiring_titles;
-- D1.completed. 

--  Deliverable 2 --
--1.retrieve emp_no, first_name, last_name, birth_date from employees table
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
FROM employees as e; --300024rows

--2. retrieve from_date, to_date from dept_emp
SELECT de.from_date, de.to_date
FROM dept_emp as de; --331603rows

--3. retrieve title from titles table
SELECT title FROM titles as ti; --443308rows

--4. use distinct on stm 
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')AND ti.to_date = ('9999-01-01')
ORDER BY e.emp_no; 

SELECT * FROM mentorship_eligibilty;

-- sample check on most recent title
SELECT emp_no, title, from_date, to_date
FROM titles
WHERE emp_no = 10762;
-- checked
-- exported the table; Deliverable 2 completed