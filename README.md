# Employee Database


## 📌 Project Overview  
This project focuses on practicing to extract and analyze employee data through querying, performing table joins to connect related information, aggregating salary statistics, and using subqueries to extract meaningful insights.

The dataset contains tables of employee details, salary information, and department assignments.  


## 📂 Database Schema  

This project contains database from [GitHub](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/Beginner%20-%20Parks_and_Rec_Create_db.sql), containing **three tables**:  

1. **`employee_demographics`** – Stores personal details of employees.  
2. **`employee_salary`** – Contains salary and department details for employees.  
3. **`parks_departments`** – Lists all departments in the organization.  

## 📌 Key SQL Concepts Covered  
✅ **Basic Queries** (`SELECT`, `WHERE`, `ORDER BY`)  
✅ **Joins** (`INNER JOIN`, `LEFT JOIN`)  
✅ **Aggregations** (`COUNT()`, `AVG()`, `MAX()`, `MIN()`)  
✅ **Grouping & Filtering** (`GROUP BY`, `HAVING`)  
✅ **Sorting & Limits** (`ORDER BY`, `LIMIT`)  
✅ **Subqueries** (`WHERE ... (SELECT ...)`)  


## 📜 SQL Queries Included  

### 🔹 Basic Queries  
#### 1️⃣ Get all employees older than 40  
```sql
SELECT *
FROM employee_demographics
WHERE age > 40;
```

#### 2️⃣ Retrieve first name, last name, and salary of all employees  
```sql
SELECT dem.employee_id, dem.first_name, dem.last_name, sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;
```

---

### 🔹 Joins & Sorting  
#### 3️⃣ Get all employees along with their salary (Sorted by First Name)  
```sql
SELECT dem.employee_id, dem.first_name, dem.last_name, sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
ORDER BY dem.first_name ASC;
```

#### 4️⃣ Get employees and occupations, sorted by highest salary  
```sql
SELECT dem.employee_id, dem.first_name, dem.last_name, sal.occupation, sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
ORDER BY sal.salary DESC;
```

#### 5️⃣ Find employees data from Parks and Recreation Department  
```sql
SELECT dem.employee_id, dem.first_name, dem.last_name, sal.occupation, sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
WHERE dept.department_name = 'Parks and Recreation';
```

---

### 🔹 Aggregations & Grouping  
#### 6️⃣ Find the average salary for each department  
```sql
SELECT dept.department_id, dept.department_name, ROUND(AVG(sal.salary), 2) AS dept_average_salary
FROM employee_salary sal
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
GROUP BY sal.dept_id;
```

#### 7️⃣ Count the number of employees in each department  
```sql
SELECT dept.department_id, dept.department_name, COUNT(sal.employee_id) AS number_of_employees
FROM employee_salary sal
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
GROUP BY dept.department_id;
```

#### 8️⃣ Find the highest and lowest salary in the organization  
```sql
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM employee_salary;
```

---

### 🔹 More Queries & Subqueries  
#### 9️⃣ Retrieve the top 3 highest-paid employees  
```sql
SELECT employee_id, first_name, last_name, salary
FROM employee_salary
ORDER BY salary DESC
LIMIT 3;
```

#### 🔟 Find employees whose first name starts with 'A' (Ordered by Age)  
```sql
SELECT employee_id, first_name, last_name, age
FROM employee_demographics
WHERE first_name LIKE 'A%'
ORDER BY age ASC;
```

#### 1️⃣1️⃣ Find employees earning more than the average salary  
```sql
SELECT employee_id, first_name, last_name, salary,
(SELECT ROUND(AVG(salary),2) FROM employee_salary) AS average_salary
FROM employee_salary
WHERE salary >
(SELECT AVG(salary)
FROM employee_salary)
ORDER BY salary DESC;
```

#### 1️⃣2️⃣ Identify employees who do not have a department assigned  
```sql
SELECT employee_id, first_name, last_name, dept_id
FROM employee_salary
WHERE dept_id IS NULL;
```

## 💻**Technologies Used**
- 🛠️ Database: MySQL
- 📚 Tools: MySQL Workbench, DBeaver, HeidiSQL
- 📝 Languages: SQL

---
✨ _Created by Halyusa Ard Wahyudi as part of a data analytics portfolio._ 🚀

