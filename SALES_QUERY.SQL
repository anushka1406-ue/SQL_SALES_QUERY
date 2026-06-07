CREATE SCHEMA anushka14;
CREATE TABLE anushka14.employees(
EmpId INT PRIMARY KEY,
NAME VARCHAR(50),
Department VARCHAR (50),
Salary DECIMAL (10,2),
JoinDate DATE
);

SELECT * FROM Anushka14.employees

ALTER TABLE anushka14.employees
ADD email VARCHAR (100)

ALTER TABLE Anushka14.employees
DROP COLUMN email;

ALTER TABLE anushka14.employees RENAME TO emp;

SELECT * FROM Anushka14.emp

INSERT INTO anushka14.emp (EmpID, Name, Department, Salary, JoinDate) VALUES
(1,'Amit Shar', 'HR', 45000, '2022-01-10'),
(2,'Neha Berma', 'IT', 60000, '2021-03-15'),
(3,'Mustafa Khan', 'Marketing', 50000, '2023-08-16'),
(4,'Mahira Sharma', 'Finance', 40000,'2021-09-11'),
(5,'Shikha Singh', 'Accountant', 35000, '2024-08-17'),
(6,'Rahul Kumar', 'Marketing', 55000,'2022-04-18'),
(7,'Ravi Shah', 'IT', 60000, '2023-07-06'),
(8,'Shivani Kumari', 'HR', 45000, '2020-06-11'),
(9,'Manu Nirwan', 'Finance', 50000, '2024-01-02'),
(10,'Shreya Patel', 'IT', 40000, '2023-02-13');

SELECT * FROM Anushka14.emp 

UPDATE anushka14.emp SET salary= 70000 WHERE EmpID=2
UPDATE anushka14.emp SET Department= 'Finance' WHERE EmpID=2

SELECT empID, NAME,salary FROM anushka14.emp

SELECT * FROM anushka14.emp WHERE salary>60000
SELECT * FROM anushka14.emp ORDER BY salary DESC
SELECT * FROM anushka14.emp ORDER BY salary ASC
SELECT Department, COUNT(*) AS totalEmployees
FROM anushka14.Emp
GROUP BY Department;
 
SELECT Department, AVG(Salary) AS avgsalary
FROM anushka14.emp
GROUP BY Department
HAVING AVG (Salary)> 50000;

CREATE USER anushka WITH PASSWORD 'Password@123';

GRANT USAGE ON SCHEMA anushka14 TO anushka
GRANT CONNECT ON DATABASE postgres TO anushka;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA anushka14
to anushka;

GRANT ALL PRIVILEGES ON TABLE anushka14.emp TO anushka;
REVOKE INSERT ON anushka14.emp FROM anushka;

CREATE DATABASE USCOMPANY_DXB;
CREATE TABLE DEPARTMENT (
    dept_id integer PRIMARY KEY,
    dept_name character varying(50),
    manager_name character varying(50)
);

CREATE TABLE employees (
    empid integer PRIMARY KEY,
    name character varying(50),
    department character varying(50),
	salary numeric(12,2),
    joindate date
);

INSERT INTO department VALUES 
(101, 'HR', 'Sarah Connor'),
(102, 'Finance', 'Michael Scott'),
(103, 'IT', 'Linus Torvalds'),
(104, 'Marketing', 'Don Draper');

INSERT INTO employes VALUES 
(1, 'Amit Sharma', 'HR', 45000.00, '2022-01-15'),
(3, 'Rahul Singh', 'Finance', 55000.00, '2020-07-10'),
(4, 'Priya Mehta', 'IT', 65000.00, '2019-11-20'),
(6, 'Sneha Kapoor', 'HR', 47000.00, '2022-06-05'),
(9, 'John Doe', 'Sales', 50000.00, '2023-01-01');

SELECT e.name, e.department, d.manager_name
FROM employes e
LEFT JOIN department d ON e.department = d.dept_name;

SELECT e.name, e.department, d.manager_name
FROM employes e
RIGHT JOIN department d ON e.department = d.dept_name;

SELECT e.name, e.department, d.manager_name
FROM employes e
FULL JOIN department d ON e.department = d.dept_name;

SELECT e.name, e.department, d.manager_name
FROM employes e
INNER JOIN department d ON e.department = d.dept_name;

QUERIES

Q1- Find employees who joined after 2022
ANS- SELECT Name, Department, JoinDate
FROM anushka14.emp
WHERE JoinDate > '2022-12-31';

Q2- Q5. Find employees earning more than the average salary
ANS- SELECT Name, Salary
FROM anushka14.emp
WHERE Salary > (SELECT AVG(Salary) FROM anushka14.emp);

Q3- Find the minimum and maximum salary in each department
ANS- SELECT Department,
       MIN(Salary) AS Min_Salary,
       MAX(Salary) AS Max_Salary
FROM anushka14.emp
GROUP BY Department
ORDER BY Max_Salary DESC;

Q4- Rank employees by salary using DENSE_RANK
ANS- SELECT Name, Department, Salary,
       DENSE_RANK() OVER (ORDER BY Salary DESC) AS Salary_Rank
FROM anushka14.emp;

Q5- Q15. Find each employee's salary compared to company average using CTE + CASE.
ANS- WITH AvgSalary AS (
    SELECT AVG(Salary) AS Avg_Sal
    FROM anushka14.emp
)
SELECT e.Name, e.Salary,
       ROUND(a.Avg_Sal, 2) AS Company_Avg,
       CASE
           WHEN e.Salary > a.Avg_Sal THEN '🟢 Above Average'
           WHEN e.Salary = a.Avg_Sal THEN '🟡 At Average'
           ELSE '🔴 Below Average'
       END AS Salary_Status
FROM anushka14.emp e, AvgSalary a;












 
















