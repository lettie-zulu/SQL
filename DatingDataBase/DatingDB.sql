CREATE TABLE my_contacts (
    contact_id bigserial,
    last_name varchar(50),
    first_name varchar(50),
    phone varchar(15),
    email varchar(50),
    gender varchar(1),
    birthday date,
    prof_id integer REFERENCES profession (prof_id),
    zip_code integer REFERENCES zip_code (zip_code),
    status_id integer REFERENCES status (status_id),
    CONSTRAINT contact_key PRIMARY KEY (contact_id)
);

INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES
('Cox', 'Yolanda', '087 433 8645', 'yolandac22@gmail.com', 'F', '1995/11/06', 1, 2188, 1),
('Adams', 'Deborah', '059 427 4353', 'debad@gmail.com', 'F', '1979/12/21', 2, 8805, 2),
('Adu', 'India', '091 324 5667', 'Adu.India@gmail.com', 'F', '2002/08/31', 2, 9309, 1),
('Knowles', 'Michael', '025 355 8670', 'knowles67@gmail.com', 'M', '1992/04/30', 3, 8800, 1),
('Jones', 'Maxwell', '066 313 7502', 'Max-J@gmail.com', 'M', '1981/02/25', 4, 3202, 1),
('Rowland', 'Michelle', '021 788 8249', 'michelle_Rowland@gmail.com', 'F', '1987/05/16', 5, 0727, 1),
('Joe', 'Moore', '093 345 6788', 'j.moore@gmail.com', 'M', '1990/11/07', 6, 1200, 2),
('Hudson', 'Kendrick', '092 465 7403', 'ken.hud@gmail.com', 'M', '1999/05/09', 4, 0699, 2),
('Bailey', 'George', '072 567 8234', 'CynB97@gmail.com', 'M', '1989/12/20', 6, 0391, 2),
('Cox', 'Erica', '013 999 8675', 'ericaCox22@gmail.com', 'F', '1995/10/05', 1, 2191, 1),
('Wright', 'Benedict', '073 357 8902', 'benW77@gmail.com', 'M', '2000/02/25', 3, 9869, 2),
('Redd', 'Wendy', '021 456 7891', 'Wendy.Redd@gmail.com', 'F', '1997/08/23', 2, 3205, 1),
('Soul', 'Randy', '011 785 6324', 'Randy_Soul@gmail.com', 'M', '1989/05/11', 4, 6900, 2),
('Williams', 'Trey', '034 784 6702', 'Trey-W@gmail.com', 'M', '1994/07/01', 5, 6900, 1),
('Xavier', 'Caroline', '015 674 8943', 'x_Caro@gmail.com', 'F', '2001/09/13', 6, 9869, 2);

CREATE TABLE contact_interest (
    contact_id bigserial REFERENCES my_contacts(contact_id),
    interest_id integer REFERENCES interests (interest_id),
   CONSTRAINT contact_interest_key PRIMARY KEY (contact_id, interest_id) 
);

INSERT INTO contact_interest (interest_id)
VALUES
(1),
(2),
(3),
(4),
(5),
(6);

CREATE TABLE interests (
    interest_id bigserial,
    interest varchar(25),
   CONSTRAINT interest_key PRIMARY KEY (interest_id) 
);

INSERT INTO interests (interest)
VALUES
('Music'),
('Creative Arts'),
('Content Creation'),
('Photography'),
('Journaling'),
('Sports');

CREATE TABLE contact_seeking (
    contact_id bigserial REFERENCES my_contacts(contact_id), 
    seeking_id integer REFERENCES seeking (seeking_id),
    CONSTRAINT contact_seeking_key PRIMARY KEY (contact_id, seeking_id) 
);

INSERT INTO contact_seeking (seeking_id)
VALUES
(1),
(2);

CREATE TABLE seeking (
    seeking_id bigserial,
    seeking varchar(1),
   CONSTRAINT seeking_key PRIMARY KEY (seeking_id) 
);

INSERT INTO seeking (seeking)
VALUES
('Y'),
('N');

CREATE TABLE profession (
    prof_id bigserial,
    profession varchar(50),--set to unique
    CONSTRAINT prof_key PRIMARY KEY (prof_id),
    CONSTRAINT prof_unique UNIQUE (profession)
);

INSERT INTO profession (profession)
VALUES
('Marketing Director'),
('General Manager'),
('Nail Technician'),
('Welder'),
('CEO'),
('Cashier');

CREATE TABLE zip_code (
    zip_code integer,
    province varchar(30),
    city varchar(30),
    CONSTRAINT zip_key PRIMARY KEY (zip_code),
    CONSTRAINT check_zip_code_not_5 CHECK (zip_code <= 9999)
);

INSERT INTO zip_code (zip_code, province, city)
VALUES
(2191, 'Gauteng', 'Pretoria'),
(2188, 'Gauteng', 'Johannesburg'),
(9869, 'Eastern Cape', 'QwaQwa'),
(9870, 'Eastern Cape', 'Port Elizabeth'),
(8800, 'Northern Cape', 'Upington'),
(8805, 'Northern Cape', 'Kimberly'),
(9309, 'Free State', 'Bloemfontein'),
(9301, 'Free State', 'Welkom'),
(0391, 'North West', 'Klerksdorp'),
(0264, 'North West', 'Rustenburg'),
(3202, 'Kwa Zulu-Natal', 'Pietermaritzburg'),
(3205, 'Kwa Zulu-Natal', 'Durban'),
(0699, 'Limpopo', 'Tzanien'),
(0727, 'Limpopo', 'Polokwane'),
(1195, 'Mpumalanga', 'Mbombela'),
(1200, 'Mpumalanga', 'Nelspruit'),
(6900, 'Western Cape', 'Laingsburg'),
(6901, 'Western Cape', 'Cape Town');

CREATE TABLE status (
    status_id bigserial,
    status varchar(15),
    CONSTRAINT status_key PRIMARY KEY (status_id)
);

INSERT INTO status (status)
VALUES
('Single'),
('Taken');
--*************TABLE CREATED FOR DISPLAY*********
CREATE TABLE dating (
    contact_id bigserial,
    last_name varchar(50),
    first_name varchar(50),
    phone varchar(15),
    email varchar(50),
    gender varchar(1),
    birthday date,
    prof_id integer REFERENCES profession (prof_id),
    zip_code integer REFERENCES zip_code (zip_code),
    status_id integer REFERENCES status (status_id),
    seeking_id integer REFERENCES seeking (seeking_id),
    interests varchar(50)    
);

INSERT INTO dating (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id, seeking_id, interest_id)
VALUES
('Cox', 'Yolanda', '087 433 8645', 'yolandac22@gmail.com', 'F', '1995/11/06', 1, 2188, 1, 1, 1),
('Cox', 'Yolanda', '087 433 8645', 'yolandac22@gmail.com', 'F', '1995/11/06', 1, 2188, 1, 1, 3),
('Adams', 'Deborah', '059 427 4353', 'debad@gmail.com', 'F', '1979/12/21', 2, 8805, 2, 2, 1),
('Adams', 'Deborah', '059 427 4353', 'debad@gmail.com', 'F', '1979/12/21', 2, 8805, 2, 2, 6),
('Adu', 'India', '091 324 5667', 'Adu.India@gmail.com', 'F', '2002/08/31', 2, 9309, 1, 1, 4),
('Adu', 'India', '091 324 5667', 'Adu.India@gmail.com', 'F', '2002/08/31', 2, 9309, 1, 1, 2),
('Knowles', 'Michael', '025 355 8670', 'knowles67@gmail.com', 'M', '1992/04/30', 3, 8800, 1, 1, 3),
('Knowles', 'Michael', '025 355 8670', 'knowles67@gmail.com', 'M', '1992/04/30', 3, 8800, 1, 1, 6),
('Jones', 'Maxwell', '066 313 7502', 'Max-J@gmail.com', 'M', '1981/02/25', 4, 3202, 1, 1, 1),
('Jones', 'Maxwell', '066 313 7502', 'Max-J@gmail.com', 'M', '1981/02/25', 4, 3202, 1, 1, 4),
('Rowland', 'Michelle', '021 788 8249', 'michelle_Rowland@gmail.com', 'F', '1987/05/16', 5, 0727, 1, 1, 1),
('Rowland', 'Michelle', '021 788 8249', 'michelle_Rowland@gmail.com', 'F', '1987/05/16', 5, 0727, 1, 1, 3),
('Joe', 'Moore', '093 345 6788', 'j.moore@gmail.com', 'M', '1990/11/07', 6, 1200, 2, 2, 2),
('Joe', 'Moore', '093 345 6788', 'j.moore@gmail.com', 'M', '1990/11/07', 6, 1200, 2, 2, 4),
('Hudson', 'Kendrick', '092 465 7403', 'ken.hud@gmail.com', 'M', '1999/05/09', 4, 0699, 2, 2, 6),
('Hudson', 'Kendrick', '092 465 7403', 'ken.hud@gmail.com', 'M', '1999/05/09', 4, 0699, 2, 2, 5),
('Bailey', 'George', '072 567 8234', 'CynB97@gmail.com', 'M', '1989/12/20', 6, 0391, 2, 2, 5),
('Bailey', 'George', '072 567 8234', 'CynB97@gmail.com', 'M', '1989/12/20', 6, 0391, 2, 2, 4),
('Cox', 'Erica', '013 999 8675', 'ericaCox22@gmail.com', 'F', '1995/10/05', 1, 2191, 2, 2, 5),
('Cox', 'Erica', '013 999 8675', 'ericaCox22@gmail.com', 'F', '1995/10/05', 1, 2191, 2, 2, 2),
('Wright', 'Benedict', '073 357 8902', 'benW77@gmail.com', 'M', '2000/02/25', 3, 9869, 1, 1, 4),
('Wright', 'Benedict', '073 357 8902', 'benW77@gmail.com', 'M', '2000/02/25', 3, 9869, 1, 1, 5),
('Redd', 'Wendy', '021 456 7891', 'Wendy.Redd@gmail.com', 'F', '1997/08/23', 2, 1195, 1, 1, 1),
('Redd', 'Wendy', '021 456 7891', 'Wendy.Redd@gmail.com', 'F', '1997/08/23', 2, 1195, 1, 1, 6),
('Soul', 'Randy', '011 785 6324', 'Randy_Soul@gmail.com', 'M', '1989/05/11', 4, 6900, 2, 2, 3),
('Soul', 'Randy', '011 785 6324', 'Randy_Soul@gmail.com', 'M', '1989/05/11', 4, 6900, 2, 2, 2),
('Williams', 'Trey', '034 784 6702', 'Trey-W@gmail.com', 'M', '1994/07/01', 5, 6900, 1, 1, 1),
('Williams', 'Trey', '034 784 6702', 'Trey-W@gmail.com', 'M', '1994/07/01', 5, 6900, 1, 1, 2),
('Xavier', 'Caroline', '015 674 8943', 'x_Caro@gmail.com', 'F', '2001/09/13', 6, 9869, 2, 2, 5);
('Xavier', 'Caroline', '015 674 8943', 'x_Caro@gmail.com', 'F', '2001/09/13', 6, 9869, 2, 2, 6);

--**********JOINING ALL THE TABLES WITH A LEFT JOIN*******
SELECT dat.first_name AS first_name
, dat.last_name AS last_name
, dat.phone AS phone
, dat.email AS email
, dat.birthday AS birthday
, int.interests AS interest
, pro.profession AS profession
, zip.city AS city
, zip.province AS province
, sta.status AS status
, see.seeking AS seeking
FROM dating dat
LEFT JOIN profession pro ON dat.prof_id = pro.prof_id
LEFT JOIN zip_code zip ON dat.zip_code = zip.zip_code
LEFT JOIN interests int ON dat.interest_id = int.interest_id
LEFT JOIN status sta ON dat.status_id = sta.status_id
LEFT JOIN seeking see ON dat.seeking_id = see.seeking_id;