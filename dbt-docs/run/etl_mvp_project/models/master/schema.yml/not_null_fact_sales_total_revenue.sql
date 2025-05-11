
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_1628e88557427fdf15643380aa72941f]
   as 
    
    



select total_revenue
from "etl-server"."master"."fact_sales"
where total_revenue is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_1628e88557427fdf15643380aa72941f]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_1628e88557427fdf15643380aa72941f]
  ;')