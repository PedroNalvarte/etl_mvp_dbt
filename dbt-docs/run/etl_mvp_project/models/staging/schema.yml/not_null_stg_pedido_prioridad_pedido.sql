
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_07a61dd9333065f154a0e72e5345a578]
   as 
    
    



select prioridad_pedido
from "etl-server"."staging"."stg_pedido"
where prioridad_pedido is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_07a61dd9333065f154a0e72e5345a578]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_07a61dd9333065f154a0e72e5345a578]
  ;')