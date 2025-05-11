
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_585f8125b540e2e047790d71901d8ba3]
   as 
    
    



select ship_method_id
from "etl-server"."master"."dim_ship_method"
where ship_method_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_585f8125b540e2e047790d71901d8ba3]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_585f8125b540e2e047790d71901d8ba3]
  ;')