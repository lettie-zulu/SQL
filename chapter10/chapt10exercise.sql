
-- 1. In Listing 10-2, the correlation coefficient, or r value, of the
-- variables pct_bachelors_higher and median_hh_income was about .68.
-- Write a query to show the correlation between pct_masters_higher and
-- median_hh_income. Is the r value higher or lower? What might explain
-- the difference?

-- Answer:
-- The r value of pct_bachelors_higher and median_hh_income is about .57, which
-- shows a lower connection between percent master's degree or higher and
-- income than percent bachelor's degree or higher and income. One possible
-- explanation is that attaining a master's degree or higher may have a more
-- incremental impact on earnings than attaining a bachelor's degree.

SELECT
    round(
      corr(median_hh_income, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_income_r,
    round(
      corr(median_hh_income, pct_masters_higher)::numeric, 2
      ) AS masters_income_r
FROM acs_2011_2015_stats;


-- 2. In the FBI crime data, Which cities with a population of 500,000 or
-- more have the highest rates of motor vehicle thefts (column
-- motor_vehicle_theft)? Which have the highest violent crime rates
-- (column violent_crime)?

-- Answer:
-- a) In 2015, Milwaukee and Albuquerque had the two highest rates of motor
-- vehicle theft:

SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 100000, 1
        ) AS vehicle_theft_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY vehicle_theft_per_100000 DESC;

-- b) In 2015, Detroit and Memphis had the two highest rates of violent crime.

SELECT
    city,
    st,
    population,
    violent_crime,
    round(
        (violent_crime::numeric / population) * 100000, 1
        ) AS violent_crime_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY violent_crime_per_100000 DESC;

-- 3. As a bonus challenge, revisit the libraries data in the table
-- pls_fy2014_pupld14a in Chapter 8. Rank library agencies based on the rate
-- of visits per 1,000 population (variable popu_lsa), and limit the query to
-- agencies serving 250,000 people or more.

-- Answer:
-- Cuyahoga County Public Library tops the rankings with 12,963 visits per
-- thousand people (or roughly 13 visits per person).

SELECT
    libname,
    stabr,
    visits,
    popu_lsa,
    round(
        (visits::numeric / popu_lsa) * 1000, 1
        ) AS visits_per_1000,
    rank() OVER (ORDER BY (visits::numeric / popu_lsa) * 1000 DESC)
FROM pls_fy2014_pupld14a
WHERE popu_lsa >= 250000;