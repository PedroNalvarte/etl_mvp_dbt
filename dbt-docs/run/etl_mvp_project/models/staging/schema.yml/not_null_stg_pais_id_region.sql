
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_e4e0265d845267eb918743d3dfd09c0e]
   as 
    
    



select id_region
from "etl-server"."staging"."stg_pais"
where id_region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e4e0265d845267eb918743d3dfd09c0e]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_e4e0265d845267eb918743d3dfd09c0e]
  ;')