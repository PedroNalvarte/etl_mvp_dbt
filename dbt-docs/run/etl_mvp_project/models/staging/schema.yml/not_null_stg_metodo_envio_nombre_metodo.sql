
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_725586c3a6f5ab95d2d868e0d853669c]
   as 
    
    



select nombre_metodo
from "etl-server"."staging"."stg_metodo_envio"
where nombre_metodo is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_725586c3a6f5ab95d2d868e0d853669c]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_725586c3a6f5ab95d2d868e0d853669c]
  ;')