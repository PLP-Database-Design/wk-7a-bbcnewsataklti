-- Question 1 Achieving 1NF (First Normal Form)
SELECT 
  OrderID,
  CustomerName,
  TRIM(product) AS Product
FROM ProductDetail,
JSON_TABLE(
  CONCAT('[', REPLACE(Products, ', ', '","'), ']'),
  '$[*]' COLUMNS(product VARCHAR(100) PATH '$')
) AS split;
-- Question 2 Achieving 2NF (Second Normal Form)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
SELECT OrderID, Product, Quantity
FROM OrderDetails;
