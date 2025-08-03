# Online-Book-store
# 📚 Books Database SQL Analysis Project

A hands-on SQL project where I analyzed a fictional bookstore's dataset to uncover meaningful insights about book sales, customer behavior, inventory status, and revenue trends. This project simulates real-world analytics workflows using structured SQL queries.

---

## 🔍 Project Overview

This project was designed to demonstrate core and advanced SQL skills including:
- Writing complex queries using `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`
- Working with subqueries and window functions
- Analyzing customer, order, and inventory data
- Solving real-world business problems like:
  - Who are the top customers?
  - Which books are running low on stock?
  - What’s the total revenue and genre-wise sales?

---

## 🛠️ Tech Stack

- **Database**: MySQL
- **Tools Used**: MySQL Workbench / any SQL IDE
- **Tables Involved**: `Books`, `Customers`, `Orders`

---

## 📈 Key Analyses Performed

- Retrieve books by genre, year, price, and stock
- Identify top-selling and low-stock books
- Calculate total revenue and revenue by genre
- Analyze customer spending and order patterns
- Track inventory post-order fulfillment
- Use window functions to rank top customers by country

---

## 📁 Files Included

- `books_analysis_queries.sql` — contains all 20+ SQL queries written and tested
- `README.md` — project overview and explanation
- [ ] *(Optional)* ER diagram or schema design (to be added)

---

## 📊 Example Insights

- **Top-spending customer**: Identified using `GROUP BY` and `ORDER BY SUM() DESC`
- **Remaining stock**: Calculated via `LEFT JOIN` between books and orders
- **Unpurchased books**: Found using `LEFT JOIN` + `IS NULL` logic
- **Genre-wise performance**: Grouped sales and revenue per book category

---
