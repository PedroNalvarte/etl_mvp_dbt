
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_3594b9026a48aae7ba1755e8cdd2b14e]
   as 
    
    



select id_region
from "etl-server"."staging"."stg_pais"
where id_region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_3594b9026a48aae7ba1755e8cdd2b14e]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_3594b9026a48aae7ba1755e8cdd2b14e]
  ;')