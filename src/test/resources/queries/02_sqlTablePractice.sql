-- USE LIBRARY APP TO SOLVE FOLLOWING QUERIES
select * from books;
select * from users;
select * from settings;
select * from book_borrow;

select * from book_categories;



-- TASK 1 --  Get me how many book we have for EACH year
select year,count(*) from books
group by year
order by year desc ;-- if I use group by i have to write all column that after select have

-- TASK 1-1 --  Find me book count between 2000-2021
select year,count(*) as book_count from books
where year between 2000 and 2021
group by year
order by year desc;



-- TASK 1-2 --  Display first 5 highest book count from previous result
select year,count(*) as book_count from books
where year between 2000 and 2021
group by year
order by book_count desc
limit 5;
-- ORACLE --> ROWNUM<6
-- MYSQL  --> LIMIT
-- MSSQL  --> TOP

-- TASK 2 -- Get all book name and related book category name into screen
select b.name,bc.name from books b
inner join book_categories bc on b.book_category_id = bc.id;

-- view
-- functions / store procedures



-- TASK 3 -- Get me book category name which has highest book number
select bc.name,count(*) as book_count from books b
inner join book_categories bc on b.book_category_id = bc.id
group by bc.name
order by book_count desc
limit 1;

-- TASK 4 -- Get me most popular book category name
-- >  (The book needs to borrowed to make category popular)

select bc.name,count(*) as book_count from books b
inner join book_categories bc on b.book_category_id = bc.id
inner join book_borrow bb on b.id = bb.book_id
group by bc.name
order by book_count desc
limit 1;

-- Test Student 1 -- Don't Worry Be Happy -- Fantasy
-- TASK 5 -- Get me student name , book Name and related category name information

select full_name,b.name,bc.name from users u
inner join book_borrow bb on u.id = bb.user_id
inner join books b on bb.book_id = b.id
inner join book_categories bc on b.book_category_id = bc.id;

-- TASK 6 -- Get me most popular student
select full_name,b.name,count(*) as book_count from users u
inner join book_borrow bb on u.id = bb.user_id
inner join books b on bb.book_id = b.id
group by full_name,b.name
order by book_count desc;



-- TASK 7 -- CHALLENGE
-- Get me fullname and book name where same book borrowed more than 1 time from same user
-- EXPLANATION - Assume we have following set of data and we want to see
--  "How many times the book has been borrowed by same student?"

-- INPUT
-- Test Student 1 --> Java
-- Test Student 1 --> Java
-- Test Student 1 --> Selenium
-- Test Student 2 --> Selenium
-- Test Student 2 --> Selenium

-- OUTPUT
-- Test Student 1 --> Java --> 2
-- Test Student 1 --> Selenium --> 1
-- Test Student 2 --> Selenium --> 2

select full_name,b.name,count(*) as book_count from users u
inner join book_borrow bb on u.id = bb.user_id
inner join books b on bb.book_id = b.id
inner join book_categories bc on b.book_category_id = bc.id
group by full_name, b.name
having book_count > 1
order by book_count desc;


-- ---------------------

-- INTERVIEW PREP
-- 1 - What is Primary Key and Foreign Key ?
-- 2 - How do you get different elements in SQL ?
-- 3 - What is group by?
-- 4 - What is difference between WHERE and HAVING?
-- 5 - What types of Joins do you know ?
-- 6 - What are joins?
-- 7 - Can you write a SQL query for me?
--     ( I need a volunteer  )
-- ---------------------