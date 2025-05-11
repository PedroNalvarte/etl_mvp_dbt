
  
    USE [etl-server];
    USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "master"."fact_sales__dbt_tmp__dbt_tmp_vw" as 

with detalle as (
  select * from "etl-server"."staging"."stg_detalle_pedido"
),

pedido as (
  select id_pedido, prioridad_pedido, fecha_pedido, id_metodo, id_pais from "etl-server"."staging"."stg_pedido"
),

fecha as (
  select
    id_pedido,
    cast(format(fecha_pedido, ''yyyyMMdd'') as int) as date_key
  from pedido
),

prioridad as (
  select ''L'' as letra, 1 as prioridad union all
  select ''M'', 2 union all
  select ''H'', 3 union all
  select ''C'', 4
),

fact as (
  select
    f.date_key,
    d.id_producto as product_id,
    p.id_pais,
    p.id_metodo as ship_method_id,
    pr.prioridad,
    d.unidades_vendidas as units_sold,
    d.costo_produccion as production_cost,
    d.costo_envio as shipping_cost,
    d.costo_aduanas as customs_cost,
    d.costo_marketing as marketing_cost,
    d.costo_almacenamiento as storage_cost,
    d.otros_costos as other_cost,
    d.costo_total as total_cost,
    d.ingreso_total as total_revenue,
    d.ganancia_total as total_profit
  from "etl-server"."staging"."stg_detalle_pedido" d
  join pedido p on d.id_pedido = p.id_pedido
  join fecha f on p.id_pedido = f.id_pedido
  join prioridad pr on p.prioridad_pedido = pr.letra
)

select * from fact;
    ')

EXEC('
            SELECT * INTO "etl-server"."master"."fact_sales__dbt_tmp" FROM "etl-server"."master"."fact_sales__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.fact_sales__dbt_tmp__dbt_tmp_vw')



    
    use [etl-server];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_fact_sales__dbt_tmp_cci'
        AND object_id=object_id('master_fact_sales__dbt_tmp')
    )
    DROP index "master"."fact_sales__dbt_tmp".master_fact_sales__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_fact_sales__dbt_tmp_cci
    ON "master"."fact_sales__dbt_tmp"

   


  