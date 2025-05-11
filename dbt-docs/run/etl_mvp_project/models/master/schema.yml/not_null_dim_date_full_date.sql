
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_3b619f06928f1ce2b0fcff1ad2a7a6db]
   as 
    
    



select full_date
from "etl-server"."master"."dim_date"
where full_date is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_3b619f06928f1ce2b0fcff1ad2a7a6db]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_3b619f06928f1ce2b0fcff1ad2a7a6db]
  ;')