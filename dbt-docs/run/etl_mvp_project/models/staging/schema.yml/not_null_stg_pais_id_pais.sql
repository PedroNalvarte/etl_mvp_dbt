
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_6b2d805650ed4f9862e8317e07fa7722]
   as 
    
    



select id_pais
from "etl-server"."staging"."stg_pais"
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

    [dbt_test__audit.testview_6b2d805650ed4f9862e8317e07fa7722]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_6b2d805650ed4f9862e8317e07fa7722]
  ;')