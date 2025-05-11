
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_33b9cfe985c4639d713fddc145dc2176]
   as 
    
    



select id_metodo
from "etl-server"."staging"."stg_metodo_envio"
where id_metodo is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_33b9cfe985c4639d713fddc145dc2176]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_33b9cfe985c4639d713fddc145dc2176]
  ;')