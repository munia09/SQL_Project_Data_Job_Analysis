      --UNION OPERATORS

SELECT 
    job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs;

        --Find job_postings from the first quarter that have a salary greater than $70k:
          --Combine job posting tables from the first quarter of 2023(jan-march)
          --Get job postings with an average yearly salary > $70,000



SELECT
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE
FROM(
     SELECT *
     FROM january_jobs
     UNION ALL
     SELECT *
     FROM february_jobs
     UNION ALL
     SELECT *
     FROM march_jobs)AS quarter1_job_postings 
WHERE quarter1_job_postings.salary_year_avg > 70000
;
