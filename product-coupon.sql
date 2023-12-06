SHOW DATABASES;
SHOW TABLES;


CREATE DATABASE mydb;
USE mydb;

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(100),
    price DECIMAL(8 , 3 )
);

CREATE TABLE coupon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) UNIQUE,
    discount DECIMAL(8 , 3 ),
    exp_date VARCHAR(100)
);
SHOW TABLES;
SELECT * FROM product;
SELECT * FROM coupon;

