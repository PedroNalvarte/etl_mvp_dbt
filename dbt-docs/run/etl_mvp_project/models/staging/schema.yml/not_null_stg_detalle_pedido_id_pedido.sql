
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_4ef94948c2f3acc2c027d2e11939f314]
   as 
    
    



select id_pedido
from "etl-server"."staging"."stg_detalle_pedido"
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

    [dbt_test__audit.testview_4ef94948c2f3acc2c027d2e11939f314]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_4ef94948c2f3acc2c027d2e11939f314]
  ;')