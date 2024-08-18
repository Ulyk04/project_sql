
# Project in PostgreSQL

## Travel Management System

### ABOUT

Description: Create a database to manage travel reservations, including flights, hotels, and car rentals.

Requirements:
    
    A flights table with columns: flight_id, origin, destination, departure_time, arrival_time, price.
    A hotels table with columns: hotel_id, name, location, price_per_night.
    A car_rentals table with columns: rental_id, company_name, car_model, price_per_day.
    A bookings table with columns: booking_id, customer_id, flight_id, hotel_id, rental_id, booking_date, total_price.

Functionality:
    
    Book flights, hotels, and cars.
    Calculate the total cost of a trip.
    Request to get all reservations for a specific customer.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.
