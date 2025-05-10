With job_cte as (
Select company_id, title, description, Count(job_id) as job_count
FRom job_listings
GROUP by company_id, title, description
Having Count(job_id) > 1
)
SELECT COUNT(*) as duplicate_companies 
FROM job_cte;
