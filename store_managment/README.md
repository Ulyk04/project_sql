# Project in PostgreSQL

## Student Management System

### ABOUT

Online store order management system

Description: Create a database to manage products, customers and orders in an online store.

Requirements:

    Create a table products with columns: product_id, name, description, price, stock.
    Create a table customers with columns: customer_id, name, email, phone, address.
    Create an orders table to track orders with columns: order_id, customer_id, order_date, total_amount.
    Create a table order_items to store information about products in orders with the columns: order_item_id, order_id, product_id, quantity, price.

Quests:

    Write a request to add a new product.
    Write a request to register a new client.
    Write a request to create a new order and add products to the order.
    Write a query to get a list of orders for a specific customer.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.

