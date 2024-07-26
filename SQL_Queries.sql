select * from pizza_sales

-- KPI REQURIREMENTS

-- Find Total Revenue

SELECT SUM(total_price) AS Total_Revenue from pizza_sales

-- Avg order Value

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_Value from pizza_sales

-- Total Pizza Sold

SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

-- Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

-- Avg Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales


-- CHARTS REQUIREMENTS

-- Daily Trends for Total Orders
 
 SELECT DATENAME(DW, order_date) as Order_Day, 
 COUNT(DISTINCT(order_id)) AS Total_Orders
 FROM pizza_sales
 GROUP BY DATENAME(DW, order_date)

 -- Monthly Trend for Total Orders

 SELECT DATENAME(MONTH, order_date) AS Month_Name, 
 COUNT(DISTINCT order_id) AS Total_Orders_By_Month from pizza_sales
 GROUP BY DATENAME(MONTH, order_date)
 ORDER BY Total_Orders_By_Month DESC

 -- Percentage of sale by Pizza Category

 SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS PCT  
 FROM pizza_sales 
 WHERE MONTH(order_date) = 1
 GROUP By pizza_category 

-- Percentage of Sales by Pizza Size

 SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
 (SELECT SUM(total_price) from pizza_sales  WHERE DATEPART(quarter, order_date) = 1) AS DECIMAL(10,2)) AS PCT  
 FROM pizza_sales 
 WHERE DATEPART(quarter, order_date) = 1
 GROUP BY pizza_size 
 ORDER BY PCT DESC

 -- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

 SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Revenue DESC
 
 -- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

 SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Revenue ASC

--Top 5 seller By Quantity

 SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Quantity DESC

--Bottom 5 seller By Quantity

 SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Quantity ASC

 --Top 5 by Orders

 SELECT TOP 5 pizza_name, SUM(order_id) AS Total_Orders from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Orders DESC

 --Bottom 5 by Orders

 SELECT TOP 5 pizza_name, SUM(order_id) AS Total_Orders from pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Orders ASC

 -- To Check Server Name

  SELECT @@SERVERNAME














  
