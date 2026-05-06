CREATE TABLE Employee (
    emp_id INT,
    name VARCHAR(50),
    age INT,
    salary INT,
    department_id INT,
    hire_date DATE
);

CREATE TABLE Department (
    department_id INT,
    name VARCHAR(50)
);

CREATE TABLE Project (
    project_id INT,
    name VARCHAR(50),
    department_id INT
);
INSERT INTO Employee VALUES
(1, 'John Doe', 28, 50000, 1, '2020-01-15'),
(2, 'Jane Smith', 34, 60000, 2, '2019-07-23'),
(3, 'Bob Brown', 45, 80000, 1, '2018-02-12'),
(4, 'Alice Blue', 25, 45000, 3, '2021-03-22'),
(5, 'Charlie P.', 29, 50000, 2, '2019-12-01');

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Project VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 1),
(4, 'Project Delta', 3),
(5, 'Project Epsilon', 4);

SELECT * FROM Employee;

SELECT name, salary FROM Employee;

SELECT * FROM Employee
WHERE age > 30;

SELECT name FROM Department;

SELECT * FROM Employee
WHERE department_id = 1;

SELECT * FROM Employee
WHERE name LIKE 'J%';

SELECT * FROM Employee
WHERE name LIKE '%e';

SELECT * FROM Employee
WHERE name LIKE '%a%';

SELECT * FROM Employee
WHERE LENGTH(name) = 9;

SELECT * FROM Employee
WHERE name LIKE '_o%';

SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

SELECT * FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;

SELECT SUM(salary) FROM Employee;

SELECT AVG(salary) FROM Employee;

SELECT MIN(salary) FROM Employee;

SELECT department_id, COUNT(*) 
FROM Employee
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id, AVG(age)
FROM Employee
GROUP BY department_id;

SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date);

SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id, AVG(salary) AS avg_sal
FROM Employee
GROUP BY department_id
ORDER BY avg_sal DESC
LIMIT 1;

SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

SELECT * FROM Employee
ORDER BY salary ASC;

SELECT * FROM Employee
ORDER BY age DESC;

SELECT * FROM Employee
ORDER BY hire_date ASC;

SELECT * FROM Employee
ORDER BY department_id, salary;

SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
ORDER BY SUM(salary);

SELECT e.name, d.name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

SELECT p.name, d.name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

SELECT e.name, p.name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

SELECT e.name, d.name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;