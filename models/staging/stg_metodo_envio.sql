{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select distinct
  {{ dbt_utils.generate_surrogate_key(['shipping_method']) }} as id_metodo,
  shipping_method as nombre_metodo
from source