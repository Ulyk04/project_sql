CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL

)

CREATE TABLE menu(
    menu_id SERIAL PRIMARY KEY,
    dish_name VARCHAR(100) NOT NULL,
    price INT
)

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount INT NOT NULL,
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)

CREATE TABLE order_item(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount VARCHAR(50) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

INSERT INTO menu(dish_name , price)
VALUES('Hamburger' , 100),
('Cheeseburger', 200),
('Pizza' , 150)

INSERT INTO customers(name , phone , email)
VALUES('Mocha Mia' , '12-250-36' , 'miamocha@gmail.com'),
('Mate Morti' , '365-89-75' , 'morimori@gmail.com'),
('Michael Jackson' , '88-85-86' , 'bejack@gmail.com')

INSERT INTO orders(customer_id, order_date , total_amount)
VALUES(1 , '2024-08-15' , 100),
(2 , '2024-08-15' , 300),
(3, '2024-08-15' , 350)

INSERT INTO order_item(order_id , menu_id , quantity)
VALUES(1 , 1 , 1),
(2 , 1 , 2),
(3 , 2 , 2)

INSERT INTO payments(order_id, payment_date, amount)
VALUES(1 , '2024-08-15' , 1),
(2 , '2024-08-15' , 2),
(3 , '2024-08-15' , 3)

SELECT 
    orders.order_date,
    orders.total_amount,
    customers.name,
    customers.phone
FROM
    orders
JOIN customers ON orders.customer_id =customers.customer_id