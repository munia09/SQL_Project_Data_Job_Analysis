              --CASE EXPRESSION

SELECT 
   job_title_short,
   job_location,
CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;

SELECT
   COUNT(job_id) AS number_of_jobs,
   CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY 
     location_category;

SELECT
   AVG(salary_year_avg) yearly_avg_salary,
   CASE
    WHEN salary_year_avg = 650000 THEN 'Highest salary'
    WHEN salary_year_avg = 400000 THEN 'Standard salary'
    WHEN salary_year_avg = 100000 THEN 'Lowest salary'
    ELSE 'Out of expectation'
   END AS salary_category
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
    AND  job_title_short = 'Data Analyst'
GROUP BY salary_year_avg
ORDER BY salary_year_avg DESC
;




