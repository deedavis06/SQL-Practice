-- Drop the PETRESCUE table in case it exists--
drop table PETRESCUE;

-- Create the PETRESCUE table --
create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

---Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.--
SELECT SUM(COST) FROM PETRESCUE;
---Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.--
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;
--Enter a function that displays the maximum quantity of animals rescued.--
SELECT MAX(QUANTITY) FROM PETRESCUE;
--Enter a function that displays the average cost of animals rescued.--
SELECT AVG(COST) FROM PETRESCUE;
--Enter a function that displays the average cost of rescuing a dog.--
SELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL='Dog';

--Enter a function that displays the rounded cost of each rescue.--
SELECT ROUND(COST) FROM PETRESCUE;
--Enter a function that displays the length of each animal name.--
SELECT LENGTH(ANIMAL) FROM PETRESCUE;
-- Enter a function that displays the animal name in each rescue in uppercase.--
SELECT UCASE(ANIMAL) FROM PETRESCUE;
--Enter a function that displays the animal name in each rescue in uppercase without duplications.--
SELECT DISTINCT (UCASE(ANIMAL)) FROM PETRESCUE;
--Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats.--
SELECT * FROM PETRESCUE WHERE LCASE(ANIMAL)='cat';

-- Enter a function that displays the day of the month when cats have been rescued.--
SELECT DAY(RESCUEDATE) FROM PETRESCUE WHERE ANIMAL='Cat';
--Enter a function that displays the number of rescues on the 5th month.--
SELECT QUANTITY FROM PETRESCUE WHERE MONTH(RESCUEDATE)='05';
-- Enter a function that displays the number of rescues on the 14th day of the month.--
SELECT QUANTITY FROM PETRESCUE WHERE DAY(RESCUEDATE)= '14';
-- Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.--
SELECT (RESCUEDATE+ 3 DAYS) AS VET_VISIT FROM PETRESCUE;
--Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the recue date.--
SELECT (CURRENT DATE-RESCUEDATE) FROM PETRESCUE;