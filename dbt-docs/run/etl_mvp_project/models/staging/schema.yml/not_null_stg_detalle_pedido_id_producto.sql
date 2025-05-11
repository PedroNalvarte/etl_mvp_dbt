
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_c78639082cf1c4139387ab4f264e8017]
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

    [dbt_test__audit.testview_c78639082cf1c4139387ab4f264e8017]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_c78639082cf1c4139387ab4f264e8017]
  ;')