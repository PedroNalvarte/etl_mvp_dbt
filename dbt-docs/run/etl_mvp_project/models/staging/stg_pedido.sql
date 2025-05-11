USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "staging"."stg_pedido__dbt_tmp" as 

with source as (
  select * from "etl-server"."raw"."dbt_data"
)

select distinct
  cast(order_id as bigint) as id_pedido,
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), coalesce(cast(country as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_'')), '''')), 2))
 as id_pais,
  order_priority as prioridad_pedido,
  cast(order_date as date) as fecha_pedido,
  cast(ship_date as date) as fecha_envio,
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), coalesce(cast(shipping_method as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_'')), '''')), 2))
 as id_metodo
from source;
    ')

