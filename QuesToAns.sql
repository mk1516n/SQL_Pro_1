-- data cleaning
-- to cheak where id null values in the data row
-- one waay
SELECT * FROM sales
where transactions_id is null;

SELECT * FROM sales
where sale_date is null;

SELECT * FROM sales
where quantiy is null;
-- other way

SELECT * FROM sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- Delete all null vaules from the data
delete from sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- data exploration

-- 1 how many sales u have done
select count(*) as total_sales from sales;

-- 2 how many customer uhave
select count(distinct customer_id) as total_customers from sales;

-- 3 how many category uhave
select count(distinct category) as total_category from sales;
select distinct category from sales;

 -- Data Analysis & Findings

-- The following SQL queries were developed to answer specific business questions:

-- 1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select count(*) from sales
where sale_date = '2022-11-05';

select * from sales
where sale_date = '2022-11-05';

-- 2 Write a SQL query to retrieve all transactions where the category is 'Clothing' 
-- and the quantity sold is more than 4 in the month of Nov-2022
select * from sales
where category = 'Clothing'
and
   TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantiy >= 4;
    
    
    -- 3 Write a SQL query to calculate the total sales (total_sale) for each category
    SELECT 
    category,
    SUM(total_sale) AS total_sales,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category;

-- 4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select category, round(avg(age)), count(*) from sales
where category = 'beauty';

-- 5 Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
select * from sales
where total_sale >= 1000;

-- 6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
select category, gender, count(transactions_id) as total_transactions from sales
group by 1,2
order by 1 asc;

-- 7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
select year(sale_date) as years,
month(sale_date) as months,
avg(total_sale)
from sales
group by 1,2
order by 1 asc, 3 desc;


-- 8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
select customer_id, sum(total_sale) as highest_sales from sales
group by 1
order by highest_sales desc
limit 5;

-- 9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM sales
GROUP BY category;

-- 10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:





    





