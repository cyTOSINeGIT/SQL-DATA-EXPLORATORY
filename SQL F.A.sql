CREATE DATABASE Enterprise;

Create table Departments (
department_id INT Primary Key,
department_name VARCHAR(50),
location VARCHAR(50)
);


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

show tables;

Insert into departments values 
(1, 'Sales', 'New York'),
(2, 'HR', 'London'),
(3,	'Engineering',	'San Francisco'),
(4,	'Marketing', 'Chicago'),
(5, 'IT' ,'Austin');

select* from departments;

Insert into employees values
(101,	'Alice Johnson',	1,	80000),
(102,	'Bob Smith',	2,	65000),
(103,	'Charlie Brown',	3,	95000),
(104,	'David Wilson',	4,	70000),
(105,	'Emily Davis',	3,	73000),
(106,	'Frank Lee',	2,	85000),
(107,	'Grace White',	5,	62000),
(108,	'Hannah Green',	4,	75000);

Select* from employees;

Insert into projects values
(201, 'Project Alpha',	1,	45000),
(202, 'Project Beta',	2,	30000),
(203, 'Project Gamma',	3, 80000),
(204, 'Project Delta',	4,	60000),
(205, 'Project Epsilon', 3,	120000),
(206, 'Project Zeta',	1,	70000),
(207, 'Project Eta',	4,	50000),
(208, 'Project Theta',	5,	95000);

INSERT INTO Projects (project_id, project_name, department_id, budget) VALUES
(201, 'Project Alpha', 1, 45000),
(202, 'Project Beta', 2, 30000),
(203, 'Project Gamma', 3, 80000),
(204, 'Project Delta', 4, 60000),
(205, 'Project Epsilon', 3, 120000),
(206, 'Project Zeta', 1, 70000),
(207, 'Project Eta', 4, 50000),
(208, 'Project Theta', 5, 95000);

Select* from projects;

-- 6 Find Employees in Engineering Department (ID = 3) with Salary Greater than 70,000
SELECT *
FROM Employees
WHERE department_id = 3 AND salary > 70000;

-- List Projects in Departments 1 or 4 with a Budget Less Than 50,000.

SELECT *
FROM Projects
WHERE department_id IN (1, 4) AND budget < 50000;

--	Find Employees Not in Department 2.

SELECT * FROM Employees
WHERE department_id != 2;

--	Find Employees with Salary Between 50,000 and 80,000.

SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

--	List All Projects with Budget Greater Than or Equal to 75,000

SELECT * FROM Projects
WHERE budget >= 75000;

--	Find Employees with Salary Not Equal to 90,000

SELECT * FROM Employees
WHERE salary != 90000;

--	Retrieve Employees with Names Starting with 'A' and Salary Above 60,000

Select* from employees 
where name LIKE 'A%' AND Salary > 60000;

--	Find Departments with an ID Less Than 3;

Select * from departments where department_id < 3;

--	Combining Logical and Comparison Operators

SELECT * FROM Employees
WHERE (department_id = 1 AND salary < 90000)
   OR (department_id = 4 AND salary > 60000);


--	List Employees in Either Department 2 or 3 with Salary Greater Than 75,000.

SELECT * FROM Employees
WHERE department_id IN (2, 3) AND salary > 75000;


--	Retrieve Projects with Budget Between 50,000 and 100,000, Not in Department 4

SELECT * FROM Projects
WHERE budget BETWEEN 50000 AND 100000
  AND department_id != 4;


--	Find Employees in Department 1 Whose Name Does Not Contain 'John'

SELECT * FROM Employees
WHERE department_id = 1 AND name NOT LIKE '%John%';

-- 18.	Retrieve Projects Belonging to Departments 1, 3, or 4 with Budget Greater Than 70,000.

Select * from Projects where department_id IN (1,3,4) AND budget > 70000;

-- Find the Total Salary of Employees in Department 2 and Department 3.

Select Sum(Salary) AS total_salary
from employees
where department_id IN (2,3);


-- Calculate Average Salary of Employees Not in Department 4.

Select Avg(Salary) AS Average_Salary from employees where employee_id !=4;

--	Count Projects with Budgets Either Less Than 30,000 or Greater Than 90,000.

Select Count(*) AS Project_Count from projects where budget < 30000 OR budget > 90000;
