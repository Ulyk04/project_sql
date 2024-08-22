CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price INT NOT NULL
)

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(100) NOT NULL
 )

CREATE TABLE sales_regions(
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL
)

CREATE TABLE sales(
    sale_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount INT NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)

INSERT INTO products(name , category,price)
VALUES('Dress' , 'Women' , 150),
('Socks' , 'Unisex' , 10),
('Shirt' , 'Men' , 80)

INSERT INTO customers(name , email , region)
VALUES('Murat Josh' , 'mura@gmail.com' , 'Moscow'),
('Buri Hasha', 'buri@gmail.com' , 'Mumbai'),
('Sasha M' , 'ms@gmail.com' , 'Amsterdam')

INSERT INTO sales_regions(region_name)
VALUES('India'),
('Russia'),
('Netherlands')

INSERT INTO sales(product_id , customer_id , sale_date , quantity , total_amount)
VALUES( 1, 3 , CURRENT_DATE, 15 , 2250),
(2 , 1 , CURRENT_DATE , 100 , 1000),
(3 , 2 , CURRENT_DATE , 50 , 4000)

SELECT 
      p.name,
      s.quantity,
      s.total_amount
FROM products p
JOIN sales s ON p.product_id = s.product_id

SELECT 
    sr.region_name, 
    s.quantity AS total_units_sold, 
    s.total_amount AS total_revenue
FROM 
    sales s
JOIN 
    customers c ON s.customer_id = c.customer_id
JOIN 
    sales_regions sr ON c.region = sr.region_name

SELECT 
    SUM(total_amount) AS total_revenue
FROM 
    sales;

SELECT 
    SUM(quantity) AS total_units_sold
FROM 
    sales;

