CREATE TABLE members(
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(50) NOT NULL,
    membership_start_date DATE NOT NULL
)

CREATE TABLE subscriptions(
    subscription_id SERIAL PRIMARY KEY,
    subscription_name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    duration_days INT NOT NULL
)

CREATE TABLE trainers(
    trainer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE schedule(
    class_id SERIAL PRIMARY KEY,
    trainer_id INT NOT NULL,
    member_id INT NOT NULL,
    class_date DATE NOT NULL,
    class_time VARCHAR(20) UNIQUE NOT NULL,
    class_name VARCHAR(20) NOT NULL,

    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
)

INSERT INTO trainers(name , specialization , email)
VALUES('Artur King' , 'Powerlifting' , 'kingartur@gmail.com'),
('Nur Salih' , 'Fitness' , 'nur1@gmail.com')

INSERT INTO subscriptions(subscription_name, price , duration_days)
VALUES('For 1 month' , 150 , 28),
('Our Year' , 500 , 365)

INSERT INTO members(name, email , phone , membership_start_date)
VALUES('Nolan Nik' , 'nik21@gmail.com' , '12-14-25' , '2024-08-12'),
('Meiv Nilo' , 'meiv@gmail.com' , '524-12-15' , '2024-08-31')

SELECT * FROM members;
SELECT * FROM trainers;
SELECT * FROM subscriptions;

INSERT INTO schedule(trainer_id , member_id , class_date , class_time , class_name)
VALUES(2 , 1 , '2024-08-16' , '15:30' , 'Fit-fit.2'),
(2 , 2 , '2024-09-01', '18:00' , 'Fit-fit'),
(1 , 1 , '2024-08-23' , '20:00' , 'Power')

SELECT * FROM schedule;

SELECT 
    members.name, 
    members.email, 
    members.phone, 
    members.membership_start_date,
    schedule.class_name, 
    schedule.class_date, 
    schedule.class_time 
FROM 
    members 
JOIN 
    schedule ON members.member_id = schedule.member_id
WHERE 
    members.member_id = 1; 


SELECT 
    trainers.name, 
    trainers.email, 
    trainers.specialization,
    schedule.class_name, 
    schedule.class_date, 
    schedule.class_time 
FROM 
    trainers 
JOIN 
    schedule ON trainers.trainer_id = schedule.trainer_id
WHERE 
    trainers.trainer_id = 2; 
