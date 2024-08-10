
CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL
)

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone BIGINT,
    address VARCHAR(100) UNIQUE
)

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount INT NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)

CREATE TABLE order_table(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
)

INSERT INTO products(name , description , price , stock)
VALUES('Laptop' , 'HP RROBOOK 4530s' , 2000 , 12),
('TELEPHONE' , 'Vivo 12s' , 930 , 5)

INSERT INTO customers( name , email , phone , address)
VALUES('Blade Jackson' , 'bladej@gmail.com' , 12345 , 'Woll.str 125' ),
('Resad Garazade' , 'garazade1@gmail.com', 21354 , 'Yolasigmaz sok,No 8')

INSERT INTO orders(customer_id, order_date , total_amount)
VALUES( 2 , '2024-08-08' , 2000),
( 1 , '2024-07-24' , 2930)

INSERT INTO order_table( order_id , product_id , quantity , price)
VALUES(1 , 1 , 1 , 2000),
(2 , 1 , 1 , 2000),
(2 , 2 , 1 , 930)

SELECT o.customer_id , o.order_date , o.total_amount
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id = 2