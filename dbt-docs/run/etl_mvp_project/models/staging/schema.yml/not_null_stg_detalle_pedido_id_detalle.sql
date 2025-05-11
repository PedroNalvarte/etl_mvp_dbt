
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_cce841521f97f78dac1065de71f3dccd]
   as 
    
    



select id_detalle
from "etl-server"."staging"."stg_detalle_pedido"
where id_detalle is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_cce841521f97f78dac1065de71f3dccd]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_cce841521f97f78dac1065de71f3dccd]
  ;')