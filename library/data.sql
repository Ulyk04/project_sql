INSERT INTO books (title, author, publication_year, genre)
VALUES 
('John in life', 'Bekham Kimber', 2004, 'Horror'),
('My tree', 'Beyong', 2003, 'Roman');

INSERT INTO users (name, email, phone)
VALUES
('User1', 'user1@example.com', '123-456-7890'),
('User2', 'user2@example.com', '098-765-4321');

INSERT INTO loans (book_id, user_id, loan_date, return_date)
VALUES
(1, 1, '2024-07-15', '2024-07-22'),
(2, 2, '2024-07-16', NULL);
