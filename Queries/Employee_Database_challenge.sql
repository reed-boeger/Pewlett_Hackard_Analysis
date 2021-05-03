
-- Deliverable 1 --
SELECT e.emp_no,
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


SELECT DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, ti.to_date DESC;



SELECT COUNT(ut.title),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Deliverable 2 --
SELECT DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name, 
e.last_name,
e.birth_date,
ti.title,
de.from_date,
de.to_date
INTO mentorship_elegibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Deliverable 3 -- 
SELECT COUNT(ut.emp_no)
FROM unique_titles as ut

SELECT COUNT (me.emp_no)
FROM mentorship_elegibility as me