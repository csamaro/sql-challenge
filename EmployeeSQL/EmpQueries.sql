-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.l_name, e.f_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s ON s.emp_no = e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT f_name, l_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.l_name, e.f_name
FROM Employees e
INNER JOIN Dept_mgr dm
ON dm.emp_no = e.emp_no
INNER JOIN Departments d
ON d.dept_no = dm.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, e.l_name, e.f_name, d.dept_name
FROM Employees e
INNER JOIN Dept_emp de
ON de.emp_no = e.emp_no
INNER JOIN Departments d
ON d.dept_no = de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT f_name, l_name, sex
FROM Employees
WHERE f_name = 'Hercules' AND l_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT  d.dept_name, e.emp_no, e.l_name, e.f_name
FROM Employees e
INNER JOIN Dept_emp de
ON de.emp_no = e.emp_no
INNER JOIN Departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT  d.dept_name, e.emp_no, e.l_name, e.f_name
FROM Employees e
INNER JOIN Dept_emp de
ON de.emp_no = e.emp_no
INNER JOIN Departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT COUNT(l_name) AS FREQUENCY, l_name
FROM Employees
GROUP BY l_name
ORDER BY COUNT(l_name) DESC;