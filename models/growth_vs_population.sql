{{ config(materialized='table') }}

SELECT
  -- DATE,
  location_iso_code,
  avg(population_density) as avg_population_density,
  avg(GROWTH_FACTOR_OF_NEW_DEATHS) as avg_growth_factor_new_deaths,
  avg(GROWTH_FACTOR_OF_NEW_CASES) as avg_growth_factor_new_cases
  -- max(GROWTH_FACTOR_OF_NEW_DEATHS) as max_growth_factor_new_deaths,
  -- max(GROWTH_FACTOR_OF_NEW_CASES) as max_growth_factor_new_cases
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAUSHIK_KOILADA" 
group by location_iso_code
order by avg_population_density desc
