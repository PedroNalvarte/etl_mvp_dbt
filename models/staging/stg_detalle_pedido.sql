{{ config(schema='staging') }}

with source as (
  select * from {{ ref('dbt_data') }}
)

select
  {{ dbt_utils.generate_surrogate_key(['order_id',
  'item_type',
  'units_sold',
  'unit_price',
  'ship_date',
  'production_cost',
  'shipping_cost',
  'customs_cost',
  'marketing_cost',
  'storage_cost',
  'other_cost']) }} as id_detalle,
  cast(order_id as bigint) as id_pedido,
  {{ dbt_utils.generate_surrogate_key(['item_type']) }} as id_producto,
  cast(units_sold as int) as unidades_vendidas,
  cast(production_cost as float) as costo_produccion,
  cast(shipping_cost as float) as costo_envio,
  cast(customs_cost as float) as costo_aduanas,
  cast(marketing_cost as float) as costo_marketing,
  cast(storage_cost as float) as costo_almacenamiento,
  cast(other_cost as float) as otros_costos,
  cast(total_cost as float) as costo_total,
  cast(total_revenue as float) as ingreso_total,
  cast(total_profit as float) as ganancia_total
from source