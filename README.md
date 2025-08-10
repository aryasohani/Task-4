
#Task4- SQL for Data Analysis
# SQL Data Analysis - Ecommerce Dataset

## Overview
SQL queries on an Ecommerce dataset using **MySQL** and **MySQL Workbench** for data extraction, joins, aggregation, subqueries, views, and indexing.

## Dataset Tables
- **customers**: customer details  
- **orders**: order info & timestamps  
- **order_items**: products in each order, price, freight  
- **products**: product details & dimensions  

## Queries Included
1. View sample rows from each table.  
2. Filter products with price > 1000.  
3. Total spent by each customer.  
4. Join orders, customers, products.  
5. Products above average price.  
6. Create view for high-value orders (> 5000).  
7. Create index on `order_items.price`.  

## How to Run
1. Open MySQL Workbench → `USE ecommerce;`  
2. Run queries from `queries.sql` one by one.  
3. Save query outputs in `screenshots/` folder.

## Outcome
- Hands-on SQL practice with real dataset.  
- Used **SELECT, WHERE, GROUP BY, JOIN, subquery, view, index**.
