CREATE DATABASE BOSSCODER;
USE BOSSCODER;
CREATE TABLE BOSS_SQL_DAY1
(

);
-- WRITE SQL QUERY TO INSERT NEW RECORDE INTO  "EMPLOYEE" TABLE.
INSERT INTO EMPLOYEE (NAME,DEPARTMENT,SALARY)
VALUES('SHUBHAM','IT',70000);
-- WRITE SQL QUERY TO UPDATE THE "QUANTITY" COLUMN OF "PRODUCT" TABLE TO 10 WHERE PRODUCT_ID IS 5;
UPDATE PRODUCT   SET QUANTITY = 10
WHERE PRODUCT_ID=5
-- DELETE ALL RECORD FOR ORDER TABLE WHERE STATUS IS "CANCELLED"
DELETE FROM ORDERS
WHERE STATUS = 'CANCELLED';

##############################################################################################################
####################  DAY 2
-- FILTERING AND SORTING OF DATA
SELECT * FROM EMPLOYEES WHERE SALARY > 50000;

SELECT * FROM PRODUCT
WHERE CATEGORY='ELECTORNICS' AND PRICE < 1000;

SELECT * FROM CUSTOMER 
ORDER BY CUSTOMER_NAME ASC;

SELECT COUNT(*) AS TOTAL_NO_RECORDS FROM ORDERS;

##############################################################################################################
####################  DAY 3
-- JOINING TABLE

	-- Create CUSTOMER table

CREATE TABLE CUSTOMER (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Insert 30 records into CUSTOMER table
INSERT INTO CUSTOMER (customer_name, city, country) VALUES
('Alice Johnson', 'New York', 'USA'),
('Bob Smith', 'Los Angeles', 'USA'),
('Charlie Brown', 'London', 'UK'),
('David Lee', 'Tokyo', 'Japan'),
('Emma Garcia', 'Paris', 'France'),
('Frank Rodriguez', 'Berlin', 'Germany'),
('Grace Martinez', 'Toronto', 'Canada'),
('Henry Nguyen', 'Sydney', 'Australia'),
('Isabella Kim', 'Seoul', 'South Korea'),
('Jack Wilson', 'Moscow', 'Russia'),
('Kevin Hernandez', 'Mexico City', 'Mexico'),
('Lily Chen', 'Beijing', 'China'),
('Michael Lopez', 'Madrid', 'Spain'),
('Natalie Wong', 'Rome', 'Italy'),
('Olivia Taylor', 'Cairo', 'Egypt'),
('Peter Patel', 'Mumbai', 'India'),
('Queen Adams', 'Rio de Janeiro', 'Brazil'),
('Robert Brown', 'Cape Town', 'South Africa'),
('Sophia Kim', 'Bangkok', 'Thailand'),
('Thomas Garcia', 'Buenos Aires', 'Argentina'),
('Uma Sharma', 'Delhi', 'India'),
('Victor Silva', 'Lisbon', 'Portugal'),
('Wendy Li', 'Shanghai', 'China'),
('Xavier Martin', 'Dubai', 'UAE'),
('Yasmine Johnson', 'Jerusalem', 'Israel'),
('Zoe Nguyen', 'Hanoi', 'Vietnam'),
('Aaron Wong', 'Singapore', 'Singapore'),
('Bella Patel', 'Dhaka', 'Bangladesh'),
('Carlos Perez', 'Lima', 'Peru');

-- Create ORDER_DETAILS table
CREATE TABLE ORDER_DETAILS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

-- Insert 30 records into ORDER_DETAILS table
INSERT INTO ORDER_DETAILS (customer_id, order_date, total_amount) VALUES
(1, '2024-04-01', 100.50),
(2, '2024-04-02', 75.20),
(3, '2024-04-03', 200.75),
(4, '2024-04-04', 150.00),
(5, '2024-04-05', 300.80),
(6, '2024-04-06', 50.25),
(7, '2024-04-07', 180.90),
(8, '2024-04-08', 90.60),
(9, '2024-04-09', 120.30),
(10, '2024-04-10', 250.70),
(11, '2024-04-11', 175.40),
(12, '2024-04-12', 80.00),
(13, '2024-04-13', 210.20),
(14, '2024-04-14', 95.50),
(15, '2024-04-15', 180.75),
(16, '2024-04-16', 300.20),
(17, '2024-04-17', 150.90),
(18, '2024-04-18', 110.60),
(19, '2024-04-19', 220.30),
(20, '2024-04-20', 140.70),
(21, '2024-04-21', 185.40),
(22, '2024-04-22', 70.00),
(23, '2024-04-23', 195.20),
(24, '2024-04-24', 105.50),
(25, '2024-04-25', 160.75),
(26, '2024-04-26', 280.20),
(27, '2024-04-27', 130.90),
(28, '2024-04-28', 90.60),
(29, '2024-04-29', 200.30);


SELECT * FROM CUSTOMER;
SELECT * FROM ORDER_DETAILS;

-- WRITE QUERY TO FIND NAME , ORDER DATA FROM TABLE;
SELECT O.ORDER_DATE,C.CUSTOMER_NAME FROM order_details AS O
JOIN customer AS C
ON O.customer_id=C.customer_id;

-- WRITE QUERY TO TO RETRIVE PRODUCT NAME,  CATEGORY AND SUPLLIER NAME  FROM PRODUCT ,CATEGORY AND SUPPLIER TABLE AND JOINING THEM ON APPROPRIATE COLUMN

 -- Create PRODUCT table
CREATE TABLE PRODUCT (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
);

-- Create CATEGORY table
CREATE TABLE CATEGORY (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Create SUPPLIER table
CREATE TABLE SUPPLIER (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(50)
);
SELECT * FROM SUPPLIER;

-- Insert 10 records into CATEGORY table
INSERT INTO CATEGORY (category_name) VALUES
('Electronics'),
('Clothing'),
('Furniture'),
('Books'),
('Food'),
('Toys'),
('Appliances'),
('Sporting Goods'),
('Cosmetics'),
('Jewelry');

-- Insert 10 records into SUPPLIER table
INSERT INTO SUPPLIER (supplier_name) VALUES
('ABC Electronics'),
('XYZ Clothing'),
('123 Furniture'),
('DEF Books'),
('GHI Foods'),
('JKL Toys'),
('MNO Appliances'),
('PQR Sports'),
('STU Cosmetics'),
('VWX Jewelry');

-- Insert 10 records into PRODUCT table
INSERT INTO PRODUCT (product_name, category_id, supplier_id) VALUES
('Laptop', 1, 1),
('T-shirt', 2, 2),
('Sofa', 3, 3),
('Novel', 4, 4),
('Chocolate', 5, 5),
('Action Figure', 6, 6),
('Refrigerator', 7, 7),
('Football', 8, 8),
('Lipstick', 9, 9),
('Necklace', 10, 10);



SELECT * FROM SUPPLIER;
SELECT * FROM PRODUCT;
SELECT * FROM CATEGORY;
select
		P.PRODUCT_NAME,
		S.SUPPLIER_NAME,
		C.CATEGORY_NAME
FROM PRODUCT AS P
		JOIN SUPPLIER AS S
			ON P.supplier_id=S.supplier_id
		JOIN  CATEGORY C
			ON P.category_id=C.category_id
            
-- WRTIE QUERY TO FIND EMPLOYEE NAME AND DEPARTMENT NAME FROM RESPECTIVE TABLE
-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert 10 records into DEPARTMENT table
INSERT INTO DEPARTMENT (department_name) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing'),
('Operations'),
('Sales'),
('Engineering'),
('Customer Service'),
('Administration'),
('Research and Development');

-- Insert 10 records into EMPLOYEE table
INSERT INTO EMPLOYEE (employee_name, department_id, salary, hire_date) VALUES
('John Doe', 1, 60000.00, '2023-01-01'),
('Jane Smith', 2, 55000.00, '2023-02-15'),
('Alice Johnson', 3, 70000.00, '2023-03-10'),
('Bob Williams', 4, 62000.00, '2023-04-05'),
('Emily Brown', 5, 65000.00, '2023-05-20'),
('Michael Davis', 6, 68000.00, '2023-06-25'),
('Sarah Wilson', 7, 63000.00, '2023-07-10'),
('David Miller', 8, 60000.00, '2023-08-15'),
('Jennifer Taylor', 9, 59000.00, '2023-09-01'),
('Kevin Anderson', 10, 57000.00, '2023-10-05');
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;


SELECT	
E.employee_name,
D.DEPARTMENT_NAME
FROM EMPLOYEE AS E
JOIN DEPARTMENT AS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;
-- FIND ALL ORDER WHICH HIGHER THAN 250

SELECT C.customer_id,O.TOTAL_AMOUNT
FROM customer AS C
JOIN order_details AS O
ON C.customer_id=O.customer_id
WHERE total_amount > 250;
;


SELECT C.customer_id,SUM(O.TOTAL_AMOUNT)
FROM customer AS C
JOIN order_details AS O
ON C.customer_id=O.customer_id
group by C.customer_id
HAVING SUM(total_amount) > 500
order by SUM(total_amount) DESC;


SELECT DISTINCT O.order_id, C.customer_id, O.total_amount
FROM customer AS C
JOIN order_details AS O ON C.customer_id = O.customer_id;

###########################################################################################################################
******DAY 4 AGGREGATIND DATA **********
-- FIND TOTAL NO OF ORDER FOR EACH CUSTOMER
SELECT * FROM ORDER_DETAILS;
SELECT customer_id ,COUNT(*) FROM ORDER_DETAILS
GROUP BY customer_id;

-- FIND AVG PRICE OF PRODUCT FOR EACH CATEGORY
ALTER TABLE PRODUCT ADD column PRICE DECIMAL(10,2);
INSERT INTO PRODUCT (product_name, category_id, supplier_id, price) VALUES
('Laptop', 1, 1, 1000.00),
('T-shirt', 2, 2, 20.00),
('Sofa', 3, 3, 500.00),
('Novel', 4, 4, 10.00),
('Chocolate', 5, 5, 5.00),
('Action Figure', 6, 6, 15.00),
('Refrigerator', 7, 7, 800.00),
('Football', 8, 8, 30.00),
('Lipstick', 9, 9, 8.00),
('Necklace', 10, 10, 50.00);

SELECT * FROM PRODUCT;
SELECT * FROM CATEGORY;
select *,
round(avg(T.price))as AVG_PRICE  FROM
(SELECT	P.PRODUCT_NAME,
		C.CATEGORY_NAME,
        P.PRICE
FROM PRODUCT AS P
		JOIN  CATEGORY C
			ON P.category_id=C.category_id) AS T
group by T.CATEGORY_NAME
order by AVG_PRICE
;

*******employee
select * from employee;
select employee_name,employee_id,department_id,max(salary) from employee
group by department_id;


-********order_DETAILS
-- TOTAL REVEUE GENERATED BY EACH CUSTOMER 
SELECT * FROM ORDER_DETAILS;
SELECT CUSTOMER_ID ,SUM(TOTAL_AMOUNT)
FROM ORDER_DETAILS
GROUP BY CUSTOMER_ID;

