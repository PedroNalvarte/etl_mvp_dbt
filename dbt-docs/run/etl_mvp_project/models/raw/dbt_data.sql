
  
    USE [etl-server];
    USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "raw"."dbt_data__dbt_tmp__dbt_tmp_vw" as 

select * from raw.data;
    ')

EXEC('
            SELECT * INTO "etl-server"."raw"."dbt_data__dbt_tmp" FROM "etl-server"."raw"."dbt_data__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS raw.dbt_data__dbt_tmp__dbt_tmp_vw')



    
    use [etl-server];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'raw_dbt_data__dbt_tmp_cci'
        AND object_id=object_id('raw_dbt_data__dbt_tmp')
    )
    DROP index "raw"."dbt_data__dbt_tmp".raw_dbt_data__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX raw_dbt_data__dbt_tmp_cci
    ON "raw"."dbt_data__dbt_tmp"

   


  