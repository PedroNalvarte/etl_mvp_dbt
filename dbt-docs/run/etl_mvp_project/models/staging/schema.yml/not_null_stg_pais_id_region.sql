
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f390d0e6f09d8faa2f7f170e6cdf9caa]
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

    [dbt_test__audit.testview_f390d0e6f09d8faa2f7f170e6cdf9caa]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f390d0e6f09d8faa2f7f170e6cdf9caa]
  ;')