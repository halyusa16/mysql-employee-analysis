SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age > 40;

SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary;

SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
ORDER BY ed.first_name ASC;

SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC;

SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, pd.department_name
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON 	es.dept_id = pd.department_id
WHERE pd.department_name = 'Parks and Recreation';

SELECT pd.department_name, AVG(es.salary) AS average_salary 
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON es.dept_id = pd.department_id
GROUP BY pd.department_name 
ORDER BY average_salary DESC;

SELECT pd.department_name, COUNT(ed.employee_id)
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
	ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
	ON es.dept_id = pd.department_id
GROUP BY pd.department_name;

SELECT MAX(es.salary) AS hihgest_salary, MIN(es.salary) AS lowest_salary
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;

SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC 
LIMIT 3;

SELECT employee_id, first_name, last_name, age 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%' 
ORDER BY age DESC;

SELECT employee_id, first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT AVG(salary)
    FROM parks_and_recreation.employee_salary
    );
    
SELECT ed.employee_id, ed.first_name, ed.last_name
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
WHERE es.dept_id IS NULL;