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

