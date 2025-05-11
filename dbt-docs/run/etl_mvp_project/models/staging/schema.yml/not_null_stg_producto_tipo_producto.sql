
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_cb6b1ac45d3b31b0dbd4ead5033f5e77]
   as 
    
    



select tipo_producto
from "etl-server"."staging"."stg_producto"
where tipo_producto is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_cb6b1ac45d3b31b0dbd4ead5033f5e77]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_cb6b1ac45d3b31b0dbd4ead5033f5e77]
  ;')