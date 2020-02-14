--List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, salary.salary
FROM employees
JOIN salary ON employees.emp_no = salary.emp_no;

--List employees who were hired in 1986
SELECT last_name,first_name,hire_date
FROM employees
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates
SELECT departmentmanagers.dept_no,departments.dept_name,employees.emp_no,employees.first_name,employees.last_name,departmentmanagers.from_date,departmentmanagers.to_date
FROM departmentmanagers
JOIN departments
	ON departmentmanagers.dept_no = departments.dept_no
JOIN employees
	ON departmentmanagers.emp_no = employees.emp_no;
	
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT departmentemployees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departmentemployees
JOIN departments
	ON departmentemployees.dept_no = departments.dept_no
JOIN employees
	ON departmentemployees.emp_no = employees.emp_no
WHERE to_date IN
(
	SELECT to_date
	FROM departmentemployees
	WHERE to_date ='1/1/9999'
);

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name ='Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT departmentemployees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departmentemployees
JOIN departments
	ON departmentemployees.dept_no = departments.dept_no
JOIN employees
	ON departmentemployees.emp_no = employees.emp_no
WHERE departmentemployees.dept_no IN
(
	SELECT dept_no
	FROM departments
	WHERE dept_name ='Sales'
);

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
SELECT departmentemployees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departmentemployees
JOIN departments
	ON departmentemployees.dept_no = departments.dept_no
JOIN employees
	ON departmentemployees.emp_no = employees.emp_no
WHERE departmentemployees.dept_no IN
(
	SELECT dept_no
	FROM departments
	WHERE dept_name ='Sales' OR dept_name ='Development'
);

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name;

