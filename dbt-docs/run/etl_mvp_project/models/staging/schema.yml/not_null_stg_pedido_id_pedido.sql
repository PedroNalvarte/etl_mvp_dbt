
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_a8ed51b92f1031af7d0327c8b90336a8]
   as 
    
    



select id_pedido
from "etl-server"."staging"."stg_pedido"
where id_pedido is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a8ed51b92f1031af7d0327c8b90336a8]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_a8ed51b92f1031af7d0327c8b90336a8]
  ;')