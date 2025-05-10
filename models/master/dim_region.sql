{{ config(schema='master', materialized='table') }}

select distinct
  r.id_region as region_id,
  r.nombre_region as region,
  p.nombre_pais as country
from {{ ref('stg_region') }} r
join {{ ref('stg_pais') }} p on r.id_region = p.id_region
