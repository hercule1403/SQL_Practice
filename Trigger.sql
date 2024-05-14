CREATE TRIGGER UpdateSalaryTrigger
ON Employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Salary column for each updated row
    UPDATE E
    SET Salary = I.Salary * 1.1 
    FROM Employees AS E
    INNER JOIN inserted AS I ON E.EmployeeID = I.EmployeeID;
END;


UPDATE Employees
SET Salary = Salary + (Salary * 0.1); 


SELECT * FROM Employees;