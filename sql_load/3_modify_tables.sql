/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM 'C:\Users\dimad\OneDrive\Desktop\Dima- SQL Project\SQL_Project_Job_As_Data_Analyst\csv_files\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:\Users\dimad\OneDrive\Desktop\Dima- SQL Project\SQL_Project_Job_As_Data_Analyst\csv_files\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:\Users\dimad\OneDrive\Desktop\Dima- SQL Project\SQL_Project_Job_As_Data_Analyst\csv_files\job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:\Users\dimad\OneDrive\Desktop\Dima- SQL Project\SQL_Project_Job_As_Data_Analyst\csv_files\skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/
SELECT * FROM company_dim;
-- NOTE: This has been updated from the video to fix issues with encoding

COPY company_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

--Now onto dates 
--DATE
SELECT job_title_short AS title,
        job_location AS location,
        job_posted_date::DATE AS date 

 FROM job_postings_fact;
 

 --TIMEZONE

SELECT job_title_short AS title,
        job_location AS location,
        job_posted_date AT TIME ZONE 'EST' AS date 

 FROM job_postings_fact;

--If values are already in a given timezone and you want to change the time zone so you write it twice

SELECT job_title_short AS title,
        job_location AS location,
        job_posted_date AT TIME ZONE 'UTC'AT TIME ZONE 'EST' AS date 

 FROM job_postings_fact;

 --EXTRACT MONTH AND DATE 

 SELECT job_title_short AS title,
        job_location AS location,
        job_posted_date AT TIME ZONE 'UTC'AT TIME ZONE 'EST' AS date, 
        EXTRACT (MONTH FROM job_posted_date) AS date_month,
        EXTRACT (YEAR FROM job_posted_date) AS date_year

 FROM job_postings_fact;

 