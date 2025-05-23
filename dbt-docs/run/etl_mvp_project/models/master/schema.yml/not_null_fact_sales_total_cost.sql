
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_7ddc85d85ce99ae88efb9f4566089a53]
   as 
    
    



select total_cost
from "etl-server"."master"."fact_sales"
where total_cost is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_7ddc85d85ce99ae88efb9f4566089a53]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_7ddc85d85ce99ae88efb9f4566089a53]
  ;')