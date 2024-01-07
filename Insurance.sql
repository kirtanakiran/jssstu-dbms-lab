CREATE DATABASE insurance;
USE insurance;

CREATE TABLE person (
    driver_id VARCHAR(255) NOT NULL,
    driver_name TEXT NOT NULL,
    address TEXT NOT NULL,
    PRIMARY KEY (driver_id)
);

CREATE TABLE car (
    reg_no VARCHAR(255) NOT NULL,
    model TEXT NOT NULL,
    c_year INTEGER,
    PRIMARY KEY (reg_no)
);

CREATE TABLE accident (
    report_no INTEGER NOT NULL,
    accident_date DATE,
    location TEXT,
    PRIMARY KEY (report_no)
);

CREATE TABLE owns (
    driver_id VARCHAR(255) NOT NULL,
    reg_no VARCHAR(255) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (reg_no) REFERENCES car(reg_no) ON DELETE CASCADE
);

CREATE TABLE participated (
    driver_id VARCHAR(255) NOT NULL,
    reg_no VARCHAR(255) NOT NULL,
    report_no INTEGER NOT NULL,
    damage_amount FLOAT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (reg_no) REFERENCES car(reg_no) ON DELETE CASCADE,
    FOREIGN KEY (report_no) REFERENCES accident(report_no)
);

INSERT INTO person VALUES
("D111", "Driver_1", "Kuvempunagar, Mysuru"),
("D222", "Smith", "JP Nagar, Mysuru"),
("D333", "Driver_3", "Udaygiri, Mysuru"),
("D444", "Driver_4", "Rajivnagar, Mysuru"),
("D555", "Driver_5", "Vijayanagar, Mysore");

INSERT INTO car VALUES
("KA-20-AB-4223", "Swift", 2020),
("KA-20-BC-5674", "Mazda", 2017),
("KA-21-AC-5473", "Alto", 2015),
("KA-21-BD-4728", "Triber", 2019),
("KA-09-MA-1234", "Tiago", 2018);

INSERT INTO accident VALUES
(43627, "2020-04-05", "Nazarbad, Mysuru"),
(56345, "2019-12-16", "Gokulam, Mysuru"),
(63744, "2020-05-14", "Vijaynagar, Mysuru"),
(54634, "2019-08-30", "Kuvempunagar, Mysuru"),
(65738, "2021-01-21", "JSS Layout, Mysuru"),
(66666, "2021-01-21", "JSS Layout, Mysuru");

INSERT INTO owns VALUES
("D111", "KA-20-AB-4223"),
("D222", "KA-20-BC-5674"),
("D333", "KA-21-AC-5473"),
("D444", "KA-21-BD-4728"),
("D222", "KA-09-MA-1234");

INSERT INTO participated VALUES
("D111", "KA-20-AB-4223", 43627, 20000),
("D222", "KA-20-BC-5674", 56345, 49500),
("D333", "KA-21-AC-5473", 63744, 15000),
("D444", "KA-21-BD-4728", 54634, 5000),
("D222", "KA-09-MA-1234", 65738, 25000);

-- Query to calculate the total number of distinct owners involved in accidents in the year 2021
SELECT COUNT(driver_id)
FROM participated p, accident a
WHERE p.report_no=a.report_no and a.accident_date like "2021%";

-- Query to count the number of distinct accidents involving a driver named "Smith"
SELECT COUNT(DISTINCT a.report_no)
FROM accident a
WHERE EXISTS
    (SELECT *
     FROM person p, participated ptd
     WHERE p.driver_id = ptd.driver_id AND p.driver_name = "Smith" AND a.report_no = ptd.report_no);

-- Insert an additional accident entry
INSERT INTO accident VALUES
(45562, "2024-04-05", "Mandya");

-- Insert an additional participated entry
INSERT INTO participated VALUES
("D222", "KA-21-BD-4728", 45562, 50000);

-- Attempt to delete a car with the model "Mazda" owned by the driver "Smith"
DELETE FROM car
WHERE model = "Mazda" AND reg_no IN
    (SELECT car.reg_no
     FROM person p, owns o
     WHERE p.driver_id = o.driver_id AND o.reg_no = car.reg_no AND p.driver_name = "Smith");

-- Update the damage amount in a specific accident participation entry
UPDATE participated SET damage_amount = 10000 WHERE report_no = 65738 AND reg_no = "KA-09-MA-1234";

-- Create a view 'CarsInAccident' to list distinct car models and manufacturing years involved in accidents
CREATE VIEW CarsInAccident AS
SELECT DISTINCT model, c_year
FROM car c, participated p
WHERE c.reg_no = p.reg_no;

-- Select data from the 'CarsInAccident' view
SELECT * FROM CarsInAccident;

/*-- Create the 'DriversWithCar' view to list driver names and addresses for those who own a car
CREATE VIEW DriversWithCar AS
SELECT driver_name, address
FROM person p, owns o
WHERE p.driver_id = o.driver_id;

-- Select data from the 'DriversWithCar' view
SELECT * FROM DriversWithCar;

-- Create the 'DriversWithAccidentInPlace' view to list drivers involved in accidents at a specific location
CREATE VIEW DriversWithAccidentInPlace AS
SELECT driver_name
FROM person p, accident a, participated ptd
WHERE p.driver_id = ptd.driver_id AND a.report_no = ptd.report_no AND a.location = "Vijaynagar, Mysuru";

-- Select data from the 'DriversWithAccidentInPlace' view
SELECT * FROM DriversWithAccidentInPlace;

-- Trigger that prevents a driver with total_damage_amount greater than Rs. 50,000 from owning a car
DELIMITER //
CREATE TRIGGER PreventOwnership
BEFORE INSERT ON owns
FOR EACH ROW
BEGIN
    IF NEW.driver_id IN (SELECT driver_id FROM participated GROUP BY driver_id HAVING SUM(damage_amount) >= 50000) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Damage Greater than Rs.50,000';
    END IF;
END;
//
DELIMITER ;

-- Attempt to insert ownership data for a driver with a total damage amount exceeding Rs. 50,000
-- Note: This should result in an error due to the trigger.
INSERT INTO owns VALUES
("D222", "KA-21-AC-5473");
*/
-- Trigger that prevents a driver from participating in more than 2 accidents in a given year
DELIMITER //
CREATE TRIGGER PreventParticipation
BEFORE INSERT ON participated
FOR EACH ROW
BEGIN
    IF 2 <= (SELECT COUNT(*) FROM participated WHERE driver_id = NEW.driver_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver has already participated in 2 accidents';
    END IF;
END;
//
DELIMITER ;

-- Attempt to insert an additional accident participation for a driver who has already participated in two accidents in the same year
-- Note: This should result in an error due to the trigger.
INSERT INTO participated VALUES
("D222", "KA-20-AB-4223", 66666, 20000);
