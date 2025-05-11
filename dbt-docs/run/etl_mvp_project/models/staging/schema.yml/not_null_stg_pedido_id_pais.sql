
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_08a695692a15182e5d213b992a5cd2a3]
   as 
    
    



select id_pais
from "etl-server"."staging"."stg_pedido"
where id_pais is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_08a695692a15182e5d213b992a5cd2a3]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_08a695692a15182e5d213b992a5cd2a3]
  ;')