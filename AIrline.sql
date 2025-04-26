CREATE DATABASE airline_db;

USE airline_db;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name varchar(50),
    status varchar(50),
    total_mileage INT
);

CREATE TABLE aircrafts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    total_seats INT
);

CREATE TABLE flights
(
    flight_id             INT AUTO_INCREMENT PRIMARY KEY,
    flight_number  varchar(5),
    mileage INT,
    aircraft_id    INT,
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);

CREATE TABLE bookings
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_number INT,
    FOREIGN KEY (flight_number) REFERENCES flights(flight_id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers(id, customer_name, status, total_mileage)
    VALUES
        (1,'Agustine Riviera','Silver',115235),
        (2,'Alaina Sepulvida','None',6008),
        (3,'Tom Jones','Gold',205767),
        (4,'Jessica James','Silver',127656),
        (5,'Sam Rio','None',2653),
        (6,'Ana Janco','Silver',136773),
        (7,'Jennifer Cortez','Gold',300582),
        (8,'Christian Janco','Silver',14642)
;

INSERT INTO aircrafts(id, name, total_seats)
    VALUES
        (1,'Boeing 747',400),
        (2,'Airbus A330',236),
        (3,'Boeing 777',264)
;

INSERT INTO flights(flight_id, flight_number, mileage, aircraft_id)
    VALUES
        (1,'DL143',135,1),
        (2,'DL122',4370,2),
        (3,'DL53',2078,3),
        (4,'DL222',4370,2),
        (5,'DL37',1765,2)
;

INSERT INTO bookings(id, customer_id, flight_number)
    VALUES
        (1,1,1),
        (2,1,2),
        (3,2,2),
        (4,1,1),
        (5,3,2),
        (6,3,3),
        (7,1,1),
        (8,5,1),
        (9,1,1),
        (10,3,4),
        (11,4,1),
        (12,5,1),
        (13,6,2),
        (14,7,2),
        (15,4,2),
        (16,5,5),
        (17,8,4)
;

SELECT COUNT(DISTINCT flight_number) FROM flights;

SELECT AVG(mileage) FROM flights;

SELECT AVG(total_seats) FROM aircrafts;

SELECT status, AVG(total_mileage) FROM customers GROUP BY status;

SELECT status, MAX(total_mileage) FROM customers GROUP BY status;

SELECT COUNT(*) FROM aircrafts WHERE name LIKE '%Boeing%';

SELECT * FROM flights WHERE mileage BETWEEN 300 AND 2000;

SELECT c.status, AVG(f.mileage)
FROM bookings b
         JOIN customers c ON b.customer_id = c.id
         JOIN flights f ON b.flight_number = f.flight_id
GROUP BY c.status;

SELECT a.name, COUNT(*) AS total_bookings
FROM bookings b
         JOIN customers c ON b.customer_id = c.id
         JOIN flights f ON b.flight_number = f.flight_id
         JOIN aircrafts a ON f.aircraft_id = a.id
WHERE c.status = 'Gold'
GROUP BY a.name
ORDER BY total_bookings DESC
    LIMIT 1;