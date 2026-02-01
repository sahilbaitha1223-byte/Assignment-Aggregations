use world;

# Question 1 : Count how many cities are there in each country?

SELECT 
    Co.name AS country, COUNT(ci.name) AS City_count
FROM
    city Ci
        JOIN
    country Co ON ci.countrycode = co.code
GROUP BY co.name;

# Question 2 : Display all continents having more than 30 countries

SELECT 
    co.Continent, COUNT(*)
FROM
    city AS ci
        JOIN
    country AS co ON ci.countrycode = co.code
GROUP BY co.Continent
HAVING COUNT(*) > 30;

SELECT DISTINCT
    name
FROM
    country;

# Question 3 : List regions whose total population exceeds 200 million ?

SELECT 
    region
FROM
    country
WHERE
    Population > 200000000;

# Question 4 : Find the top 5 continents by average GNP per country

SELECT 
    continent, AVG(GNP) AS AVG_GNP
FROM
    country
GROUP BY continent
ORDER BY AVG(GNP) DESC
LIMIT 5;

# Question 5 : Find the total number of official languages spoken in each continent

SELECT 
    co.Continent, COUNT(Language) AS Total_language
FROM
    country AS co
        JOIN
    countrylanguage AS cl ON co.code = cl.CountryCode
GROUP BY co.Continent
ORDER BY Total_language DESC;

# Question 6 : Find the maximum and minimum GNP for each continent.

SELECT 
    continent, MAX(GNP) AS max_gnp, MIN(GNP) AS min_gnp
FROM
    country
GROUP BY continent;

# Question 7 : Find the country with the highest average city population.

select co.name 

from city ci join country co
on ci.CountryCode = co.Code 
group by co.Name 
order by avg(ci.Population)  desc
limit 1;

# Question 8 : List continents where the average city population is greater than 200,000.

select co.Continent
from city as ci join country as co
on ci.CountryCode = co.Code
group by co.Continent
having avg(ci.Population) > 200000;

# Question 9 : Find the total population and average life expectancy for each continent,
-- ordered by average life expectancy descending.

select 
        co.Continent , sum(ci.Population) as Total_population,
        avg(co.LifeExpectancy) as avg_lifeExpentancy
from city as ci join country as co
on ci.CountryCode = co.Code
group by co.Continent
order by avg_lifeExpentancy desc;

# Question 10 : Find the top 3 continents with the highest average life expectancy,
-- but only include those wherethe total population is over 200 million.

SELECT 
    co.Continent,
    AVG(co.LifeExpectancy) AS avg_lifeExpentancy,
    SUM(ci.Population) AS Total_population
FROM
    city AS ci
        JOIN
    country AS co ON ci.CountryCode = co.Code
GROUP BY co.Continent
HAVING SUM(ci.Population) > 200000000
ORDER BY avg_lifeExpentancy DESC
limit 3;




























