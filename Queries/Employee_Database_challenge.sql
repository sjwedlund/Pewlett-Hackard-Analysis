-- Deliverable 1
-- TABLE 1: Retirement Titles Table

SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date

INTO retirement_titles
FROM employees as e 
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC; 

SELECT * FROM retirement_titles

-- Use Distinct with Order by to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt 
ORDER BY emp_no ASC, to_date DESC;

-- Table 3 : Retiring Titles Table

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;


--Deliverable 2
--Mentorship Eligibility table

SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Queries for other numbers needed for analysis
-- Retiring titles count
SELECT SUM(count)
FROM retiring_titles

--Total mentorship count
SELECT COUNT(first_name) AS total_mentorship_amount
FROM mentorship_eligibility

-- Total current employee count
SELECT COUNT(e.emp_no)
FROM employees AS e 
LEFT JOIN titles as t 
ON e.emp_no = t.emp_no 
WHERE to_date = ('9999-01-01');

-- Total present employee table
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO present_employees
FROM employees AS e
LEFT JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE to_date = ('9999-01-01');

-- Pre-Retirement, Post-Mentorship Eligible
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO pre_retirement
FROM employees AS e
LEFT JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1956-12-31' AND '1964-01-01'
AND to_date = ('9999-01-01');

SELECT * from pre_retirement 

-- Mentees Table
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO mentees
FROM employees AS e
LEFT JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1966-01-01' AND '9999-01-01'
AND to_date = ('9999-01-01');

-- Eligible for Promotion Table

SELECT COUNT(pe.emp_no), pe.title
INTO present_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;


