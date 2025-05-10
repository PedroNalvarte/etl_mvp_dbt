{{ config(schema='master', materialized='table') }}

select
  id_metodo as ship_method_id,
  nombre_metodo as ship_method
from {{ ref('stg_metodo_envio') }}
