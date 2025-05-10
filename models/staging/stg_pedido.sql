{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select distinct
  cast(order_id as bigint) as id_pedido,
  {{ dbt_utils.generate_surrogate_key(['country']) }} as id_pais,
  order_priority as prioridad_pedido,
  cast(order_date as date) as fecha_pedido,
  cast(ship_date as date) as fecha_envio,
  {{ dbt_utils.generate_surrogate_key(['shipping_method']) }} as id_metodo
from source