CREATE TABLE items(
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    location VARCHAR(100) NOT NULL
)

CREATE TABLE suppliers(
    suplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
)

CREATE TABLE shipments(
    shipment_id SERIAL PRIMARY KEY,
    supplier_id INT NOT NULL,
    shipment_date DATE NOT NULL,
    item_id INT NOT NULL,
    quantity_received INT NOT NULL,

    FOREIGN KEY (supplier_id) REFERENCES suppliers(suplier_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
)

CREATE TABLE outgoing_shipments(
    outgoing_id SERIAL PRIMARY KEY,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    dispatch_date DATE NOT NULL,
    destination VARCHAR(100) NOT NULL,

    FOREIGN KEY (item_id) REFERENCES items(item_id)
)

INSERT INTO items(item_name,
description,
quantity,
location)
VALUES('Smartphone' , 'iPhone 15 Pro' , 150 , 'Chine'),
('TV' , 'Samsung Start 1' , 100 , 'Korea'),
('Laptop' , 'HP Switch' , 80 , 'Vietnam')

INSERT INTO suppliers(
    name,
    contact_info
)
VALUES('Chi Da' , '12-12-159'),
('Zanzswuang Mi' , '15-16-148'),
('Mia Hoo' , '165-189-174')

INSERT INTO shipments(
    supplier_id,
    shipment_date,
    item_id,
    quantity_received
)
VALUES(1 , '2024-08-15' , 1 , 100),
(2 , '2024-08-26' , 2 , 85),
(3, '2024-07-01' , 3 , 80)

INSERT INTO outgoing_shipments(
    item_id,
    quantity,
    dispatch_date,
    destination
)
VALUES(1, 100 , '2024-08-25' , 'USA'),
(2 , 85 , '2024-09-01' , 'Kazakhstan'),
(3 , 80 , '2024-08-05' , 'Turkey')

SELECT items.item_id , items.item_name,items.description , 
COALESCE(SUM(shipments.quantity_received) , 0) - COALESCE(SUM(outgoing_shipments.quantity) , 0) AS stock_balance,
items.location
FROM items
LEFT JOIN shipments ON items.item_id = shipments.item_id
LEFT JOIN outgoing_shipments ON items.item_id = outgoing_shipments.outgoing_id
GROUP BY items.item_id , items.item_name , items.description , items.location  