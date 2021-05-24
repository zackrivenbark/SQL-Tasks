-- MIS 504
-- Zachary Rivenbark
-- Project 7

--1.
SELECT Products.ProductID
FROM Products
    LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE [Order Details].ProductID = NULL
ORDER BY Products.ProductID

--2.
SELECT Products.ProductID
FROM Products
    JOIN [Order Details] ON Products.ProductID = [Order Details].[ProductID]
    JOIN Orders ON [Order Details].[OrderID] = Orders.OrderID
WHERE 1996 NOT IN (SELECT YEAR (Orders.OrderDate))
ORDER BY Products.ProductID

--3.
SELECT Customers.CustomerID
FROM Customers
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerID = NULL
ORDER BY Customers.CustomerID

--4.
SELECT Customers.CustomerID
FROM Customers
    JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE 1996 NOT IN (SELECT YEAR (Orders.OrderDate))
ORDER BY Customers.CustomerID

--5.
SELECT Products.ProductName
FROM Products
    JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE EXISTS (SELECT [Order Details].OrderID
            FROM [Order Details]
            WHERE Products.ProductID = [Order Details].ProductID)
ORDER BY Products.ProductName

--6.
SELECT *
FROM Products
GROUP BY Products.ProductID,
    Products.ProductName
HAVING Products.UnitPrice > (SELECT(AVG(Products.UnitPrice)
                                FROM Products))
ORDER BY Products.ProductName