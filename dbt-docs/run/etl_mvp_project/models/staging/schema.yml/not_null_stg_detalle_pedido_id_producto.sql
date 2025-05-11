
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f21252653e839d1ae48b26864028e8fe]
   as 
    
    



select id_producto
from "etl-server"."staging"."stg_detalle_pedido"
where id_producto is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_f21252653e839d1ae48b26864028e8fe]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f21252653e839d1ae48b26864028e8fe]
  ;')