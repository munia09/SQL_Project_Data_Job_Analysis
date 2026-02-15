ALTER TABLE job_applied
ADD contact VARCHAR (50);

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied; --Delete an existing table