-- EmployeeInfo table using CTE
WITH EmployeeInfoData AS (
    SELECT * FROM (
        VALUES
            (1, 'John', 'Doe', 'HR', 'Project A', '123 Main St, City', '1990-05-15', 'M'),
            (2, 'Jane', 'Smith', 'IT', 'Project B', '456 Elm St, Town', '1985-08-20', 'F'),
            (3, 'Mike', 'Johnson', 'HR', 'Project A', '789 Oak St, Village', '1988-12-10', 'M'),
            (4, 'Sarah', 'Williams', 'Finance', 'Project C', '101 Pine St, County', '1993-04-25', 'F')
    ) AS TempTable(EmpID, EmpFirstName, EmpLastName, Department, Project, Address, DOB, Gender)
)
INSERT INTO EmployeeInfo (EmpID, EmpFirstName, EmpLastName, Department, Project, Address, DOB, Gender)
SELECT EmpID, EmpFirstName, EmpLastName, Department, Project, Address, DOB, Gender
FROM EmployeeInfoData;

--EmployeePosition table using CTE
WITH EmployeePositionData AS (
    SELECT * FROM (
        VALUES
            (1, 'Manager', '2015-03-10', 75000.00),
            (2, 'Developer', '2018-06-20', 65000.00),
            (3, 'HR Assistant', '2019-01-15', 55000.00),
            (4, 'Accountant', '2017-09-05', 70000.00)
    ) AS TempTable(EmpID, EmpPosition, DOJ, Salary)
)
INSERT INTO EmployeePosition (EmpID, EmpPosition, DOJ, Salary)
SELECT EmpID, EmpPosition, DOJ, Salary
FROM EmployeePositionData;
