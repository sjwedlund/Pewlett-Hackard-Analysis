-- Deliverable 1

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
order by e.emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp,_no,
rt.first_name,
rt.last_name,
rt.title

-- Create a Unique Titles table using the INTO clause
INTO unique_titles
FROM retirement_titles AS rt 
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM unique_titles;

--Create a Retiring Titles table
SELECT COUNT (ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY title
ORDER BY COUNT(title) DESC;
SELECT * FROM retiring_titles;

--Deliverable 2
--Mentorship Eligibility table

SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--DISTINCT ON(emp_no)
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
