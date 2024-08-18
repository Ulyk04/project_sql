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
