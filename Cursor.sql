

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'employee_cursor' AND type = 'CURSOR')
BEGIN
    DECLARE @sql NVARCHAR(MAX) = '
        DECLARE @EmployeeID INT;
        DECLARE @Salary DECIMAL(10, 2);
        CLOSE employee_cursor; 
        DEALLOCATE employee_cursor;'
    EXEC sp_executesql @sql;
END

-- Create  table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert into the table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES
    (1, 'John', 'Doe', 50000.00),
    (2, 'Jane', 'Smith', 60000.00),
    (3, 'Mike', 'Johnson', 55000.00),
    (4, 'Emily', 'Brown', 62000.00),
    (5, 'Chris', 'Wilson', 58000.00);

--  Declare variables for fetching data
DECLARE @EmployeeID INT;
DECLARE @Salary DECIMAL(10, 2);

-- Declare the cursor
DECLARE employee_cursor CURSOR FOR
    SELECT EmployeeID, Salary
    FROM Employees;

--  Open the cursor
OPEN employee_cursor;

-- Fetch the first row from the cursor
FETCH NEXT FROM employee_cursor INTO @EmployeeID, @Salary;

-- Start looping through the cursor and update salary
WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Employees
    SET Salary = Salary * 1.1 
    WHERE EmployeeID = @EmployeeID;

    -- Fetch the next row from the cursor
    FETCH NEXT FROM employee_cursor INTO @EmployeeID, @Salary;
END;

--  Close the cursor
CLOSE employee_cursor;

-- Deallocate the cursor
DEALLOCATE employee_cursor;

-- Verify the updated salaries
SELECT * FROM Employees;
