CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE tasks(
    task_id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    descriptions VARCHAR(100),
    assigned_to VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    status_id INT NOT NULL
)

CREATE TABLE statuses(
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(100)
)

DROP TABLE tasks;

CREATE TABLE tasks(
    task_id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    descriptions VARCHAR(100),
    assigned_to VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    status_id INT NOT NULL,

    FOREIGN KEY (status_id) REFERENCES statuses(status_id)
)

INSERT INTO users(name , email)
VALUES('JOhn Wick' , 'johnwick@gmail.com'),
('Resad Garazade' , 'resad@gmail.com'),
('Adem Dal' , 'ademdal@gmail.com')

INSERT INTO statuses(status_name)
VALUES('Begins'),
('In process'),
('Completed')

INSERT INTO tasks(title , descriptions , assigned_to , due_date , status_id)
VALUES('Repair' , 'Needs to repair laptop' , 'Resad' , '2024-09-10' , 2),
('Painting' , 'Needs to paint the wall' , 'Adem' , '2024-08-08' , 3),
('Send' , 'Needs to send a floor' , 'John' , '2024-10-02' , 1)

SELECT t.title , t.descriptions , t.due_date, statuses.status_name 
FROM tasks t
JOIN statuses ON t.status_id = statuses.status_id
WHERE t.assigned_to = 'Adem'

SELECT t.title , t.descriptions , t.due_date, statuses.status_name 
FROM tasks t
JOIN statuses ON t.status_id = statuses.status_id