
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_c103f2ca4fe22c709ff50c4ade2c2960]
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

    [dbt_test__audit.testview_c103f2ca4fe22c709ff50c4ade2c2960]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_c103f2ca4fe22c709ff50c4ade2c2960]
  ;')