CREATE DATABASE KSAILORSK;
USE KSAILORSK;

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

insert into SAILORS values
(1,"Albert", 5.0, 40),
(2, "Nakul", 5.0, 49),
(3, "Darshan", 9, 18),
(4, "Astorm Gowda", 2, 68),
(5, "Armstormin", 7, 19);

 insert into BOAT values
(1,"Boat_1", "Green"),
(2,"Boat_2", "Red"),
(103,"Boat_3", "Blue");

insert into RESERVERS values
(1,103,"2023-01-01"),
(1,2,"2023-02-01"),
(2,1,"2023-02-05"),
(3,2,"2023-03-06"),
(5,103,"2023-03-06"),
(1,1,"2023-03-06");

