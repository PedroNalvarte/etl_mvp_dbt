
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_1e1530681c69e9f579d5a714d16228f9]
   as 
    
    



select id_producto
from "etl-server"."staging"."stg_producto"
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

    [dbt_test__audit.testview_1e1530681c69e9f579d5a714d16228f9]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_1e1530681c69e9f579d5a714d16228f9]
  ;')