DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;
DROP TABLE products;

CREATE TABLE products(
  id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100)NOT NULL,
  department_name VARCHAR(50)NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY(id)
);

SELECT * FROM products;

INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Bacon Socks', 'Mens Fashion', 5, 60);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('My Little Pony Headband', 'Accessories', 6, 125);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Black & Decker Iron', 'Household', 40, 37);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Everyday Craft Table', 'Furniture', 75, 8);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Samsung TV ', 'Electronics', 400, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Cheeze-Its', 'Pantry', 2.99, 98);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Caress Soap', 'Personal Care', 1.99, 175);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Word-Search', 'Books', 7.99, 15);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Jawbone Bluetooth Speaker', 'Electronics', 80, 6);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('The Pioneer Woman Dinnerware Set', 'Housewares', 39.99, 14);



