create database supermarket_sales;
use supermarket_sales;
rename table `supermarket sales cleaned` to sales;
-- Q1 Total Revenue 
select round(sum(total),2) as total_revenue from sales;
-- Q2 Total Transactions
select count(*) as total_transactions from sales;
-- Q3 Average Transaction values
select avg(total) as avg_transaction from sales;
-- Q4 Revenue by Branch
select Branch,round(sum(Total),2) as revenue from sales group by Branch order by revenue desc;
-- Q5 Best Perfoming Branch
select Branch,sum(total) as revenue from sales group by Branch order by Revenue desc limit 1;
-- Q6 Revenue by Product Line
select `Product line`,round(sum(Total),2) as revenue from sales group by `Product line` order by revenue desc;
-- Q7 best selling product line
select `Product line`,round(sum(Total),2) as revenue from sales group by `Product line` order by revenue desc limit 1;
-- Q8 Member vs Normal Revenue
select `Customer type`,round(sum(total),2) as revenue from sales group by `Customer type` order by revenue;
-- Q9 Revenue by Gender
select Gender,sum(total) as revenue from sales group by Gender;
-- Q10 Most used payment method
select Payment,count(*) as transaction from sales group by Payment order by transaction desc;
-- Q11 Revenue by city
select City,round(sum(total),2) as revenue from sales group by City;
-- Q12 Highest rated product line
select `Product line`,round(avg(Rating),2) as rating from sales group by `Product line` order by rating desc;
-- Q13 Product line above average  revenue
select `Product line`,sum(total) as revenue from sales group by `Product line`  having revenue > (select avg(total_revenue) from ( select sum(total) as total_revenue  from sales group by `Product line`) x );
-- Q14 Monthly revenue Trend 
select Month,round(sum(total),2) as revenue from sales group by Month order by Month;
-- Q15 top 5 transaction
select * from sales order by total desc limit 5;
