# Project in PostgreSQL

## Library Management System

### ABOUT

Library management

Description: Create a database to manage the library. It should have tables to store information about books, authors, users and issued books.

Requirements:

    Books table with columns: book_id, title, author_id, genre, published_year.
    Authors table with columns: author_id, name, birthdate.
    Table users with columns: user_id, name, email, membership_date.
    Issued_books table with columns: issue_id, book_id, user_id, issue_date, return_date.
    
Functionality:

    Adding new books and authors.
    A record of books issued to users.
    Request to retrieve all books issued to the user.
    A request to receive all books by a specific author.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.

