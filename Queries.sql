-- 1. For each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
RIGHT JOIN salaries
ON (salaries.emp_no = employees.emp_no);

-- 2. Employees hired in 1986.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. Manager of each department with: department number, department name,
-- manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
RIGHT JOIN dept_manager
ON (departments.dept_no = dept_manager.dept_no)
INNER JOIN employees
ON (dept_manager.emp_no = employees.emp_no);

-- 4. Department of each employee with: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no);

-- 5. Employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.emp_no, employees.last_name, employees.first_name,
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. Employees in Sales department, including employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales';

-- 7. Employees in Sales and Development departments, including employee number, last name,
-- first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. Frequency count of employee shared last names in descending order

SELECT employees.last_name, COUNT(employees.emp_no)
FROM employees 
GROUP BY employees.last_name 
ORDER BY COUNT(employees.emp_no) DESC;