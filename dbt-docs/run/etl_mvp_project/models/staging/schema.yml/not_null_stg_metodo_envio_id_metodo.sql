
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_717f144465cce4d03aeebd3f26ba4b5a]
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

    [dbt_test__audit.testview_717f144465cce4d03aeebd3f26ba4b5a]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_717f144465cce4d03aeebd3f26ba4b5a]
  ;')