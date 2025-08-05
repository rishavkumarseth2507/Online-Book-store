-- 1) Retrieve all books in the "Fiction" genre
SELECT * FROM books
WHERE  genre = 'fiction' ;


-- 2) Find books published after the year 1950
SELECT * FROM books
WHERE Published_Year > 1950;


-- 3) List all customers from the Canada
SELECT * FROM customers
WHERE country = 'Canada' ;


-- 4) Show orders placed in November 2023
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';


-- 5) Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock 
FROM books;


-- 6) Find the details of the most expensive book
SELECT * FROM books
ORDER BY Price DESC
LIMIT 1; 


-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT 
    Customer_ID, SUM(Quantity) AS No_of_books_ordered
FROM
    orders
GROUP BY Customer_ID
HAVING SUM(Quantity) > 1;


-- 8) Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders
WHERE Total_Amount>20;


-- 9) List all genres available in the Books table
SELECT DISTINCT(Genre) FROM books;


-- 10) Find the book with the lowest stock
SELECT * FROM books
ORDER BY stock
LIMIT 1; 


-- 11) Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_Revenue
FROM orders;


-- 12) Retrieve the total number of books sold for each genre
SELECT 
    books.Genre, SUM(orders.Quantity) AS Total
FROM
    books
        JOIN
    orders ON books.Book_ID = orders.Book_ID
GROUP BY books.Genre;


-- 13) Find the average price of books in the "Fantasy" genre
SELECT Genre,AVG(Price) FROM books
GROUP BY Genre
HAVING Genre = 'Fantasy';


-- 14) List customers who have placed at least 2 orders
SELECT 
    customers.customer_id,
    customers.Name,
    COUNT(orders.Order_ID) AS Order_count
FROM
    customers
        JOIN
    orders ON customers.customer_id = orders.customer_id
GROUP BY orders.customer_id , customers.Name
HAVING Order_count >= 2;


-- 15) Find the most frequently ordered books
SELECT 
    orders.Book_ID,
    books.Title,
    COUNT(orders.Order_ID) AS Order_Count
FROM
    orders
        JOIN
    books ON orders.Book_ID = books.Book_ID
GROUP BY orders.Book_ID , books.Title
ORDER BY COUNT(orders.Order_ID) DESC;


-- 16) Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC LIMIT 3;


-- 17) Retrieve the total quantity of books sold by each author
SELECT books.Author, SUM(orders.Quantity)
FROM books JOIN orders ON books.Book_ID = orders.Book_ID
GROUP BY books.Author;


-- 18) List the cities where customers who spent over $30 are located
SELECT DISTINCT customers.City
FROM customers 
JOIN orders ON customers.Customer_ID = orders.Customer_ID
GROUP BY customers.Customer_ID, customers.City
HAVING SUM(orders.Total_Amount) > 30;


-- 19) Find the customer who spent the most on orders
SELECT 
    customers.Customer_ID,
    customers.Name,
    SUM(orders.Total_Amount) AS Total_Spent
FROM
    customers
        JOIN
    orders ON customers.Customer_ID = orders.Customer_ID
GROUP BY customers.Customer_ID , customers.Name
ORDER BY Total_Spent DESC
LIMIT 1;


-- 20) Calculate the stock remaining after fulfilling all orders
SELECT books.Book_ID, books.Title, books.Stock, 
       COALESCE(SUM(orders.Quantity), 0) AS Order_Quantity,  
       books.Stock - COALESCE(SUM(orders.Quantity), 0) AS Remaining_Quantity
FROM books 
LEFT JOIN orders ON books.Book_ID = orders.Book_ID
GROUP BY books.Book_ID, books.Title, books.Stock
ORDER BY books.Book_ID;
