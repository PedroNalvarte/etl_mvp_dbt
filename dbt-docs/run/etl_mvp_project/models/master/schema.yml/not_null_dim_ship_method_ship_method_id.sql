
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_b4b44b20d959d31780ba9eb0fbd6ce34]
   as 
    
    



select ship_method_id
from "etl-server"."master"."dim_ship_method"
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

    [dbt_test__audit.testview_b4b44b20d959d31780ba9eb0fbd6ce34]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_b4b44b20d959d31780ba9eb0fbd6ce34]
  ;')