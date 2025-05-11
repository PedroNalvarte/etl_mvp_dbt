
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_e601593425c2b472e7dd684c3d311adf]
   as 
    
    



select nombre_pais
from "etl-server"."staging"."stg_pais"
where nombre_pais is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e601593425c2b472e7dd684c3d311adf]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_e601593425c2b472e7dd684c3d311adf]
  ;')