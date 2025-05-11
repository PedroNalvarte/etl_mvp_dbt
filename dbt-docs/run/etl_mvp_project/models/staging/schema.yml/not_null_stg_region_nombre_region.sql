
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_326402b89e874888485f27d9d5a45d73]
   as 
    
    



select nombre_region
from "etl-server"."staging"."stg_region"
where nombre_region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_326402b89e874888485f27d9d5a45d73]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_326402b89e874888485f27d9d5a45d73]
  ;')