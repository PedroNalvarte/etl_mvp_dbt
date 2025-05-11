
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_88d4b8501a9530c8d2a1051199aee9b9]
   as 
    
    



select region_id
from "etl-server"."master"."dim_region"
where region_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_88d4b8501a9530c8d2a1051199aee9b9]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_88d4b8501a9530c8d2a1051199aee9b9]
  ;')