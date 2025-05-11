
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f54cd5a107ab0bd1ac529322dc495a3c]
   as 
    
    



select id_region
from "etl-server"."staging"."stg_region"
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

    [dbt_test__audit.testview_f54cd5a107ab0bd1ac529322dc495a3c]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f54cd5a107ab0bd1ac529322dc495a3c]
  ;')