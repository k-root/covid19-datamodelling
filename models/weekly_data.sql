{{ config(materialized='table') }}


SELECT
 min(DATE) as week_start_date,
 week(to_timestamp(DATE)) as week_num,
 year(to_timestamp(DATE)) as year,
 sum(TOTAL_RECOVERED) as weekly_total_recovered,
 sum(TOTAL_CASES_PER_MILLION) as weekly_total_cases_per_million,
 sum(NEW_CASES_PER_MILLION) as weekly_new_cases_per_million,

 sum(TOTAL_ACTIVE_CASES) as weekly_total_active_cases,
 sum(NEW_ACTIVE_CASES) as weekly_new_active_cases,

 avg(GROWTH_FACTOR_OF_NEW_CASES) as average_growth_factor_of_new_cases,
 avg(GROWTH_FACTOR_OF_NEW_DEATHS) as average_growth_factor_of_new_deaths,
 
 avg(CASE_FATALITY_RATE) as average_case_fatality_rate,
 avg(CASE_RECOVERED_RATE) as average_case_recovered_rate
 
FROM   "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAUSHIK_KOILADA"  
group by week_num, year
order by year, week_num, week_start_date