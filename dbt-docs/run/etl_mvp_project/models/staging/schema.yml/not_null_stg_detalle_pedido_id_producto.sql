
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_be77a151ebdcd0c7d3558b7101361d79]
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

    [dbt_test__audit.testview_be77a151ebdcd0c7d3558b7101361d79]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_be77a151ebdcd0c7d3558b7101361d79]
  ;')