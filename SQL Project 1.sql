CREATE DATABASE OnlineBookstore;

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

select * from books
where Genre = 'Fiction';

select * from books
where published_year > 1950;

select * from Customers
where country = 'Canada';

select * from orders
where order_date between '2023-11-01' and '2023-11-30';

select * from books
order by price desc
limit 1;

select * from orders
where quantity > 1;

select * from orders
where total_amount > 20;

select distinct genre from books;

select * from books
order by stock 
limit 1;

Select sum(total_amount) As Revenue 
From Orders;

select * from orders;

select b.genre , sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id
group by b.genre;

select avg(price) as average_price
from books
where Genre = 'Fantasy';

select customer_id ,count (order_id) as order_count
from orders
group by customer_id
having count (order_id) >=2;

select book_id , count(order_id) as order_count
from orders
group by book_id
order by order_count desc limit 1;

select * from books
where genre = 'Fantasy'
order by price desc limit 3;

select b.author , sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id
group by b.author;

select distinct c.city, total_amount
from orders o
join customers c on o.customer_id = c.customer_id
where o.total_amount > 30;

select c.customer_id , c.name , sum(total_amount) as total_spent
from orders o
join customers c on o.customer_id  = c.customer_id
group by c.customer_id , c.name
order by total_spent desc limit 1;

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;









































