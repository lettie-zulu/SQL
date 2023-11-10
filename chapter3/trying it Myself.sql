--TRY IT YOURSELF.
CREATE TABLE MileageTracking (
    DriverID INT,
    Date DATE,
    Mileage DECIMAL(4,1)
);
SELECT * FROM MileageTracking;
--In this case, since you want to track mileage to a tenth of a mile and the maximum value is 999 miles, you might consider using a data type like DECIMAL(4,1).
--Here, 4 is the precision (total digits), and 1 is the scale (number of digits to the right of the decimal point).

CREATE TABLE Driver (
    DriverID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
SELECT * FROM Driver;
--Search and Sorting: Separating names into distinct columns allows for more efficient search and sorting operations.
--Flexibility: Storing first and last names separately provides flexibility when you need to display or manipulate the data.

SELECT TO_TIMESTAMP('4//2017', 'MM/YYYY');
--This results in an error.
