CREATE TABLE employees (
    emp_id bigserial,
    first_name varchar(60),
    surname varchar(60),
    gender varchar(2),
    address varchar(100),
    email varchar(60),
    dept_id integer REFERENCES department (dept_id),
    role_id integer REFERENCES roles (role_id),
    salary_id integer REFERENCES salaries (salary_id),
    overtime_id integer REFERENCES overtime_hrs (overtime_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

INSERT INTO employees (first_name, surname, gender, address, email, dept_id, role_id, salary_id, overtime_id)
VALUES
('Nhlakanipho', 'Meva', 'M', '71 Edison Str', 'nipho@gmail.com', 4, 4, 3, 1),
('Thuto', 'Modise', 'F', '6 Ndlanzi str', 'thuto@gmail.com', 3, 3, 2, 2),
('Oratiloe', 'Mnguni', 'F', '88 Matsau str', 'Ora@gmail.com', 2, 2, 1, 3),
('Mbali', 'Ngwenya', 'M', '23 Pono str','mbali@gmail.com', 1, 1, 2, 4),
('Thobile', 'Msiza', 'F', '4 Chris Hani str', 'thobi@gmail.com', 1, 1, 1, 5),
('Buhle', 'Douglas', 'M', '2 Tlhako str', 'buhle@gmail.com', 2, 2, 3, 1),
('Hlehle', 'Zoba', 'F', '59 Tana str', 'hlehle@gmail.com', 3, 3, 2, 5),
('Ndalo', 'Zwane', 'F' '25 Tonsti Str', 'ndalo@gmail.com', 4, 4, 1, 2),
('Mpumelelo', 'Mahlangu', '14 Tom str', 'Mpumi@gmail.com', 4, 4, 2, 3),
('Maggie', 'Modise', '69 Motsweding Str', 'maggie@gmail.com', 3, 3, 3, 4);

CREATE TABLE department (
    dept_id bigserial,
    dep_name varchar(20),
    dept_city varchar(25),
    CONSTRAINT dept_key PRIMARY KEY (dept_id)
);

INSERT INTO departments (depart_id, depart_name, depart_city)
VALUES
(1,'Reception', 'Centurion'),
(2,'Finance', 'Edenvale');
(3, 'Human Resources', 'Northmead'),
(4, 'Data analyst', 'Bryanston');

CREATE TABLE roles (
    role_id bigserial,
    role varchar(20),
    CONSTRAINT role_key PRIMARY KEY (role_id)
);

INSERT INTO roles (role_id, role)
VALUES
(1, 'Receptionist'),
(2, 'Accounting'),
(3, 'Recruitment'),
(4, 'Data Analysis');

CREATE TABLE salaries (
    salary_id bigserial,
    salary_pa integer,
    CONSTRAINT salary_key PRIMARY KEY (salary_id)
);

INSERT INTO salaries (salary_id, salary)
VALUES
(1, 12000),
(2, 250000),
(3, 570000);

CREATE TABLE overtime_hrs (
    overtime_id bigserial,
    overtime_hrs integer,
    CONSTRAINT overtime_key PRIMARY KEY (overtime_id)
);

INSERT INTO overtime_hours (overtime_id, overtime_hours)
VALUES
(1, 0),
(2, 6),
(3, 8),
(4, 11),
(5, 13);

--JOINING ALL THE TABLES WITH A LEFT JOIN--
SELECT emp.first_name AS first_name
, emp.surname AS surname
, emp.address AS address
, emp.email AS email
, dep.depart_name AS depart_name
, rol.role AS roles
, sal.salary AS salary
, ovr.overtime_hours AS overtime_hours
FROM employees emp
LEFT JOIN department dep ON emp.depart_id = dep.depart_id
LEFT JOIN roles rol ON emp.role_id = rol.role_id
LEFT JOIN salary sal ON emp.salary_id = sal.salary_id
LEFT JOIN overtime_hours ovr ON emp.overtime_id = ovr.overtime_id;