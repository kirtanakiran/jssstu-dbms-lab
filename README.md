SAILORS DATABASE

Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified. Create tables for the following schema listed below by properly specifying the primary keys and foreign keys. Enter at least five tuples for each relation.

Sailors database
SAILORS (sid, sname, rating, age)
BOAT(bid, bname, color)
RSERVERS (sid, bid, date)
Queries, View and Trigger

Find the colours of boats reserved by Albert
Find all sailor id’s of sailors who have a rating of at least 8 or reserved boat 103
Find the names of sailors who have not reserved a boat whose name contains the string “storm”. Order the names in ascending order.
Find the names of sailors who have reserved all boats.
Find the name and age of the oldest sailor.
For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors.
A view that shows names and ratings of all sailors sorted by rating in descending order.
Create a view that shows the names of the sailors who have reserved a boat on a given date.
Create a view that shows the names and colours of all the boats that have been reserved by a sailor with a specific rating.
A trigger that prevents boats from being deleted If they have active reservations.
A trigger that prevents sailors with rating less than 3 from reserving a boat.
A trigger that deletes all expired reservations.

INSURANCE DATABASE

Consider the database schemas given below. Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified. Create tables for the following schema listed below by properly specifying the primary keys and foreign keys. Enter at least five tuples for each relation.
Insurance database

PERSON (driver id#: string, name: string, address: string)
CAR (regno: string, model: string, year: int)
ACCIDENT (report_ number: int, acc_date: date, location: string)
OWNS (driver id#: string, regno: string)
PARTICIPATED(driver id#:string, regno:string, report_ number: int,damage_amount: int)
Queries, View and Trigger

Find the total number of people who owned cars that were involved in accidents in 2021.
Find the number of accidents in which the cars belonging to “Smith” were involved.
Add a new accident to the database; assume any values for required attributes.
Delete the Mazda belonging to “Smith”.
Update the damage amount for the car with license number “KA09MA1234” in the accident with report.
A view that shows models and year of cars that are involved in accident.
Create a view that shows name and address of drivers who own a car.
Create a view that shows the names of the drivers who a participated in a accident in a specific place.
A trigger that prevents driver with total damage amount >rs.50,000 from owning a car.
A trigger that prevents a driver from participating in more than 3 accidents in a given year.
