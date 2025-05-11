
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_bf816b0d0586f68ce5fd3958626f167d]
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

    [dbt_test__audit.testview_bf816b0d0586f68ce5fd3958626f167d]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_bf816b0d0586f68ce5fd3958626f167d]
  ;')