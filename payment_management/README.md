
# Project in PostgreSQL

## System for managing payments and invoicing clients.

### ABOUT

Requirements:

    Clients table with columns: client_id, name, email, address.
    Invoices table with columns: invoice_id, client_id, amount, issue_date, due_date, status.
    Payments table with columns: payment_id, invoice_id, payment_date, amount, payment_method.
    Payment_methods table with columns: method_id, method_name.

Functionality:
    
    Invoicing clients.
    Processing payments on invoices.
    Request for information on overdue invoices and total client debt.


### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.
