{{ config(schema='master', materialized='table') }}

with fechas as (
  select distinct cast(fecha_pedido as date) as fecha
  from {{ ref('stg_pedido') }}
)

select
  cast(format(fecha, 'yyyyMMdd') as int) as date_key,
  fecha as full_date,
  year(fecha) as year,
  month(fecha) as month,
  datepart(quarter, fecha) as quarter
from fechas
