
  
    USE [etl-server];
    USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "master"."dim_date__dbt_tmp__dbt_tmp_vw" as 

with fechas as (
  select distinct cast(fecha_pedido as date) as fecha
  from "etl-server"."staging"."stg_pedido"
)

select
  cast(format(fecha, ''yyyyMMdd'') as int) as date_key,
  fecha as full_date,
  year(fecha) as year,
  month(fecha) as month,
  datepart(quarter, fecha) as quarter
from fechas;
    ')

EXEC('
            SELECT * INTO "etl-server"."master"."dim_date__dbt_tmp" FROM "etl-server"."master"."dim_date__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_date__dbt_tmp__dbt_tmp_vw')



    
    use [etl-server];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dim_date__dbt_tmp_cci'
        AND object_id=object_id('master_dim_date__dbt_tmp')
    )
    DROP index "master"."dim_date__dbt_tmp".master_dim_date__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dim_date__dbt_tmp_cci
    ON "master"."dim_date__dbt_tmp"

   


  