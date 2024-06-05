-- 1.	How many rows are in the data_analyst_jobs table?

-- SELECT COUNT(*)
-- FROM data_analysts_jobs;

-- 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- SELECT*
-- FROM data_analysts_jobs
-- LIMIT 10;

--ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

-- SELECT COUNT(*)
-- FROM data_analysts_jobs
-- WHERE location IN ('TN','KY');

-- 27 postings 

-- 4.	How many postings in Tennessee have a star rating above 4?

-- SELECT COUNT(location)
-- FROM data_analysts_jobs
-- WHERE location = 'TN'
-- AND star_rating > 4;

--3

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

-- SELECT COUNT(*)
-- FROM data_analysts_jobs
-- WHERE review_count BETWEEN 500 AND 1000;

--151

-- 6.	Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating?

-- SELECT AVG(star_rating) AS avg_rating, location AS state
-- FROM data_analysts_jobs
-- 	WHERE star_rating IS NOT NULL
-- 	AND location IS NOT NULL
-- GROUP BY state
-- ORDER BY avg_rating DESC
-- LIMIT 1;

-- Nebraska

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analysts_jobs;

-- 881 jobs

-- 8.	How many unique job titles are there for California companies?

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analysts_jobs
-- WHERE location = 'CA';

--230 jobs

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?

-- SELECT company, AVG(star_rating) AS avg_star_rating
-- FROM data_analysts_jobs
-- WHERE review_count > 5000
-- 	AND company IS NOT NULL
-- GROUP BY company;

-- 40 

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. 
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
--What is that rating?

-- SELECT company, AVG(star_rating) AS avg_star_rating
-- FROM data_analysts_jobs
-- WHERE review_count > 5000
-- AND company IS NOT NULL
-- GROUP BY company
-- ORDER BY avg_star_rating DESC;

--Unilever (4.199...)

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analysts_jobs
-- WHERE title LIKE '%Analyst%';

-- 754
-- unsure that I am using the % correctly...

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?

-- SELECT DISTINCT(title)
-- FROM data_analysts_jobs
-- WHERE title NOT LIKE '%Analyst%'
-- 	AND title NOT LIKE '%Analytics%'
-- 	AND title NOT LIKE '%ANALYST%'
-- 	AND title NOT LIKE '%ANALYTICS%'
-- 	AND title NOT LIKE '%analyst%';

-- Specialist 

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. 
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

-- SELECT COUNT(title), domain 
-- FROM data_analysts_jobs
-- WHERE days_since_posting > 21
-- AND skill LIKE '%SQL%'
-- GROUP BY domain;

--  - Disregard any postings where the domain is NULL. 

-- SELECT COUNT(title), domain 
-- FROM data_analysts_jobs
-- WHERE days_since_posting > 21
-- AND skill LIKE '%SQL%'
-- AND domain IS NOT NULL
-- GROUP BY domain;

--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 

SELECT COUNT(title), domain 
FROM data_analysts_jobs
WHERE days_since_posting > 21
AND skill LIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;


--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- Internet and Software (62), Banks and Financial Services (61), Consulting and Business Services (57)
