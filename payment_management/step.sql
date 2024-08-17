CREATE TABLE clients(
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(50) NOT NULL
)

CREATE TABLE invoices(
    invoice_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    amount VARCHAR(50) NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients(client_id)
)

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount INT NOT NULL,
    payment_method VARCHAR(100) NOT NULL,

    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
)

CREATE TABLE payment_methods (
    method_id SERIAL PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL
)

INSERT INTO clients(name , email , address)
VALUES('Turko Node' , 'node@gmail.com' , 'Wall-street 54'),
('Johnathon Made' , 'jmade@gmail.com' , 'New-gold 55'),
('Mia Malika' , 'miam@gmail.com' , 'Gold 45')

INSERT INTO invoices(client_id , amount, issue_date , due_date , status)
VALUES(1 , 1500 , '2024-08-15' , '2024-08-15' , 'Peyment received') , 
(2 , 1200 , '2024-08-20' , '2024-08-20', 'Payment not received'), 
(3 , 1600 , '2024-08-16' , '2024-08-16' , 'Payment received')

INSERT INTO payments(invoice_id , payment_date ,amount , payment_method)
VALUES(1, '2024-08-15' , 1500 , 'Online transfer'),
(2 , '2024-08-20', 1200 , 'Payment of a fine'),
(3,  '2024-08-16' , 1600 , 'Online transfer')

INSERT INTO payment_methods(method_name)
VALUES('Online transfer'),
('Payment of a fine'),
('Payment with a card')

SELECT clients.name , clients.email , clients.address
FROM clients
JOIN invoices ON clients.client_id = invoices.invoice_id
WHERE invoices.invoice_id = 1

SELECT payments.payment_date , payments.amount , payments.payment_method
FROM payments
JOIN invoices ON payments.invoice_id = invoices.invoice_id
WHERE invoices.invoice_id = 1

SELECT 
    i.invoice_id,
    i.client_id,
    c.name,
    i.amount,
    i.issue_date,
    i.due_date,
    i.status
FROM 
    invoices i
JOIN 
    clients c ON i.client_id = c.client_id
WHERE 
    i.due_date < CURRENT_DATE
    AND i.status <> 'Paid';


SELECT 
    c.client_id,
    c.name,
    SUM(CAST(invoices.amount AS NUMERIC)) AS total_debt
FROM 
    clients c
JOIN 
    invoices ON c.client_id = invoices.client_id
LEFT JOIN 
    payments p ON invoices.invoice_id = p.invoice_id
WHERE 
    invoices.status <> 'Paid'
GROUP BY 
    c.client_id, c.name;
