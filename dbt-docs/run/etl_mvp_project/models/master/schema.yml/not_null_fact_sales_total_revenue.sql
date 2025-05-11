
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_57b33a780240bbd0c9ffa3cd361b209b]
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

    [dbt_test__audit.testview_57b33a780240bbd0c9ffa3cd361b209b]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_57b33a780240bbd0c9ffa3cd361b209b]
  ;')