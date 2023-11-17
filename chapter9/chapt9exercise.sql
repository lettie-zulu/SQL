--------------------------------------------------------------
-- Chapter 9: Inspecting and Modifying Data
--------------------------------------------------------------

-- In this exercise, you’ll turn the meat_poultry_egg_inspect table into useful
-- information. You needed to answer two questions: How many of the companies
-- in the table process meat, and how many process poultry?

-- Create two new columns called meat_processing and poultry_processing. Each
-- can be of the type boolean.

-- Using UPDATE, set meat_processing = TRUE on any row where the activities
-- column contains the text 'Meat Processing'. Do the same update on the
-- poultry_processing column, but this time lookup for the text
-- 'Poultry Processing' in activities.

-- Use the data from the new, updated columns to count how many companies
-- perform each type of activity. For a bonus challenge, count how many
-- companies perform both activities.

-- Answer:
-- a) Add the columns

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean;
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN poultry_processing boolean;

SELECT * FROM meat_poultry_egg_inspect; -- view table with new empty columns

-- b) Update the columns

UPDATE meat_poultry_egg_inspect
SET meat_processing = TRUE
WHERE activities ILIKE '%meat processing%'; -- case-insensitive match with wildcards

UPDATE meat_poultry_egg_inspect
SET poultry_processing = TRUE
WHERE activities ILIKE '%poultry processing%'; -- case-insensitive match with wildcards

-- c) view the updated table

SELECT * FROM meat_poultry_egg_inspect;

-- d) Count meat and poultry processors

SELECT count(meat_processing), count(poultry_processing)
FROM meat_poultry_egg_inspect;

-- e) Count those who do both

SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;