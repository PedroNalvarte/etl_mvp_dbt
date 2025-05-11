
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_9f3dcbccc3d78f46e358a879f4639606]
   as 
    
    



select date_key
from "etl-server"."master"."fact_sales"
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

    [dbt_test__audit.testview_9f3dcbccc3d78f46e358a879f4639606]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_9f3dcbccc3d78f46e358a879f4639606]
  ;')