
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_2ae9583d54f17ae7b3648f0409927ac5]
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

    [dbt_test__audit.testview_2ae9583d54f17ae7b3648f0409927ac5]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_2ae9583d54f17ae7b3648f0409927ac5]
  ;')