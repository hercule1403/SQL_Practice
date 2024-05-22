-- Table 1
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(50),
    Country NVARCHAR(50)
);


INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'Australia');



-- Table 2
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount)
VALUES 
(1, '2023-01-10', 1, 100.00),
(2, '2023-02-15', 1, 150.00),
(3, '2023-03-20', 2, 200.00),
(4, '2023-04-25', 5, 250.00); 

-- INNER JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


-- LEFT JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- GROUP BY, HAVING, ORDER BY, and EXISTS
SELECT Customers.CustomerID, Customers.CustomerName, SUM(Orders.Amount) AS TotalAmount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
)
GROUP BY Customers.CustomerID, Customers.CustomerName
HAVING SUM(Orders.Amount) > 200
ORDER BY TotalAmount DESC;