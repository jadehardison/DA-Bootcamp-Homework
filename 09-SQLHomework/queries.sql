
-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM employee;
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.gender
FROM employee
LEFT JOIN salary ON employee.emp_no=salary.emp_no
ORDER BY employee.emp_no;

-- List employees who were hired in 1986
SELECT employee.last_name, employee.first_name FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'


-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT manager.dept_no, departments.dept_name, employee.first_name, employee.last_name, manager.emp_no,
manager.from_date, manager.to_date

FROM manager
	INNER JOIN employee ON employee.emp_no=manager.emp_no
	INNER JOIN departments ON manager.dept_no=departments.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
	INNER JOIN dept_emp ON dept_emp.emp_no=employee.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no;
	
-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
	INNER JOIN dept_emp ON dept_emp.emp_no=employee.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
	INNER JOIN dept_emp ON dept_emp.emp_no=employee.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name IN ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;