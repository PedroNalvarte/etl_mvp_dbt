
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_81aabf391b090168475e0f6360ee2420]
   as 
    
    



select total_profit
from "etl-server"."master"."fact_sales"
where total_profit is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_81aabf391b090168475e0f6360ee2420]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_81aabf391b090168475e0f6360ee2420]
  ;')