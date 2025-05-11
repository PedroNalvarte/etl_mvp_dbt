USE [etl-server];
    
    

    

    
    USE [etl-server];
    EXEC('
        create view "staging"."stg_region__dbt_tmp" as 

with source as (
  select * from "etl-server"."raw"."dbt_data"
)

select distinct
  
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), coalesce(cast(region as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_'')), '''')), 2))
 as id_region,
  region as nombre_region
from source;
    ')

