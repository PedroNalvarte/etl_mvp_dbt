
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_d9170fd62c17e9b0665f34d93586d4de]
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

    [dbt_test__audit.testview_d9170fd62c17e9b0665f34d93586d4de]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_d9170fd62c17e9b0665f34d93586d4de]
  ;')