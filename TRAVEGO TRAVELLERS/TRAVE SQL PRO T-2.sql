
# TRAVEGO SQL PROJECT

-- TASK- 2

-- -------------------------------------------------------------------------------------------------------

-- 2. Perform read operation on the designed table created in the above task

-- a. How many female passengers traveled a minimum distance of 600 KMs?

select count(*) as FemalePassengers from Passenger
where Gender = 'F' and Distance >= 600;

-- -------------------------------------------------------------------------------------------------------

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.

select * from passenger
where Distance > 500 and Bus_Type = 'sleeper';

-- -------------------------------------------------------------------------------------------------------

-- c. Select passenger names whose names start with the character 'S'. 

select Passenger_name from Passenger 
where Passenger_name like 's%';

-- -------------------------------------------------------------------------------------------------------

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output.

select 
	P.Passenger_name,
    P.Boarding_City,
    P.Destination_City,
    P.Bus_Type,
    PR.Price 
from Passenger P join Price PR
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance;

-- -------------------------------------------------------------------------------------------------------

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?

select
    P.Passenger_name,
    PR.Price AS Ticket_Price
from Passenger P join Price PR
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance
where P.Distance = 1000 and P.Bus_Type = 'Sitting';

-- -------------------------------------------------------------------------------------------------------
    
-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
    
select * from price 
where distance = (select distance from passenger where passenger_name = 'pallavi');

-- -------------------------------------------------------------------------------------------------------

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.

update Passenger
set Category = 'Non-AC'
where Bus_Type = 'Sleeper';

select * from passenger;

-- -------------------------------------------------------------------------------------------------------

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.

delete from Passenger
where Passenger_name = 'Piyush';

select * from passenger;

-- -------------------------------------------------------------------------------------------------------

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required)

truncate table Passenger;
-- After executing this statement all rows in the "Passenger" table will be deleted and the table will have zero rows.

select * from passenger;

-- -------------------------------------------------------------------------------------------------------

-- j. Delete the table passenger from the database

drop table Passenger;

-- Here we droping the database travego;