-- combine all data into one table

SELECT *
INTO full_data
FROM (
SELECT *
FROM year_2018
UNION ALL
SELECT *
FROM year_2019
UNION ALL
SELECT *
FROM year_2020) sub

SELECT *
FROM full_data

-- add revenue column

ALTER TABLE full_data
ADD revenue int

UPDATE full_data
SET revenue = (stays_in_weekend_nights + stays_in_week_nights)*adr

-- join all tables

SELECT *
FROM full_data
JOIN market_segment
ON full_data.market_segment = market_segment.market_segment
JOIN meal_cost
ON full_data.meal = meal_cost.meal
