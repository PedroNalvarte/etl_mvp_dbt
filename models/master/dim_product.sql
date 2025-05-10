{{ config(schema='master', materialized='table') }}

select
  id_producto as product_id,
  tipo_producto as product,
  precio_unitario,
  costo_unitario
from {{ ref('stg_producto') }}
