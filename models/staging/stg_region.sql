{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select distinct
  {{ dbt_utils.generate_surrogate_key(['region']) }} as id_region,
  region as nombre_region
from source