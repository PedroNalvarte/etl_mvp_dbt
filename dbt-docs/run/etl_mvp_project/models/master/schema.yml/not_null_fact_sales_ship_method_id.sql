
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_9c65ca831b21a693f823d24c3a34df63]
   as 
    
    



select ship_method_id
from "etl-server"."master"."fact_sales"
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

    [dbt_test__audit.testview_9c65ca831b21a693f823d24c3a34df63]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_9c65ca831b21a693f823d24c3a34df63]
  ;')