
  
    USE [etl-server];
    USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "master"."dim_region__dbt_tmp__dbt_tmp_vw" as 

select distinct
  r.id_region as region_id,
  r.nombre_region as region,
  p.nombre_pais as country
from "etl-server"."staging"."stg_region" r
join "etl-server"."staging"."stg_pais" p on r.id_region = p.id_region;
    ')

EXEC('
            SELECT * INTO "etl-server"."master"."dim_region__dbt_tmp" FROM "etl-server"."master"."dim_region__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_region__dbt_tmp__dbt_tmp_vw')



    
    use [etl-server];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dim_region__dbt_tmp_cci'
        AND object_id=object_id('master_dim_region__dbt_tmp')
    )
    DROP index "master"."dim_region__dbt_tmp".master_dim_region__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dim_region__dbt_tmp_cci
    ON "master"."dim_region__dbt_tmp"

   


  