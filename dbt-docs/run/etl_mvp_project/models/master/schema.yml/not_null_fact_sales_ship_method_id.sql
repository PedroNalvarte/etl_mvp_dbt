
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_ba25019565476c49e84a57f19b48e15d]
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

    [dbt_test__audit.testview_ba25019565476c49e84a57f19b48e15d]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_ba25019565476c49e84a57f19b48e15d]
  ;')