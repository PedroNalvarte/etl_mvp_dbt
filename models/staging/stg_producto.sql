{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select distinct
  {{ dbt_utils.generate_surrogate_key(['item_type']) }} as id_producto,
  item_type as tipo_producto,
  cast(unit_price as float) as precio_unitario,
  cast(unit_cost as float) as costo_unitario
from source
