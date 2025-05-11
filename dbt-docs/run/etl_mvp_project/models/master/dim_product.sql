
  
    USE [etl-server];
    USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "master"."dim_product__dbt_tmp__dbt_tmp_vw" as 

select
  id_producto as product_id,
  tipo_producto as product,
  precio_unitario,
  costo_unitario
from "etl-server"."staging"."stg_producto";
    ')

EXEC('
            SELECT * INTO "etl-server"."master"."dim_product__dbt_tmp" FROM "etl-server"."master"."dim_product__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_product__dbt_tmp__dbt_tmp_vw')



    
    use [etl-server];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dim_product__dbt_tmp_cci'
        AND object_id=object_id('master_dim_product__dbt_tmp')
    )
    DROP index "master"."dim_product__dbt_tmp".master_dim_product__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dim_product__dbt_tmp_cci
    ON "master"."dim_product__dbt_tmp"

   


  