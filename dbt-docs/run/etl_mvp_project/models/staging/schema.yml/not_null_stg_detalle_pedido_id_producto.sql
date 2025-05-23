
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_a9237aad0bce908f7412f5237ed68f77]
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

    [dbt_test__audit.testview_a9237aad0bce908f7412f5237ed68f77]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_a9237aad0bce908f7412f5237ed68f77]
  ;')