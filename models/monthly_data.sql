{{ config(materialized='table') }}


SELECT
 min(DATE) as month_start_date,
 month(to_timestamp(DATE)) as month_num,
 year(to_timestamp(DATE)) as year,
 sum(TOTAL_RECOVERED) as monthly_total_recovered,
 sum(TOTAL_CASES_PER_MILLION) as monthly_total_cases_per_million,
 sum(NEW_CASES_PER_MILLION) as monthly_new_cases_per_million,

 sum(TOTAL_ACTIVE_CASES) as monthly_total_active_cases,
 sum(NEW_ACTIVE_CASES) as monthly_new_active_cases,

 avg(GROWTH_FACTOR_OF_NEW_CASES) as average_growth_factor_of_new_cases,
 avg(GROWTH_FACTOR_OF_NEW_DEATHS) as average_growth_factor_of_new_deaths,
 
 avg(CASE_FATALITY_RATE) as average_case_fatality_rate,
 avg(CASE_RECOVERED_RATE) as average_case_recovered_rate
 
FROM   "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAUSHIK_KOILADA"  
group by month_num, year
order by year, month_num, month_start_date