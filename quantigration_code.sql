# Analyze sales data by state to determine where the company has the largest customer base.

SELECT Customers.State AS State, COUNT(*) AS Product Sales
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY State
ORDER BY Product Sales ASC; 

#Determine top three product SKUs sold in United States

SELECT Orders.SKU, COUNT(*)
FROM Orders
GROUP BY Orders.SKU
ORDER BY COUNT(*) DESC;

/*Analyze the data to determine the top three products sold in the southeastern region 
(Virginia, North Carolina, South Carolina, Georgia) of the United States*/

SELECT Orders.SKU, COUNT (*)
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomersID
WHERE Customers.State IN ('Virginia', 'North Carolina', 'South Carolina', 'Georgia')
GROUP BY Orders.SKU
ORDER BY COUNT(*) DESC;

#Analyze the data to determine the top three products returned in the United States.

SELECT Orders.SKU, COUNT(*)
FROM Orders
INNER JOIN RMA on RMA.OrderID = Orders.OrderID
GROUP BY Orders.SKU
ORDER BY COUNT(*) DESC;

/* Analyze the data to determine the top three products returned in the northwestern region of the United States 
(Washington, Oregon, Idaho, Montana) */

SELECT Orders.SKU, COUNT(*)
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
WHERE Customers.State IN ('Washington', 'Oregon', 'Idaho', 'Montana')
GROUP BY Orders.SKU
ORDER BY COUNT(*) DESC;

