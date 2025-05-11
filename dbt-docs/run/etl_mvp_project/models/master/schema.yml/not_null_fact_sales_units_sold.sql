
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_0881e1e843cad136a4b5548ae6f430d4]
   as 
    
    



select units_sold
from "etl-server"."master"."fact_sales"
where units_sold is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_0881e1e843cad136a4b5548ae6f430d4]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_0881e1e843cad136a4b5548ae6f430d4]
  ;')