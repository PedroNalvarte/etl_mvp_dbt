
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_59e62849c67c9a0e6f7fc61c0528d2e8]
   as 
    
    



select fecha_envio
from "etl-server"."staging"."stg_pedido"
where fecha_envio is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_59e62849c67c9a0e6f7fc61c0528d2e8]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_59e62849c67c9a0e6f7fc61c0528d2e8]
  ;')