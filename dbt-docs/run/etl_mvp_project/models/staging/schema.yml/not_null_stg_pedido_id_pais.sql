
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_d813ef9e7c3fadcc8abc69a4b9022e62]
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

    [dbt_test__audit.testview_d813ef9e7c3fadcc8abc69a4b9022e62]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_d813ef9e7c3fadcc8abc69a4b9022e62]
  ;')