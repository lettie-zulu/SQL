CREATE TABLE actors (
    id integer,
    movie text,
    actor text
);

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20
     )
TO 'C:\Users\letti\Documents\bootcamp\SQL\chapter4\us_counties_housing_export.txt'
WITH (FORMAT CSV, HEADER);

-- No, it won't. In fact, you won't even be able to create a column with that
-- data type because the precision must be larger than the scale. The correct
-- type for the example data is numeric(8,3).