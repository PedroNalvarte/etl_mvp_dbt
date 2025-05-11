
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_41264225e3b31f3de90100f0c2051994]
   as 
    
    



select fecha_pedido
from "etl-server"."staging"."stg_pedido"
where fecha_pedido is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_41264225e3b31f3de90100f0c2051994]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_41264225e3b31f3de90100f0c2051994]
  ;')