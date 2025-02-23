-- Retrieve all employees from the employee_demographics table who are older than 40.
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age > 40;

-- Get the first name, last name, and salary of all employees from the employee_salary table.
SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary;

-- Retrieve all employees along with their salaries by joining employee_demographics and employee_salary.
-- Orders the results by first name in ascending order.
SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
ORDER BY ed.first_name ASC;

-- Retrieve all employees along with their occupation and salary.
-- Orders the results by salary in descending order (highest to lowest).
SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC;

-- List employees working in the 'Parks and Recreation' department, along with their occupation.
SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, pd.department_name
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON 	es.dept_id = pd.department_id
WHERE pd.department_name = 'Parks and Recreation';

-- Calculate the average salary for each department and order by highest to lowest.
SELECT pd.department_name, AVG(es.salary) AS average_salary 
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON es.dept_id = pd.department_id
GROUP BY pd.department_name 
ORDER BY average_salary DESC;

-- Count the number of employees in each department.
SELECT pd.department_name, COUNT(ed.employee_id)
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON es.dept_id = pd.department_id
GROUP BY pd.department_name;

-- Find the highest and lowest salary among employees.
SELECT MAX(es.salary) AS highest_salary, MIN(es.salary) AS lowest_salary
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;

-- Retrieve the top 3 highest-paid employees.
SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC 
LIMIT 3;

-- Retrieve all employees whose first name starts with 'A', ordered by age in descending order.
SELECT employee_id, first_name, last_name, age 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%' 
ORDER BY age DESC;

-- Find employees who earn more than the average salary.
SELECT employee_id, first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT AVG(salary)
    FROM parks_and_recreation.employee_salary
    );

-- Identify employees who do not have a department assigned.
SELECT ed.employee_id, ed.first_name, ed.last_name
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
WHERE es.dept_id IS NULL;
