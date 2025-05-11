
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_490fc9f2dba60160a5f2e4aad62e3e3d]
   as 
    
    



select date_key
from "etl-server"."master"."dim_date"
where date_key is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_490fc9f2dba60160a5f2e4aad62e3e3d]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_490fc9f2dba60160a5f2e4aad62e3e3d]
  ;')