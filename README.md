# Employee Database


## 📌 Project Overview  
This project focuses on analyzing employee data through querying, performing table joins to connect related information, aggregating salary statistics, and using subqueries to extract meaningful insights.

The dataset contain tables of employee details, salary information, and department assignments.  


## 📂 Database Schema  

This project contains database from [GitHub](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/Beginner%20-%20Parks_and_Rec_Create_db.sql), contains **three tables**:  

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
FROM parks_and_recreation.employee_demographics
WHERE age > 40;
```

#### 2️⃣ Retrieve first name, last name, and salary of all employees  
```sql
SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary;
```

---

### 🔹 Joins & Sorting  
#### 3️⃣ Get all employees along with their salary (Sorted by First Name)  
```sql
SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
ORDER BY ed.first_name ASC;
```

#### 4️⃣ Get employees and occupations, sorted by highest salary  
```sql
SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC;
```

---

### 🔹 Aggregations & Grouping  
#### 5️⃣ Find the average salary for each department  
```sql
SELECT pd.department_name, AVG(es.salary) AS average_salary 
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
ON es.dept_id = pd.department_id
GROUP BY pd.department_name 
ORDER BY average_salary DESC;
```

#### 6️⃣ Count the number of employees in each department  
```sql
SELECT pd.department_name, COUNT(ed.employee_id)
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
LEFT JOIN parks_and_recreation.parks_departments pd
ON es.dept_id = pd.department_id
GROUP BY pd.department_name;
```

#### 7️⃣ Find the highest and lowest salary in the organization  
```sql
SELECT MAX(es.salary) AS highest_salary, MIN(es.salary) AS lowest_salary
FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;
```

---

### 🔹 Advanced Queries & Subqueries  
#### 8️⃣ Retrieve the top 3 highest-paid employees  
```sql
SELECT ed.employee_id, ed.first_name, ed.last_name, es.salary
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
ORDER BY es.salary DESC 
LIMIT 3;
```

#### 9️⃣ Find employees whose first name starts with 'A' (Ordered by Age)  
```sql
SELECT employee_id, first_name, last_name, age 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%' 
ORDER BY age DESC;
```

#### 🔟 Find employees earning more than the average salary  
```sql
SELECT employee_id, first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT AVG(salary)
    FROM parks_and_recreation.employee_salary
    );
```

#### 1️⃣1️⃣ Identify employees who do not have a department assigned  
```sql
SELECT ed.employee_id, ed.first_name, ed.last_name
FROM parks_and_recreation.employee_demographics ed 
LEFT JOIN parks_and_recreation.employee_salary es 
ON ed.employee_id = es.employee_id
WHERE es.dept_id IS NULL;
```

---
✨ _Created by Halyusa Ard Wahyudi as part of a data analytics portfolio._ 🚀


