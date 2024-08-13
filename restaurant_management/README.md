
# Project in PostgreSQL

## Restaurant Management System

### ABOUT

Description: Create a database for restaurant management that will store data about customers, menus, orders and payments.

Requirements:

    Table customers with columns: customer_id, name, phone, email.
    Menu table with columns: menu_id, dish_name, price.
    Table orders with columns: order_id, customer_id, order_date, total_amount.
    Order_items table with columns: order_item_id, order_id, menu_id, quantity.
    Payments table with columns: payment_id, order_id, payment_date, amount.

Functionality:

    Adding new dishes to the menu.
    Creating orders and adding dishes to the order.
    Processing customer payments.
    Request to receive all customer orders.
    
### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.
