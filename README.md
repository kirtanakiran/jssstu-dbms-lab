<h1>SAILORS DATABASE</h1>
<hr/>

Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified. Create tables for the following schema listed below by properly specifying the primary keys and foreign keys. Enter at least five tuples for each relation.<br >

Sailors database<br >
SAILORS (sid, sname, rating, age)<br >
BOAT(bid, bname, color)<br >
RSERVERS (sid, bid, date)<br >
Queries, View and Trigger<br >

<ol>
<li>Find the colours of boats reserved by Albert</li>
<li>Find all sailor id’s of sailors who have a rating of at least 8 or reserved boat 103</li>
<li>Find the names of sailors who have not reserved a boat whose name contains the string “storm”. Order the names in ascending order.</li>
<li>Find the names of sailors who have reserved all boats.</li>
<li>Find the name and age of the oldest sailor.</li>
<li>For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors.</li>
<li>Create a view that shows the names and colours of all the boats that have been reserved by a sailor with a specific rating.</li>
<li>A trigger that prevents boats from being deleted If they have active reservations.</li>
</ol>

<h1>INSURANCE DATABASE</h1>
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

## Order Processing Database 
3.Write ER diagram and schema diagram. The primary keys are underlined and the data types are specified.
Create tables for the following schema listed below by properly specifying the primary keys and foreign keys.
Enter at least five tuples for each relation.
Order processing database

1. Customer (Cust#:int, cname: string, city: string)
2. Order (order#:int, odate: date, cust#: int, order-amt: int)
3. Order-item (order#:int, Item#: int, qty: int)
4. Item (item#:int, unitprice: int)
5. Shipment (order#:int, warehouse#: int, ship-date: date)
6. Warehouse (warehouse#:int, city: string)

Queries, View and Trigger

1. List the Order# and Ship\_date for all orders shipped from Warehouse# "W2". 
2. List the Warehouse information from which the Customer named "Kumar" was supplied his orders. Produce a listing of Order#, Warehouse#. 
3. Produce a listing: Cname, #ofOrders, Avg\_Order\_Amt, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer. (Use aggregate functions) 
4. Delete all orders for customer named "Kumar". 
5. Find the item with the maximum unit price. 
6. A trigger that prevents warehouse details from being deleted if any item has to be shipped from that warehouse. 
7. Create a view to display orderID and shipment date of all orders shipped from a warehouse 2. 
8. A view that shows the warehouse name from where the kumar’s order is been shipped.
9. A tigger that updates order\_amount based on quantity and unit price of order\_item .
