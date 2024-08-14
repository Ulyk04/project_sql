CREATE TABLE projects(
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL 
)

CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL
)

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    team_id INT NOT NULL,

    FOREIGN KEY (team_id) REFERENCES teams(team_id)
)

CREATE TABLE tasks(
    task_id SERIAL PRIMARY KEY,
    project_id INT NOT NULL,
    assigned_to VARCHAR(100) NOT NULL,
    task_description VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,

    FOREIGN KEY (project_id) REFERENCES projects(project_id)
)

CREATE TABLE reports(
    report_id SERIAL PRIMARY KEY,
    project_id INT NOT NULL,
    report_date DATE NOT NULL,
    progress_percent NUMERIC (5 , 2) NOT NULL,
    comments VARCHAR(50) NOT NULL,

    FOREIGN KEY (project_id) REFERENCES projects(project_id)
)

INSERT INTO projects(project_name, start_date, end_date, status)
VALUES('News 45' , '2024-08-15' , '2024-09-15' , 'In process'),
('VUE' , '2024-09-01' , '2024-09-20' , 'Begins'),
('NOva' , '2024-07-15' , '2024-08-15' , 'Finished')

INSERT INTO teams(team_name)
VALUES('Group 1'),
('Group 2 '),
('Group 3 ')

INSERT INTO employees(name , email , team_id)
VALUES('John Cavanna' , 'cavannaj@gmail.com' , 1),
('Michael Mick' , 'mich@gmail.com' , 1),
('Jack Douson' , 'jackj@gmail.com' , 2),
('Jason Mira' , 'jo1@gmail.com' , 2),
('Aleksey Krasnikov' , 'krasnikov@gmail.com' , 3),
('Ashley M', 'ashley@gmail.com' , 3)

INSERT INTO tasks(project_id , assigned_to , task_description , start_date , due_date , status)
VALUES(1 , 'Group 3' , 'Needs create a news program' , '2024-08-16' , '2024-08-15' , 'In process'),
(2 , 'Group 1' , 'Needs create message program' , '2024-09-01' , '2024-09-01' , 'Begins'),
(3 , 'Group 2',  'Needs create a game' , '2024-07-15' , '2024-07-15' , 'Completed')

INSERT INTO reports(project_id, report_date , progress_percent , comments)
VALUES(1 , '2024-09-15' , 21.50 , 'It is possible but need a time'),
(2 , '2024-09-20' , 1.10 , 'No comments'),
(3 , '2024-08-15' , 100.00 , 'It was good')