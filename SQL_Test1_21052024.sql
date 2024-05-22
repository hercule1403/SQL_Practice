CREATE TABLE EmployeeInfo (
    EmpID INT PRIMARY KEY,
    EmpFirstName VARCHAR(50) NOT NULL,
    EmpLastName VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Project VARCHAR(100),
    Address VARCHAR(255),
    DOB DATE,
    Gender VARCHAR(10)
);

CREATE TABLE EmployeePosition (
    EmpID INT PRIMARY KEY,
    EmpPosition VARCHAR(100) NOT NULL,
    DOJ DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);



-- Inserting data into EmployeeInfo table
INSERT INTO EmployeeInfo (EmpID, EmpFirstName, EmpLastName, Department, Project, Address, DOB, Gender)
VALUES
(1, 'John', 'Doe', 'HR', 'Project A', '123 Main St, City', '1990-05-15', 'M'),
(2, 'Jane', 'Smith', 'IT', 'Project B', '456 Elm St, Town', '1985-08-20', 'F'),
(3, 'Mike', 'Johnson', 'HR', 'Project A', '789 Oak St, Village', '1988-12-10', 'M'),
(4, 'Sarah', 'Williams', 'Finance', 'Project C', '101 Pine St, County', '1993-04-25', 'F');

-- Inserting data into EmployeePosition table
INSERT INTO EmployeePosition (EmpID, EmpPosition, DOJ, Salary)
VALUES
(1, 'Manager', '2015-03-10', 75000.00),
(2, 'Developer', '2018-06-20', 65000.00),
(3, 'HR Assistant', '2019-01-15', 55000.00),
(4, 'Accountant', '2017-09-05', 70000.00);




--1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.
SELECT UPPER(EmpFirstName) AS EmpName
FROM EmployeeInfo;


--2. Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(*)
FROM EmployeeInfo
WHERE Department = 'HR';


--3. Write a query to get the current date.
SELECT GETDATE();


--4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT SUBSTRING(EmpLastName, 1, 4) AS EmpLastNamePrefix
FROM EmployeeInfo;


--5. Write query to find all the employees whose salary is between 50000 to 100000.
SELECT e.EmpID, e.EmpFirstName, e.EmpLastName, e.Department, e.Project, e.Address, e.DOB, e.Gender, p.EmpPosition, p.DOJ, p.Salary
FROM EmployeeInfo e
JOIN EmployeePosition p ON e.EmpID = p.EmpID
WHERE p.Salary BETWEEN 50000 AND 100000;


--6. Write a query to find the names of employees that begin with ‘S’
SELECT EmpFirstName, EmpLastName
FROM EmployeeInfo
WHERE EmpFirstName LIKE 'S%';


--7. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT(EmpFirstName, ' ', EmpLastName) AS FullName
FROM EmployeeInfo;


--8. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
SELECT Gender, COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE DOB BETWEEN '1970-02-05' AND '1975-12-31'
GROUP BY Gender;


--9. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
SELECT *
FROM EmployeeInfo
ORDER BY EmpLastName DESC, Department ASC;


--10.Write a query to fetch all employees who also hold the managerial position
SELECT e.EmpID, e.EmpFirstName, e.EmpLastName, e.Department, e.Project, e.Address, e.DOB, e.Gender, p.EmpPosition, p.DOJ, p.Salary
FROM EmployeeInfo e
JOIN EmployeePosition p ON e.EmpID = p.EmpID
WHERE p.EmpPosition LIKE '%Manager%';
