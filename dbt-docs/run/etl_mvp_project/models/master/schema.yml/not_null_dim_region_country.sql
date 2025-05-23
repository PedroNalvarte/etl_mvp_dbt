
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_9f4ae436f76e5fbdc8755be9dc699b72]
   as 
    
    



select country
from "etl-server"."master"."dim_region"
where country is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9f4ae436f76e5fbdc8755be9dc699b72]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_9f4ae436f76e5fbdc8755be9dc699b72]
  ;')