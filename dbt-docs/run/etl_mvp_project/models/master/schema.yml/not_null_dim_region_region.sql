
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_d55102e42ec3dd60154dd3f41b2bcd06]
   as 
    
    



select region
from "etl-server"."master"."dim_region"
where region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d55102e42ec3dd60154dd3f41b2bcd06]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_d55102e42ec3dd60154dd3f41b2bcd06]
  ;')