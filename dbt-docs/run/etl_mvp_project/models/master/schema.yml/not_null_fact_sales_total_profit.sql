
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_e9ff50ca0e328eea79a884d09f7d86ec]
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

    [dbt_test__audit.testview_e9ff50ca0e328eea79a884d09f7d86ec]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_e9ff50ca0e328eea79a884d09f7d86ec]
  ;')