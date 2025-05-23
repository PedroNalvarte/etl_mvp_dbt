
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_ade227311f316cba0122e233514d2bc5]
   as 
    
    



select total_revenue
from "etl-server"."master"."fact_sales"
where total_revenue is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_ade227311f316cba0122e233514d2bc5]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_ade227311f316cba0122e233514d2bc5]
  ;')