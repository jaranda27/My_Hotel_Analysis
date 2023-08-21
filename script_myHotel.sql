USE my_hotel;

CREATE TABLE hote_reveue
SELECT * FROM hotel_revenue_2018
UNION 
SELECT * FROM hotel_revenue_2019
UNION 
SELECT * FROM hotel_revenue_2020;

SELECT hotel_type, arrival_date_year AS year, ROUND(SUM(
(stays_in_week_nights + stays_in_weekend_nights)*adr),2) AS Total_revenue
FROM hote_revenue
GROUP BY 1,2;

ALTER TABLE meal_cost RENAME COLUMN
ï»¿Cost TO cost;

ALTER TABLE market_segment RENAME COLUMN
ï»¿Discount TO Discount;

SELECT * 
FROM hote_revenue AS htr
LEFT JOIN market_segment AS ms 
ON htr.market_segment=ms.market_segment
LEFT JOIN meal_cost AS mc
ON htr.meal = mc.meal;

