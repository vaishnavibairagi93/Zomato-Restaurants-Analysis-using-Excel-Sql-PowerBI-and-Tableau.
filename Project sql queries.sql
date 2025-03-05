# ques 1

select a.country_code,  b.Countryname, a.city, a.Locality, c.Currency, c.`USD Rate`
from main_table as a join country as b
on a.country_code=b.CountryID
join Currency as c
on a.Currency=c.Currency;

select a.country_code,  b.Countryname, a.city, a.Locality, a.Currency
from main_table as a join country as b
on a.country_code=b.CountryID;


#Question 2

SELECT YEAR(Datekey_Opening) AS Year,  MONTH(Datekey_Opening) AS Monthno, 
Monthname(Datekey_Opening) AS Monthname, concat("qtr-",Quarter(Datekey_Opening))Quarter,
DATE_FORMAT(Datekey_Opening, '%Y-%b') AS YearMonth, dayofweek(Datekey_Opening) AS Weekdayno, 
dayname(Datekey_Opening) AS Weekdayname,
case 
when month(Datekey_Opening)>3 then month (Datekey_Opening) -3 
else month(Datekey_Opening)+9 end as  FinancialMonth,
CASE
        WHEN MONTH(Datekey_Opening) BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN MONTH(Datekey_Opening) BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN MONTH(Datekey_Opening) BETWEEN 10 AND 12 THEN 'FQ3'
        WHEN MONTH(Datekey_Opening) BETWEEN 1 AND 3 THEN 'FQ4'
    END AS FinancialQuarter
FROM Main_table;


#ques 3 

select b.Countryname ,a.city, count(RestaurantID)numofrestaurants
from main_table as a join  country as b
on a.country_code = b.countryID
group by 1,2
order by 1,2;

select count(distinct city)  from main_table;


# ques 4 

select year(Datekey_Opening)year, quarter(Datekey_Opening)QTR, month(Datekey_Opening)month,
count(RestaurantId)noofresturants from main_table
group by 1, 2, 3
order by 1, 2,3;


# ques 5

SELECT CASE 
        WHEN rating <= 2 THEN "0-2"
        WHEN rating <= 3 THEN "2-3"
        WHEN rating <= 4 THEN "3-4"
        WHEN rating <= 5 THEN "4-5"
    END AS rating_range,
    COUNT(restaurantid) AS restaurant_count
FROM main_table
GROUP BY 1
ORDER BY rating_range ASC;
    
    
SELECT AVG(rating) AS average_rating, COUNT(DISTINCT restaurantid) AS restaurant_count
FROM main_table
having 1
ORDER BY average_rating DESC;


#ques 6

SELECT 
    CASE 
        WHEN price_range = 1 THEN "0-500" 
        WHEN price_range = 2 THEN "500-3000" 
        WHEN price_range = 3 THEN "3000-10000" 
        WHEN price_range = 4 THEN ">10000" 
    END AS price_range,
    COUNT(restaurantid) AS restaurant_count
FROM main_table
GROUP BY 1
ORDER BY restaurant_count ASC;  

# ques 7

SELECT Has_Table_booking, 
CONCAT(ROUND(COUNT(Has_Table_booking) * 100.0 / (SELECT COUNT(*) FROM main_table), 1), "%") AS percentage
FROM main_table
GROUP BY Has_Table_booking;

# ques 8

SELECT has_online_delivery, 
CONCAT(ROUND(COUNT(Has_Online_delivery) * 100.0 / (SELECT COUNT(*) FROM main_table), 1), "%") AS percentage
FROM main_table
GROUP BY has_online_delivery;
