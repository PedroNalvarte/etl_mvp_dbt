
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f09203099d8861bb70f58cfccc0598d1]
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

    [dbt_test__audit.testview_f09203099d8861bb70f58cfccc0598d1]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f09203099d8861bb70f58cfccc0598d1]
  ;')