
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_04873377b2efaaea4b205d2018cb628e]
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

    [dbt_test__audit.testview_04873377b2efaaea4b205d2018cb628e]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_04873377b2efaaea4b205d2018cb628e]
  ;')