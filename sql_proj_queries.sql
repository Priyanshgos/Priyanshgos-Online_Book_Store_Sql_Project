create database online_book_store;
use online_book_store;

-- I successfully created a database name Online_Book_Store and inside in these created 3 table 
-- 1st books
-- 2nd orders
-- 3rd customers

-- 1 Retrieve all books in the fiction genre
select * from books where genre='fiction';


-- 2 Find all books published after year 1950
 select * from books where Published_Year>1950;
 
 
-- 3 List all customers from canada
select * from customers where country='canada';


-- 4 Show orders placed in November 2023
select * from orders where order_date between '2023-11-01' and '2023-11-30';


-- 5 Retrieve the total stocks of book available
select sum(stock) from books;


-- 6 Find the details of the most expensive books
select * from books order by Price desc;


-- 7 Show all customers who ordered more than 1 quantity of books
select * from orders where quantity>1;


-- 8 Retrieve all orders where the total amount exceeds 50
select * from orders where Total_Amount>50; 


-- 9 List all genre available in the book table
select distinct genre from books;


-- 10 Find the books with the lowest stock
select title, stock from books order by stock limit 1;   -- select min(stock) as lowest_stock from books;


-- 11 Calculate the total revenue generated from all orders
select sum(total_amount) from orders;


-- 12 Find the avg price of books in the fanatsy genre
  select avg(price) from books where genre ='fantasy';



-- ADV
-- 1 Retrieve the total num of books sold for each genre
select b.genre,sum(o.Quantity)
 from orders o
join books b on
 b.Book_ID=o.Book_ID 
group by b.genre;


-- 2 List the customers who have placed atleast 2 orders
select o.customer_id,count(o.order_id),c.name
 from orders o
join customers c on c.Customer_ID=o.Customer_ID
group by o.Customer_ID,c.name
having count(o.Order_ID)>2;


-- 3 Find the most frequently ordered book
select b.title,count(o.book_id) 
from books b 
join orders o on
 o.Book_ID=b.Book_ID
 group by b.title 
 order by count(o.Book_ID) desc;


-- 4 Show top 3 most expensive books of Fantasy Genre
select title,price
 from books 
 where genre='fantasy' 
 order by price desc limit 3;


-- 5 Retrieve the total quantity of books sold by each author
select b.author,sum(o.quantity) 
from books b
 join orders o 
 on o.Book_ID=b.Book_ID 
 group by b.Author 
 order by sum(o.Quantity) desc;


-- 6 List the cities where the customer who spent over 30 are located
select distinct c.city,c.customer_id,o.total_amount 
from customers c 
join orders o on
 o.Customer_ID=c.Customer_ID
 where Total_Amount>30;
 
 
 -- 7 Find the customer who spent most on orders
select c.name,c.customer_id,sum(o.total_amount) 
from customers c join orders o on
 o.Customer_ID=c.Customer_ID
 group by c.name,c.customer_id 
 order by sum(o.Total_Amount) desc limit 1;
 
 
 -- 8 Calculate the stock remaning after fulfilling all orders
select * from books;
select * from orders;
select b.title,b.stock-sum(o.quantity) as remaining_stock
 from books b
 join orders o
 on o.Book_ID=b.Book_ID
 group by b.Book_ID, b.title,b.stock
 order by remaining_stock desc;
