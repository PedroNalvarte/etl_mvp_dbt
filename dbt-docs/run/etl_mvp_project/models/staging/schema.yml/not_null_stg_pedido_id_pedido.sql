
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_2f08ff5fb8fd4769f8f8b88fa61c5cd5]
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

    [dbt_test__audit.testview_2f08ff5fb8fd4769f8f8b88fa61c5cd5]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_2f08ff5fb8fd4769f8f8b88fa61c5cd5]
  ;')