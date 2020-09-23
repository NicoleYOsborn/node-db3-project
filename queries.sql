-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productName AS product,
       c.CategoryName AS category
  FROM product AS p
       JOIN
       category AS c ON p.CategoryId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id,
       s.CompanyName AS shipper
  FROM [order] AS o
       JOIN
       shipper AS s ON o.ShipVia = s.id
 WHERE o.orderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName,
       od.quantity
  FROM OrderDetail AS od
       JOIN
       product AS p ON od.ProductId = p.id
 WHERE od.OrderId = 10251
 ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS orderID,
       c.companyname AS Customer,
       e.lastname
  FROM [order] AS o
       JOIN
       Employee AS e ON o.EmployeeId = e.Id
       JOIN
       Customer AS c ON o.CustomerId = c.id;

    --    Stretch:  Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT categories.categoryname as Category, COUNT(products.productid) as Count
  FROM products
      JOIN
       categories ON products.categoryid = categories.categoryid
 GROUP BY products.categoryid,
          categories.categoryname;

-- Stretch: Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.  

select orders.orderid, count(orderdetails.productid) as ItemCount
    from orders
    join orderdetails on orders.orderid = orderdetails.orderid
    group by orders.orderid;

 -- Stretch - add step

 INSERT INTO steps (instructions, scheme_id, step_number)
  VALUES ('profit', 1, 4);   
    
