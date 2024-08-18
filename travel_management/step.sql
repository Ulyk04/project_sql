CREATE TABLE flights(
    flight_id SERIAL PRIMARY KEY,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_time VARCHAR(50) NOT NULL,
    arrival_time  VARCHAR(50) NOT NULL,
    price VARCHAR(50) NOT NULL
) 

CREATE TABLE hotels(
    hotel_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    price_per_night INT NOT NULL
)

CREATE TABLE car_rentals(
    rental_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    car_model VARCHAR(100) NOT NULL,
    price_per_day INT NOT NULL
)

CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    hotel_id INT NOT NULL,
    rental_id INT NOT NULL,
    booking_date DATE NOT NULL,
    total_price INT NOT NULL,

    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),
    FOREIGN KEY (rental_id) REFERENCES car_rentals(rental_id)
    
)

INSERT INTO flights (flight_id, origin, destination, departure_time, arrival_time, price)
VALUES (101, 'New York', 'Los Angeles', '2024-09-01 10:00:00', '2024-09-01 14:00:00', 150.00);

INSERT INTO hotels (hotel_id, name, location, price_per_night)
VALUES (201, 'Sunset Hotel', 'Los Angeles', 100.00);

INSERT INTO car_rentals (rental_id, company_name, car_model, price_per_day)
VALUES (301, 'Hertz', 'Toyota Corolla', 40.00);

INSERT INTO bookings (customer_id, flight_id, hotel_id, rental_id, booking_date, total_price)
VALUES (1, 101, 201, 301, CURRENT_DATE, 0);

UPDATE bookings
SET total_price = (
    (SELECT CAST(price AS NUMERIC) FROM flights WHERE flight_id = bookings.flight_id) +
    (SELECT CAST(price_per_night AS NUMERIC) FROM hotels WHERE hotel_id = bookings.hotel_id) +
    (SELECT CAST(price_per_day AS NUMERIC) FROM car_rentals WHERE rental_id = bookings.rental_id)
)
WHERE booking_id = 201;

SELECT 
    b.booking_id,
    b.booking_date,
    f.origin,
    f.destination,
    f.departure_time,
    f.arrival_time,
    h.name AS hotel_name,
    h.location AS hotel_location,
    c.company_name,
    c.car_model,
    b.total_price
FROM 
    bookings b
JOIN 
    flights f ON b.flight_id = f.flight_id
JOIN 
    hotels h ON b.hotel_id = h.hotel_id
JOIN 
    car_rentals c ON b.rental_id = c.rental_id
WHERE 
    b.customer_id = 1;
