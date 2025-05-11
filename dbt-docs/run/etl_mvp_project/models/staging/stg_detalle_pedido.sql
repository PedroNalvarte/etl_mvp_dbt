USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "staging"."stg_detalle_pedido__dbt_tmp" as 

with source as (
  select * from "etl-server"."raw"."dbt_data"
)

select
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(order_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(item_type as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(units_sold as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(unit_price as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(ship_date as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(production_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(shipping_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(customs_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(marketing_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(storage_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(other_cost as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as id_detalle,
  cast(order_id as bigint) as id_pedido,
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), coalesce(cast(item_type as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_'')), '''')), 2))
 as id_producto,
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
from source;
    ')

