
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_d3359fb5f221ba8eaf0bf5fc608ada11]
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

    [dbt_test__audit.testview_d3359fb5f221ba8eaf0bf5fc608ada11]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_d3359fb5f221ba8eaf0bf5fc608ada11]
  ;')