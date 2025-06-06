/*
Question: What are the top-paying jobs for data analyst jobs? 
    - Identify the top 10 highest-paying Data analyst roles that are available remotely. 
    - Focuses on job postings with specified salareis (no NULLS).
    - Why? Highlight the top-paying opprtunities for Data analysts, offering insights into employment opprtunities
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    name AS company_name,
    salary_year_avg,
    job_posted_date::DATE
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;