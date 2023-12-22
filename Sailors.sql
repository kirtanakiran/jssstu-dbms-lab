CREATE DATABASE SAILORSK;
USE SAILORSK;

CREATE TABLE SAILORS(
     Sid int primary key,
     Sname VARCHAR(100),
     rating float,
     age int
     );

CREATE TABLE BOAT(
     bid int primary key,
     bname VARCHAR(100),
     color VARCHAR(100)
     );

CREATE TABLE RESERVERS(
    Sid int,
    bid int,
    date DATE,
    primary key(Sid,bid),
    FOREIGN KEY(Sid)REFERENCES SAILORS(Sid),
    FOREIGN KEY(bid)REFERENCES BOAT(bid)
   );

INSERT DATA INTO SAILORS VALUES
   (601,"John",4.3,32),
   (602,"Pari",4,28),
   (603,"Piyush",3.2,36),
   (604,"Aditya",4.5,30),
   (605,"Raga",3.2,25);

SELECT * FROM SAILORS;

INSERT INTO BOAT VALUES
    (701,"Boat1","Blue"),
    (702,"Boat2","White"),
    (703,"Boat3","Orange"),
    (704,"Boat4","Red"),
    (705,"Boat5","Black");

SELECT * FROM BOAT;

INSERT INTO RESERVERS VALUES
     (601,701,"2023-07-01"),
     (602,702,"2023-10-11"),
     (603,703,"2023-11-09"),
     (604,704,"2023-05-23"),
     (605,705,"2023-02-22");

SELECT * FROM RESERVERS;

ALTER TABLE SAILORS
ADD email VARCHAR(100);
UPDATE SAILORS
SET email="john@gmail.com"
WHERE Sid=601;

SELECT * FROM SAILORS;

UPDATE SAILORS
SET email="pari@gmail.com"
WHERE Sid=602;

UPDATE SAILORS
SET email="piyush@gmail.com"
WHERE Sid=603;

UPDATE SAILORS
SET email="aditya@gmail.com"
WHERE Sid=604;

UPDATE SAILORS
SET email="raga@gmail.com"
WHERE Sid=605;

ALTER TABLE BOAT
ADD model int;
UPDATE BOAT
SET model=1995
WHERE bid IN(701, 702, 703, 704, 705);

SELECT * FROM BOAT;

ALTER TABLE RESERVERS
ADD Departure_time time;
UPDATE RESERVERS
SET Departure_time='10:30:00'
WHERE bid IN(701. 702, 703, 704, 705);

SELECT * FROM RESERVERS;

ALTER TABLE SAILORS
ADD CONSTRAINT unique_email UNIQUE(email);
ALTER TABLE BOAT
ADD CONSTRAINT check_model_year CHECK(model>=1980);

ALTER TABLE SAILORS
DROP CONSTRAINT unique_email;
ALTER TABLE BOAT
DROP CONSTRAINT check_model_year;

ALTER TABLE BOAT 
ADD location VARCHAR(100);
ALTER TABLE BOAT
DROP column location;

UPDATE SAILORS
SET rating=4.9
WHERE Sname="John";

UPDATE BOAT
SET color="Navy Blue"
WHERE bname="Boat1";

DELETE FROM RESERVERS
WHERE Sid=604;
DELETE FROM SAILORS
WHERE Sname="Aditya";

DELETE FROM RESERVERS
WHERE Bid=705;
DELETE FROM BOAT 
WHERE Bid=705;

