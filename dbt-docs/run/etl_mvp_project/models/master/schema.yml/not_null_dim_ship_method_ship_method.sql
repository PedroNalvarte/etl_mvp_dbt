
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f9b8cab3136f0dca855e0dd2c2a83c96]
   as 
    
    



select ship_method
from "etl-server"."master"."dim_ship_method"
where ship_method is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_f9b8cab3136f0dca855e0dd2c2a83c96]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f9b8cab3136f0dca855e0dd2c2a83c96]
  ;')