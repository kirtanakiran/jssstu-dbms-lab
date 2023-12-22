CREATE DATABASE INSURANCES;
USE INSURANCES;

CREATE TABLE PERSON(
    driver_id VARCHAR(10)primary key,
    name VARCHAR(20),
    address VARCHAR(30)
);

CREATE TABLE CAR(
    reg_no VARCHAR(15)primary key,
    model VARCHAR(20),
    year int
);

CREATE TABLE ACCIDENT(
   report_no int primary key,
   acc_date date,
   location VARCHAR(30)
);

CREATE TABLE OWNS(
    reg_no VARCHAR(15),
    driver_id VARCHAR(10),
    foreign key(reg_no)references CAR(reg_no)on delete cascade,
    foreign key(driver_id)references PERSON(driver_id)on delete cascade
);

CREATE TABLE PARTICIPATED(
    driver_id VARCHAR(10),
    reg_no VARCHAR(15),
    report_no int,
    damage_amt float(8),
    foreign key(driver_id)references PERSON(driver_id)on delete cascade,
    foreign key(reg_no)references CAR(reg_no)on delete cascade,
    foreign key(report_no)references ACCIDENT(report_no)on delete cascade
);

/*Queries Implemented*/

Select count(driver_id)
from PARTICIPATED p, ACCIDENT a
where p.report_no=a.report_no AND a.acc_date LIKE "2021%";

Select count(distinct a.report_no)
from ACCIDENT a
where EXISTS
(Select * 
from PERSON p, PARTICIPATED ptd
where p.driver_id=ptd.driver_id AND p.name="Smith" AND a.report_no=ptd.report_no);

INSERT INTO ACCIDENT VALUES 
(45418,"2023-03-19","KalidasaRoad");

DELETE from CAR
WHERE model="Mazda" AND reg_no IN
(Select CAR.reg_no
 from PERSON p, OWNS o
 where p.driver_id=o.driver_id AND p.name="Smith" AND CAR.reg_no=o.reg_no);

UPDATE PARTICIPATED 
SET damage_amt=10000 
WHERE report_no=65738 AND reg_no="KA-09-MA-1234";

CREATE VIEW CarsInAccident AS
SELECT DISTINCT model, year
FROM CAR c, PARTICIPATED p
WHERE c.reg_no = p.reg_no;

DELIMITER //
create trigger PreventParticipation
before insert on PARTICIPATED
for each row
BEGIN
	IF 3<=(select count(*) from PARTICIPATED where driver_id=new.driver_id) THEN
		signal sqlstate '45000' set message_text='Driver has already participated in 3 accidents';
	END IF;
END;//
DELIMITER ;







