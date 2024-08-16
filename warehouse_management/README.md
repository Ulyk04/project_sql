# Project in PostgreSQL

## Warehouse Management System

### ABOUT

Description: Create a system for inventory management in a warehouse, including receiving, storing and issuing goods.

Requirements:

    Table items with columns: item_id, item_name, description, quantity, location.
    Table suppliers with columns: supplier_id, name, contact_info.
    Table shipments with columns: shipment_id, supplier_id, shipment_date, item_id, quantity_received.
    Table outgoing_shipments with columns: outgoing_id, item_id, quantity, dispatch_date, destination.

Functionality:

    Adding new goods and suppliers.
    Accounting for received and dispatched goods.
    Request for a report on the balance of goods in the warehouse.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.

