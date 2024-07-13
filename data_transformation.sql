
    select count(*)
    from products_s;
    
    select count(*)
    from customers_s;
    
    select count(*) 
    from orders_s;
    
    --
    select * from orders_s;
    
    select * from customers_s;
    
    select * from products_s;
    
    
-- Getting Needed data from 3 tables
    select o.Order_ID,o.Order_Date,o.Customer_ID,o.Product_ID,o.Quantity,c.Customer_Name,c.Email,c.Country,p.Coffee_Type,p.Roast_Type,p.Size,p.Unit_Price
    from orders_s o 
    left join customers_s c on o.Customer_ID = c.Customer_ID 
    left join products_s p on o.Product_ID = p.Product_ID
    
-- Data Transformation

-- 1.Adding new column
	select o.Order_ID,o.Order_Date,o.Customer_ID,o.Product_ID,o.Quantity,c.Customer_Name,c.Email,c.Country,p.Coffee_Type,p.Roast_Type,p.Size,round(p.Unit_Price,2) as Unit_Price, round(o.Quantity*p.Unit_Price,2) as Sales
    from orders_s o 
    left join customers_s c on o.Customer_ID = c.Customer_ID 
    left join products_s p on o.Product_ID = p.Product_ID

-- 2.changing coffee type
    SELECT 
    o.Order_ID,
    o.Order_Date,
    o.Customer_ID,
    o.Product_ID,
    o.Quantity,
    c.Customer_Name,
    c.Email,
    c.Country,
    p.Coffee_Type,
    p.Roast_Type,
    p.Size,
    ROUND(p.Unit_Price, 2) AS Unit_Price,
    ROUND(o.Quantity * p.Unit_Price, 2) AS Sales,
    CASE 
        WHEN p.Coffee_type = 'Rob' THEN 'Robusta'
        WHEN p.Coffee_type = 'Exc' THEN 'Excelsa'
        WHEN p.Coffee_type = 'Ara' THEN 'Arabica'
        WHEN p.Coffee_type = 'Lib' THEN 'Libarica'
        Else NULL
    END AS Coffee_type,
    CASE 
        when p.Roast_Type = "M" then 'Medium'
        when p.Roast_Type = 'L' then 'Light'
        when p.Roast_Type = 'D' then 'Dark'
        Else NULL
    END AS Roast_type
    
FROM 
    orders_s o
LEFT JOIN 
    customers_s c ON o.Customer_ID = c.Customer_ID
LEFT JOIN 
    products_s p ON o.Product_ID = p.Product_ID;


-- 3. changing date format 
    SELECT 
    o.Order_ID,
    DATE_FORMAT(o.Order_Date, '%b-%d-%Y') as Order_Date,
    o.Customer_ID,
    o.Product_ID,
    o.Quantity,
    c.Customer_Name,
    c.Email,
    c.Country,
    p.Coffee_Type,
    p.Roast_Type,
    p.Size,
    ROUND(p.Unit_Price, 2) AS Unit_Price,
    ROUND(o.Quantity * p.Unit_Price, 2) AS Sales,
    CASE 
        WHEN p.Coffee_type = 'Rob' THEN 'Robusta'
        WHEN p.Coffee_type = 'Exc' THEN 'Excelsa'
        WHEN p.Coffee_type = 'Ara' THEN 'Arabica'
        WHEN p.Coffee_type = 'Lib' THEN 'Libarica'
        Else NULL
    END AS Coffee_type,
    CASE 
        when p.Roast_Type = "M" then 'Medium'
        when p.Roast_Type = 'L' then 'Light'
        when p.Roast_Type = 'D' then 'Dark'
        Else NULL
    END AS Roast_type
    
FROM 
    orders_s o
LEFT JOIN 
    customers_s c ON o.Customer_ID = c.Customer_ID
LEFT JOIN 
    products_s p ON o.Product_ID = p.Product_ID;

-- 4. changing quntity to meaningful values for Size
   SELECT 
    o.Order_ID,
    DATE_FORMAT(o.Order_Date, '%b-%d-%Y') as Order_Date,
    o.Customer_ID,
    o.Product_ID,
    o.Quantity,
    c.Customer_Name,
    c.Email,
    c.Country,
    p.Coffee_Type,
    p.Roast_Type,
    concat(p.Size,' kg') as Size,
    ROUND(p.Unit_Price, 2) AS Unit_Price,
    ROUND(o.Quantity * p.Unit_Price, 2) AS Sales,
    CASE 
        WHEN p.Coffee_type = 'Rob' THEN 'Robusta'
        WHEN p.Coffee_type = 'Exc' THEN 'Excelsa'
        WHEN p.Coffee_type = 'Ara' THEN 'Arabica'
        WHEN p.Coffee_type = 'Lib' THEN 'Libarica'
        Else NULL
    END AS Coffee_type,
    CASE 
        when p.Roast_Type = "M" then 'Medium'
        when p.Roast_Type = 'L' then 'Light'
        when p.Roast_Type = 'D' then 'Dark'
        Else NULL
    END AS Roast_type
    
FROM 
    orders_s o
LEFT JOIN 
    customers_s c ON o.Customer_ID = c.Customer_ID
LEFT JOIN 
    products_s p ON o.Product_ID = p.Product_ID;
 
-- 5. currency symbols
  SELECT DISTINCT
    o.Order_ID,
    DATE_FORMAT(o.Order_Date, '%b-%d-%Y') as Order_Date,
    o.Customer_ID,
    o.Product_ID,
    o.Quantity,
    c.Customer_Name,
    c.Email,
    c.Country,
    p.Coffee_Type,
    p.Roast_Type,
    concat(p.Size,' kg') as Size,
    concat('$ ',ROUND(p.Unit_Price, 2)) AS Unit_Price,
    concat('$ ',ROUND(o.Quantity * p.Unit_Price, 2)) AS Sales,
    CASE 
        WHEN p.Coffee_type = 'Rob' THEN 'Robusta'
        WHEN p.Coffee_type = 'Exc' THEN 'Excelsa'
        WHEN p.Coffee_type = 'Ara' THEN 'Arabica'
        WHEN p.Coffee_type = 'Lib' THEN 'Libarica'
        Else NULL
    END AS Coffee_type_Name,
    CASE 
        when p.Roast_Type = "M" then 'Medium'
        when p.Roast_Type = 'L' then 'Light'
        when p.Roast_Type = 'D' then 'Dark'
        Else NULL
    END AS Roast_type_Name
    
FROM 
    orders_s o
LEFT JOIN 
    customers_s c ON o.Customer_ID = c.Customer_ID
LEFT JOIN 
    products_s p ON o.Product_ID = p.Product_ID;
 

    
    
    