
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_152f68d6b3129330e94c0f9a1ff83286]
   as 
    
    



select id_metodo
from "etl-server"."staging"."stg_pedido"
where id_metodo is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_152f68d6b3129330e94c0f9a1ff83286]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_152f68d6b3129330e94c0f9a1ff83286]
  ;')