
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_deec541989a996af427c268beb0fca94]
   as 
    
    



select product_id
from "etl-server"."master"."dim_product"
where product_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_deec541989a996af427c268beb0fca94]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_deec541989a996af427c268beb0fca94]
  ;')