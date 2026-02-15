SELECT 
   '2023-02-19' :: Date,
   '123' :: Integer,
   'TRUE' :: Boolean,
   '3.21' :: Real; 

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date_time
FROM job_postings_fact
LIMIT 10;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date :: date AS date
FROM job_postings_fact
LIMIT 10;

SELECT 
  job_title_short AS Title,
  job_location AS Location,
  job_posted_date 
    AT TIME ZONE 'UTC' 
    AT TIME ZONE 'EST' AS Date_Time
FROM job_postings_fact
LIMIT 10;

SELECT 
  job_title_short AS Title,
  job_location AS Location,
  job_posted_date 
    AT TIME ZONE 'UTC' 
    AT TIME ZONE 'EST' AS Date_Time,
    EXTRACT (YEAR FROM job_posted_date) AS year,
    EXTRACT (MONTH FROM job_posted_date) AS month,
    EXTRACT (DAY FROM job_posted_date) AS day
FROM job_postings_fact
LIMIT 10;

SELECT
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS MONTH
FROM job_postings_fact
LIMIT 10;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS MONTH
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY MONTH
ORDER BY job_posted_count DESC;

SELECT
    job_posted_date ::DATE AS Date,
    job_schedule_type, 
    AVG(salary_year_avg) AS avg_year_salary,
    AVG(salary_hour_avg) AS avg_hour_salary
FROM job_postings_fact
WHERE job_posted_date >= '2023-07-01'
GROUP BY job_schedule_type,Date
ORDER BY Date ASC;

SELECT
    COUNT(job_id) AS job_posted_count,
    job_posted_date
       AT TIME ZONE 'UTC'
       AT TIME ZONE 'EST' AS date_time,
    EXTRACT(
        MONTH FROM job_posted_date
        AT TIME ZONE 'UTC'
        AT TIME ZONE 'EST') AS MONTH
FROM job_postings_fact
GROUP BY date_time, EXTRACT(
        MONTH FROM job_posted_date
        AT TIME ZONE 'UTC'
        AT TIME ZONE 'EST')
ORDER BY MONTH ASC
;

                 --create tables:

--january
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)= 1;

--february
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--march
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs;