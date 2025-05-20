/*
Question: What skills are required for the top-paying data analyst jobs? 
    - Using the top 10 highest-paying Data analyst jobs from (1_top_paying_jobs). 
    - Adding the specific skills required for these rolse.
    - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
           helping job seekers understand which skills to develop that aligh with the top salaries.
*/

WITH top_paying_data_analyst_jobs AS (
    SELECT 
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_data_analyst_jobs.*,skills
FROM 
    top_paying_data_analyst_jobs
INNER JOIN skills_job_dim ON top_paying_data_analyst_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;
