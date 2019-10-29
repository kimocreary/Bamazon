DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;

CREATE TABLE products(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100),
  department_name VARCHAR(50),
  price INTEGER
  stock_quantity INTEGER(1000),
);



INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('200', 'bacon socks', 'mens fashion', '5', 60);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('201', 'headband', 'accessories', '6', 125);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('202', 'iron', 'household', '40', 37);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('203', 'craft table', 'furniture', '75', 8);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('204', 'tv', 'electronics', '400', 15);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('205', 'cheeze-its', 'pantry', '2.99', 98);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('206', 'soap', 'personal care', '1.99', 175);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('207', 'word-search', 'books', '7.99', 15);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('208', 'bluetooth speaker', 'electronics', '80', 6);
INSERT INTO products (id, product_name, department_name, price, stock_quantity) values ('209', 'dinnerware set', 'housewares', '39.99', 14);



SELECT * FROM authors;
SELECT * FROM books;

-- show ALL books with authors
-- INNER JOIN will only return all matching values from both tables
SELECT title, firstName, lastName
FROM books
INNER JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
SELECT title, firstName, lastName
FROM books
LEFT JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
SELECT title, firstName, lastName
FROM books
RIGHT JOIN authors ON books.authorId = authors.id;
