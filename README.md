<h1>SAILORS DATABASE</h1>
<hr/>

Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified. Create tables for the following schema listed below by properly specifying the primary keys and foreign keys. Enter at least five tuples for each relation.<br >

Sailors database<br >
SAILORS (sid, sname, rating, age)<br >
BOAT(bid, bname, color)<br >
RSERVERS (sid, bid, date)<br >
Queries, View and Trigger<br >

<ol>
<li>Find the colours of boats reserved by Albert</li><br >
<li>Find all sailor id’s of sailors who have a rating of at least 8 or reserved boat 103</li><br >
<li>Find the names of sailors who have not reserved a boat whose name contains the string “storm”. Order the names in ascending order.</li><br >
<li>Find the names of sailors who have reserved all boats.</li><br >
<li>Find the name and age of the oldest sailor.</li><br >
<li>For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors.</li><br >
<li>Create a view that shows the names and colours of all the boats that have been reserved by a sailor with a specific rating.</li><br >
<li>A trigger that prevents boats from being deleted If they have active reservations.</li><br >
</ol>

<h1>INSURANCE DATABASE</h1><br >
<hr/>

Consider the database schemas given below. Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified. Create tables for the following schema listed below by properly specifying the primary keys and foreign keys. Enter at least five tuples for each relation.<br >
Insurance database<br >

PERSON (driver id#: string, name: string, address: string)<br >
CAR (regno: string, model: string, year: int)<br >
ACCIDENT (report_ number: int, acc_date: date, location: string)<br >
OWNS (driver id#: string, regno: string)<br >
PARTICIPATED(driver id#:string, regno:string, report_ number: int,damage_amount: int)<br >
Queries, View and Trigger<br >
<ol>
<li>Find the total number of people who owned cars that were involved in accidents in 2021.</li>
<li>Find the number of accidents in which the cars belonging to “Smith” were involved.</li>
<li>Add a new accident to the database; assume any values for required attributes.</li>
<li>Delete the Mazda belonging to “Smith”.</li>
<li>Update the damage amount for the car with license number “KA09MA1234” in the accident with report.</li>
<li>A view that shows models and year of cars that are involved in accident.</li>
<li>A trigger that prevents a driver from participating in more than 3 accidents in a given year.</li>
</ol>
