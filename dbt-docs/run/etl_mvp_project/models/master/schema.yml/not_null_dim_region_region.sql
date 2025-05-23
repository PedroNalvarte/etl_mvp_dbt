
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_c27fcf2155d09ed87e2845aec060f223]
   as 
    
    



select region
from "etl-server"."master"."dim_region"
where region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c27fcf2155d09ed87e2845aec060f223]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_c27fcf2155d09ed87e2845aec060f223]
  ;')