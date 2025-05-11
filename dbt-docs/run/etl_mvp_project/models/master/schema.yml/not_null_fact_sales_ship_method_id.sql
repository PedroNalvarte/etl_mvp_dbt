
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_0639a46d59120db27b2dfdb505b69fc1]
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

    [dbt_test__audit.testview_0639a46d59120db27b2dfdb505b69fc1]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_0639a46d59120db27b2dfdb505b69fc1]
  ;')