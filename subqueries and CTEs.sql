               --Subqueries:

SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

              --Common Table Expressions(CTEs):

WITH january_jobs AS 
      (SELECT *
      FROM job_postings_fact
      WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)   
SELECT *
FROM january_jobs;        

SELECT
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN(
    SELECT company_id
FROM job_postings_fact
WHERE job_no_degree_mention = TRUE
ORDER BY company_id);


WITH company_job_count AS(
            SELECT
            company_id,
            COUNT(*) AS total_jobs -- or COUNT(company_id) same thing
            FROM job_postings_fact
            GROUP BY company_id)
SELECT cd.name AS company_name, --When I enter the full name of the table here it gives me an error message.
       cjc.total_jobs --When I enter the full name of the table here it gives me an error message.
FROM company_dim  cd 
LEFT JOIN company_job_count cjc
  ON cjc.company_id = cd.company_id
ORDER BY total_jobs DESC
;

  --Find the count of the number of remote job postings per skill:
  --  Display the top 5 skills by their demand in remote jobs,
  --  Include skill id, name and count of postings requiring the skill

WITH remote_job_skills AS (
     SELECT
        skill_id,
        COUNT(*) AS skill_count
     FROM skills_job_dim sjd 
     INNER JOIN job_postings_fact jpf 
        ON jpf.job_id = sjd.job_id
     WHERE jpf.job_work_from_home = TRUE
     AND jpf.job_title_short = 'Data Analyst'
     GROUP BY skill_id
)

SELECT
     sd.skill_id,
     skills AS skill_name,
     skill_count
FROM remote_job_skills rjs
INNER JOIN skills_dim sd
   ON rjs.skill_id = sd.skill_id
ORDER BY skill_count DESC
LIMIT 5
;






