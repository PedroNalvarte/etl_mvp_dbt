USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "staging"."stg_producto__dbt_tmp" as 

with source as (
  select * from "etl-server"."raw"."dbt_data"
)

select distinct
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), coalesce(cast(item_type as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_'')), '''')), 2))
 as id_producto,
  item_type as tipo_producto,
  cast(unit_price as float) as precio_unitario,
  cast(unit_cost as float) as costo_unitario
from source;
    ')

