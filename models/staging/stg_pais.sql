{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select distinct
  {{ dbt_utils.generate_surrogate_key(['country']) }} as id_pais,
  country as nombre_pais,
  {{ dbt_utils.generate_surrogate_key(['region']) }} as id_region
from source